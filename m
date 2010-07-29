From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v3 3/3] rtc: rtc-s3c: Add BCD register initialization codes
Date: Thu, 29 Jul 2010 13:59:30 +0900
Message-ID: <1280379570-6147-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42347 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751117Ab0G2FMz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 01:12:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Taekgyun Ko <taeggyun.ko@samsung.com>

RTC needs to be initialized when BCD registers have invalid value.

Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
---
Hi, Alessandro Zummo
Just moved the routine to support all Samsung SoCs' RTC.
Is still your ack valid?

Changes since v2:
Moved chekcing BCD registers to support all Samsung SoCs as per Ben's comments.

 drivers/rtc/rtc-s3c.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 2040017..a0d3ec8 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -458,6 +458,7 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 {
 	struct rtc_device *rtc;
 	struct resource *res;
+	unsigned int tmp, i;
 	int ret;
 
 	pr_debug("%s: probe=%p\n", __func__, pdev);
@@ -536,6 +537,15 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 
 	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
 
+	/* Check RTC Time */
+
+	for (i = S3C2410_RTCSEC; i <= S3C2410_RTCYEAR; i += 0x4) {
+		tmp = readb(s3c_rtc_base + i);
+
+		if ((tmp & 0xf) > 0x9 || ((tmp >> 4) & 0xf) > 0x9)
+			writeb(0, s3c_rtc_base + i);
+	}
+
 	if (s3c_rtc_cpu_type == TYPE_S3C64XX)
 		rtc->max_user_freq = 32768;
 	else
-- 
1.6.2.5
