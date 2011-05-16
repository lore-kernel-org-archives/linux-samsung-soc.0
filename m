From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix incorrect mapping of gpio pull-up macro to
 register setting
Date: Mon, 16 May 2011 19:31:38 +0530
Message-ID: <1305554498-2878-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55599 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755335Ab1EPNy2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 May 2011 09:54:28 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLA00HA5JYN6AM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 22:54:26 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLA00IU0JYHJH@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 22:54:26 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

The S3C_GPIO_PULL_UP macro value incorrectly maps to a reserved setting of GPIO
pull up/down registers on Exynos4 platform. Fix this incorrect mapping by adding
wrappers to the s3c_gpio_setpull_updown and s3c_gpio_getpull_updown functions.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos4/gpiolib.c |   29 +++++++++++++++++++++++++----
 1 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos4/gpiolib.c b/arch/arm/mach-exynos4/gpiolib.c
index d54ca6a..d647cfe 100644
--- a/arch/arm/mach-exynos4/gpiolib.c
+++ b/arch/arm/mach-exynos4/gpiolib.c
@@ -21,16 +21,37 @@
 #include <plat/gpio-cfg.h>
 #include <plat/gpio-cfg-helpers.h>
 
+int s3c_gpio_setpull_exynos4(struct s3c_gpio_chip *chip,
+				unsigned int off, s3c_gpio_pull_t pull)
+{
+	if (pull == S3C_GPIO_PULL_UP)
+		pull = 3;
+
+	return s3c_gpio_setpull_updown(chip, off, pull);
+}
+
+s3c_gpio_pull_t s3c_gpio_getpull_exynos4(struct s3c_gpio_chip *chip,
+						unsigned int off)
+{
+	s3c_gpio_pull_t pull;
+
+	pull = s3c_gpio_getpull_updown(chip, off);
+	if (pull == 3)
+		pull = S3C_GPIO_PULL_UP;
+
+	return pull;
+}
+
 static struct s3c_gpio_cfg gpio_cfg = {
 	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
-	.set_pull	= s3c_gpio_setpull_updown,
-	.get_pull	= s3c_gpio_getpull_updown,
+	.set_pull	= s3c_gpio_setpull_exynos4,
+	.get_pull	= s3c_gpio_getpull_exynos4,
 };
 
 static struct s3c_gpio_cfg gpio_cfg_noint = {
 	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
-	.set_pull	= s3c_gpio_setpull_updown,
-	.get_pull	= s3c_gpio_getpull_updown,
+	.set_pull	= s3c_gpio_setpull_exynos4,
+	.get_pull	= s3c_gpio_getpull_exynos4,
 };
 
 /*
-- 
1.6.6.rc2
