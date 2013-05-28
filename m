From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] usb: phy: samsung: Add support for EXYNOS4210
Date: Tue, 28 May 2013 18:04:07 +0900
Message-ID: <000301ce5b82$4fa829e0$eef87da0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46623 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933652Ab3E1JEK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 05:04:10 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Felipe Balbi' <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, 'Greg KH' <gregkh@linuxfoundation.org>, 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Praveen Paneri' <p.paneri@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Add support for EXYNOS4210 that includes USB EHCI/OHCI.
Previous PHY initialization code is not correct; thus, it is modifed
to support EXYNOS4210 PHY. Also, after common clock framework for
Samsung is added, clock name is defined as 'usb_device'.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Tested on Exynos4210.

 drivers/usb/phy/phy-samsung-usb.h  |   35 ++++++++++++++---
 drivers/usb/phy/phy-samsung-usb2.c |   74 +++++++++++++++++++++++++++++++++---
 2 files changed, 98 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-samsung-usb.h b/drivers/usb/phy/phy-samsung-usb.h
index 70a9cae..34c35e8 100644
--- a/drivers/usb/phy/phy-samsung-usb.h
+++ b/drivers/usb/phy/phy-samsung-usb.h
@@ -22,13 +22,22 @@
 
 #define SAMSUNG_PHYPWR				(0x00)
 
+#define PHYPWR_PHY1_HSIC_NORMAL_MASK		(0xf << 9)
+#define PHYPWR_PHY1_HSIC1_SLEEP			(1 << 12)
+#define PHYPWR_PHY1_HSIC1_FORCE_SUSPEND		(1 << 11)
+#define PHYPWR_PHY1_HSIC0_SLEEP			(1 << 10)
+#define PHYPWR_PHY1_HSIC0_FORCE_SUSPEND		(1 << 9)
+#define PHYPWR_PHY1_STD_NORMAL_MASK		(0x7 << 6)
+#define PHYPWR_PHY1_STD_SLEEP			(1 << 8)
+#define PHYPWR_PHY1_STD_ANALOG_POWERDOWN	(1 << 7)
+#define PHYPWR_PHY1_STD_FORCE_SUSPEND		(1 << 6)
 #define PHYPWR_NORMAL_MASK			(0x19 << 0)
 #define PHYPWR_OTG_DISABLE			(0x1 << 4)
 #define PHYPWR_ANALOG_POWERDOWN			(0x1 << 3)
 #define PHYPWR_FORCE_SUSPEND			(0x1 << 1)
 /* For Exynos4 */
-#define PHYPWR_NORMAL_MASK_PHY0			(0x39 << 0)
-#define PHYPWR_SLEEP_PHY0			(0x1 << 5)
+#define PHYPWR_PHY0_NORMAL_MASK			(0x39 << 0)
+#define PHYPWR_PHY0_SLEEP			(0x1 << 5)
 
 #define SAMSUNG_PHYCLK				(0x04)
 
@@ -43,9 +52,25 @@
 
 #define SAMSUNG_RSTCON				(0x08)
 
-#define RSTCON_PHYLINK_SWRST			(0x1 << 2)
-#define RSTCON_HLINK_SWRST			(0x1 << 1)
-#define RSTCON_SWRST				(0x1 << 0)
+#define RSTCON_HOST_LINK_PORT_SWRST_MASK	(0xf << 6)
+#define RSTCON_HOST_LINK_PORT2_SWRST		(0x1 << 9)
+#define RSTCON_HOST_LINK_PORT1_SWRST		(0x1 << 8)
+#define RSTCON_HOST_LINK_PORT0_SWRST		(0x1 << 7)
+#define RSTCON_HOST_LINK_ALL_SWRST		(0x1 << 6)
+#define RSTCON_PHY1_SWRST_MASK			(0x7 << 3)
+#define RSTCON_PHY1_HSIC_SWRST			(0x1 << 5)
+#define RSTCON_PHY1_STD_SWRST			(0x1 << 4)
+#define RSTCON_PHY1_ALL_SWRST			(0x1 << 3)
+#define RSTCON_PHY0_SWRST_MASK			(0x7 << 0)
+#define RSTCON_PHY0_PHYLINK_SWRST		(0x1 << 2)
+#define RSTCON_PHY0_HLINK_SWRST			(0x1 << 1)
+#define RSTCON_PHY0_SWRST			(0x1 << 0)
+
+/* EXYNOS4 */
+#define EXYNOS4_PHY1CON				(0x34)
+
+#define PHY1CON_FPENABLEN			(0x1 << 0)
+
 
 /* EXYNOS5 */
 #define EXYNOS5_PHY_HOST_CTRL0			(0x00)
diff --git a/drivers/usb/phy/phy-samsung-usb2.c b/drivers/usb/phy/phy-samsung-usb2.c
index 9d5e273..4f93d84 100644
--- a/drivers/usb/phy/phy-samsung-usb2.c
+++ b/drivers/usb/phy/phy-samsung-usb2.c
@@ -158,6 +158,15 @@ static void samsung_exynos5_usb2phy_enable(struct samsung_usbphy *sphy)
 	writel(ohcictrl, regs + EXYNOS5_PHY_HOST_OHCICTRL);
 }
 
+static bool exynos4_phyhost_is_on(void __iomem *regs)
+{
+	u32 reg;
+
+	reg = readl(regs + SAMSUNG_PHYPWR);
+
+	return !(reg & PHYPWR_PHY1_STD_ANALOG_POWERDOWN);
+}
+
 static void samsung_usb2phy_enable(struct samsung_usbphy *sphy)
 {
 	void __iomem *regs = sphy->regs;
@@ -165,6 +174,18 @@ static void samsung_usb2phy_enable(struct samsung_usbphy *sphy)
 	u32 phyclk;
 	u32 rstcon;
 
+	switch (sphy->drv_data->cpu_type) {
+	case TYPE_EXYNOS4210:
+		atomic_inc(&sphy->phy_usage);
+
+		if (exynos4_phyhost_is_on(regs)) {
+			dev_info(sphy->dev, "Already power on PHY\n");
+			return;
+		}
+	default:
+		break;
+	}
+
 	/* set clock frequency for PLL */
 	phyclk = sphy->ref_clk_freq;
 	phypwr = readl(regs + SAMSUNG_PHYPWR);
@@ -174,22 +195,48 @@ static void samsung_usb2phy_enable(struct samsung_usbphy *sphy)
 	case TYPE_S3C64XX:
 		phyclk &= ~PHYCLK_COMMON_ON_N;
 		phypwr &= ~PHYPWR_NORMAL_MASK;
-		rstcon |= RSTCON_SWRST;
+		rstcon |= RSTCON_PHY0_SWRST;
 		break;
 	case TYPE_EXYNOS4210:
-		phypwr &= ~PHYPWR_NORMAL_MASK_PHY0;
-		rstcon |= RSTCON_SWRST;
+		phypwr &= ~(PHYPWR_PHY0_NORMAL_MASK |
+				PHYPWR_PHY1_STD_NORMAL_MASK |
+				PHYPWR_PHY1_HSIC_NORMAL_MASK);
+		rstcon |= (RSTCON_PHY0_SWRST_MASK |
+				RSTCON_PHY1_SWRST_MASK |
+				RSTCON_HOST_LINK_PORT_SWRST_MASK);
 	default:
 		break;
 	}
 
 	writel(phyclk, regs + SAMSUNG_PHYCLK);
-	/* Configure PHY0 for normal operation*/
+
+	switch (sphy->drv_data->cpu_type) {
+	case TYPE_EXYNOS4210:
+		/* floating prevention logic: disable */
+		writel((readl(regs + EXYNOS4_PHY1CON) | PHY1CON_FPENABLEN),
+			regs + EXYNOS4_PHY1CON);
+	default:
+		break;
+	}
+
+	/* Configure PHY0, PHY1 and HSIC for normal operation*/
 	writel(phypwr, regs + SAMSUNG_PHYPWR);
+
 	/* reset all ports of PHY and Link */
 	writel(rstcon, regs + SAMSUNG_RSTCON);
 	udelay(10);
-	rstcon &= ~RSTCON_SWRST;
+
+	switch (sphy->drv_data->cpu_type) {
+	case TYPE_S3C64XX:
+		rstcon &= ~RSTCON_PHY0_SWRST;
+		break;
+	case TYPE_EXYNOS4210:
+		rstcon &= ~(RSTCON_PHY0_SWRST_MASK |
+				RSTCON_PHY1_SWRST_MASK |
+				RSTCON_HOST_LINK_PORT_SWRST_MASK);
+	default:
+		break;
+	}
 	writel(rstcon, regs + SAMSUNG_RSTCON);
 }
 
@@ -233,6 +280,16 @@ static void samsung_usb2phy_disable(struct samsung_usbphy *sphy)
 	void __iomem *regs = sphy->regs;
 	u32 phypwr;
 
+	switch (sphy->drv_data->cpu_type) {
+	case TYPE_EXYNOS4210:
+		if (atomic_dec_return(&sphy->phy_usage) > 0) {
+			dev_info(sphy->dev, "still being used\n");
+			return;
+		}
+	default:
+		break;
+	}
+
 	phypwr = readl(regs + SAMSUNG_PHYPWR);
 
 	switch (sphy->drv_data->cpu_type) {
@@ -240,7 +297,9 @@ static void samsung_usb2phy_disable(struct samsung_usbphy *sphy)
 		phypwr |= PHYPWR_NORMAL_MASK;
 		break;
 	case TYPE_EXYNOS4210:
-		phypwr |= PHYPWR_NORMAL_MASK_PHY0;
+		phypwr |= (PHYPWR_PHY0_NORMAL_MASK |
+				PHYPWR_PHY1_STD_NORMAL_MASK |
+				PHYPWR_PHY1_HSIC_NORMAL_MASK);
 	default:
 		break;
 	}
@@ -379,6 +438,8 @@ static int samsung_usb2phy_probe(struct platform_device *pdev)
 
 	if (drv_data->cpu_type == TYPE_EXYNOS5250)
 		clk = devm_clk_get(dev, "usbhost");
+	else if (drv_data->cpu_type == TYPE_EXYNOS4210)
+		clk = devm_clk_get(dev, "usb_device");
 	else
 		clk = devm_clk_get(dev, "otg");
 
@@ -444,6 +505,7 @@ static const struct samsung_usbphy_drvdata usb2phy_exynos4 = {
 	.cpu_type		= TYPE_EXYNOS4210,
 	.devphy_en_mask		= EXYNOS_USBPHY_ENABLE,
 	.hostphy_en_mask	= EXYNOS_USBPHY_ENABLE,
+	.hostphy_reg_offset	= EXYNOS_USBHOST_PHY_CTRL_OFFSET,
 };
 
 static struct samsung_usbphy_drvdata usb2phy_exynos5 = {
-- 
1.7.10.4
