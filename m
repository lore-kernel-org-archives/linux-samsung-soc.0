From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/3] rtc: rtc-s3c: Updates driver for S3C64XX and newer SoCs
Date: Wed, 21 Jul 2010 17:57:45 +0900
Message-ID: <1279702666-13021-3-git-send-email-kgene.kim@samsung.com>
References: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53824 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751518Ab0GUJGM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 05:06:12 -0400
In-Reply-To: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Atul Dahiya <atul.dahiya@samsung.com>, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Atul Dahiya <atul.dahiya@samsung.com>

This Patch does followings.
1) Enables support for alarm and time tick pending register
   for periodic interrupt generation.
2) Changes writeb to writew beacuse the macro S3C64XX_RTCCON_TICEN
   (Tick Timer Enable) is 9th bit of register.
3) Changes writeb to writel as max_user_freq used in s3c64xx is 32768 and
   requires 15 bits to update the Tick Count Register.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/rtc/rtc-s3c.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index c032a15..2040017 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -57,6 +57,10 @@ static irqreturn_t s3c_rtc_alarmirq(int irq, void *id)
 	struct rtc_device *rdev = id;
 
 	rtc_update_irq(rdev, 1, RTC_AF | RTC_IRQF);
+
+	if (s3c_rtc_cpu_type == TYPE_S3C64XX)
+		writeb(S3C2410_INTP_ALM, s3c_rtc_base + S3C2410_INTP);
+
 	return IRQ_HANDLED;
 }
 
@@ -65,6 +69,10 @@ static irqreturn_t s3c_rtc_tickirq(int irq, void *id)
 	struct rtc_device *rdev = id;
 
 	rtc_update_irq(rdev, 1, RTC_PF | RTC_IRQF);
+
+	if (s3c_rtc_cpu_type == TYPE_S3C64XX)
+		writeb(S3C2410_INTP_TIC, s3c_rtc_base + S3C2410_INTP);
+
 	return IRQ_HANDLED;
 }
 
@@ -98,7 +106,7 @@ static int s3c_rtc_setpie(struct device *dev, int enabled)
 		if (enabled)
 			tmp |= S3C64XX_RTCCON_TICEN;
 
-		writeb(tmp, s3c_rtc_base + S3C2410_RTCCON);
+		writew(tmp, s3c_rtc_base + S3C2410_RTCCON);
 	} else {
 		tmp = readb(s3c_rtc_base + S3C2410_TICNT);
 		tmp &= ~S3C2410_TICNT_ENABLE;
@@ -132,7 +140,7 @@ static int s3c_rtc_setfreq(struct device *dev, int freq)
 
 	tmp |= (rtc_dev->max_user_freq / freq)-1;
 
-	writeb(tmp, s3c_rtc_base + S3C2410_TICNT);
+	writel(tmp, s3c_rtc_base + S3C2410_TICNT);
 	spin_unlock_irq(&s3c_rtc_pie_lock);
 
 	return 0;
-- 
1.6.2.5
