require "import"
import "com.androlua.util.RootUtil"
import "java.io.File"

r=0
f=0
a=0

if pcall(function() activity.getPackageManager().getPackageInfo("org.lsposed.manager",0) end) then
  r=r+1
 else
end

if pcall(function() activity.getPackageManager().getPackageInfo("com.topjohnwu.magisk",0) end) then
  r=r+1
 else
end

if pcall(function() activity.getPackageManager().getPackageInfo("org.meowcat.edxposed.manager",0) end) then
  r=r+1
 else
end

if pcall(function() activity.getPackageManager().getPackageInfo("io.github.lsposed.manager",0) end) then
  r=r+1
 else
end


import "com.androlua.util.RootUtil"
local root = RootUtil()
if root.haveRoot() then
  f=f+1
 else
  if File("/system/bin/su").exists() then
    f=f+1
   else
  end
end




if pcall(function() activity.getPackageManager().getPackageInfo("de.robv.android.xposed.installer",0) end) then
  r=r+1
 else
end



if pcall(function() activity.getPackageManager().getPackageInfo("me.weishu.exp",0) end) then
  r=r+1
 else
end

if pcall(function() activity.getPackageManager().getPackageInfo("eu.chainfire.supersu",0) end) then
  r=r+1
 else
end


if pcall(function() activity.getPackageManager().getPackageInfo("com.qihoo.permmgr",0) end) then
  r=r+1
 else
end



if File("/sdcard/TWRP").exists() then
  f=f+1
 else
end




if File("/system/bin/ku.sud").exists() then
  f=f+1
 else
end



if File("/system/bin/toybox").exists() then
  f=f+1
 else
end


if File("/system/xbin/daemonsu").exists() then
  f=f+1
 else
end

if File("/system/xbin/sugote").exists() then
  f=f+1
 else
end


if File("/data/adb/magisk").exists() then
  f=f+1
 else
end


if File("/data/adb/lspd").exists() then
  f=f+1
 else
end

a=f+r