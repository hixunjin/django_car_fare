# 应该弄清楚页面的HTML代码

# 这里写好的组件，可以让多个视图函数同时使用，视图函数再让前端进行渲染，实现了代码复用

# 把下一页按钮修改好
class Paginater():
    def __init__(self, url_address, cur_page_num, total_rows, one_page_lines=10, page_max_tag=9):
        #  self.属性名 是 设置的本类中的属性，和属性值没有关系，一般是将属性值给它

        self.url_address = url_address  # 需要分页功能的网页URL
        self.page_max_tag = page_max_tag

        """
        下面我们设置 总页数、当前页数
        总页数:总记录/一页中含有的数据量，得到的整数即为总页数，如果存在余数，总页数=整数+
        当前页数:如果当前页数大于总数，则当前页数设置为总数，即尾页
        """

        # 处理总页数
        total_page, remainder = divmod(total_rows, one_page_lines)

        if remainder:
            total_page += 1

        self.total_page = total_page  # 这里是相当于给类添加一个 total_page 字段

        # 处理当前页数

        try:
            cur_page_num = int(cur_page_num)

            if cur_page_num > total_page:
                cur_page_num = total_page

            # 避免当前页面出现为零的情况
            if cur_page_num == 0:
                cur_page_num = 1

        except Exception as e:
            # 如果输入的页码数不是正整数或者数字时，设置当前页面为第一页
            cur_page_num = 1

        # 当前页面cur_page_num 处理完毕
        self.cur_page_num = cur_page_num

        # 定义两个变量:当前页的记录开始数、记录结束数

        # rows_start:即当前页的数据在数据库中总数居的索引数
        """
        分页从1开始，数据库数据索引是从0开始，所以当前页需要减去1 并乘以 每页的总数据量
        例如
        一页有10条数据，第二页的起始数据索引为: (2-1) * 10 = 10
        即在数据库中代表是第 11条数据
        """
        self.rows_start = (cur_page_num - 1) * one_page_lines

        """
        rows_end:当前页最后一条数据在数据库中的索引，即结束索引
        rows_end = cur_page_num * one_page_lines

        例如:
        rows_end  =  2 * 10 = 20 即第二页的结束索引为 20，在数据库中索引为 21 

        那么:  rows_end - rows_start = 21 - 11 = 10 = one_page_lines
        """
        self.rows_end = cur_page_num * one_page_lines

        # 页码标签数的设置
        # 如果总页数小于当前页的页码标签码数，设置每页页码数为总页数（尾页）
        if total_page < page_max_tag:
            page_max_tag = total_page

            # 页码标签数的位置处理，当前页码标签放到中间，前面放一半页码标签，后面放一半页码标签

            """
             10 / 2 = 5

             5
             start = 5-5 = 2
             end = 5+5 = 10
             当前页码标签 总页码标签数 决定起始和结束的页码标签数，起始和结束这两个值在发生变化

            """

        half_page_maxtag = page_max_tag // 2

        # 计算起始和结束的页码标签数
        page_start = cur_page_num - half_page_maxtag
        page_end = cur_page_num + half_page_maxtag

        """
        如果计算出的页码标签开始数小于1，则设置 page_start = 1 page_end = page_max_tag 
        """

        if page_start < 1:
            page_start = 1
            page_end = page_max_tag

        if page_end >= total_page:
            page_end = page_max_tag
            page_start = total_page - page_max_tag + 1

            if page_start <= 1:
                page_start = 1

        # 最终处理
        self.page_start = page_start
        self.page_end = page_end

    # 上面的部分处理的都是和页码相关的属性，接下来是生成 HTML 代码部分
    def html_page(self):
        html_page = []  # 这个列表用于存储HTML代码片段,数据类型本质上是 字符串

        # 首页代码
        html_page.append('<li><a href="{}?page=1">首页</a></li>'.format(self.url_address))

        """
        上一页的页码标签HTML代码，如果当前页是第一页，上一页标签设置为不可用状态
        """

        if self.cur_page_num <= 1:
            html_page.append("<li class='disabled'><a href='#' ><span aria-hidden='true'>&laquo</span></a></li>".format(
                self.cur_page_num - 1
            ))
        else:
            html_page.append("<li><a href='{}?page={}'><span aria-hidden='true'>&laquo</span></a></li>"
                             .format(self.url_address, self.cur_page_num - 1))

        # 依次取出页码标签
        for i in range(self.page_start, self.page_end + 1):
            # 如果等于当前页面，就增加一个 active 类
            if i == self.cur_page_num:
                tmp = '<li class="active"><a href="{0}?page={1}" >{1}</a></li>' \
                    .format(self.url_address, i)


            else:
                tmp = '<li class=""><a href="{0}?page={1}" >{1}</a></li>' \
                    .format(self.url_address, i)

            html_page.append(tmp)

        """
        下一页的页码标签
        """

        # 如果当前页是最后一页，则下一页设置为 disabled

        if self.cur_page_num >= self.total_page:
            a = '<li class="disabled"><a href="#"><span aria-hidden="true">&raquo;</span></a></li>'
            html_page.append(a)

        else:
            a = '<li><a href="{}?page={}"><span aria-hidden="true">&raquo</span></a></li>' \
                .format(self.url_address, self.total_page)
            html_page.append(a)

        # 最后一页页码标签的HTML代码
        html_page.append('<li><a href="{}?page={}" >尾页</a></li>'.format(self.url_address, self.total_page))

        # 把HTML连接起来
        page_nav = "".join(html_page)
        return page_nav

    # 把  data_start()方法当作属性使用
    @property
    def data_start(self):
        return self.rows_start

    @property
    def data_end(self):
        return self.rows_end






























