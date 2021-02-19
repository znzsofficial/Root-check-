require "import"
import "com.androlua.util.RootUtil"
import "java.io.File"
if pcall(function() activity.getPackageManager().getPackageInfo("com.topjohnwu.magisk",0) end) then
  a=a+1
 else
end

if pcall(function() activity.getPackageManager().getPackageInfo("org.meowcat.edxposed.manager",0) end) then
  a=a+1
 else
end

if pcall(function() activity.getPackageManager().getPackageInfo("io.github.lsposed.manager",0) end) then
  a=a+1
 else
end

import "com.androlua.util.RootUtil"
local root = RootUtil()
if root.haveRoot() then
  a=a+1
 else
end



local root,exit,numb=os.execute("su")
if root==true then
  a=a+1
 else
end


if pcall(function() activity.getPackageManager().getPackageInfo("com.coderstory.toolkit",0) end) then
  a=a+1
 else
end


if pcall(function() activity.getPackageManager().getPackageInfo("de.robv.android.xposed.installer",0) end) then
  a=a+1
 else
end


if pcall(function() activity.getPackageManager().getPackageInfo("com.omarea.vaddin",0) end) then
  a=a+1
 else
end

if pcall(function() activity.getPackageManager().getPackageInfo("me.weishu.exp",0) end) then
  a=a+1
 else
end

if pcall(function() activity.getPackageManager().getPackageInfo("eu.chainfire.supersu",0) end) then
  a=a+1
 else
end


if pcall(function() activity.getPackageManager().getPackageInfo("com.qihoo.permmgr",0) end) then
  a=a+1
 else
end


if pcall(function() activity.getPackageManager().getPackageInfo("nil.nadph.qnotified",0) end) then
  a=a+1
 else
end


if File("/sdcard/TWRP").exists() then
  a=a+1
 else
end