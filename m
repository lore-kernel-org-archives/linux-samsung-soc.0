From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/2] RTC: s3c: Initialize s3c_rtc_cpu_type before using it
Date: Thu, 27 May 2010 23:28:47 +0200
Message-ID: <4BFEE40F.8010400@gmail.com>
References: <cover.1274994983.git.mcuelenaere@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:37266 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757174Ab0E0V2u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 May 2010 17:28:50 -0400
Received: by mail-ew0-f216.google.com with SMTP id 8so137814ewy.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 May 2010 14:28:49 -0700 (PDT)
In-Reply-To: <cover.1274994983.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, a.zummo@towertech.it, p_gortmaker@yahoo.com, Jiri.Pinkava@vscht.cz, akpm@linux-foundation.org

Make sure s3c_rtc_cpu_type is initialised _before_ it's used in an if() check.

This was probably caused due to a merge mistake.

Reported-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 drivers/rtc/rtc-s3c.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 6adebf3..70b68d3 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -508,13 +508,13 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 		goto err_nortc;
 	}
 
+	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
+
 	if (s3c_rtc_cpu_type == TYPE_S3C64XX)
 		rtc->max_user_freq = 32768;
 	else
 		rtc->max_user_freq = 128;
 
-	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
-
 	platform_set_drvdata(pdev, rtc);
 
 	s3c_rtc_setfreq(&pdev->dev, 1);
-- 
1.7.1
