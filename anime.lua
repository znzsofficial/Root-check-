require "import"
import "android.view.animation.LinearInterpolator"
import "android.view.animation.Animation"
import "android.view.animation.RotateAnimation"
import "android.animation.ValueAnimator"
import "android.view.animation.DecelerateInterpolator"
import "android.animation.AnimatorSet"
import "android.view.animation.ScaleAnimation"
import "android.animation.ObjectAnimator"
import "android.view.ViewAnimationUtils"


function 单次旋转(控件,频率)
  import "android.view.animation.Animation"
  import "android.view.animation.RotateAnimation"
  rotate = RotateAnimation(0,360,Animation.RELATIVE_TO_SELF,0.5,Animation.RELATIVE_TO_SELF,0.5)
  rotate.setDuration(频率)
  rotate.setRepeatCount(0.5)
  控件.startAnimation(rotate)
end

function 缓冲旋转(控件,频率)
  import "android.view.animation.Animation"
  import "android.view.animation.RotateAnimation"
  rotate = RotateAnimation(0,360,Animation.RELATIVE_TO_SELF,0.5,Animation.RELATIVE_TO_SELF,0.5)
  rotate.setDuration(频率)
  rotate.setRepeatCount(频率)
  控件.startAnimation(rotate)
end

function 流畅旋转(控件,频率,顺时针,逆时针)
  import "android.view.animation.LinearInterpolator"
  c = ObjectAnimator()
  c.setTarget(控件)
  c.setDuration(频率)
  c.setRepeatCount(ValueAnimator.INFINITE)
  c.setPropertyName("rotation")
  c.setFloatValues({顺时针,逆时针})
  c.setRepeatMode(ValueAnimator.INFINITE)
  c.setInterpolator(LinearInterpolator())
  c.start()
end

function 揭露动画(view,a,b,c,d,e)
  translationUp = ViewAnimationUtils.createCircularReveal(view,a,b,c,d)
  translationUp.setInterpolator(DecelerateInterpolator())
  translationUp.setDuration(e)
  translationUp.start()
end
--调用方法
--task(1,function()
--揭露动画(填写控件ID,0,0,0,activity.Height,2000)
--end)

function 缩放动画(控件)
  import "android.view.animation.*"
  控件.startAnimation(ScaleAnimation(0.0,1.0,0.0,1.0,1,0.5,1,0.5).setDuration(200))
end

function 水珠动画(控件,时间)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(控件,"scaleX",{1,.8,1.3,.9,1}).setDuration(时间).start()
  ObjectAnimator().ofFloat(控件,"scaleY",{1,.8,1.3,.9,1}).setDuration(时间).start()
end



--[[单击缩放={
  onTouch=function (v,e)
    if e.action==0 then
      设置缩放(v,1,0.95,250)
     else
      设置缩放(v,0.90,1,250)
    end
  end}
function 设置缩放(view,startscale,endscale,time)
  local animatorSetsuofang = AnimatorSet()
  local scaleX=ObjectAnimator.ofFloat(view,"scaleX",{startscale,endscale})
  local scaleY=ObjectAnimator.ofFloat(view,"scaleY",{startscale,endscale})
  animatorSetsuofang.setDuration(time)
  animatorSetsuofang.setInterpolator(DecelerateInterpolator())
  animatorSetsuofang.play(scaleX).with(scaleY);
  animatorSetsuofang.start()
end
--调用方法
填写控件ID.onTouchListener=单击缩放;
]]

--[[点击监听={
  onTouch=function (v,e)
    if e.action==2 then
      缩放动画(v, 0,0.95,250)
     else
      缩放动画(v,0.95,1,250)
    end
  end}
function 缩放动画(view,startscale,endscale,time)
  local animatorSetsuofang = AnimatorSet()
  local scaleX=ObjectAnimator.ofFloat(view,"scaleX",{startscale,endscale})
  local scaleY=ObjectAnimator.ofFloat(view,"scaleY",{startscale,endscale})
  animatorSetsuofang.setDuration(time)
  animatorSetsuofang.setInterpolator(DecelerateInterpolator())
  animatorSetsuofang.play(scaleX).with(scaleY);
  animatorSetsuofang.start()
end

--调用方法
--点击监听放到布局控件里
onTouchListener=点击监听,--动画效果
]]
