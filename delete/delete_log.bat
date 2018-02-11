@echo off
set wwwroot=D:\www\php\ysos
set dir=%wwwroot%\ys_center\runtime\log %wwwroot%\ys_information\runtime\log %wwwroot%\ys_file\runtime\log %wwwroot%\ys_im\runtime\log %wwwroot%\ys_log\runtime\log
set dir=%dir% %wwwroot%\ys_material\runtime\log %wwwroot%\ys_notice\runtime\log %wwwroot%\ys_qr\runtime\log %wwwroot%\ys_queue\runtime\log %wwwroot%\ys_resource\runtime\log
set dir=%dir% %wwwroot%\ys_material\runtime\log %wwwroot%\ys_notice\runtime\log %wwwroot%\ys_qr\runtime\log %wwwroot%\ys_queue\runtime\log %wwwroot%\ys_resource\runtime\log
set dir=%dir% %wwwroot%\ys_scenic\Runtime\Logs %wwwroot%\ys_sms\runtime\log %wwwroot%\ys_tuanjie\runtime\log %wwwroot%\ys_wechat\runtime\log
echo 正在删除%dir%里的7天前的日志
for %%i in (%dir%) do forfiles /p %%i /s /m *.log /d -7 /c "cmd /c del @path"
echo 删除完成
pause