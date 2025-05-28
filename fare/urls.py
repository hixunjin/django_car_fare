from django.contrib import admin
from django.urls import path
from .views import *
from django.contrib.auth.decorators import login_required



urlpatterns = [


    path('admin/',admin.site.urls),
    path('index/',index),



    #车辆信息的增删改查
    path('carlist/',carlist),
    path('caradd/', caradd),
    path('caredit/<int:id>/', caredit),
    path('cardel/<int:id>/', cardelete),



    #部门信息的增删改查
    path('deplist/',deplist),
    path('depadd/', depadd),
    path('depedit/<int:id>/',depedit),
    path('depdelete/<int:id>/',depdelete),


    #用户分配
    path('userlist/',userlist),   #用户列表
    path('useredit/<int:userid>/',useredit),  #用户编辑
    path('userdel/<int:userid>/',userdel),  #用户编辑





    #车费上报路由
    path('farelist/',farelist),
    path('fareadd/', fareadd),
    path('fareedit/<int:fareid>/', fareedit),
    path('faredel/<int:fareid>/', faredel),


    #车费审批功能，包含 通过审批 和 取消审批两部分，每部分都有两部分组成，即 列表展示数据和审批功能,同时，这里结合了
    #分页组件功能


    #通过审批
    path('farecheck/',farecheck),
    path('farecheck/<str:ids>/', fare_approve),  #可以实现多选，即一次选择多个记录

    #取消审批
    path('farecheck2/',farecheck2),
    path('farecheck2/<str:ids>/',cancel_fare, name='cancel_fare'),


    #车费统计
    path('annotate/',annotate_fare),


]

