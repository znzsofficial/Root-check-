require "import"

function 提示(内容,圆角)
  junyang=
  {
    LinearLayout;
    id="toastb";
    {
      CardView;--卡片控件
      layout_margin='';--卡片边距
      layout_gravity='horizontal';--重力属性
      layout_marginBottom='10dp';--布局底距
      elevation='5dp';--阴影属性
      layout_width='wrap';--卡片宽度
      CardBackgroundColor='#FF757575';--卡片背景颜色
      layout_height='wrap';--卡片高度
      radius=圆角..'dp';--卡片圆角
      {
        TextView;--文字控件
        background="#ff36373C";--背景颜色
        padding="8dp";
        textSize="15sp";--文字大小
        TextColor="#ffffffff";--文字颜色
        layout_width="fill";--卡片宽度
        layout_height="fill";--卡片高度
        gravity="center";--重力
        text="提示出错";--显示文字
        id="text_ts";
      };
    };
  };
  local toast=Toast.makeText(activity,"内容",Toast.LENGTH_SHORT).setView(loadlayout(junyang))
  toast.setGravity(Gravity.BOTTOM,0, 0)
  text_ts.Text=tostring(内容)
  toast.show()
end


退出=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if 退出+2 > tonumber(os.time()) then
      activity.finish()--退出页面
     else
      提示("双击返回键退出",20)
      退出=tonumber(os.time())
    end
    return true
  end
end


function 过渡加载框(标题,消息,时间)
  import ("android.app.ProgressDialog");
  local pd = ProgressDialog.show(this,标题,消息);
  local id =import "android.os.Build"
  local dd=id.SERIAL
  local set=import "android.provider.Settings"
  local id = set.System.getString(this.getContentResolver(), "android_id")
  local codeid =dd..id
  task(时间,function()
    pd.dismiss();
  end)
end