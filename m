From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 1/5] usb: phy: samsung: Add host phy support to samsung-phy
 driver
Date: Mon, 08 Oct 2012 19:42:24 +0530
Message-ID: <1349705548-15207-2-git-send-email-gautam.vivek@samsung.com>
References: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33680 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845Ab2JHOIb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 10:08:31 -0400
In-reply-to: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com, yulgon.kim@samsung.com

This patch adds host phy support for samsung's exynos5250.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 drivers/usb/phy/Kconfig                      |    1 -
 drivers/usb/phy/samsung-usbphy.c             |  362 ++++++++++++++++++++++++--
 include/linux/platform_data/samsung-usbphy.h |    9 +-
 3 files changed, 344 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 313685f..1ce5b32 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -35,7 +35,6 @@ config MV_U3D_PHY
 
 config SAMSUNG_USBPHY
 	bool "Samsung USB PHY controller Driver"
-	depends on USB_S3C_HSOTG
 	select USB_OTG_UTILS
 	help
 	  Enable this to support Samsung USB phy controller for samsung
diff --git a/drivers/usb/phy/samsung-usbphy.c b/drivers/usb/phy/samsung-usbphy.c
index ee2dee0..504ef84 100644
--- a/drivers/usb/phy/samsung-usbphy.c
+++ b/drivers/usb/phy/samsung-usbphy.c
@@ -61,9 +61,114 @@
 #define MHZ (1000*1000)
 #endif
 
+/* EXYNOS5 */
+#define EXYNOS5_PHYHOST				(0x00)
+
+#define EXYNOS5_PHYHOST_PHYSWRSTALL		(0x1 << 31)
+
+#define EXYNOS5_PHYHOST_REFCLKSEL_MASK		(0x3)
+#define EXYNOS5_PHYHOST_REFCLKSEL(_x)		((_x) << 19)
+#define EXYNOS5_PHYHOST_REFCLKSEL_XTAL		\
+		EXYNOS5_PHYHOST_REFCLKSEL(0x0)
+#define EXYNOS5_PHYHOST_REFCLKSEL_EXTL		\
+		EXYNOS5_PHYHOST_REFCLKSEL(0x1)
+#define EXYNOS5_PHYHOST_REFCLKSEL_CLKCORE	\
+		EXYNOS5_PHYHOST_REFCLKSEL(0x2)
+
+#define EXYNOS5_PHYHOST_FSEL_MASK		(0x7 << 16)
+#define EXYNOS5_PHYHOST_FSEL(_x)		((_x) << 16)
+#define EXYNOS5_PHYHOST_FSEL_CLKSEL_50M		(0x7)
+#define EXYNOS5_PHYHOST_FSEL_CLKSEL_24M		(0x5)
+#define EXYNOS5_PHYHOST_FSEL_CLKSEL_20M		(0x4)
+#define EXYNOS5_PHYHOST_FSEL_CLKSEL_19200K	(0x3)
+#define EXYNOS5_PHYHOST_FSEL_CLKSEL_12M		(0x2)
+#define EXYNOS5_PHYHOST_FSEL_CLKSEL_10M		(0x1)
+#define EXYNOS5_PHYHOST_FSEL_CLKSEL_9600K	(0x0)
+
+#define EXYNOS5_PHYHOST_COMMONON_N		(0x1 << 9)
+#define EXYNOS5_PHYHOST_SIDDQ			(0x1 << 6)
+#define EXYNOS5_PHYHOST_FORCESLEEP		(0x1 << 5)
+#define EXYNOS5_PHYHOST_FORCESUSPEND		(0x1 << 4)
+#define EXYNOS5_PHYHOST_WORDINTERFACE		(0x1 << 3)
+#define EXYNOS5_PHYHOST_UTMISWRST		(0x1 << 2)
+#define EXYNOS5_PHYHOST_LINKSWRST		(0x1 << 1)
+#define EXYNOS5_PHYHOST_PHYSWRST		(0x1 << 0)
+
+#define EXYNOS5_PHYHOST_TUNE0			(0x04)
+
+#define EXYNOS5_PHYHOST_TEST0			(0x08)
+
+#define EXYNOS5_PHYHSIC1			(0x10)
+
+#define EXYNOS5_PHYHSIC2			(0x20)
+
+#define EXYNOS5_PHYHSIC_REFCLKSEL_MASK		(0x3)
+#define EXYNOS5_PHYHSIC_REFCLKSEL		(0x2 << 23)
+
+#define EXYNOS5_PHYHSIC_REFCLKDIV_MASK		(0x7f)
+#define EXYNOS5_PHYHSIC_REFCLKDIV(_x)		((_x) << 16)
+#define EXYNOS5_PHYHSIC_REFCLKDIV_12		\
+		EXYNOS5_PHYHSIC_REFCLKDIV(0x24)
+#define EXYNOS5_PHYHSIC_REFCLKDIV_15		\
+		EXYNOS5_PHYHSIC_REFCLKDIV(0x1C)
+#define EXYNOS5_PHYHSIC_REFCLKDIV_16		\
+		EXYNOS5_PHYHSIC_REFCLKDIV(0x1A)
+#define EXYNOS5_PHYHSIC_REFCLKDIV_19_2		\
+		EXYNOS5_PHYHSIC_REFCLKDIV(0x15)
+#define EXYNOS5_PHYHSIC_REFCLKDIV_20		\
+		EXYNOS5_PHYHSIC_REFCLKDIV(0x14)
+
+#define EXYNOS5_PHYHSIC_SIDDQ			(0x1 << 6)
+#define EXYNOS5_PHYHSIC_FORCESLEEP		(0x1 << 5)
+#define EXYNOS5_PHYHSIC_FORCESUSPEND		(0x1 << 4)
+#define EXYNOS5_PHYHSIC_WORDINTERFACE		(0x1 << 3)
+#define EXYNOS5_PHYHSIC_UTMISWRST		(0x1 << 2)
+#define EXYNOS5_PHYHSIC_PHYSWRST		(0x1 << 0)
+
+#define EXYNOS5_EHCICTRL			(0x30)
+
+#define EXYNOS5_EHCICTRL_ENAINCRXALIGN		(0x1 << 29)
+#define EXYNOS5_EHCICTRL_ENAINCR4		(0x1 << 28)
+#define EXYNOS5_EHCICTRL_ENAINCR8		(0x1 << 27)
+#define EXYNOS5_EHCICTRL_ENAINCR16		(0x1 << 26)
+
+#define EXYNOS5_OHCICTRL			(0x34)
+
+#define EXYNOS5_OHCICTRL_SUSPLGCY		(0x1 << 3)
+#define EXYNOS5_OHCICTRL_APPSTARTCLK		(0x1 << 2)
+#define EXYNOS5_OHCICTRL_CNTSEL			(0x1 << 1)
+#define EXYNOS5_OHCICTRL_CLKCKTRST		(0x1 << 0)
+
+#define EXYNOS5_PHYOTG				(0x38)
+
+#define EXYNOS5_PHYOTG_PHYLINK_SWRESET		(0x1 << 14)
+#define EXYNOS5_PHYOTG_LINKSWRST_UOTG		(0x1 << 13)
+#define EXYNOS5_PHYOTG_PHY0_SWRST		(0x1 << 12)
+
+#define EXYNOS5_PHYOTG_REFCLKSEL_MASK		(0x3 << 9)
+#define EXYNOS5_PHYOTG_REFCLKSEL(_x)		((_x) << 9)
+#define EXYNOS5_PHYOTG_REFCLKSEL_XTAL		\
+		EXYNOS5_PHYOTG_REFCLKSEL(0x0)
+#define EXYNOS5_PHYOTG_REFCLKSEL_EXTL		\
+		EXYNOS5_PHYOTG_REFCLKSEL(0x1)
+#define EXYNOS5_PHYOTG_REFCLKSEL_CLKCORE	\
+		EXYNOS5_PHYOTG_REFCLKSEL(0x2)
+
+#define EXYNOS5_PHYOTG_IPPULLUP_UOTG			(0x1 << 8)
+#define EXYNOS5_PHYOTG_COMMON_ON			(0x1 << 7)
+
+#define EXYNOS5_PHYOTG_FSEL_MASK			(0x7 << 4)
+#define EXYNOS5_PHYOTG_FSEL(_x)				((_x) << 4)
+
+#define EXYNOS5_PHYOTG_FORCESLEEP			(0x1 << 3)
+#define EXYNOS5_PHYOTG_OTGDISABLE			(0x1 << 2)
+#define EXYNOS5_PHYOTG_SIDDQ_UOTG			(0x1 << 1)
+#define EXYNOS5_PHYOTG_FORCESUSPEND			(0x1 << 0)
+
 enum samsung_cpu_type {
 	TYPE_S3C64XX,
 	TYPE_EXYNOS4210,
+	TYPE_EXYNOS5250,
 };
 
 /*
@@ -84,6 +189,7 @@ struct samsung_usbphy {
 	void __iomem	*regs;
 	int		ref_clk_freq;
 	int		cpu_type;
+	atomic_t	host_usage;
 };
 
 #define phy_to_sphy(x)		container_of((x), struct samsung_usbphy, phy)
@@ -96,30 +202,175 @@ static int samsung_usbphy_get_refclk_freq(struct samsung_usbphy *sphy)
 	struct clk *ref_clk;
 	int refclk_freq = 0;
 
-	ref_clk = clk_get(sphy->dev, "xusbxti");
+	if (sphy->cpu_type == TYPE_EXYNOS5250)
+		ref_clk = clk_get(sphy->dev, "ext_xtal");
+	else
+		ref_clk = clk_get(sphy->dev, "xusbxti");
 	if (IS_ERR(ref_clk)) {
 		dev_err(sphy->dev, "Failed to get reference clock\n");
 		return PTR_ERR(ref_clk);
 	}
 
-	switch (clk_get_rate(ref_clk)) {
-	case 12 * MHZ:
-		refclk_freq |= S3C_PHYCLK_CLKSEL_12M;
-		break;
-	case 24 * MHZ:
-		refclk_freq |= S3C_PHYCLK_CLKSEL_24M;
-		break;
-	default:
-	case 48 * MHZ:
-		/* default reference clock */
-		refclk_freq |= S3C_PHYCLK_CLKSEL_48M;
-		break;
+	if (sphy->cpu_type == TYPE_EXYNOS5250) {
+		/* set clock frequency for PLL */
+		switch (clk_get_rate(ref_clk)) {
+		case 96 * 100000:
+			refclk_freq |= EXYNOS5_PHYHOST_FSEL_CLKSEL_9600K;
+			break;
+		case 10 * MHZ:
+			refclk_freq |= EXYNOS5_PHYHOST_FSEL_CLKSEL_10M;
+			break;
+		case 12 * MHZ:
+			refclk_freq |= EXYNOS5_PHYHOST_FSEL_CLKSEL_12M;
+			break;
+		case 192 * 100000:
+			refclk_freq |= EXYNOS5_PHYHOST_FSEL_CLKSEL_19200K;
+			break;
+		case 20 * MHZ:
+			refclk_freq |= EXYNOS5_PHYHOST_FSEL_CLKSEL_20M;
+			break;
+		case 50 * MHZ:
+			refclk_freq |= EXYNOS5_PHYHOST_FSEL_CLKSEL_50M;
+			break;
+		case 24 * MHZ:
+		default:
+			/* default reference clock */
+			refclk_freq |= EXYNOS5_PHYHOST_FSEL_CLKSEL_24M;
+			break;
+		}
+	} else {
+		switch (clk_get_rate(ref_clk)) {
+		case 12 * MHZ:
+			refclk_freq |= S3C_PHYCLK_CLKSEL_12M;
+			break;
+		case 24 * MHZ:
+			refclk_freq |= S3C_PHYCLK_CLKSEL_24M;
+			break;
+		default:
+		case 48 * MHZ:
+			/* default reference clock */
+			refclk_freq |= S3C_PHYCLK_CLKSEL_48M;
+			break;
+		}
 	}
 	clk_put(ref_clk);
 
 	return refclk_freq;
 }
 
+static int exynos5_phyhost_is_on(void *regs)
+{
+	return (readl(regs + EXYNOS5_PHYHOST) & EXYNOS5_PHYHOST_SIDDQ) ? 0 : 1;
+}
+
+static void samsung_exynos5_usbphy_enable(struct samsung_usbphy *sphy)
+{
+	void __iomem *regs = sphy->regs;
+	u32 phyclk = sphy->ref_clk_freq;
+	u32 phyhost;
+	u32 phyotg;
+	u32 phyhsic;
+	u32 ehcictrl;
+	u32 ohcictrl;
+
+	atomic_inc(&sphy->host_usage);
+
+	if (exynos5_phyhost_is_on(regs)) {
+		dev_info(sphy->dev, "Already power on PHY\n");
+		return;
+	}
+
+	/* Selecting Host/OTG mode; Default USB2.0PHY_CFG: HOST. */
+	if (sphy->plat && sphy->plat->phy_cfg_sel) {
+		if (sphy->plat->type)
+			sphy->plat->phy_cfg_sel(sphy->dev, sphy->plat->type);
+		else
+			sphy->plat->phy_cfg_sel(sphy->dev, TYPE_OTG);
+	}
+
+	/* Host configuration */
+	phyhost = readl(regs + EXYNOS5_PHYHOST);
+
+	/* phy reference clock configuration */
+	phyhost &= ~(EXYNOS5_PHYHOST_FSEL_MASK);
+	phyhost |= EXYNOS5_PHYHOST_FSEL(phyclk);
+
+	/* host phy reset */
+	phyhost &= ~(EXYNOS5_PHYHOST_PHYSWRST |
+			EXYNOS5_PHYHOST_PHYSWRSTALL |
+			EXYNOS5_PHYHOST_SIDDQ |
+			/* Enable normal mode of operation */
+			EXYNOS5_PHYHOST_FORCESUSPEND |
+			EXYNOS5_PHYHOST_FORCESLEEP);
+
+	/* Link reset */
+	phyhost |= (EXYNOS5_PHYHOST_LINKSWRST |
+			EXYNOS5_PHYHOST_UTMISWRST |
+			/* COMMON Block configuration during suspend */
+			EXYNOS5_PHYHOST_COMMONON_N);
+	writel(phyhost, regs + EXYNOS5_PHYHOST);
+	udelay(10);
+	phyhost &= ~(EXYNOS5_PHYHOST_LINKSWRST |
+			EXYNOS5_PHYHOST_UTMISWRST);
+	writel(phyhost, regs + EXYNOS5_PHYHOST);
+
+	/* OTG configuration */
+	phyotg = readl(regs + EXYNOS5_PHYOTG);
+
+	/* phy reference clock configuration */
+	phyotg &= ~(EXYNOS5_PHYOTG_FSEL_MASK);
+	phyotg |= EXYNOS5_PHYOTG_FSEL(phyclk);
+
+	/* Enable normal mode of operation */
+	phyotg &= ~(EXYNOS5_PHYOTG_FORCESUSPEND |
+			EXYNOS5_PHYOTG_SIDDQ_UOTG |
+			EXYNOS5_PHYOTG_FORCESLEEP |
+			EXYNOS5_PHYOTG_REFCLKSEL_MASK |
+			/* COMMON Block configuration during suspend */
+			EXYNOS5_PHYOTG_COMMON_ON);
+
+	/* OTG phy & link reset */
+	phyotg |= (EXYNOS5_PHYOTG_PHY0_SWRST |
+			EXYNOS5_PHYOTG_LINKSWRST_UOTG |
+			EXYNOS5_PHYOTG_PHYLINK_SWRESET |
+			EXYNOS5_PHYOTG_OTGDISABLE |
+			/* Set refclk */
+			EXYNOS5_PHYOTG_REFCLKSEL_CLKCORE);
+
+	writel(phyotg, regs + EXYNOS5_PHYOTG);
+	udelay(10);
+	phyotg &= ~(EXYNOS5_PHYOTG_PHY0_SWRST |
+			EXYNOS5_PHYOTG_LINKSWRST_UOTG	|
+			EXYNOS5_PHYOTG_PHYLINK_SWRESET);
+	writel(phyotg, regs + EXYNOS5_PHYOTG);
+
+	/* HSIC phy configuration */
+	phyhsic = (EXYNOS5_PHYHSIC_REFCLKDIV_12 |
+			EXYNOS5_PHYHSIC_REFCLKSEL |
+			EXYNOS5_PHYHSIC_PHYSWRST);
+	writel(phyhsic, regs + EXYNOS5_PHYHSIC1);
+	writel(phyhsic, regs + EXYNOS5_PHYHSIC2);
+	udelay(10);
+	phyhsic &= ~(EXYNOS5_PHYHSIC_PHYSWRST);
+	writel(phyhsic, regs + EXYNOS5_PHYHSIC1);
+	writel(phyhsic, regs + EXYNOS5_PHYHSIC2);
+
+	udelay(80);
+
+	/* enable EHCI DMA burst */
+	ehcictrl = readl(regs + EXYNOS5_EHCICTRL);
+	ehcictrl |= (EXYNOS5_EHCICTRL_ENAINCRXALIGN |
+				EXYNOS5_EHCICTRL_ENAINCR4 |
+				EXYNOS5_EHCICTRL_ENAINCR8 |
+				EXYNOS5_EHCICTRL_ENAINCR16);
+	writel(ehcictrl, regs + EXYNOS5_EHCICTRL);
+
+	/* set ohci_suspend_on_n */
+	ohcictrl = readl(regs + EXYNOS5_OHCICTRL);
+	ohcictrl |= EXYNOS5_OHCICTRL_SUSPLGCY;
+	writel(ohcictrl, regs + EXYNOS5_OHCICTRL);
+}
+
 static void samsung_usbphy_enable(struct samsung_usbphy *sphy)
 {
 	void __iomem *regs = sphy->regs;
@@ -155,6 +406,41 @@ static void samsung_usbphy_enable(struct samsung_usbphy *sphy)
 	writel(rstcon, regs + S3C_RSTCON);
 }
 
+static void samsung_exynos5_usbphy_disable(struct samsung_usbphy *sphy)
+{
+	void __iomem *regs = sphy->regs;
+	u32 phyhost;
+	u32 phyotg;
+	u32 phyhsic;
+
+	if (atomic_dec_return(&sphy->host_usage) > 0) {
+		dev_info(sphy->dev, "still being used\n");
+		return;
+	}
+
+	phyhsic = (EXYNOS5_PHYHSIC_REFCLKDIV_12 |
+			EXYNOS5_PHYHSIC_REFCLKSEL |
+			EXYNOS5_PHYHSIC_SIDDQ |
+			EXYNOS5_PHYHSIC_FORCESLEEP |
+			EXYNOS5_PHYHSIC_FORCESUSPEND);
+	writel(phyhsic, regs + EXYNOS5_PHYHSIC1);
+	writel(phyhsic, regs + EXYNOS5_PHYHSIC2);
+
+	phyhost = readl(regs + EXYNOS5_PHYHOST);
+	phyhost |= (EXYNOS5_PHYHOST_SIDDQ |
+			EXYNOS5_PHYHOST_FORCESUSPEND |
+			EXYNOS5_PHYHOST_FORCESLEEP |
+			EXYNOS5_PHYHOST_PHYSWRST |
+			EXYNOS5_PHYHOST_PHYSWRSTALL);
+	writel(phyhost, regs + EXYNOS5_PHYHOST);
+
+	phyotg = readl(regs + EXYNOS5_PHYOTG);
+	phyotg |= (EXYNOS5_PHYOTG_FORCESUSPEND |
+			EXYNOS5_PHYOTG_SIDDQ_UOTG |
+			EXYNOS5_PHYOTG_FORCESLEEP);
+	writel(phyotg, regs + EXYNOS5_PHYOTG);
+}
+
 static void samsung_usbphy_disable(struct samsung_usbphy *sphy)
 {
 	void __iomem *regs = sphy->regs;
@@ -194,11 +480,18 @@ static int samsung_usbphy_init(struct usb_phy *phy)
 	}
 
 	/* Disable phy isolation */
-	if (sphy->plat && sphy->plat->pmu_isolation)
-		sphy->plat->pmu_isolation(false);
+	if (sphy->plat && sphy->plat->pmu_isolation) {
+		if (sphy->plat->type)
+			sphy->plat->pmu_isolation(false, sphy->plat->type);
+		else
+			sphy->plat->pmu_isolation(false, TYPE_OTG);
+	}
 
 	/* Initialize usb phy registers */
-	samsung_usbphy_enable(sphy);
+	if (sphy->cpu_type == TYPE_EXYNOS5250)
+		samsung_exynos5_usbphy_enable(sphy);
+	else
+		samsung_usbphy_enable(sphy);
 
 	/* Disable the phy clock */
 	clk_disable_unprepare(sphy->clk);
@@ -220,11 +513,18 @@ static void samsung_usbphy_shutdown(struct usb_phy *phy)
 	}
 
 	/* De-initialize usb phy registers */
-	samsung_usbphy_disable(sphy);
+	if (sphy->cpu_type == TYPE_EXYNOS5250)
+		samsung_exynos5_usbphy_disable(sphy);
+	else
+		samsung_usbphy_disable(sphy);
 
 	/* Enable phy isolation */
-	if (sphy->plat && sphy->plat->pmu_isolation)
-		sphy->plat->pmu_isolation(true);
+	if (sphy->plat && sphy->plat->pmu_isolation) {
+		if (sphy->plat->type)
+			sphy->plat->pmu_isolation(true, sphy->plat->type);
+		else
+			sphy->plat->pmu_isolation(true, TYPE_OTG);
+	}
 
 	clk_disable_unprepare(sphy->clk);
 }
@@ -277,16 +577,9 @@ static int __devinit samsung_usbphy_probe(struct platform_device *pdev)
 	if (!sphy)
 		return -ENOMEM;
 
-	clk = devm_clk_get(dev, "otg");
-	if (IS_ERR(clk)) {
-		dev_err(dev, "Failed to get otg clock\n");
-		return PTR_ERR(clk);
-	}
-
 	sphy->dev		= &pdev->dev;
 	sphy->plat		= pdata;
 	sphy->regs		= phy_base;
-	sphy->clk		= clk;
 	sphy->phy.dev		= sphy->dev;
 	sphy->phy.label		= "samsung-usbphy";
 	sphy->phy.init		= samsung_usbphy_init;
@@ -294,6 +587,17 @@ static int __devinit samsung_usbphy_probe(struct platform_device *pdev)
 	sphy->cpu_type		= samsung_usbphy_get_driver_data(pdev);
 	sphy->ref_clk_freq	= samsung_usbphy_get_refclk_freq(sphy);
 
+	if (sphy->cpu_type == TYPE_EXYNOS5250)
+		clk = devm_clk_get(dev, "usbhost");
+	else
+		clk = devm_clk_get(dev, "otg");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Failed to get otg clock\n");
+		return PTR_ERR(clk);
+	}
+
+	sphy->clk = clk;
+
 	ret = usb_add_phy(&sphy->phy, USB_PHY_TYPE_USB2);
 	return ret;
 }
@@ -315,6 +619,9 @@ static const struct of_device_id samsung_usbphy_dt_match[] = {
 	}, {
 		.compatible = "samsung,exynos4210-usbphy",
 		.data = (void *)TYPE_EXYNOS4210,
+	}, {
+		.compatible = "samsung,exynos5250-usbphy",
+		.data = (void *)TYPE_EXYNOS5250,
 	},
 	{},
 };
@@ -330,6 +637,9 @@ static struct platform_device_id samsung_usbphy_driver_ids[] = {
 	}, {
 		.name		= "exynos4210-usbphy",
 		.driver_data	= TYPE_EXYNOS4210,
+	}, {
+		.name		= "exynos5250-usbphy",
+		.driver_data	= TYPE_EXYNOS5250,
 	},
 	{},
 };
diff --git a/include/linux/platform_data/samsung-usbphy.h b/include/linux/platform_data/samsung-usbphy.h
index 1bd24cb..2b400e0 100644
--- a/include/linux/platform_data/samsung-usbphy.h
+++ b/include/linux/platform_data/samsung-usbphy.h
@@ -18,8 +18,15 @@
  * samsung_usbphy_data - Platform data for USB PHY driver.
  * @pmu_isolation: Function to control usb phy isolation in PMU.
  */
+enum phy_type {
+	TYPE_OTG,
+	TYPE_HOST,
+};
+
 struct samsung_usbphy_data {
-	void (*pmu_isolation)(int on);
+	void (*pmu_isolation)(int on, int phy_type);
+	void (*phy_cfg_sel)(struct device *dev, int phy_type);
+	int type;
 };
 
 extern void samsung_usbphy_set_pdata(struct samsung_usbphy_data *pd);
-- 
1.7.6.5
