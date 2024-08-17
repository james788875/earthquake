@ECHO OFF
chcp 65001

:: 設定發送給LINE的訊息，包含日期和時間
SET /A "sec=%2-5"
IF %sec% LSS 0 SET "sec=0"
IF %1 == 0 SET "text=%date% %time% 地震速報，預估震度%1級，%sec%秒後抵達"
IF %1 == 1 SET "text=%date% %time% 地震速報，預估震度%1級，%sec%秒後抵達"
IF %1 == 2 SET "text=%date% %time% 地震速報，預估震度%1級，%sec%秒後抵達"
IF %1 == 3 SET "text=%date% %time% 地震速報，預估震度%1級，%sec%秒後抵達"
IF %1 == 4 SET "text=%date% %time% 地震速報，預估震度%1級，%sec%秒後抵達"
IF %1 == 5- SET "text=%date% %time% 強震警報，預估震度5弱，%sec%秒後抵達"
IF %1 == 5+ SET "text=%date% %time% 強震警報，預估震度5強，%sec%秒後抵達"
IF %1 == 6- SET "text=%date% %time% 強震警報，預估震度6弱，%sec%秒後抵達"
IF %1 == 6+ SET "text=%date% %time% 強震警報，預估震度6強，%sec%秒後抵達"
IF %1 == 7 SET "text=%date% %time% 強震警報，預估震度%1級，%sec%秒後抵達"


:: 發送LINE通知
set LINE_TOKEN=貼上你的line notify token 不用雙引號喔
curl -X POST -H "Authorization: Bearer %LINE_TOKEN%" -F "message=%text%"  https://notify-api.line.me/api/notify
:: 向Google Sheets發送數據
curl -X POST -H "Content-Type: application/json" -d "{\"level\":\"%1\", \"seconds\":\"%sec%\"}" https://部署網頁網址

