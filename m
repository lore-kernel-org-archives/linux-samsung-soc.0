From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: S5P: Add SCLK SDHCI configuration functionality
Date: Tue, 09 Mar 2010 19:09:18 +0530
Message-ID: <1268141958-10910-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43008 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752624Ab0CINiX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Mar 2010 08:38:23 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZ000ILSOJLF7@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:38:10 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZ000B8TOJIBI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:38:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

The SDHCI SCLK clock in Samsung's S5P SoC's can be configured for required
clock speeds. This patch adds SDHCI SCLK configuration functionality for
S5P SoC's.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-s5p/clock.c                  |   21 +++++++++++++++++++++
 arch/arm/plat-s5p/include/plat/s5p-clock.h |    2 ++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
index aa96e33..12970ed 100644
--- a/arch/arm/plat-s5p/clock.c
+++ b/arch/arm/plat-s5p/clock.c
@@ -19,11 +19,13 @@
 #include <linux/clk.h>
 #include <linux/sysdev.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 #include <asm/div64.h>
 
 #include <plat/clock.h>
 #include <plat/clock-clksrc.h>
 #include <plat/s5p-clock.h>
+#include <plat/sdhci.h>
 
 /* fin_apll, fin_mpll and fin_epll are all the same clock, which we call
  * clk_ext_xtal_mux.
@@ -147,3 +149,22 @@ void __init s5p_register_clocks(unsigned long xtal_freq)
 	if (ret > 0)
 		printk(KERN_ERR "Failed to register s5p clocks\n");
 }
+
+#ifdef CONFIG_MMC_SDHCI_S3C
+int s5p_setup_sdhci_sclk(struct platform_device *pdev, struct clk *parent)
+{
+	struct s3c_sdhci_platdata *pdata = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	struct clk *sclk_mmc;
+
+	sclk_mmc = clk_get(dev, "mmc_bus");
+	if (IS_ERR(sclk_mmc)) {
+		dev_err(dev, "failed to get mmc_bus clock\n");
+		return PTR_ERR(sclk_mmc);
+	}
+
+	sclk_mmc->ops->set_parent(sclk_mmc, parent);
+	sclk_mmc->ops->set_rate(sclk_mmc, pdata->sclk_mmc_freq);
+	return 0;
+}
+#endif /* CONFIG_MMC_SDHCI_S3C */
diff --git a/arch/arm/plat-s5p/include/plat/s5p-clock.h b/arch/arm/plat-s5p/include/plat/s5p-clock.h
index 56fb8b4..3855f74 100644
--- a/arch/arm/plat-s5p/include/plat/s5p-clock.h
+++ b/arch/arm/plat-s5p/include/plat/s5p-clock.h
@@ -36,5 +36,7 @@ extern struct clksrc_sources clk_src_epll;
 
 extern int s5p6440_clk48m_ctrl(struct clk *clk, int enable);
 extern int s5p_gatectrl(void __iomem *reg, struct clk *clk, int enable);
+extern int s5p_setup_sdhci_sclk(struct platform_device *pdev,
+					struct clk *parent);
 
 #endif /* __ASM_PLAT_S5P_CLOCK_H */
-- 
1.6.6.rc2
