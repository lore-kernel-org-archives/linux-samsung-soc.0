From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/3] rtc: rtc-s3c: Add BCD register initialization codes
Date: Wed, 21 Jul 2010 17:57:46 +0900
Message-ID: <1279702666-13021-4-git-send-email-kgene.kim@samsung.com>
References: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53850 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab0GUJGM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 05:06:12 -0400
In-Reply-To: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Taekgyun Ko <taeggyun.ko@samsung.com>

RTC needs to be initialized when BCD registers have invalid value.

Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/rtc/rtc-s3c.c |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 2040017..e96e109 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -536,10 +536,20 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 
 	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
 
-	if (s3c_rtc_cpu_type == TYPE_S3C64XX)
+	if (s3c_rtc_cpu_type == TYPE_S3C64XX) {
 		rtc->max_user_freq = 32768;
-	else
+
+		/* Check RTC Time */
+
+		for (i = S3C2410_RTCSEC; i <= S3C2410_RTCYEAR; i += 0x4) {
+			tmp = readb(s3c_rtc_base + i);
+
+			if (((tmp & 0xf) > 0x9) || (((tmp >> 4) & 0xf) > 0x9))
+				writeb(0, s3c_rtc_base + i);
+		}
+	} else {
 		rtc->max_user_freq = 128;
+	}
 
 	platform_set_drvdata(pdev, rtc);
 
-- 
1.6.2.5
