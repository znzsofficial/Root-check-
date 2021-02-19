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
  提示("夜间模式有点问题",40)
  back.setBackgroundDrawable(ColorDrawable(0xff2c2c2c))
  c0.setBackgroundDrawable(ColorDrawable(0xff388E3C))
 else
  import "android.graphics.drawable.ColorDrawable"
  back.setBackgroundDrawable(ColorDrawable(0xffFAFAFA))
end





c0.onLongClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,50},-1)
  过渡加载框("...","",500)
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
  提示("电池电量"..电量.." %",10)
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


c0.onClick=function()
  showPopMenu(tab0,c0,"菜单")
end
