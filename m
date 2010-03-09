From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] S5P6440: Add support for SDHCI on SMDK6440 board.
Date: Tue, 09 Mar 2010 19:09:57 +0530
Message-ID: <1268141997-11015-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64604 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752671Ab0CINiy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Mar 2010 08:38:54 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZ0006IXOKSH8@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:38:52 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZ0009J9OKL3Y@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:38:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch adds support for SDHCI interface on SMDK6440 board.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s5p6440/mach-smdk6440.c |   69 +++++++++++++++++++++++++++++++++
 1 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p6440/mach-smdk6440.c b/arch/arm/mach-s5p6440/mach-smdk6440.c
index 3ae88f2..e039128 100644
--- a/arch/arm/mach-s5p6440/mach-smdk6440.c
+++ b/arch/arm/mach-s5p6440/mach-smdk6440.c
@@ -20,6 +20,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/clk.h>
+#include <linux/irq.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -38,6 +39,12 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pll.h>
+#include <plat/sdhci.h>
+#include <plat/s5p-clock.h>
+
+#include <mach/gpio.h>
+#include <plat/gpio-core.h>
+#include <plat/gpio-cfg.h>
 
 #define S5P6440_UCON_DEFAULT    (S3C2410_UCON_TXILEVEL |	\
 				S3C2410_UCON_RXILEVEL |		\
@@ -84,6 +91,10 @@ static struct s3c2410_uartcfg smdk6440_uartcfgs[] __initdata = {
 };
 
 static struct platform_device *smdk6440_devices[] __initdata = {
+#ifdef CONFIG_MMC_SDHCI_S3C
+	&s3c_device_hsmmc0,
+	&s3c_device_hsmmc1,
+#endif
 };
 
 static void __init smdk6440_map_io(void)
@@ -93,9 +104,67 @@ static void __init smdk6440_map_io(void)
 	s3c24xx_init_uarts(smdk6440_uartcfgs, ARRAY_SIZE(smdk6440_uartcfgs));
 }
 
+#ifdef CONFIG_MMC_SDHCI_S3C
+static void smdk6440_sdhci0_cfg_ext_cd(void)
+{
+	s3c_gpio_cfgpin(S5P6440_GPN(8), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5P6440_GPN(8), S3C_GPIO_PULL_NONE);
+	set_irq_type(IRQ_EINT(8), IRQ_TYPE_EDGE_BOTH);
+}
+
+static u32 smdk6440_sdhci0_card_detect(void)
+{
+	struct s3c_gpio_chip *chip = s3c_gpiolib_getchip(S5P6440_GPN(8));
+	struct gpio_chip *gc = &chip->chip;
+	u32 present;
+	int offset;
+
+	offset = S5P6440_GPN(8) - chip->chip.base;
+	present = gc->get(gc, offset);
+	return !present;
+}
+
+static void smdk6440_sdhci_setup_clocks(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk *parent;
+
+	parent = clk_get(NULL, "dout_mpll");
+	if (IS_ERR(parent)) {
+		dev_err(dev, "failed to get parent clock of mmc_bus clock\n");
+		return;
+	}
+
+	if (!s5p_setup_sdhci_sclk(pdev, parent))
+		clk_put(parent);
+}
+
+static void __init smdk6440_sdhci_setup_platdata(void)
+{
+	struct s3c_sdhci_platdata *pdata;
+
+	/* SDHCI Slot 0 platform data */
+	/* SMDK6440 uses EINT(8) for SD/MMC card detection for slot 0 */
+	pdata = &s3c_hsmmc0_def_platdata;
+	pdata->cfg_ext_cd = smdk6440_sdhci0_cfg_ext_cd;
+	pdata->is_card_present = smdk6440_sdhci0_card_detect;
+	pdata->ext_cd = S5P_EINT(8);
+	pdata->cfg_clocks = smdk6440_sdhci_setup_clocks;
+	pdata->sclk_mmc_freq = 50 * MHZ;
+
+	/* SDHCI Slot 1 platform data */
+	pdata = &s3c_hsmmc1_def_platdata;
+	s3c_hsmmc1_def_platdata.cfg_clocks = smdk6440_sdhci_setup_clocks;
+	s3c_hsmmc1_def_platdata.sclk_mmc_freq = 50 * MHZ;
+}
+#endif /* CONFIG_MMC_SDHCI_S3C */
+
 static void __init smdk6440_machine_init(void)
 {
 	platform_add_devices(smdk6440_devices, ARRAY_SIZE(smdk6440_devices));
+#ifdef CONFIG_MMC_SDHCI_S3C
+	smdk6440_sdhci_setup_platdata();
+#endif
 }
 
 MACHINE_START(SMDK6440, "SMDK6440")
-- 
1.6.6.rc2
