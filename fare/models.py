from django.db import models

"""
数据表
loguser 和 UserInfo 是一对一关系，这样 loguser 中的记录不仅可以作为登录用户，也可以进行授权，以便对这个网站进行管理

"""

#from rbac.models import UserInfo #因为和 loguser 是一对一关系，所以需要导入
from rbac import models  as rbac_models

class carinfo(models.Model):
    #车牌号
    plate_number = models.CharField(max_length=7,verbose_name='车牌号',unique=True)
    #司机
    driver = models.CharField(verbose_name="司机",max_length=10)
    #设置每公里的单价
    price = models.DecimalField(max_digits=8,decimal_places=2,verbose_name='单价')
    #备注
    remarks = models.CharField(max_length=32,verbose_name="备注说明",blank=True,null=True)

    def __int__(self):
        return self.plate_number

#管理人员信息表（登录网站）

class loguser(models.Model):
    #用户、头像、部门
    user_obj = models.OneToOneField(to=rbac_models.UserInfo,on_delete=models.CASCADE,null=True,blank=True)
    head_img = models.ImageField(upload_to='headimgage',blank=True,null=True,verbose_name='头像')
    dep = models.ForeignKey(to='department',to_field='id',on_delete=models.CASCADE,blank=True,null=True)

    def __str__(self):
        return self.user_obj.username



#部门表
class department(models.Model):
    #部门名称和备注
    dep_name = models.CharField(verbose_name='部门名称',max_length=32,unique=True,blank=True)
    dep_script = models.CharField(verbose_name='部门备注',null = True,max_length=60)

    def __str__(self):
        return self.dep_name



class fare(models.Model):
    #本表记录和 department 是多对一关系
    dep = models.ForeignKey(to=department,to_field='id',on_delete = models.CASCADE) #部门

    #乘客、车辆、司机、单价
    passenger = models.CharField(verbose_name="乘车人",max_length=32)
    car = models.ForeignKey(to=carinfo,to_field ='id',on_delete=models.CASCADE)
    driver = models.CharField(verbose_name='司机',max_length=10)
    price = models.DecimalField(max_digits=8,decimal_places=2,verbose_name='单价')

    #公里数、费用、乘车时间、乘车说明、操作员
    distance = models.IntegerField(verbose_name="公里数")  #使用整数
    fare = models.DecimalField(max_digits=8,decimal_places=2,verbose_name='费用')
    derve_date = models.DateField(verbose_name='乘车时间',auto_now_add=True,blank=True,null=True)
    remarks = models.CharField(verbose_name='乘车说明',max_length=100)
    operator = models.CharField(verbose_name='输入人员',max_length=32)

    #审批日期和审批状态

    approve_date = models.DateField(verbose_name='审批时间',auto_now=True,blank=True,null=True)
    approve_status = models.CharField(max_length=1,verbose_name='审批状态',choices=(('0','未审批'),('1','通过审批')),
                                      blank=True,null=True)















