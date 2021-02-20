require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.content.Intent"
import "android.content.IntentFilter"
import "android.content.Context"
import "anime"
import "popup"
a=0
import "check"

xh=Build.MANUFACTURER.." "..Build.MODEL
yj=Build.HARDWARE
adv="安卓版本："..Build.VERSION.RELEASE
SDK="SDK版本："..Build.VERSION.SDK
宽度=this.Width
高度=this.Height
packinfo = this.getPackageManager().getPackageInfo(this.getPackageName(), 64.0)
ver=tostring(packinfo.versionName)
import "layout"

activity.overridePendingTransition(android.R.anim.slide_in_left,android.R.anim.fade_out)
activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
activity.setTitle("Root检测")
activity.setContentView(loadlayout(layout))




if a==0 then
  c0e.setVisibility(View.GONE)
 else
  c0r.setVisibility(View.GONE)
end


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
--状态栏沉浸透明
import "android.graphics.Color"
local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.setStatusBarColor(Color.TRANSPARENT)--程序启动时会执行的事件


function isNightMode()
  local configuration = activity.getResources().getConfiguration();
  return configuration.uiMode+1==configuration.UI_MODE_NIGHT_YES or configuration.uiMode-1==configuration.UI_MODE_NIGHT_YES or configuration.uiMode==configuration.UI_MODE_NIGHT_YES
end
if isNightMode() then
  import "android.graphics.drawable.ColorDrawable"
  back.setBackgroundDrawable(ColorDrawable(0xff2c2c2c))
 else
  import "android.graphics.drawable.ColorDrawable"
  back.setBackgroundDrawable(ColorDrawable(0xffFAFAFA))
end


c1.onClick=function()
  水珠动画(c1,500)
end


c2.onClick=function()
  水珠动画(c2,500)
end


c0e.onLongClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,50},-1)
  过渡加载框("刷新中...","",500)
  task(500,function()
    activity.recreate()
  end)
end



c0r.onLongClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,50},-1)
  过渡加载框("刷新中...","",500)
  task(500,function()
    activity.recreate()
  end)
end



c3.onClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,15},-1)
  信息赋值=activity.getApplicationContext().registerReceiver(null,IntentFilter(Intent.ACTION_BATTERY_CHANGED))
  电量=信息赋值.getIntExtra("level",0)
  电压=信息赋值.getIntExtra("voltage",0)
  温度=信息赋值.getIntExtra("temperature",0)
  提示("电池电量"..电量.."%",10)
  提示("电池电压"..电压.." mV",10)
  提示("电池温度"..(温度*0.1).." ℃",10)
  提示("屏幕高度"..高度.."px",10)
  提示("屏幕宽度"..宽度.."px",10)
end

c4.onClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,15},-1)
  提示("作者：智商封印official",50)
  提示("版本号："..ver,50)
end


c0e.onClick=function()
  showPopMenu(tab0e,c0e,"菜单")
end


c0r.onClick=function()
  showPopMenu(tab0r,c0r,"菜单")
end

back.onLongClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,15},-1)
  showPopMenu(taback,title,"菜单")
end


--函数
function 波纹(id,颜色)
  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
end
--用法

ico.onClick=function()
  波纹(ico,0xff808080)
end


device.onClick=function()
  波纹(device,0xff808080)
end


ndro.onClick=function()
  波纹(ndro,0xff808080)
end

