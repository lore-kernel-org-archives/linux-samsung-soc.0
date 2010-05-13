From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 8/9] Input: s3c24xx_ts - Adds TYPE_S5PV210 into Samsung touchscreen driver
Date: Thu, 13 May 2010 22:07:28 +0900
Message-ID: <1273756048-3263-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52301 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab0EMNKw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 May 2010 09:10:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Naveen Krishna <ch.naveen@samsung.com>

This patch adds TYPE_S5PV210 to the ID table in Samsung touchscreen driver.
So, we can configure the driver based on the IP level changes.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/input/touchscreen/Kconfig      |    2 +-
 drivers/input/touchscreen/s3c2410_ts.c |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index c82c1e1..a90a5bb 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -159,7 +159,7 @@ config TOUCHSCREEN_FUJITSU
 
 config TOUCHSCREEN_S3C2410
 	tristate "Samsung S3C2410 touchscreen input driver"
-	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5P6440
+	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5P6440 || ARCH_S5PV210
 	select S3C_ADC
 	help
 	  Say Y here if you have the s3c2410 touchscreen.
diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
index 7e7d368..8a970ea 100644
--- a/drivers/input/touchscreen/s3c2410_ts.c
+++ b/drivers/input/touchscreen/s3c2410_ts.c
@@ -89,6 +89,7 @@ enum s3c_cpu_type {
 	TYPE_S3C2410,
 	TYPE_S3C2440,
 	TYPE_S3C64XX,	/* S3C64XX, S5P64XX Series */
+	TYPE_S5PV210,	/* S5PV210 */
 };
 
 /**
@@ -418,6 +419,7 @@ static struct platform_device_id s3cts_driver_ids[] = {
 	{ "s3c2410-ts", TYPE_S3C2410 },
 	{ "s3c2440-ts", TYPE_S3C2440 },
 	{ "s3c64xx-ts", TYPE_S3C64XX },
+	{ "s5pv210-ts", TYPE_S5PV210 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, s3cts_driver_ids);
-- 
1.6.2.5
