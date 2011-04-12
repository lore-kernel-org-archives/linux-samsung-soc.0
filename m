From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix incorrect mapping of gpio pull-up macro to
 register setting
Date: Tue, 12 Apr 2011 17:31:34 +0530
Message-ID: <1302609694-7539-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61888 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751096Ab1DLL5o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2011 07:57:44 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJJ009Y7FW6JZ70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Apr 2011 20:57:42 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJJ006IEFVYTQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Apr 2011 20:57:43 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, nicolas.pitre@linaro.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linaro-dev@lists.linaro.org, patches@linaro.org, Thomas Abraham <thomas.ab@samsung.com>

The S3C_GPIO_PULL_UP macro value incorrectly maps to a reserved setting of GPIO
pull up/down registers on Exynos4 platform. Fix this incorrect mapping by adding
wrappers to the s3c_gpio_setpull_updown and s3c_gpio_getpull_updown functions.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos4/gpiolib.c                    |    8 +++---
 arch/arm/plat-samsung/gpio-config.c                |   23 ++++++++++++++++++
 .../plat-samsung/include/plat/gpio-cfg-helpers.h   |   25 ++++++++++++++++++++
 3 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos4/gpiolib.c b/arch/arm/mach-exynos4/gpiolib.c
index d54ca6a..3a47c8e 100644
--- a/arch/arm/mach-exynos4/gpiolib.c
+++ b/arch/arm/mach-exynos4/gpiolib.c
@@ -23,14 +23,14 @@
 
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
diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-samsung/gpio-config.c
index 1c0b040..2a710b0 100644
--- a/arch/arm/plat-samsung/gpio-config.c
+++ b/arch/arm/plat-samsung/gpio-config.c
@@ -320,6 +320,29 @@ s3c_gpio_pull_t s3c_gpio_getpull_s3c2443(struct s3c_gpio_chip *chip,
 	return pull;
 }
 #endif
+
+#ifdef CONFIG_CPU_EXYNOS4210
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
+					unsigned int off)
+{
+	s3c_gpio_pull_t pull;
+
+	pull = s3c_gpio_getpull_updown(chip, off);
+	if (pull == 3)
+		pull = S3C_GPIO_PULL_UP;
+
+	return pull;
+}
+#endif /* CONFIG_CPU_EXYNOS4210 */
 #endif
 
 #if defined(CONFIG_S3C_GPIO_PULL_UP) || defined(CONFIG_S3C_GPIO_PULL_DOWN)
diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
index 5603db0..75c46b9 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
@@ -247,5 +247,30 @@ extern int s3c_gpio_setpull_s3c2443(struct s3c_gpio_chip *chip,
 extern s3c_gpio_pull_t s3c_gpio_getpull_s3c2443(struct s3c_gpio_chip *chip,
 						unsigned int off);
 
+/**
+ * s3c_gpio_setpull_exynos4() - Pull configuration for Exynos 4210.
+ * @chip: The gpio chip that is being configured.
+ * @off: The offset for the GPIO being configured.
+ * @param: pull: The pull mode being requested.
+ *
+ * This is a wrapper function for s3c_gpio_setpull_updown() function.
+ * It provides a different mapping of S3C_GPIO_PULL_XXX to actual
+ * register settings.
+ */
+extern int s3c_gpio_setpull_exynos4(struct s3c_gpio_chip *chip,
+				   unsigned int off, s3c_gpio_pull_t pull);
+
+/**
+ * s3c_gpio_getpull_exynos4() - Get configuration for Exynos 4210 pull resistors
+ * @chip: The gpio chip that the GPIO pin belongs to
+ * @off: The offset to the pin to get the configuration of.
+ *
+ * This is a wrapper function for s3c_gpio_getpull_updown() function.
+ * It provides a different mapping of S3C_GPIO_PULL_XXX to actual
+ * register settings.
+*/
+extern s3c_gpio_pull_t s3c_gpio_getpull_exynos4(struct s3c_gpio_chip *chip,
+					       unsigned int off);
+
 #endif /* __PLAT_GPIO_CFG_HELPERS_H */
 
-- 
1.6.6.rc2
