require "import"
import "android.widget.PopupWindow"
import "android.widget.LinearLayout"
import "android.content.res.ColorStateList"
import "android.R$id"
import "android.graphics.Typeface"
import "android.graphics.drawable.ColorDrawable"
import "android.content.res.ColorStateList"
import "android.widget.CardView"
import "anime"

function dp2px(dpValue)
  local scale = activity.getResources().getDisplayMetrics().scaledDensity
  return dpValue * scale + 0.5
end
小部件=0xffbb000000
主题色=0xff009688

function showPopMenu(tab,views,title)

  lp = activity.getWindow().getAttributes();
  lp.alpha = 0.85;
  activity.getWindow().setAttributes(lp);
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);

  ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
  ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)

  Popup_layout={
    LinearLayout;
    {
      CardView;
      Elevation="0";
      CardBackgroundColor=0xfffafafa;
      Radius="4dp";
      layout_width="192dp";
      layout_height="-2";
      --  layout_marginTop="8dp";
      layout_marginLeft="8dp";
      {
        LinearLayout;
        layout_height="-1";
        layout_width="-1";
        orientation="vertical",
        id="Popup_list";
      };
    };
  };

  --PopupWindow
  pops=PopupWindow(activity)
  --PopupWindow加载布局
  pops.setContentView(loadlayout(Popup_layout))
  pops.setWidth(-2)
  pops.setHeight(-2)
  pops.setFocusable(true)
  pops.setOutsideTouchable(true)
  pops.setBackgroundDrawable(ColorDrawable(0x00000000))

  pops.onDismiss=function()
    lp = activity.getWindow().getAttributes();
    lp.alpha = 1;
    activity.getWindow().setAttributes(lp);
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);


  end

  --PopupWindow列表项布局

  Popup_list_title={
    LinearLayout;
    layout_width="-1";
    layout_height="48dp";
    {
      TextView;
      id="popadp_text";
      Typeface=Typeface.DEFAULT_BOLD,
      textColor=主题色;

      layout_width="-1";
      layout_height="-1";
      textSize="14sp";
      gravity="left|center";
      paddingLeft="16dp";
      Enabled=false,
      --  Alpha=0.5,

    };
  };

  if title
    view=loadlayout(Popup_list_title)
    Popup_list.addView(view)
    popadp_text.setText(title)
  end

  Popup_list_item={
    LinearLayout;
    layout_width="-1";
    layout_height="48dp";
    {
      TextView;
      id="popadp_text";
      textColor=小部件;
      layout_width="-1";
      layout_height="-1";
      textSize="14sp";
      gravity="left|center";
      paddingLeft="16dp";

    };
  };

  for k,v in pairs(tab)

    view=loadlayout(Popup_list_item)
    view.BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{0x10000000}));
    if type(v)=="table"

      Popup_list.addView(view)
      popadp_text.setText(k.."...")
      view.onClick=function()
        pops.dismiss()
        task(50,function()

          showPopMenu(v,views,k.."...")
        end)
        -- pops.dismiss()
      end

     elseif type(v)=="function"

      Popup_list.addView(view)
      popadp_text.setText(k)
      view.onClick=function()
        pops.dismiss()
        task(50,function()

          v()
        end)
      end
    end
  end
  pops.showAsDropDown(views)
end

tab0={
  ["菜单"]={
    ["无"]=function()
    end,
  },
  ["返回"]=function()
  end,
  ["隐藏"]=function()
    水珠动画(c0,500)
    task(500,function()
      c0.setVisibility(View.GONE)
    end)
  end,
}

