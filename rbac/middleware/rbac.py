from django.conf import settings
from django.shortcuts import HttpResponse,redirect
from django.utils.deprecation import MiddlewareMixin
import re



#中间件的作用，使用中间件验证用户权限
class RbacMiddleware(MiddlewareMixin):


    #定义函数，在用户请求之后，视图函数工作之前
    def process_request(self,request):

        #取得URL的路径
        request_url = request.path_info

        #从 session 中取出 init_permission 生成的字典，字典包含可以访问的URL
        permission_url = request.session.get(settings.PERMISSION_URL_KEY)





        #settings 中的 SAVE_URL 保存的URL可以直接访问，无需权限，称为URL白名单
        #如果请求的URL在白名单中，则直接返回 None 放行

        for url in settings.SAFE_URL:
            if re.match(url,request_url):
                return None

        #如果是超级用户，放行
        if request.user.is_superuser:
            return None


        #这里是为普通用户设置的登录操作，当 user 值存在时放行，即用验证成功后直接放行，登录成功
        if request.user:
            return  None



        # 如果未取得用户的权限URL，说明用户没有登录，重定向到登陆页面
        #这里的中间件作用：可以检查用户是否登录，如果没有，则让用户重新登陆
        if not permission_url:
            return redirect(settings.LOGIN_URL)



        flag = False  #这里的 flag  是用来控制 for 循环的进程的
        for perm_group_id,code_url in permission_url.items():
            for url in code_url['urls']:

                #构建正则表达式
                url_pattern = "^{0}$".format(url)
                if re.match(url_pattern,request_url):
                    #把用户的权限代码取出来放到 session 中进行备用
                    request.session['permission_codes'] = code_url['codes']

                    print("中间件中的函数输出结果:")
                    print(request.session.get('permission_codes'))

                    flag = True
                    break

            if flag:
                return None

        if not flag:
            # 调试模式
            if settings.DEBUG:
                info = "<br/>" + ('<br/>'.join(code_url['urls']))
                return HttpResponse("无权限，请尝试访问以下地址:%s" % info)


        else:
            return HttpResponse('无权限访问')








