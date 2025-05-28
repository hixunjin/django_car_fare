import re

from django.conf import settings

#问题还是在于初始化文件

"""
文件功能

1.根据用户所属角色从数据表中获取对应的权限，然后按照指定的格式放在 request.session 中
2.把用户涉及到的 菜单、权限组、权限等信息根据数据表关系从数据模型中取出，然后咱找指定格式存放在 requset.session 中
3.初始化用户权限数据的文件中，函数 init__permission() 并不是自动调用的，我们将其用在 login 登录函数中，
用户在登录的时候该函数收集用户的权限，进行数据初始化
"""
def init_permission(request,user_obj):  #user_obj 对应 userinfo 实例对象，可以查询其中的字段

    """
    下面是查询指定的字段，
    user_obj.roles  由 userinfo 中的外键 roles 关联到 Role 表，
    再由 Role 表中的  permissions 表去查询 Permission 表中的字段
    """

    permission_item_list = user_obj.roles.values(

        #以下代码是添加的条件
        #代码的单词不要拼写错误
        'permissions__id',
        'permissions__title',
        'permissions__url',
        'permissions__perm_code',
        'permissions__pid_id',
        'permissions__perm_group_id',
        'permissions__perm_group__menu_id',
        'permissions__perm_group__menu__title',
    ).distinct()



    #初始化字典变量，存储权限URL
    permission_url_list = {}    #用以存储URL
    #初始化列表变量
    permission_menu_list = []    #用以存储菜单信息


    #通过循环把 permission_item_list 的值放在 permission_url_list 中
    #我们构建的字典以权限id为键名，键值为嵌套字典，字典有两个键值对， 权限代码 和 列表一对，权限URL 和 url 列表一对

    for item in permission_item_list:
        # 权限id
        perm_group_id = item['permissions__perm_group_id']

        #权限url
        url = item['permissions__url']   #item是字典，这里获取键值


        #新代码加入
        url = re.sub('<int:\w+>','[0-9]+',url)
        url = re.sub('<str:\w+>','[^/]+',url)
        url = re.sub('<slug:\w+>','[-a-zA-z0-9_]+',url)
        url = re.sub('<uuid:\w+>','[0-9a-f {8}-[0-9a-f] {4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}',url)
        url = re.sub('<path:\w+>','.+',url)



        #加入代码结束

        #权限代码
        perm_code = item['permissions__perm_code']  #获取键值


        #字典数据设置
        if perm_group_id in permission_url_list:

            #添加单个权限代码和权限URL
            permission_url_list[perm_group_id]['codes'].append(perm_code)
            permission_url_list[perm_group_id]['urls'].append(url)

        else:

            #直接设置权限id和嵌套的字典,以权限id为索引
            permission_url_list[perm_group_id] = {'codes':[perm_code,],'urls':[url,]}   #键值是列表

    #把处理好的列表放到 session 中
    request.session[settings.PERMISSION_URL_KEY] = permission_url_list







    #菜单信息处理


    for item in permission_item_list:

        #循环创建单个字典
        tpl = {
             #已经处理好的数据，也是可以通过外键+双下划线获取关联表中的数据
            'id':item['permissions__id'],
            'title':item['permissions__title'],
            'url': item['permissions__url'],
            'pid_id': item['permissions__pid_id'],
            'menu_id':item['permissions__perm_group__menu_id'],
            'menu_title': item['permissions__perm_group__menu__title'],
        }

        permission_menu_list.append(tpl)

        # 收集权限代码---后面加入
        permission_code_list = []

        for item in permission_item_list:
            perm_code = item['permissions__perm_code']
            if perm_code:  # 防止为空
                permission_code_list.append(perm_code)

        # 保存权限代码到 session
        request.session['permission_codes'] = list(set(permission_code_list))  # 去重后保存

    #将数据添加到 settings 中的  session 中
    request.session[settings.PERMISSION_MENU_KEY] = permission_menu_list












