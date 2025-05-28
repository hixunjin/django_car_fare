from django.contrib.auth.decorators import login_required
from django.shortcuts import render,redirect,HttpResponse
from rbac import models
from .models import *
from django.db.models import Sum
# Create your views here.
from django.conf import settings
from rbac.service.init_permission import init_permission
#用户分配
from django.core.exceptions import ObjectDoesNotExist
from rbac.models import UserInfo


#权限初始化类，涉及到 add del edit 功能时，需要先初始化这个类，然后把类对象返回到前端，
#前端根据类对象的属性，来判断用户是否拥有指定的权限，并根据拥有的权限显示对应的功能按钮


class BasePermPage(object):
    """
    1.类功能：
    这个类被实例化后将传递给页面，实例化对象根据传入的权限代码，判断用户对当前页面是否有  add del edit
    这三个权限

    2.参数 code_list
    这里的参数 code_list 用以接收 request.session['permission_codes'] 的值，
    具体在  rbac 中进行赋值

    """
    def __init__(self,code_list):
        self.code_list = code_list or []


    #下面的方法逻辑一样，都是判断指定的权限名字是否在获取的列表中，根据结果返回布尔值，存在为 True，不存在为 False
    def has_add(self):
        if 'add' in self.code_list:
            return True
    def has_del(self):
        if 'del' in self.code_list:
            return True
    def has_edit(self):
        if 'edit' in self.code_list:
            return  True



#登录视图函数
def login(request):
    if request.method == 'GET':
        return render(request,'fare/login.html')  #我们给 应用 fare 创建一个专属的 HTML 文件夹
    else:
        username = request.POST.get('username')
        password = request.POST.get('password')

        print(username)
        print(password)


        from rbac .models import UserInfo
        user = UserInfo.objects.filter(
            username=username,
            password=password
        ).first()

        print(user)


        #将用户的信息保存到 session 中,应该知道，保存的信息是字典类型，且是自定义的，并不是固定存在的键值对
        if user:

            #调用函数进行权限初始化，将用户的身份和权限信息存放到 session 中
            init_permission(request,user_obj=user)

            perm_menu = request.session[settings.PERMISSION_MENU_KEY]
            print(perm_menu)

            perm_url = request.session[settings.PERMISSION_URL_KEY]
            print("测试")
            print(perm_url)

            #这里我们存储了用户名和用户所属的部门id
            request.session['user_nickname'] = user.nickname
            request.session['user_dep'] = user.loguser.dep_id
            return redirect('/fare/index')
        else:
            return render(request,'fare/login.html')




#注销函数

def logout(request):
    request.session.clear()   #session 保存在 请求对象 HttpRequest 中， 通过 request 进行访问

    # cookies 保存在响应对象 HttpResponse 中，因此先通过代码 rep = redirect('/login/')
    #获取响应对象

    rep = redirect('/login/')
    rep.cookies.clear()
    return rep



#测试函数
def index(request):
    return render(request,'index.html')


#车辆信息的增删改查


#数据查询
def carlist(request):

    # 工作流程： init__permission 初始化身份和权限数据到 session 中，含有功能的视图函数实例化此类，
    # 从session中获取权限数据（列表形式）当作类参数，完成 BasePermPage实例化对象，然后返回给前端，前端
    # 调用类方法，判断用户是否有指定的权限，根据结果显示对应的功能按钮

    #一般来说是放在列表页对应的视图函数，因为增删改操作一般在列表页面

    pagpermission = BasePermPage(request.session.get('permission_codes'))  # 被参数 code_list 接收

    #测试数据
    perm_menu = request.session[settings.PERMISSION_MENU_KEY]
    print(perm_menu)

    perm_url = request.session[settings.PERMISSION_URL_KEY]
    print("测试")
    print(perm_url)

    print("下面是 userinfo 中的函数")
    print(request.session.get('permission_codes'))



    carlist = carinfo.objects.all()

    return render(request,'fare/carinfo_list.html',{'carlist':carlist,'pagpermission':pagpermission})


#增加

def caradd(request):
    if request.method == "POST":

        #获取表单数据
        plate_number = request.POST.get('plate_number')
        driver = request.POST.get('driver')
        price = request.POST.get('price')
        remarks = request.POST.get('remarks')


        print(plate_number)
        print(driver)
        print(price)
        print(remarks)





        #保存
        carinfo.objects.create(
            plate_number = plate_number,
            driver = driver,
            price = price,
            remarks = remarks
        )

        return redirect('/fare/carlist/')
    else:
        return render(request,'fare/carinfo_add.html')



#车辆信息修改

def caredit(request,id):

    if request.method == 'POST':
        # 取出请求中的 id  ，查询出指定的用户
        obj_id = request.POST.get('id')
        car_obj = carinfo.objects.get(id=obj_id)   #具体的用户


        #获取表单数据:
        plate_number = request.POST.get('plate_number')
        dirver = request.POST.get('driver')
        price = request.POST.get('price')
        remarks = request.POST.get('remarks')


        #给数据库字段指定新的数据
        car_obj.plate_number = plate_number
        car_obj.driver = dirver
        car_obj.price = price
        car_obj.remarks = remarks

        #保存到数据库
        car_obj.save()
        return redirect('/fare/carlist/')

    else:

        #如果不是  POST请求，我们获取出指定　id　的数据，并将其返回给前端修改页面，显示修改前的数据
        car_obj = carinfo.objects.get(id=id)
        return render(request,'fare/carinfo_edit.html',{'car_obj':car_obj})




#车辆信息删除
def cardelete(requst,id):
    car_obj = carinfo.objects.get(id=id).delete()
    return redirect('/fare/carlist/')



#部门数据的增删改查
def deplist(request):


    pagpermission = BasePermPage(request.session.get('permission_codes'))

    deplist = department.objects.all()
    return render(request,'fare/depinfo_list.html',{'deplist':deplist,'pagpermission':pagpermission})


#部门增加
def depadd(request):
    if request.method == "POST":
        dep_name = request.POST.get('dep_name')
        dep_script = request.POST.get('dep_script')

        department.objects.create(
            dep_name=dep_name,
            dep_script=dep_script
        )
        return redirect('/fare/deplist/')

    else:
        return render(request,'fare/depinfo_add.html')




#部门修改

def depedit(request,id):
    if request.method == "POST":
        obj_id = request.POST.get('id')
        dep_obj = department.objects.get(id=id)

        #获取表单数据
        dep_name = request.POST.get('dep_name')
        dep_script = request.POST.get('dep_script')

        #为字段赋值
        dep_obj.dep_name = dep_name
        dep_obj.dep_script = dep_script

        #保存到数据库表
        dep_obj.save()

        #返回查询页面
        return redirect('/fare/deplist/')

    else:

        dep_obj = department.objects.get(id=id)
        return render(request,'fare/depinfo_edit.html',{'dep_obj':dep_obj})




#部门删除
def depdelete(request,id):
    dep_obj = department.objects.get(id=id)
    dep_obj.delete()
    return redirect('/fare/deplist/')






#用户列表---用户信息数展示，用户部门分配功能
def userlist(request):


    pagpermission = BasePermPage(request.session.get('permission_codes'))

    user_list = UserInfo.objects.all()
    return render(request,'fare/userinfo_list.html',{'user_list':user_list,'pagpermission':pagpermission})


#用户编辑函数
def useredit(request,userid):
    if request.method == "POST":
        id = request.POST.get('id')

        #获取用户对象
        user_obj = UserInfo.objects.get(id=id)
        #获取部门对象
        dep_id = request.POST.get('dep_id')  #这里获取的是表单数据，以标签的 usernamae  为例

        #反向取出 loguser 中的记录，通过更新 loguser 的  dep_id 值来实现更新部门信息
        try:
            loguser_id = user_obj.loguser.id

            #更新用户部门
            loguser.objects.filter(id=loguser_id).update(dep_id=dep_id)


        #用户不存在,loguser 中没有记录
        except ObjectDoesNotExist:
            loguser.objects.create(
                dep_id=dep_id,
                user_obj_id=id
            )

        return redirect('/fare/userlist/')


    #现在是第一次打开网页，将UserInfo用户对象和部门数据返回给前端
    user_obj = UserInfo.objects.get(id=userid)
    dep_list = department.objects.all()
    return render(request,'fare/userinfo_edit.html',{'obj':user_obj,'dep_list':dep_list})


#用户删除函数
def userdel(request,userid):
    a = UserInfo.objects.get(id=userid).delete()
    return redirect('/fare/userlist/')


#接下来开始编写车费上报---本质上对数据表的增删改查


import datetime

def farelist(request):
    #日期限定为当日日期，不可修改
    tday = datetime.datetime.now().date()  #获取当日日期

    pagpermission = BasePermPage(request.session.get('permission_codes'))


    cur_dep = request.session.get('user_dep')

    #获取当天、本部门、为审批的记录
    #注意，model文件代码中，fare模型字段 字段 drive_date  错写为  derve_date
    fare_list = fare.objects.all().filter(derve_date=tday,dep_id=cur_dep,approve_status='0')
    return render(request,'fare/fare_list.html',{'fare_list':fare_list,'pagpermission':pagpermission})


#删除函数

def faredel(request, fareid):
    ret = {'status': False}
    try:
        obj = fare.objects.get(id=fareid)
        obj.delete()
        ret['status'] = True
    except Exception as e:
        print("删除失败：", e)
    return JsonResponse(ret)


def fareadd(request):
    #取出一定格式的日期
    today = datetime.datetime.now().strftime('%Y-%m-%d')

    #现在从 session 中取出登录的用户名和用户所属的id

    #部门(存储的是id值)
    cur_dep_id = request.session.get('user_dep')
    print(cur_dep_id)
    dep_obj = department.objects.get(id=cur_dep_id)

    #用户名
    user_nickname = request.session.get('user_nickname')


    #车辆信息
    carinfo_list = carinfo.objects.all()

    #接下来是判断 POST 请求 和 GET 请求，并进行相关的处理

    if request.method == "POST":
        carid = request.POST.get('car_id')
        passenger = request.POST.get('passenger')
        driver = request.POST.get('driver')
        price = request.POST.get('price')
        distance = request.POST.get('distance')
        fare1 = request.POST.get('fare')
        remark = request.POST.get('remark')
        drive_date = datetime.datetime.now()

        #创建新的记录

        fare.objects.create(
            dep_id=cur_dep_id,
            passenger=passenger,
            car_id=carid,
            driver=driver,
            distance=distance,
            price=price,
            remarks=remark,
            derve_date=drive_date,
            operator=user_nickname,
            approve_status='0',
            fare=fare1
        )

        return redirect('/fare/farelist/')

    #第一次打开网页，将初始信息返回给前端
    return render(request,'fare/fare_add.html',{'user_nickname':user_nickname,
                                                'cur_dep':dep_obj,
                                                'car_list':carinfo_list,
                                                'tday':today})







#接下来开始编写车费上报信息修改
#网页和车费信息的页面类似，也是先展示数据，在数据展示页面有个模态框，在模态框中进行修改

def fareedit(request,fareid):
    # 取出一定格式的日期
    today = datetime.datetime.now().strftime('%Y-%m-%d')

    #取出session中的用户部门id
    cur_dep_id = request.session.get('user_dep')

    dep_obj = department.objects.get(id=cur_dep_id)
    #取出用户
    user_nickname = request.session.get('user_nickname')

    #车辆信息
    car_list = carinfo.objects.all()

    #判断if请求

    if request.method == "POST":
        fareid = request.POST.get('id')

        #通过id进行修改数据
        cur_dep = request.POST.get('dep_id')
        passenger = request.POST.get('passenger')
        carid = request.POST.get('car_id')
        driver = request.POST.get('driver')
        price = request.POST.get('price')
        distance = request.POST.get('distance')

        #fare,这个修改的是费用
        fare1 = request.POST.get('fare')
        remark = request.POST.get('remark')
        drive_date = request.POST.get('drive_date')


        #修改记录
        fare.objects.filter(id=fareid).update(
        passenger=passenger,
        car_id = carid,
        driver = driver,
        price = price,

        # 公里数、费用、乘车时间、乘车说明、操作员
        distance = distance,
        fare = fare1,
        derve_date = drive_date,
        remarks = remark,
        operator = user_nickname,
        )


        #重定向到首页

        return redirect('/fare/farelist/')

    else:
        #这个是 指定的 fare 对象实例
        fare_obj = fare.objects.get(id=fareid)
        car_list = carinfo.objects.all()
        user_nickname = request.session.get('user_nickname')

        #返回给前端网页
        return  render(request,'fare/fare_edit.html',{'user_nickname':user_nickname,
                                                      'obj':fare_obj,
                                                      'car_list':car_list
                                                      })






#接下来开始编写 车费审批功能


#导入分页组件
from utils.paginater import Paginater
def farecheck(request):

    #车费审批和取消本质上是 exit 功能，因此也可以加上
    dep_list = department.objects.all()

    if request.method == "POST":

        #获取用户输入的查询值，作为查询条件
        dep_id = request.POST.get('department')
        drive_date1 = request.POST.get('drive_date1',None)
        drive_date2 = request.POST.get('drive_date2',None)


        #设置空字典，存储用户输入数据，当作查询条件
        conditon_dict = {}
        conditon_dict['approve_status'] = '0'

        #输入部门值如果不为空，设置为条件
        if dep_id:
            conditon_dict['dep_id'] = int(dep_id)


        #将用户输入的查询时间设置为查询条件
        if drive_date1:
            conditon_dict['drive_date__gte'] = drive_date1
        if drive_date2:
            conditon_dict['drive_date__lte'] = drive_date2

        #如果字典不为0，则生成过滤条件开始查询数据
        #这里获取的 total_count 是当作分页组件的参数，可以知道，这个参数仅仅是总数，但是并不代表是模型数据的全部记录，
        #也可以是符合条件的全部记录，而且这是很常见的情况
        if len(conditon_dict) > 0 :

            #这里是将字典当作条件，使用任意数量的关键字实参进行接收字典中的键值对
            total_count = fare.objects.filter(**conditon_dict).count()

        else:
            #如果为0，即用户没有输入数据,则取得记录总数
            total_count = fare.objects.all().count()


        #分页组件需要的参数准备

        #获取当前页面，这里是从组件中设置的 <li> 标签当中 进行获取的
        cur_page_num = request.GET.get('page')

        #如果不存在，设置为 1
        if not cur_page_num:
            cur_page_num = 1

        #一页显示多少数据
        one_page_lines = 3

        #页码标签数
        page_max_tag = 5

        #生成分页对象
        page_obj = Paginater(

            url_address='/fare/farecheck/',
            cur_page_num=cur_page_num,
            total_rows=total_count,
            one_page_lines=one_page_lines,
        )

        #上面是根据数据模型设置好分页组件需要的数据



        #当前页面的设置，有两类，一个是符合查询条件下的记录，一个是没有查询的条件的记录

        #对符合查询条件记录进行切片处理

        # data_start data_end 和分页组件中的函数修饰器相关
        if len(conditon_dict) >  0:
            fare_list = fare.objects.filter(**conditon_dict).order_by('derve_date')[page_obj.data_start:
                        page_obj.data_end]

        else:
            fare_list = fare.objects.all().order_by('derve_date')[page_obj.data_start:
                        page_obj.data_end]



        return render(request,'fare/farelist_check.html',{'fare_list':fare_list,
                                                           'page_nav':page_obj.html_page(),
                                                           'dep_list':dep_list,

                                                           })


    #接下来是处理GET请求下的分页数据
    else:
        #获取当前页面
        cur_page_num = request.GET.get('page')
        if not cur_page_num :

            cur_page_num = 1

        #取得记录总数，条件是未被审批的记录，即 approve_status = '0'

        total_count = fare.objects.filter(approve_status='0').count()
        one_page_lines = 3
        page_max_tag = 7


        #分页组件对象参数设置
        page_obj = Paginater(
            url_address='/fare/farecheck/',
            cur_page_num=cur_page_num,
            one_page_lines=one_page_lines,
            page_max_tag=page_max_tag,
            total_rows=total_count
        )

        #对记录进行切片
        fare_list = fare.objects.filter(approve_status='0').order_by('derve_date')[
            page_obj.data_start:page_obj.data_end
        ]

        #返回给前端网页
        return render(request,'fare/farelist_check.html',{'fare_list':fare_list,
                                                          'page_nav':page_obj.html_page(),
                                                          'dep_list':dep_list
                                                          })



def fare_approve(request, ids):
    """
    审批多个车费记录：将 approve_status 字段由 '0' 改为 '1'
    """
    id_list = ids.split(",")
    try:
        for single_id in id_list:
            fare_record = fare.objects.get(id=single_id)
            fare_record.approve_status = '1'  # 修改字段值
            fare_record.save()
        return JsonResponse({'status': True, 'message': '审批成功'})
    except Exception as e:
        return JsonResponse({'status': False, 'message': str(e)})






#车费取消功能
#和车费审批功能类似，不同的是查询条件不同，可类比编写，分为  查询条件定义、数据展示给列表、分页组件

def farecheck2(request):
    # 获取部门数据，返回给前端
    dep_list = department.objects.all()

    # 如果是 POST 请求，进行查询
    if request.method == "POST":
        # 获取用户输入的查询值，作为查询条件
        dep_id = request.POST.get('department', None)
        drive_date1 = request.POST.get('drive_date1', None)
        drive_date2 = request.POST.get('drive_date2', None)

        # 设置空字典，存储用户输入数据，当作查询条件
        conditon_dict = {}
        conditon_dict['approve_status'] = '1'  # 查询已审批的记录，approve_status 的值为 1

        # 设置查询条件
        if dep_id:
            conditon_dict['dep_id'] = int(dep_id)
        if drive_date1:
            conditon_dict['drive_date__gte'] = drive_date1
        if drive_date2:
            conditon_dict['drive_date__lte'] = drive_date2

        # 获取符合条件的记录总数
        if conditon_dict:
            total_count = fare.objects.filter(**conditon_dict).count()
        else:
            total_count = fare.objects.all().count()

        # 分页组件需要的参数准备
        cur_page_num = request.GET.get('page')
        if not cur_page_num:
            cur_page_num = 1

        # 每页显示多少数据
        one_page_lines = 3

        # 生成分页对象
        page_obj = Paginater(
            url_address='/fare/farecheck2/',
            cur_page_num=cur_page_num,
            total_rows=total_count,
            one_page_lines=one_page_lines,
        )

        # 获取符合查询条件的车费记录
        if len(conditon_dict) > 0:
            fare_list = fare.objects.filter(**conditon_dict).order_by('derve_date')[page_obj.data_start:page_obj.data_end]
        else:
            fare_list = fare.objects.all().order_by('derve_date')[page_obj.data_start:page_obj.data_end]

        # 返回渲染页面
        return render(request, 'fare/farelist_check2.html', {
            'fare_list': fare_list,
            'page_nav': page_obj.html_page(),
            'dep_list': dep_list,
        })

    # 如果是 GET 请求，显示待取消的车费记录
    else:
        # 获取当前页面
        cur_page_num = request.GET.get('page')
        if not cur_page_num:
            cur_page_num = 1

        # 获取待取消的车费记录总数，approve_status='1' 表示已审批通过的记录
        total_count = fare.objects.filter(approve_status='1').count()
        one_page_lines = 3

        # 生成分页对象
        page_obj = Paginater(
            url_address='/fare/farecheck2/',
            cur_page_num=cur_page_num,
            one_page_lines=one_page_lines,
            total_rows=total_count,
        )

        # 获取待取消的车费记录，已审批的记录
        fare_list = fare.objects.filter(approve_status='1').order_by('derve_date')[page_obj.data_start:page_obj.data_end]

        # 返回渲染页面
        return render(request, 'fare/farelist_check2.html', {
            'fare_list': fare_list,
            'page_nav': page_obj.html_page(),
            'dep_list': dep_list,
        })




from django.http import JsonResponse
from .models import fare  # 假设你的模型叫 FareInfo

def cancel_fare(request, ids):
    if request.method == "GET":
        try:
            id_list = ids.split(',')  # 例如 ['1', '2', '3']
            # 批量更新数据库中的 approve_status 字段
            fare.objects.filter(id__in=id_list).update(approve_status='0')
            return JsonResponse({'status': True})
        except Exception as e:
            return JsonResponse({'status': False, 'message': str(e)})
    else:
        return JsonResponse({'status': False, 'message': '不支持的请求方法'})




#车费统计
#车费统计主要依据 年、月、部门、审批状态 进行统计
#本函数主要就是将处理好的数据放到字典中，返回给前端进行展示


def annotate_fare(request):
    #下面导入 fare 数据模型，正确引用数据模型

    from .models import fare

    #通过Django ORM 对数据库中的数据进行分组聚合，获取初步的统计数据
    farelist = fare.objects.values('dep__dep_name','derve_date__year','derve_date__month','approve_status'
                                   ).annotate(sum_distance=Sum('distance'),
                                              sum_fare = Sum('fare'),
                                              ).values('dep__dep_name',
                                                       'derve_date__year',
                                                       'derve_date__month',
                                                       'approve_status',
                                                       'sum_distance',
                                                       'sum_fare',
                                                       )

    #初始化一个字典，当存储的数据结构比较复杂时，一般会用到字典
    faredict = {}

    #循环标志,设置为 True ，标志第一条记录
    begin = True

    depname = ''


    #保存未被审批的车费里程、费用小计
    distance0_xj = 0
    fare0_xj = 0

    # 保存已经审批的车费里程、费用小计
    distance1_xj = 0
    fare1_xj = 0


    #行车里程和车费里程小计（包括已经审批和未被审批两部分）
    distance_xj = 0
    fare_xj = 0


    #未经审批的的合计数据
    distance0_hj = 0
    fare0_hj = 0

    #经过审批的的合计数据
    distance1_hj = 0
    fare1_hj = 0

    #行车里程、费用合计（包括审批和未审批的数据）
    distance_hj = 0
    fare_hj = 0

    #通过循环取得分组记录
    for fare in farelist:
        if begin:
            depname = fare['dep__dep_name']  #联表查询

        if depname == fare['dep__dep_name']:

            #部门发生变化前，插入一条记录
            onefare = {
                'dep__dep_name':"小计",

                #未审批
                'sum_distance0': distance0_xj,
                'sum_fare0':fare0_xj,

                #已经审批
                'sum_distance1': distance1_xj,
                'sum_fare1': fare1_xj,

                #总的小计
                'sum_distance': distance_xj,
                'sum_fare': fare_xj,
            }


            faredict[depname + 'xj'] = onefare

            #把各个小计设置为0，总共 6 个， 四个分的小计，两个总的小计
            distance0_xj = 0
            fare0_xj = 0

            distance1_xj = 0
            fare1_xj = 0

            distance_xj = 0
            fare_xj = 0

            #把新的部门赋值给 depname ,dep__dep_name  涉及到联表查询
            depname = fare['dep__dep_name']



            #把每条记录对应的字段值添加到对应的小计中---两个总小计，两个总合计

            distance_xj += fare['sum_distance']
            fare_xj += fare['sum_distance']

            distance_hj += fare['sum_distance']
            fare_hj += fare['sum_distance']




            #根据审批状态将小计数据添加到对应的小计中---未审批数据
            if fare['approve_status'] == '0':

                #在循环中处理数据， 通过 += 算法是常见的计算方法

                #小计
                distance0_xj += fare['sum_distance']
                fare0_xj += fare['sum_fare']

                #合计
                distance0_hj += fare['sum_distance']
                fare0_hj += fare['sum_fare']

            #经过审批的记录
            if fare['approve_status'] == '1':

                #小计
                distance1_xj += fare['sum_distance']
                fare1_xj += fare['sum_fare']

                #合计
                distance1_hj += fare['sum_distance']
                fare1_hj += fare['sum_fare']



            #生成唯一标识，用来标记一条记录
            vid = fare['dep__dep_name'] + str(fare['derve_date__year']) + str(fare['derve_date__month'])

            #判断字典是否有键名等于  vid 的键
            if vid in faredict:
                #根据 fare['approve_status'] 的值，生成两个不同的 fare['vid'] 的键值对，
                #本质上是生成两个不同类型的键值对


                #未经过审批的车费记录
                if fare['approve_status'] == '0':

                    #vid是二级字典的键名，二级字典中，添加了两个键值对
                    faredict['vid']['sum_distance0'] = fare['sum_distance']
                    faredict['vid']['sum_fare0'] = fare['sum_fare']

                #经过车费审批的记录
                if fare['approve_status'] == '1':
                    #vid是二级字典的键名，二级字典中，添加了两个键值对
                    faredict['vid']['sum_distance1'] = fare['sum_distance']
                    faredict['vid']['sum_fare1'] = fare['sum_fare']



                #当  sum_distance 在 faredict[vid],说明当前记录是未审批记录，把里程和车费取出放到变量中
                if 'sum_distance0' in faredict[vid]:
                    distance0 = faredict[vid]['sum_distance0']
                    fare0 = faredict[vid]['sum_fare0']
                else:
                    distance0 = 0
                    fare0 = 0

                #当  sum_distance1 在 faredict[vid],说明当前记录是已经审批记录，把里程和车费取出放到变量中
                if 'sum_distance1' in faredict[vid]:
                    distance1 = faredict[vid]['sum_distance1']
                    fare1 = faredict[vid]['sum_fare1']
                else:
                    distance1 = 0
                    fare1 = 0



                #在 fare[vid] 的二级字典中添加两个键值对，sum_distance sum_fare
                #这两个是 经过审批和未经过审批的数据之和

                fare[vid]['sum_distance'] = distance0 + distance1
                fare[vid]['sum_fare'] = fare0 + fare1



            #如果字典中不存在 vid ，则设置字典数据，即增加 键名vid 和对应的数据
            else:

                onefare = {
                    'dep__dep_name':fare['dep__dep_name'],
                    'drive_date__year':fare['derve_date__year'],
                    'drive_date__month': fare['derve_date__month'],
                }

                #根据  approve_status 为 onefare 增加不同的键值对
                if fare['approve_status'] == '0':
                    onefare['sum_distance0'] = fare['sum_distance']
                    onefare['sum_fare0'] = fare['sum_fare']


                if fare['approve_status'] == '1':
                    onefare['sum_distance1'] = fare['sum_distance']
                    onefare['sum_fare1'] = fare['sum_fare']


                #添加二级字典
                fare[vid] = onefare

                #当 sum_distance0 在 faredict 中，说明当前记录是为审批记录，取出数据放到变量中
                if 'sum_distance0' in onefare:
                    distance0 = onefare['sum_distance0']
                    fare0 = onefare['sum_fare0']

                else:
                    distance0 = 0
                    fare0 = 0


                #当 sum_distance1 在 faredict 中，说明当前记录是为审批记录，取出数据放到变量中
                if 'sum_distance1' in onefare:
                    distance1 = onefare['sum_distance1']
                    fare1 = onefare['sum_fare1']

                else:
                    distance1 = 0
                    fare1 = 0


                #现在为 fare[vid] 中的二级字典 onefare 增加键值对，分别是 里程合计  车费合计


                onefare['sum_distance'] = distance0 + distance1
                onefare['sum_fare'] = fare0 + fare1

                #循环中的数据处理完毕，现在为键名 vid 设置二级字典 onefare
                fare[vid] = onefare

    # 在循环外，在字典中加入最后一个部门的小计
    onefare = {
        'dep__dep_name': "小计",
        'sum_distance0': distance0_xj,
        'sum_fare0': fare0_xj,

        'sum_distance1': distance1_xj,
        'sum_fare1': fare1_xj,

        # 总小计数据数据
        'sum_distance': distance_xj,
        'sum_fare': fare_xj,

    }


    #在循环外，为字典添加合计项

    onefare = {
        'dep__dep_name': "合计",
        'sum_distance0': distance0_hj,
        'sum_fare0': fare0_hj,

        'sum_distance1': distance1_hj,
        'sum_fare1': fare1_hj,

        # 总小计数据数据
        'sum_distance': distance_hj,
        'sum_fare': fare_hj,

    }

    faredict[depname + 'hj'] = onefare

    #将处理好的数据返回给前端
    return render(request,'fare/fare_addup.html',{'faredict':faredict})





