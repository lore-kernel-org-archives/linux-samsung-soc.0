From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 1/2] USB: PHY: Add support for USB 3.0 phy for exynos5250
Date: Tue, 06 Nov 2012 21:06:36 +0530
Message-ID: <1352216197-11828-2-git-send-email-gautam.vivek@samsung.com>
References: <1352216197-11828-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57255 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556Ab2KFPcx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 10:32:53 -0500
In-reply-to: <1352216197-11828-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: gregkh@linuxfoundation.org, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, yulgon.kim@samsung.com, av.tikhomirov@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com

Adding support for USB3.0 phy for dwc3 controller on
exynso5250 SOC.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 drivers/usb/phy/samsung-usbphy.c    |  337 +++++++++++++++++++++++++++++++++++
 include/linux/usb/samsung_usb_phy.h |    1 +
 2 files changed, 338 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/phy/samsung-usbphy.c b/drivers/usb/phy/samsung-usbphy.c
index 3b4863d..e3b5fb1 100644
--- a/drivers/usb/phy/samsung-usbphy.c
+++ b/drivers/usb/phy/samsung-usbphy.c
@@ -167,6 +167,99 @@
 
 #define EXYNOS5_PHY_OTG_TUNE			(0x40)
 
+/* USB 3.0: DRD */
+#define EXYNOS5_DRD_LINKSYSTEM			(0x04)
+
+#define LINKSYSTEM_FLADJ_MASK			(0x3f << 1)
+#define LINKSYSTEM_FLADJ(_x)			((_x) << 1)
+#define LINKSYSTEM_XHCI_VERSION_CONTROL		(1 << 27)
+
+#define EXYNOS5_DRD_PHYUTMI			(0x08)
+
+#define PHYUTMI_OTGDISABLE			(1 << 6)
+#define PHYUTMI_FORCESUSPEND			(1 << 1)
+#define PHYUTMI_FORCESLEEP			(1 << 0)
+
+#define EXYNOS5_DRD_PHYPIPE			(0x0C)
+
+#define EXYNOS5_DRD_PHYCLKRST			(0x10)
+
+#define PHYCLKRST_SSC_REFCLKSEL_MASK		(0xff << 23)
+#define PHYCLKRST_SSC_REFCLKSEL(_x)		((_x) << 23)
+
+#define PHYCLKRST_SSC_RANGE_MASK		(0x03 << 21)
+#define PHYCLKRST_SSC_RANGE(_x)			((_x) << 21)
+
+#define PHYCLKRST_SSC_EN			(1 << 20)
+#define PHYCLKRST_REF_SSP_EN			(1 << 19)
+#define PHYCLKRST_REF_CLKDIV2			(1 << 18)
+
+#define PHYCLKRST_MPLL_MULTIPLIER_MASK		(0x7f << 11)
+#define PHYCLKRST_MPLL_MULTIPLIER(_x)		((_x) << 11)
+#define PHYCLKRST_MPLL_MULTIPLIER_100MHZ_REF 	\
+		PHYCLKRST_MPLL_MULTIPLIER(0x19)
+#define PHYCLKRST_MPLL_MULTIPLIER_50M_REF 	\
+		PHYCLKRST_MPLL_MULTIPLIER(0x02)
+#define PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF	\
+		PHYCLKRST_MPLL_MULTIPLIER(0x68)
+#define PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF	\
+		PHYCLKRST_MPLL_MULTIPLIER(0x7d)
+#define PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF 	\
+		PHYCLKRST_MPLL_MULTIPLIER(0x02)
+
+#define PHYCLKRST_FSEL_MASK			(0x3f << 5)
+#define PHYCLKRST_FSEL(_x)			((_x) << 5)
+#define PHYCLKRST_FSEL_PAD_100MHZ		\
+		PHYCLKRST_FSEL(0x27)
+#define PHYCLKRST_FSEL_PAD_24MHZ		\
+		PHYCLKRST_FSEL(0x2a)
+#define PHYCLKRST_FSEL_PAD_20MHZ		\
+		PHYCLKRST_FSEL(0x31)
+#define PHYCLKRST_FSEL_PAD_19_2MHZ		\
+		PHYCLKRST_FSEL(0x38)
+
+#define PHYCLKRST_RETENABLEN			(1 << 4)
+
+#define PHYCLKRST_REFCLKSEL_MASK		(0x03 << 2)
+#define PHYCLKRST_REFCLKSEL(_x)			((_x) << 2)
+#define PHYCLKRST_REFCLKSEL_PAD_REFCLK		\
+		PHYCLKRST_REFCLKSEL(2)
+#define PHYCLKRST_REFCLKSEL_EXT_REFCLK		\
+		PHYCLKRST_REFCLKSEL(3)
+
+#define PHYCLKRST_PORTRESET			(1 << 1)
+#define PHYCLKRST_COMMONONN			(1 << 0)
+
+#define EXYNOS5_DRD_PHYREG0			(0x14)
+#define EXYNOS5_DRD_PHYREG1			(0x18)
+
+#define EXYNOS5_DRD_PHYPARAM0			(0x1C)
+
+#define PHYPARAM0_REF_USE_PAD			(0x1 << 31)
+#define PHYPARAM0_REF_LOSLEVEL_MASK		(0x1f << 26)
+#define PHYPARAM0_REF_LOSLEVEL			(0x9 << 26)
+
+#define EXYNOS5_DRD_PHYPARAM1			(0x20)
+
+#define PHYPARAM1_PCS_TXDEEMPH_MASK		(0x1f << 0)
+#define PHYPARAM1_PCS_TXDEEMPH			(0x1C)
+
+#define EXYNOS5_DRD_PHYTERM			(0x24)
+
+#define EXYNOS5_DRD_PHYTEST			(0x28)
+
+#define PHYTEST_POWERDOWN_SSP			(1 << 3)
+#define PHYTEST_POWERDOWN_HSP			(1 << 2)
+
+#define EXYNOS5_DRD_PHYADP			(0x2C)
+
+#define EXYNOS5_DRD_PHYBATCHG			(0x30)
+
+#define PHYBATCHG_UTMI_CLKSEL			(0x1 << 2)
+
+#define EXYNOS5_DRD_PHYRESUME			(0x34)
+#define EXYNOS5_DRD_LINKPORT			(0x44)
+
 #ifndef MHZ
 #define MHZ (1000*1000)
 #endif
@@ -180,10 +273,12 @@ enum samsung_cpu_type {
 /*
  * struct samsung_usbphy - transceiver driver state
  * @phy: transceiver structure
+ * @phy3: transceiver structure for USB 3.0
  * @plat: platform data
  * @dev: The parent device supplied to the probe function
  * @clk: usb phy clock
  * @regs: usb phy register memory base
+ * @regs_phy3: usb 3.0 phy register memory base
  * @ref_clk_freq: reference clock frequency selection
  * @cpu_type: machine identifier
  * @phy_type: It keeps track of the PHY type.
@@ -191,10 +286,12 @@ enum samsung_cpu_type {
  */
 struct samsung_usbphy {
 	struct usb_phy	phy;
+	struct usb_phy	phy3;
 	struct samsung_usbphy_data *plat;
 	struct device	*dev;
 	struct clk	*clk;
 	void __iomem	*regs;
+	void __iomem	*regs_phy3;
 	int		ref_clk_freq;
 	int		cpu_type;
 	enum samsung_usb_phy_type phy_type;
@@ -202,6 +299,7 @@ struct samsung_usbphy {
 };
 
 #define phy_to_sphy(x)		container_of((x), struct samsung_usbphy, phy)
+#define phy3_to_sphy(x)		container_of((x), struct samsung_usbphy, phy3)
 
 /*
  * PHYs are different for USB Device and USB Host. Controllers can make
@@ -287,12 +385,120 @@ static int samsung_usbphy_get_refclk_freq(struct samsung_usbphy *sphy)
 	return refclk_freq;
 }
 
+/*
+ * Sets the phy clk as EXTREFCLK (XXTI) which is internal clock form clock core.
+ */
+static u32 exynos5_usbphy3_set_clock(struct samsung_usbphy *sphy)
+{
+	u32 reg;
+	u32 refclk;
+
+	refclk = sphy->ref_clk_freq;
+
+	reg = PHYCLKRST_REFCLKSEL_EXT_REFCLK |
+		PHYCLKRST_FSEL(refclk);
+
+	switch (refclk) {
+	case HOST_CTRL0_FSEL_CLKSEL_50M:
+		reg |= (PHYCLKRST_MPLL_MULTIPLIER_50M_REF |
+			PHYCLKRST_SSC_REFCLKSEL(0x00));
+		break;
+	case HOST_CTRL0_FSEL_CLKSEL_20M:
+		reg |= (PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF |
+			PHYCLKRST_SSC_REFCLKSEL(0x00));
+		break;
+	case HOST_CTRL0_FSEL_CLKSEL_19200K:
+		reg |= (PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF |
+			PHYCLKRST_SSC_REFCLKSEL(0x88));
+		break;
+	case HOST_CTRL0_FSEL_CLKSEL_24M:
+	default:
+		reg |= (PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF |
+			PHYCLKRST_SSC_REFCLKSEL(0x88));
+		break;
+	}
+
+	return reg;
+}
+
 static int exynos5_phyhost_is_on(void *regs)
 {
 	return (readl(regs + EXYNOS5_PHY_HOST_CTRL0) &
 				HOST_CTRL0_SIDDQ) ? 0 : 1;
 }
 
+static int samsung_exynos5_usbphy3_enable(struct samsung_usbphy *sphy)
+{
+	void __iomem *regs = sphy->regs_phy3;
+	u32 phyparam0;
+	u32 phyparam1;
+	u32 linksystem;
+	u32 phybatchg;
+	u32 phytest;
+	u32 phyclkrst;
+
+	/* Reset USB 3.0 PHY */
+	writel(0x0, regs + EXYNOS5_DRD_PHYREG0);
+
+	phyparam0 = readl(regs + EXYNOS5_DRD_PHYPARAM0);
+	/* Select PHY CLK source */
+	phyparam0 &= ~PHYPARAM0_REF_USE_PAD;
+	/* Set Loss-of-Signal Detector sensitivity */
+	phyparam0 &= ~PHYPARAM0_REF_LOSLEVEL_MASK;
+	phyparam0 |= PHYPARAM0_REF_LOSLEVEL;
+	writel(phyparam0, regs + EXYNOS5_DRD_PHYPARAM0);
+
+	writel(0x0, regs + EXYNOS5_DRD_PHYRESUME);
+
+	/*
+	 * Setting the Frame length Adj value[6:1] to default 0x20
+	 * See xHCI 1.0 spec, 5.2.4
+	 */
+	linksystem = LINKSYSTEM_XHCI_VERSION_CONTROL |
+			LINKSYSTEM_FLADJ(0x20);
+	writel(linksystem, regs + EXYNOS5_DRD_LINKSYSTEM);
+
+	phyparam1 = readl(regs + EXYNOS5_DRD_PHYPARAM1);
+	/* Set Tx De-Emphasis level */
+	phyparam1 &= ~PHYPARAM1_PCS_TXDEEMPH_MASK;
+	phyparam1 |= PHYPARAM1_PCS_TXDEEMPH;
+	writel(phyparam1, regs + EXYNOS5_DRD_PHYPARAM1);
+
+	phybatchg = readl(regs + EXYNOS5_DRD_PHYBATCHG);
+	phybatchg |= PHYBATCHG_UTMI_CLKSEL;
+	writel(phybatchg, regs + EXYNOS5_DRD_PHYBATCHG);
+
+	/* PHYTEST POWERDOWN Control */
+	phytest = readl(regs + EXYNOS5_DRD_PHYTEST);
+	phytest &= ~(PHYTEST_POWERDOWN_SSP |
+			PHYTEST_POWERDOWN_HSP);
+	writel(phytest, regs + EXYNOS5_DRD_PHYTEST);
+
+	/* UTMI Power Control */
+	writel(PHYUTMI_OTGDISABLE, regs + EXYNOS5_DRD_PHYUTMI);
+
+	phyclkrst = exynos5_usbphy3_set_clock(sphy);
+
+	phyclkrst |= PHYCLKRST_PORTRESET |
+			/* Digital power supply in normal operating mode */
+			PHYCLKRST_RETENABLEN |
+			/* Enable ref clock for SS function */
+			PHYCLKRST_REF_SSP_EN |
+			/* Enable spread spectrum */
+			PHYCLKRST_SSC_EN |
+			/* Power down HS Bias and PLL blocks in suspend mode */
+			PHYCLKRST_COMMONONN;
+
+	writel(phyclkrst, regs + EXYNOS5_DRD_PHYCLKRST);
+
+	udelay(10);
+
+	phyclkrst &= ~(PHYCLKRST_PORTRESET);
+	writel(phyclkrst, regs + EXYNOS5_DRD_PHYCLKRST);
+
+	return 0;
+}
+
 static void samsung_exynos5_usbphy_enable(struct samsung_usbphy *sphy)
 {
 	void __iomem *regs = sphy->regs;
@@ -432,6 +638,32 @@ static void samsung_usbphy_enable(struct samsung_usbphy *sphy)
 	writel(rstcon, regs + SAMSUNG_RSTCON);
 }
 
+static void samsung_exynos5_usbphy3_disable(struct samsung_usbphy *sphy)
+{
+	u32 phyutmi;
+	u32 phyclkrst;
+	u32 phytest;
+	void __iomem *regs = sphy->regs_phy3;
+
+	phyutmi = PHYUTMI_OTGDISABLE |
+			PHYUTMI_FORCESUSPEND |
+			PHYUTMI_FORCESLEEP;
+	writel(phyutmi, regs + EXYNOS5_DRD_PHYUTMI);
+
+	/* Resetting the PHYCLKRST enable bits to reduce leakage current */
+	phyclkrst = readl(regs + EXYNOS5_DRD_PHYCLKRST);
+	phyclkrst &= ~(PHYCLKRST_REF_SSP_EN |
+			PHYCLKRST_SSC_EN |
+			PHYCLKRST_COMMONONN);
+	writel(phyclkrst, regs + EXYNOS5_DRD_PHYCLKRST);
+
+	/* Control PHYTEST to remove leakage current */
+	phytest = readl(regs + EXYNOS5_DRD_PHYTEST);
+	phytest |= (PHYTEST_POWERDOWN_SSP |
+			PHYTEST_POWERDOWN_HSP);
+	writel(phytest, regs + EXYNOS5_DRD_PHYTEST);
+}
+
 static void samsung_exynos5_usbphy_disable(struct samsung_usbphy *sphy)
 {
 	void __iomem *regs = sphy->regs;
@@ -491,6 +723,76 @@ static void samsung_usbphy_disable(struct samsung_usbphy *sphy)
 /*
  * The function passed to the usb driver for phy initialization
  */
+static int samsung_usbphy3_init(struct usb_phy *phy3)
+{
+	struct samsung_usbphy *sphy;
+	int ret = 0;
+
+	sphy = phy3_to_sphy(phy3);
+
+	if (sphy->cpu_type != TYPE_EXYNOS5250) {
+		dev_err(sphy->dev, "Not a valid cpu_type for USB 3.0\n");
+		return -ENODEV;
+	}
+
+	/* setting default phy-type for USB 3.0 */
+	samsung_usbphy_set_type(&sphy->phy3, USB_PHY_TYPE_DRD);
+
+	/* Enable the phy clock */
+	ret = clk_prepare_enable(sphy->clk);
+	if (ret) {
+		dev_err(sphy->dev, "%s: clk_prepare_enable failed\n", __func__);
+		return ret;
+	}
+
+	/* Disable phy isolation */
+	if (sphy->plat && sphy->plat->pmu_isolation)
+		sphy->plat->pmu_isolation(false, sphy->phy_type);
+
+	/* Initialize usb phy registers */
+	samsung_exynos5_usbphy3_enable(sphy);
+
+	/* Disable the phy clock */
+	clk_disable_unprepare(sphy->clk);
+
+	return ret;
+}
+
+/*
+ * The function passed to the usb driver for phy shutdown
+ */
+static void samsung_usbphy3_shutdown(struct usb_phy *phy3)
+{
+	struct samsung_usbphy *sphy;
+
+	sphy = phy3_to_sphy(phy3);
+
+	if (sphy->cpu_type != TYPE_EXYNOS5250) {
+		dev_err(sphy->dev, "Not a valid cpu_type for USB 3.0\n");
+		return;
+	}
+
+	/* setting default phy-type for USB 3.0 */
+	samsung_usbphy_set_type(&sphy->phy3, USB_PHY_TYPE_DRD);
+
+	if (clk_prepare_enable(sphy->clk)) {
+		dev_err(sphy->dev, "%s: clk_prepare_enable failed\n", __func__);
+		return;
+	}
+
+	/* De-initialize usb phy registers */
+	samsung_exynos5_usbphy3_disable(sphy);
+
+	/* Enable phy isolation */
+	if (sphy->plat && sphy->plat->pmu_isolation)
+		sphy->plat->pmu_isolation(true, sphy->phy_type);
+
+	clk_disable_unprepare(sphy->clk);
+}
+
+/*
+ * The function passed to the usb driver for phy initialization
+ */
 static int samsung_usbphy_init(struct usb_phy *phy)
 {
 	struct samsung_usbphy *sphy;
@@ -570,6 +872,8 @@ static int __devinit samsung_usbphy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *phy_mem;
 	void __iomem	*phy_base;
+	struct resource *phy3_mem;
+	void __iomem	*phy3_base = NULL;
 	struct clk *clk;
 	int	ret = 0;
 
@@ -618,7 +922,38 @@ static int __devinit samsung_usbphy_probe(struct platform_device *pdev)
 
 	sphy->clk = clk;
 
+	if (sphy->cpu_type == TYPE_EXYNOS5250) {
+		phy3_mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		if (!phy3_mem) {
+			dev_err(dev, "%s: missing mem resource\n", __func__);
+			return -ENODEV;
+		}
+
+		phy3_base = devm_request_and_ioremap(dev, phy3_mem);
+		if (!phy3_base) {
+			dev_err(dev, "%s: register mapping failed\n", __func__);
+			return -ENXIO;
+		}
+	}
+
+	sphy->regs_phy3		= phy3_base;
+	sphy->phy3.dev		= sphy->dev;
+	sphy->phy3.label	= "samsung-usbphy3";
+	sphy->phy3.init		= samsung_usbphy3_init;
+	sphy->phy3.shutdown	= samsung_usbphy3_shutdown;
+
 	ret = usb_add_phy(&sphy->phy, USB_PHY_TYPE_USB2);
+	if (ret)
+		return ret;
+
+	if (sphy->cpu_type != TYPE_EXYNOS5250) {
+		dev_warn(dev, "Not a valid cpu_type for USB 3.0\n");
+	} else {
+		ret = usb_add_phy(&sphy->phy3, USB_PHY_TYPE_USB3);
+		if (ret)
+			return ret;
+	}
+
 	return ret;
 }
 
@@ -627,6 +962,8 @@ static int __exit samsung_usbphy_remove(struct platform_device *pdev)
 	struct samsung_usbphy *sphy = platform_get_drvdata(pdev);
 
 	usb_remove_phy(&sphy->phy);
+	if (sphy->cpu_type == TYPE_EXYNOS5250)
+		usb_remove_phy(&sphy->phy3);
 
 	return 0;
 }
diff --git a/include/linux/usb/samsung_usb_phy.h b/include/linux/usb/samsung_usb_phy.h
index 8c05462..ed6f6c4 100644
--- a/include/linux/usb/samsung_usb_phy.h
+++ b/include/linux/usb/samsung_usb_phy.h
@@ -16,6 +16,7 @@ enum samsung_usb_phy_type
 {
 	USB_PHY_TYPE_DEVICE,
 	USB_PHY_TYPE_HOST,
+	USB_PHY_TYPE_DRD,
 };
 
 #ifdef CONFIG_SAMSUNG_USBPHY
-- 
1.7.6.5
