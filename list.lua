require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

layout=
{
  --添加滚动布局，因为list可以很多，所以需要添加滚动布局
  ScrollView,
  VerticalScrollBarEnabled=false,
  id="xm",
  {--滚动布局下必须有线性竖直布局
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_margin="38dp";
    layout_height="fill",
    {--添加一个list布局，这个时候list是空的，还没有匹配数据
      --仅仅是在屏幕布局内开辟一块大空间作为list布局
      ListView;
      layout_width="fill";
      layout_height="332dp";
      dividerHeight="4";
      id="yuxuan_list";
      --background="#ff4285f4",
    },

  };

}
activity.setContentView(loadlayout(layout))



--状态栏沉浸透明
import "android.graphics.Color"
local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.setStatusBarColor(Color.TRANSPARENT)--程序启动时会执行的事件





--定义一个布局为list单个项目布局，名字为itemc
itemc={
  LinearLayout;
  gravity="center";
  layout_width="fill";
  layout_height="80dp";
  orientation="horizontal";
  {
    ImageView;
    layout_height="25dp";
    id="srcf";
    --padding="10dp";
    layout_width="25dp";
    layout_marginLeft="15dp";
    ColorFilter=0xff4285f4;--给图标上色
  };
  {
    LinearLayout;
    layout_width="fill";
    layout_height="80dp";
    orientation="vertical";
    layout_marginLeft="20dp";
    {
      TextView;
      id="srct";
      layout_height="40dp";
      layout_width="fill";
      textColor="#000000",
      gravity="left|bottom",
      textSize="15sp",
    };
    {
      TextView;
      id="srcb";
      layout_height="40dp";
      layout_width="fill";
      textColor="#808080",
      gravity="left",
      textSize="12sp",



    };
  };
};
--一个小list模板已搭建好了，下面开始匹配数据

--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}


--创建了三个有数据的列表
aic={"","res/ic_color_lens_black_24dp.png","res/ic_arrow_drop_down_circle_black_24dp.png","res/ic_email_black_24dp.png"}
aw={"这个页面本来应该是用来显示具体检测项目的","图标绘制","打包开发","联系作者"}
mmp={"但是我懒","谁知道，反正是Auto的图标","@智商封印official","znzsofficial@qq.com"}


--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  table.insert(datas,{srct=aw[nj],srcf=aic[nj],srcb=mmp[nj]})
end
--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adp=LuaAdapter(activity,datas,itemc)

--将小项目匹配给大list
yuxuan_list.Adapter=yuxuan_adp




--[[给list添加点击事件
yuxuan_list.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id)
    if pos == 0 then
      弹出消息("list1")
     elseif pos == 1 then
      弹出消息("list2")
     else
      弹出消息("list3")
    end
  end
})
]]


--[[
yuxuan_list.setOnItemLongClickListener(AdapterView.OnItemLongClickListener{
  onItemLongClick=function(parent,v,pos,id)
    if pos == 0 then
      弹出消息("长按list1")
     elseif pos == 1 then
      弹出消息("长按list2")
     else
      弹出消息("长按list3")
    end
  end
})
]]




