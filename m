From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 2/2] rtc: max77802: Report platform modalias to fix module autoload
Date: Wed, 13 May 2015 17:18:02 +0200
Message-ID: <1431530282-10672-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1431530282-10672-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431530282-10672-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

If the rtc-max77802 driver is built as a module, modalias information is
not filled so the module is not autoloaded. Use the MODULE_DEVICE_TABLE()
macro to export the platform ID table so the module contains that data.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/rtc/rtc-max77802.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-max77802.c b/drivers/rtc/rtc-max77802.c
index 7f8adf8d6feb..82ffcc5a5345 100644
--- a/drivers/rtc/rtc-max77802.c
+++ b/drivers/rtc/rtc-max77802.c
@@ -484,6 +484,7 @@ static const struct platform_device_id rtc_id[] = {
 	{ "max77802-rtc", 0 },
 	{},
 };
+MODULE_DEVICE_TABLE(platform, rtc_id);
 
 static struct platform_driver max77802_rtc_driver = {
 	.driver		= {
-- 
2.1.4
