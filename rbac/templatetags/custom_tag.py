"""
根据 init__permisssion 中的数据，生成系统菜单需要的数据，即一级菜单和二级菜单


"""



from django import template
from django.conf import settings
import re,os
from django.utils.safestring import mark_safe

#生成模板类库
register = template.Library()



#第一个循环形成二级菜单字典
#我们称为  一级菜单（下面还有菜单）、二级菜单的标题

#函数，构建二级菜单字典结构
def get_structure_data(request):
    current_url = request.path_info  #去除当前网页URL

    #取出 session 中的 权限菜单信息
    perm_menu = request.session[settings.PERMISSION_MENU_KEY]
    menu_dict = {}

    for item in perm_menu:   #item 是一个字典

        #如果 pid 为空，说明是二级菜单的标题
        if not item["pid_id"]:
            # copy()方法可以直接复制一个字典，下面通过复制字典，形成嵌套字典
            menu_dict[item["id"]] = item.copy()  #用二级菜单的id当作键名，键值是二级菜单（作为一级菜单）


    #第二个for循环作用：如果二级菜单被应用，这个二级菜单被激活（添加键值对 {active:true}）
    #如果隶属于某个二级菜单的权限被选中，也设置这个二级菜单被激活，也是添加键值对 {active:true}
    #前端可以根据 active 的值为的 True，来设置高亮效果
    for item in perm_menu:
        regex = "^{0}$".format(item["url"])
        if re.match(regex,current_url):

            #二级菜单标题（属于一级菜单）
            if not item["pid_id"]:
                menu_dict[item['id']]['active'] = True  #menu_dict[item['id']] 这是一个字典结构

            #非权限菜单，把本记录隶属的权限菜单(二级菜单标题)的 active 的值设置为 True
            else:
                menu_dict[item['pid_id']]["active"] = True


    """
    第三个for循环
    把一级菜单个二级菜单按照顺序放在一起，并分出层次感
    """



    menu_result = {}


    for item in menu_dict.values():
        #给 active 赋值，如果取不到值，则设置为   active = None
        active = item.get("active")
        menu_id = item.get('menu_id')


        #如果 menu_id 在 menu_result中，则为二级字典的 children 键值添加一个项
        if menu_id in  menu_result:
            menu_result[menu_id]["children"].append({
                'title':item['title'],
                'url':item['url'],
                'active':active,
            })

            if active:
                menu_result[menu_id]['active'] = True


        else:
            menu_result[menu_id] = {
                'menu_id':menu_id,
                'menu_title':item['menu_title'],
                'active':active,
                'children':[
                    {'title':item['title'],
                     'url':item['url'],
                     'active':active,
                     }
                ]
            }
    return menu_result









@register.inclusion_tag('rbac.html')
def rbac_menu(request):
    menu_data = get_structure_data(request)
    return  {'menu_result':menu_data}




















