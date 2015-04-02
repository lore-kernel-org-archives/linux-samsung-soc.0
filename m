From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] rtc: rtc-s3c: Fix failed first read of RTC time
Date: Thu, 02 Apr 2015 13:00:59 +0200
Message-ID: <1427972459-6480-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Initialize the device time (if it is wrong) before registering RTC
device to fix following error message during rtc-s3c probe:

[    2.215414] rtc (null): read_time: fail to read
[    2.216322] s3c-rtc 10070000.rtc: rtc core: registered s3c as rtc1

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 5e162eaad277..1d3a4c58fec4 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -496,6 +496,22 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
+	/* Check RTC Time */
+	s3c_rtc_gettime(&pdev->dev, &rtc_tm);
+
+	if (rtc_valid_tm(&rtc_tm)) {
+		rtc_tm.tm_year	= 100;
+		rtc_tm.tm_mon	= 0;
+		rtc_tm.tm_mday	= 1;
+		rtc_tm.tm_hour	= 0;
+		rtc_tm.tm_min	= 0;
+		rtc_tm.tm_sec	= 0;
+
+		s3c_rtc_settime(&pdev->dev, &rtc_tm);
+
+		dev_warn(&pdev->dev, "warning: invalid RTC value so initializing it\n");
+	}
+
 	/* register RTC and exit */
 	info->rtc = devm_rtc_device_register(&pdev->dev, "s3c", &s3c_rtcops,
 				  THIS_MODULE);
@@ -519,22 +535,6 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 		goto err_nortc;
 	}
 
-	/* Check RTC Time */
-	s3c_rtc_gettime(&pdev->dev, &rtc_tm);
-
-	if (rtc_valid_tm(&rtc_tm)) {
-		rtc_tm.tm_year	= 100;
-		rtc_tm.tm_mon	= 0;
-		rtc_tm.tm_mday	= 1;
-		rtc_tm.tm_hour	= 0;
-		rtc_tm.tm_min	= 0;
-		rtc_tm.tm_sec	= 0;
-
-		s3c_rtc_settime(&pdev->dev, &rtc_tm);
-
-		dev_warn(&pdev->dev, "warning: invalid RTC value so initializing it\n");
-	}
-
 	if (info->data->select_tick_clk)
 		info->data->select_tick_clk(info);
 
-- 
1.9.1
