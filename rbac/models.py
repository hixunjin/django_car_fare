from django.db import models






#Userinfo 表---用户信息表
#与角色表 Role 进行关联
class UserInfo(models.Model):
    #登录用户名
    username = models.CharField(max_length=300,verbose_name="用户名")
    password = models.CharField(max_length=64,verbose_name="密码")
    nickname = models.CharField(max_length=30,verbose_name="姓名")
    email = models.EmailField()

    #定义多对多关系
    #格式： 字段名 = models.ManyToManyField("多对多数据表名")
    #建立多对多关系表时，Django会创建一个中间表，中间表中只要id字段，以本表为例，id Role_id UserInfo_id
    roles = models.ManyToManyField("Role")  #注意实现方式，使用  ManyToManyField



    #后台中实例对象的别名，增强可读性
    def __str__(self):
        return self.nickname

    #定义数据表在后台显示的名字
    class Meta:
        verbose_name_plural = "用户表"




#角色表---Role
#相关联的表是权限表  Permissions,多对多关系

class Role(models.Model):
    title = models.CharField(max_length=300,verbose_name="角色名",unique=True)

    #角色表和权限表的多对多关系---自  身就是角色表，因此设置为 permissions
    permissions = models.ManyToManyField("Permission",blank=True,verbose_name="拥有的权限")

    #定义数据模型实例对象的名称，在后台显示

    def __str__(self):
        return self.title  #一般返回具有代表意义的本数据模型字段


    class Meta:
        verbose_name_plural = "角色表"


#Permission表
#用户根据项目需要划分好权限，然后输入到这张表中
#和权限组表 PermGroup 是 多对一关系


class Permission(models.Model):
    title = models.CharField(max_length=32,verbose_name="权限名称",unique=True)
    url = models.CharField(max_length=32,verbose_name="URL",unique=True)
    perm_code = models.CharField(max_length=32,verbose_name="权限代码")
    perm_group = models.ForeignKey(to="PermGroup",blank=True,on_delete = models.CASCADE,verbose_name="所属权限")

    """
    pid是PermGroup表中的主键，和本表中的id形成多对一关系，当pid不存在的时候，约定为二级菜单
    """


    #上面已经通过 ForeignKey 进行了关联，为什么下面还需要让 id  进行关联
    pid = models.ForeignKey(to="Permission",null=True,blank=True,on_delete=models.CASCADE,verbose_name="所属二级菜单")


    def __str__(self):
        return self.title
    class Meta:
        verbose_name_plural = "权限表"





#创建 PermGroup 表

#和菜单表进行关联，形成多对一关系
class PermGroup(models.Model):
    title = models.CharField(max_length=32,verbose_name="权限组名")
    #外键，多对一关系.
    menu = models.ForeignKey(to="Menu",verbose_name="所属菜单",blank=True,on_delete=models.CASCADE)

    #自定义模型实例对象的名字
    def __str__(self):
        return self.title

    #定义本模型在后台显示的别名
    class Meta:
        verbose_name_plural = "权限组"



#创建菜单表

class Menu(models.Model):
    title = models.CharField(max_length=32,verbose_name="一级菜单",unique=True)

    def __str__(self):
        return  self.title

    class Meta:
        verbose_name_plural = "一级菜单表"

























