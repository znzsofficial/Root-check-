require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"


activity.setTheme(R.Theme_Blue)
activity.setTitle("禅定")

activity.recreate()

function onPause()
  activity.recreate()
end
function onDestroy()
  activity.recreate()
end
function onStop()
  activity.recreate()
end