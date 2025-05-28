from django.contrib import admin
from .models import *

@admin.register(UserInfo)
class UserInfoAdmin(admin.ModelAdmin):
    list_display = ("username", "nickname", "email")  # 列表显示的字段
    search_fields = ("username", "nickname", "email")  # 添加搜索框
    filter_horizontal = ("roles",)  # 让多对多字段在 admin 页面更好管理

@admin.register(Role)
class RoleAdmin(admin.ModelAdmin):
    list_display = ("title",)
    filter_horizontal = ("permissions",)

@admin.register(Permission)
class PermissionAdmin(admin.ModelAdmin):
    list_display = ("title", "url", "perm_code", "perm_group")
    list_filter = ("perm_group",)

@admin.register(PermGroup)
class PermGroupAdmin(admin.ModelAdmin):
    list_display = ("title", "menu")

@admin.register(Menu)
class MenuAdmin(admin.ModelAdmin):
    list_display = ("title",)
