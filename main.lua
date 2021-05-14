require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.content.Intent"
import "android.content.IntentFilter"
import "android.content.Context"
import "android.graphics.Paint"
import "function"
import "anime"
import "popup"
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


title.getPaint().setFakeBoldText(true)

if a==0 then
  c0e.setVisibility(View.GONE)
 else
  c0r.setVisibility(View.GONE)
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
  title.setTextColor(0xfff0f0f0)
 else
  import "android.graphics.drawable.ColorDrawable"
  back.setBackgroundDrawable(ColorDrawable(0xffFAFAFA))
  title.setTextColor(0xff3f3f3f)
  this.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
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
  提示("作者：智商封印official™",50)
  提示("版本号："..ver,50)
end


c0e.onClick=function()
  showPopMenu(tab0e,c0e,"菜单")
end


c0r.onClick=function()
  showPopMenu(tab0r,c0r,"菜单")
end




ico.onClick=function()
  showPopMenu(taback,title,"菜单")
  缓冲旋转(ico,2500)
end


function 波纹特效v2(颜色)
  import"android.content.res.ColorStateList"
  return activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackground--[[Borderless]]}).getResourceId(0,0))
  .setColor(ColorStateList(int[0]
  .class{int{}},int{颜色 or 0x20000000}))
end

c3.foreground=波纹特效v2(0xff666666)

c4.foreground=波纹特效v2(0xff666666)

c0r.foreground=波纹特效v2(0x22000000)
c0e.foreground=波纹特效v2(0x22000000)