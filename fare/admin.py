from django.contrib import admin
from . import models


#后台注册
@admin.register(models.carinfo)
class CarInfoAdmin(admin.ModelAdmin):
    list_display = ('plate_number', 'driver', 'price', 'remarks')
    search_fields = ('plate_number', 'driver')
    list_filter = ('driver',)

@admin.register(models.loguser)
class LogUserAdmin(admin.ModelAdmin):
    list_display = ('user_obj', 'dep')
    search_fields = ('user_obj__username',)

@admin.register(models.department)
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('dep_name', 'dep_script')
    search_fields = ('dep_name',)

@admin.register(models.fare)
class FareAdmin(admin.ModelAdmin):
    list_display = ('passenger', 'car', 'driver', 'distance', 'fare', 'derve_date', 'operator', 'approve_status')
    list_filter = ('approve_status', 'derve_date')
    search_fields = ('passenger', 'driver', 'operator')
    date_hierarchy = 'derve_date'
