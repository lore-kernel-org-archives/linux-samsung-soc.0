From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 1/2] RTC: s3c: Initialize driver data before using it
Date: Thu, 27 May 2010 23:28:45 +0200
Message-ID: <4BFEE40D.4030807@gmail.com>
References: <cover.1274994983.git.mcuelenaere@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:37266 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755439Ab0E0V2r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 May 2010 17:28:47 -0400
Received: by mail-ew0-f216.google.com with SMTP id 8so137814ewy.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 May 2010 14:28:47 -0700 (PDT)
In-Reply-To: <cover.1274994983.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, a.zummo@towertech.it, p_gortmaker@yahoo.com, Jiri.Pinkava@vscht.cz, akpm@linux-foundation.org

s3c_rtc_setfreq() uses the platform driver data to derive struct rtc_device,
so make sure drvdata is set _before_ s3c_rtc_setfreq() is called.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 drivers/rtc/rtc-s3c.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index e5972b2..6adebf3 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -495,8 +495,6 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
  	pr_debug("s3c2410_rtc: RTCCON=%02x\n",
 		 readb(s3c_rtc_base + S3C2410_RTCCON));
 
-	s3c_rtc_setfreq(&pdev->dev, 1);
-
 	device_init_wakeup(&pdev->dev, 1);
 
 	/* register RTC and exit */
@@ -518,6 +516,9 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
 
 	platform_set_drvdata(pdev, rtc);
+
+	s3c_rtc_setfreq(&pdev->dev, 1);
+
 	return 0;
 
  err_nortc:
-- 
1.7.1
