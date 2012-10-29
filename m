From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 1/4] usb: phy: samsung: Add host phy support to samsung-phy
 driver
Date: Mon, 29 Oct 2012 19:12:37 +0530
Message-ID: <1351518160-22369-2-git-send-email-gautam.vivek@samsung.com>
References: <1351518160-22369-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1351518160-22369-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds host phy support to samsung-usbphy.c and
further adds support for samsung's exynos5250 usb-phy.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/setup-usb-phy.c         |    2 +-
 arch/arm/mach-s3c64xx/setup-usb-phy.c        |    2 +-
 arch/arm/plat-samsung/include/plat/usb-phy.h |    2 +-
 drivers/usb/phy/Kconfig                      |    1 -
 drivers/usb/phy/samsung-usbphy.c             |  369 ++++++++++++++++++++++++--
 include/linux/platform_data/samsung-usbphy.h |    8 +-
 6 files changed, 353 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
index 1c62d20..be6cd4f 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -222,7 +222,7 @@ int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 	return -EINVAL;
 }
 
-void s5p_usb_phy_pmu_isolation(int on)
+void s5p_usb_phy_pmu_isolation(int on, int type)
 {
 	if (on) {
 		writel(readl(S5P_USBDEVICE_PHY_CONTROL)
diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c b/arch/arm/mach-s3c64xx/setup-usb-phy.c
index 3aee778..b7d1d95 100644
--- a/arch/arm/mach-s3c64xx/setup-usb-phy.c
+++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
@@ -13,7 +13,7 @@
 #include <mach/map.h>
 #include <mach/regs-sys.h>
 
-void s5p_usb_phy_pmu_isolation(int on)
+void s5p_usb_phy_pmu_isolation(int on, int type)
 {
 	if (on) {
 		writel(readl(S3C64XX_OTHERS) & ~S3C64XX_OTHERS_USBMASK,
diff --git a/arch/arm/plat-samsung/include/plat/usb-phy.h b/arch/arm/plat-samsung/include/plat/usb-phy.h
index 165ffe7..7a4a959 100644
--- a/arch/arm/plat-samsung/include/plat/usb-phy.h
+++ b/arch/arm/plat-samsung/include/plat/usb-phy.h
@@ -18,6 +18,6 @@ enum s5p_usb_phy_type {
 
 extern int s5p_usb_phy_init(struct platform_device *pdev, int type);
 extern int s5p_usb_phy_exit(struct platform_device *pdev, int type);
-extern void s5p_usb_phy_pmu_isolation(int on);
+extern void s5p_usb_phy_pmu_isolation(int on, int type);
 
 #endif /* __PLAT_SAMSUNG_USB_PHY_H */
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
index 4efe89c..006f72e 100644
--- a/drivers/usb/phy/samsung-usbphy.c
+++ b/drivers/usb/phy/samsung-usbphy.c
@@ -57,6 +57,116 @@
 #define S3C_RSTCON_HCLK				(1 << 1)
 #define S3C_RSTCON_PHY				(1 << 0)
 
+/* EXYNOS5 */
+#define EXYNOS5_PHY_HOST_CTRL0			(0x00)
+
+#define HOST_CTRL0_PHYSWRSTALL			(0x1 << 31)
+
+#define HOST_CTRL0_REFCLKSEL_MASK		(0x3)
+#define HOST_CTRL0_REFCLKSEL(_x)		((_x) << 19)
+#define HOST_CTRL0_REFCLKSEL_XTAL		\
+		HOST_CTRL0_REFCLKSEL(0x0)
+#define HOST_CTRL0_REFCLKSEL_EXTL		\
+		HOST_CTRL0_REFCLKSEL(0x1)
+#define HOST_CTRL0_REFCLKSEL_CLKCORE		\
+		HOST_CTRL0_REFCLKSEL(0x2)
+
+#define HOST_CTRL0_FSEL_MASK			(0x7 << 16)
+#define HOST_CTRL0_FSEL(_x)			((_x) << 16)
+#define HOST_CTRL0_FSEL_CLKSEL_50M		(0x7)
+#define HOST_CTRL0_FSEL_CLKSEL_24M		(0x5)
+#define HOST_CTRL0_FSEL_CLKSEL_20M		(0x4)
+#define HOST_CTRL0_FSEL_CLKSEL_19200K		(0x3)
+#define HOST_CTRL0_FSEL_CLKSEL_12M		(0x2)
+#define HOST_CTRL0_FSEL_CLKSEL_10M		(0x1)
+#define HOST_CTRL0_FSEL_CLKSEL_9600K		(0x0)
+
+#define HOST_CTRL0_TESTBURNIN			(0x1 << 11)
+#define HOST_CTRL0_RETENABLE			(0x1 << 10)
+#define HOST_CTRL0_COMMONON_N			(0x1 << 9)
+#define HOST_CTRL0_SIDDQ			(0x1 << 6)
+#define HOST_CTRL0_FORCESLEEP			(0x1 << 5)
+#define HOST_CTRL0_FORCESUSPEND			(0x1 << 4)
+#define HOST_CTRL0_WORDINTERFACE		(0x1 << 3)
+#define HOST_CTRL0_UTMISWRST			(0x1 << 2)
+#define HOST_CTRL0_LINKSWRST			(0x1 << 1)
+#define HOST_CTRL0_PHYSWRST			(0x1 << 0)
+
+#define EXYNOS5_PHY_HOST_TUNE0			(0x04)
+
+#define EXYNOS5_PHY_HSIC_CTRL1			(0x10)
+
+#define EXYNOS5_PHY_HSIC_TUNE1			(0x14)
+
+#define EXYNOS5_PHY_HSIC_CTRL2			(0x20)
+
+#define EXYNOS5_PHY_HSIC_TUNE2			(0x24)
+
+#define HSIC_CTRL_REFCLKSEL_MASK		(0x3)
+#define HSIC_CTRL_REFCLKSEL			(0x2 << 23)
+
+#define HSIC_CTRL_REFCLKDIV_MASK		(0x7f)
+#define HSIC_CTRL_REFCLKDIV(_x)			((_x) << 16)
+#define HSIC_CTRL_REFCLKDIV_12			\
+		HSIC_CTRL_REFCLKDIV(0x24)
+#define HSIC_CTRL_REFCLKDIV_15			\
+		HSIC_CTRL_REFCLKDIV(0x1C)
+#define HSIC_CTRL_REFCLKDIV_16			\
+		HSIC_CTRL_REFCLKDIV(0x1A)
+#define HSIC_CTRL_REFCLKDIV_19_2		\
+		HSIC_CTRL_REFCLKDIV(0x15)
+#define HSIC_CTRL_REFCLKDIV_20			\
+		HSIC_CTRL_REFCLKDIV(0x14)
+
+#define HSIC_CTRL_SIDDQ				(0x1 << 6)
+#define HSIC_CTRL_FORCESLEEP			(0x1 << 5)
+#define HSIC_CTRL_FORCESUSPEND			(0x1 << 4)
+#define HSIC_CTRL_WORDINTERFACE			(0x1 << 3)
+#define HSIC_CTRL_UTMISWRST			(0x1 << 2)
+#define HSIC_CTRL_PHYSWRST			(0x1 << 0)
+
+#define EXYNOS5_PHY_HOST_EHCICTRL		(0x30)
+
+#define HOST_EHCICTRL_ENAINCRXALIGN		(0x1 << 29)
+#define HOST_EHCICTRL_ENAINCR4			(0x1 << 28)
+#define HOST_EHCICTRL_ENAINCR8			(0x1 << 27)
+#define HOST_EHCICTRL_ENAINCR16			(0x1 << 26)
+
+#define EXYNOS5_PHY_HOST_OHCICTRL		(0x34)
+
+#define HOST_OHCICTRL_SUSPLGCY			(0x1 << 3)
+#define HOST_OHCICTRL_APPSTARTCLK		(0x1 << 2)
+#define HOST_OHCICTRL_CNTSEL			(0x1 << 1)
+#define HOST_OHCICTRL_CLKCKTRST			(0x1 << 0)
+
+#define EXYNOS5_PHY_OTG_SYS			(0x38)
+
+#define OTG_SYS_PHYLINK_SWRESET			(0x1 << 14)
+#define OTG_SYS_LINKSWRST_UOTG			(0x1 << 13)
+#define OTG_SYS_PHY0_SWRST			(0x1 << 12)
+
+#define OTG_SYS_REFCLKSEL_MASK			(0x3 << 9)
+#define OTG_SYS_REFCLKSEL(_x)			((_x) << 9)
+#define OTG_SYS_REFCLKSEL_XTAL			\
+		OTG_SYS_REFCLKSEL(0x0)
+#define OTG_SYS_REFCLKSEL_EXTL			\
+		OTG_SYS_REFCLKSEL(0x1)
+#define OTG_SYS_REFCLKSEL_CLKCORE		\
+		OTG_SYS_REFCLKSEL(0x2)
+
+#define OTG_SYS_IDPULLUP_UOTG			(0x1 << 8)
+#define OTG_SYS_COMMON_ON			(0x1 << 7)
+
+#define OTG_SYS_FSEL_MASK			(0x7 << 4)
+#define OTG_SYS_FSEL(_x)			((_x) << 4)
+
+#define OTG_SYS_FORCESLEEP			(0x1 << 3)
+#define OTG_SYS_OTGDISABLE			(0x1 << 2)
+#define OTG_SYS_SIDDQ_UOTG			(0x1 << 1)
+#define OTG_SYS_FORCESUSPEND			(0x1 << 0)
+
+#define EXYNOS5_PHY_OTG_TUNE			(0x40)
+
 #ifndef MHZ
 #define MHZ (1000*1000)
 #endif
@@ -64,6 +174,7 @@
 enum samsung_cpu_type {
 	TYPE_S3C64XX,
 	TYPE_EXYNOS4210,
+	TYPE_EXYNOS5250,
 };
 
 /*
@@ -84,6 +195,7 @@ struct samsung_usbphy {
 	void __iomem	*regs;
 	int		ref_clk_freq;
 	int		cpu_type;
+	atomic_t	host_usage;
 };
 
 #define phy_to_sphy(x)		container_of((x), struct samsung_usbphy, phy)
@@ -96,30 +208,176 @@ static int samsung_usbphy_get_refclk_freq(struct samsung_usbphy *sphy)
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
+			refclk_freq |= HOST_CTRL0_FSEL_CLKSEL_9600K;
+			break;
+		case 10 * MHZ:
+			refclk_freq |= HOST_CTRL0_FSEL_CLKSEL_10M;
+			break;
+		case 12 * MHZ:
+			refclk_freq |= HOST_CTRL0_FSEL_CLKSEL_12M;
+			break;
+		case 192 * 100000:
+			refclk_freq |= HOST_CTRL0_FSEL_CLKSEL_19200K;
+			break;
+		case 20 * MHZ:
+			refclk_freq |= HOST_CTRL0_FSEL_CLKSEL_20M;
+			break;
+		case 50 * MHZ:
+			refclk_freq |= HOST_CTRL0_FSEL_CLKSEL_50M;
+			break;
+		case 24 * MHZ:
+		default:
+			/* default reference clock */
+			refclk_freq |= HOST_CTRL0_FSEL_CLKSEL_24M;
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
+	return (readl(regs + EXYNOS5_PHY_HOST_CTRL0) &
+				HOST_CTRL0_SIDDQ) ? 0 : 1;
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
+	/* Selecting Host/OTG mode; After reset USB2.0PHY_CFG: HOST */
+	if (sphy->plat && sphy->plat->phy_cfg_sel) {
+		if (sphy->plat->type)
+			sphy->plat->phy_cfg_sel(sphy->dev, sphy->plat->type);
+		else
+			sphy->plat->phy_cfg_sel(sphy->dev, TYPE_OTG);
+	}
+
+	/* Host configuration */
+	phyhost = readl(regs + EXYNOS5_PHY_HOST_CTRL0);
+
+	/* phy reference clock configuration */
+	phyhost &= ~HOST_CTRL0_FSEL_MASK;
+	phyhost |= HOST_CTRL0_FSEL(phyclk);
+
+	/* host phy reset */
+	phyhost &= ~(HOST_CTRL0_PHYSWRST |
+			HOST_CTRL0_PHYSWRSTALL |
+			HOST_CTRL0_SIDDQ |
+			/* Enable normal mode of operation */
+			HOST_CTRL0_FORCESUSPEND |
+			HOST_CTRL0_FORCESLEEP);
+
+	/* Link reset */
+	phyhost |= (HOST_CTRL0_LINKSWRST |
+			HOST_CTRL0_UTMISWRST |
+			/* COMMON Block configuration during suspend */
+			HOST_CTRL0_COMMONON_N);
+	writel(phyhost, regs + EXYNOS5_PHY_HOST_CTRL0);
+	udelay(10);
+	phyhost &= ~(HOST_CTRL0_LINKSWRST |
+			HOST_CTRL0_UTMISWRST);
+	writel(phyhost, regs + EXYNOS5_PHY_HOST_CTRL0);
+
+	/* OTG configuration */
+	phyotg = readl(regs + EXYNOS5_PHY_OTG_SYS);
+
+	/* phy reference clock configuration */
+	phyotg &= ~OTG_SYS_FSEL_MASK;
+	phyotg |= OTG_SYS_FSEL(phyclk);
+
+	/* Enable normal mode of operation */
+	phyotg &= ~(OTG_SYS_FORCESUSPEND |
+			OTG_SYS_SIDDQ_UOTG |
+			OTG_SYS_FORCESLEEP |
+			OTG_SYS_REFCLKSEL_MASK |
+			/* COMMON Block configuration during suspend */
+			OTG_SYS_COMMON_ON);
+
+	/* OTG phy & link reset */
+	phyotg |= (OTG_SYS_PHY0_SWRST |
+			OTG_SYS_LINKSWRST_UOTG |
+			OTG_SYS_PHYLINK_SWRESET |
+			OTG_SYS_OTGDISABLE |
+			/* Set phy refclk */
+			OTG_SYS_REFCLKSEL_CLKCORE);
+
+	writel(phyotg, regs + EXYNOS5_PHY_OTG_SYS);
+	udelay(10);
+	phyotg &= ~(OTG_SYS_PHY0_SWRST |
+			OTG_SYS_LINKSWRST_UOTG |
+			OTG_SYS_PHYLINK_SWRESET);
+	writel(phyotg, regs + EXYNOS5_PHY_OTG_SYS);
+
+	/* HSIC phy configuration */
+	phyhsic = (HSIC_CTRL_REFCLKDIV_12 |
+			HSIC_CTRL_REFCLKSEL |
+			HSIC_CTRL_PHYSWRST);
+	writel(phyhsic, regs + EXYNOS5_PHY_HSIC_CTRL1);
+	writel(phyhsic, regs + EXYNOS5_PHY_HSIC_CTRL2);
+	udelay(10);
+	phyhsic &= ~HSIC_CTRL_PHYSWRST;
+	writel(phyhsic, regs + EXYNOS5_PHY_HSIC_CTRL1);
+	writel(phyhsic, regs + EXYNOS5_PHY_HSIC_CTRL2);
+
+	udelay(80);
+
+	/* enable EHCI DMA burst */
+	ehcictrl = readl(regs + EXYNOS5_PHY_HOST_EHCICTRL);
+	ehcictrl |= (HOST_EHCICTRL_ENAINCRXALIGN |
+				HOST_EHCICTRL_ENAINCR4 |
+				HOST_EHCICTRL_ENAINCR8 |
+				HOST_EHCICTRL_ENAINCR16);
+	writel(ehcictrl, regs + EXYNOS5_PHY_HOST_EHCICTRL);
+
+	/* set ohci_suspend_on_n */
+	ohcictrl = readl(regs + EXYNOS5_PHY_HOST_OHCICTRL);
+	ohcictrl |= HOST_OHCICTRL_SUSPLGCY;
+	writel(ohcictrl, regs + EXYNOS5_PHY_HOST_OHCICTRL);
+}
+
 static void samsung_usbphy_enable(struct samsung_usbphy *sphy)
 {
 	void __iomem *regs = sphy->regs;
@@ -155,6 +413,41 @@ static void samsung_usbphy_enable(struct samsung_usbphy *sphy)
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
+	phyhsic = (HSIC_CTRL_REFCLKDIV_12 |
+			HSIC_CTRL_REFCLKSEL |
+			HSIC_CTRL_SIDDQ |
+			HSIC_CTRL_FORCESLEEP |
+			HSIC_CTRL_FORCESUSPEND);
+	writel(phyhsic, regs + EXYNOS5_PHY_HSIC_CTRL1);
+	writel(phyhsic, regs + EXYNOS5_PHY_HSIC_CTRL2);
+
+	phyhost = readl(regs + EXYNOS5_PHY_HOST_CTRL0);
+	phyhost |= (HOST_CTRL0_SIDDQ |
+			HOST_CTRL0_FORCESUSPEND |
+			HOST_CTRL0_FORCESLEEP |
+			HOST_CTRL0_PHYSWRST |
+			HOST_CTRL0_PHYSWRSTALL);
+	writel(phyhost, regs + EXYNOS5_PHY_HOST_CTRL0);
+
+	phyotg = readl(regs + EXYNOS5_PHY_OTG_SYS);
+	phyotg |= (OTG_SYS_FORCESUSPEND |
+			OTG_SYS_SIDDQ_UOTG |
+			OTG_SYS_FORCESLEEP);
+	writel(phyotg, regs + EXYNOS5_PHY_OTG_SYS);
+}
+
 static void samsung_usbphy_disable(struct samsung_usbphy *sphy)
 {
 	void __iomem *regs = sphy->regs;
@@ -194,11 +487,18 @@ static int samsung_usbphy_init(struct usb_phy *phy)
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
@@ -220,11 +520,18 @@ static void samsung_usbphy_shutdown(struct usb_phy *phy)
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
@@ -277,16 +584,9 @@ static int __devinit samsung_usbphy_probe(struct platform_device *pdev)
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
@@ -296,6 +596,17 @@ static int __devinit samsung_usbphy_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sphy);
 
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
@@ -317,6 +628,9 @@ static const struct of_device_id samsung_usbphy_dt_match[] = {
 	}, {
 		.compatible = "samsung,exynos4210-usbphy",
 		.data = (void *)TYPE_EXYNOS4210,
+	}, {
+		.compatible = "samsung,exynos5250-usbphy",
+		.data = (void *)TYPE_EXYNOS5250,
 	},
 	{},
 };
@@ -332,6 +646,9 @@ static struct platform_device_id samsung_usbphy_driver_ids[] = {
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
index 1bd24cb..364a38a 100644
--- a/include/linux/platform_data/samsung-usbphy.h
+++ b/include/linux/platform_data/samsung-usbphy.h
@@ -18,8 +18,14 @@
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
+	int type;
 };
 
 extern void samsung_usbphy_set_pdata(struct samsung_usbphy_data *pd);
-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
