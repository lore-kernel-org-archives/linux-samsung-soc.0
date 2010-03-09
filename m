From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] S5P6440: SDHCI: Add SDHCI card and GPIO configuration support
Date: Tue, 09 Mar 2010 19:09:33 +0530
Message-ID: <1268141973-10942-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:42908 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751306Ab0CINiv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Mar 2010 08:38:51 -0500
Received: from epmmp2 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZ0006U6OK1EF@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:38:25 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZ000BITOJXIN@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:38:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch adds SDHCI card and GPIO configuration support for
Samsung's S5P6440 SoC.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s5p6440/Makefile      |    1 +
 arch/arm/mach-s5p6440/setup-sdhci.c |  104 +++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p6440/setup-sdhci.c

diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/Makefile
index 70fbf32..8110570 100644
--- a/arch/arm/mach-s5p6440/Makefile
+++ b/arch/arm/mach-s5p6440/Makefile
@@ -13,6 +13,7 @@ obj-				:=
 # Core support for S5P6440 system
 
 obj-$(CONFIG_CPU_S5P6440)		+= cpu.o init.o clock.o gpio.o irq-eint.o
+obj-$(CONFIG_S5P6440_SETUP_SDHCI)	+= setup-sdhci.o
 
 # machine support
 
diff --git a/arch/arm/mach-s5p6440/setup-sdhci.c b/arch/arm/mach-s5p6440/setup-sdhci.c
new file mode 100644
index 0000000..e1c3b1a
--- /dev/null
+++ b/arch/arm/mach-s5p6440/setup-sdhci.c
@@ -0,0 +1,104 @@
+/* linux/arch/arm/mach-s5p6440/setup-sdhci.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ * Based on arch/arm/mach-s3c64xx/setup-sdhci.c
+ *
+ * S3C6440 - Helper functions for settign up SDHCI device(s) (HSMMC)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+
+#include <linux/mmc/card.h>
+#include <linux/mmc/host.h>
+
+#include <plat/regs-sdhci.h>
+#include <plat/sdhci.h>
+
+#include <mach/gpio.h>
+#include <plat/gpio-cfg.h>
+#include <mach/regs-gpio.h>
+
+/* clock sources for the mmc bus clock, order as for the ctrl2[5..4] */
+static char *s5p6440_hsmmc_clksrcs[4] = {
+	[0] = "hsmmc",
+	[1] = "hsmmc",
+	[2] = "mmc_bus",
+};
+
+static void s5p6440_setup_sdhci_cfg_card(struct platform_device *dev,
+				  void __iomem *r,
+				  struct mmc_ios *ios,
+				  struct mmc_card *card)
+{
+	u32 ctrl2, ctrl3 = 0;
+
+	writel(S3C64XX_SDHCI_CONTROL4_DRIVE_9mA, r + S3C64XX_SDHCI_CONTROL4);
+
+	ctrl2 = readl(r + S3C_SDHCI_CONTROL2);
+	ctrl2 &= S3C_SDHCI_CTRL2_SELBASECLK_MASK;
+	ctrl2 |= (S3C64XX_SDHCI_CTRL2_ENSTAASYNCCLR |
+		  S3C64XX_SDHCI_CTRL2_ENCMDCNFMSK |
+		  S3C_SDHCI_CTRL2_DFCNT_NONE |
+		  S3C_SDHCI_CTRL2_ENCLKOUTHOLD | (2<<4));
+
+	printk(KERN_INFO "%s: CTRL 2=%08x, 3=%08x\n", __func__, ctrl2, ctrl3);
+	writel(ctrl2, r + S3C_SDHCI_CONTROL2);
+	writel(ctrl3, r + S3C_SDHCI_CONTROL3);
+}
+
+static void s5p6440_setup_sdhci0_cfg_gpio(struct platform_device *dev,
+						int width)
+{
+	unsigned int gpio;
+	unsigned int end;
+
+	end = S5P6440_GPG(2 + width);
+
+	/* Set all the necessary GPG pins to special-function 0 */
+	for (gpio = S5P6440_GPG(0); gpio < end; gpio++) {
+		s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
+		s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
+	}
+}
+
+static void s5p6440_setup_sdhci1_cfg_gpio(struct platform_device *dev,
+						int width)
+{
+	unsigned int gpio;
+	unsigned int end;
+
+	end = S5P6440_GPH(2 + width);
+
+	/* Set all the necessary GPG pins to special-function 0 */
+	for (gpio = S5P6440_GPH(0); gpio < end; gpio++) {
+		s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
+		s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
+	}
+
+	s3c_gpio_setpull(S5P6440_GPG(6), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5P6440_GPG(6), S3C_GPIO_SFN(3));
+}
+
+void s5p6440_setup_sdhci(void)
+{
+	struct s3c_sdhci_platdata *pdata;
+
+	pdata = &s3c_hsmmc0_def_platdata;
+	pdata->clocks = s5p6440_hsmmc_clksrcs;
+	pdata->cfg_gpio = s5p6440_setup_sdhci0_cfg_gpio;
+	pdata->cfg_card = s5p6440_setup_sdhci_cfg_card;
+
+	pdata = &s3c_hsmmc1_def_platdata;
+	pdata->clocks = s5p6440_hsmmc_clksrcs;
+	pdata->cfg_gpio = s5p6440_setup_sdhci1_cfg_gpio;
+	pdata->cfg_card = s5p6440_setup_sdhci_cfg_card;
+}
-- 
1.6.6.rc2
