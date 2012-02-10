From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 3/6] ARM: EXYNOS: Add usb otg phy control for EXYNOS4210
Date: Fri, 10 Feb 2012 11:35:43 +0100
Message-ID: <1328870146-20312-4-git-send-email-l.majewski@samsung.com>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:37692 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758993Ab2BJKfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 05:35:53 -0500
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LZ6002Z2ARR4S30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZ600BTYARRL7@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:51 +0000 (GMT)
In-reply-to: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch supports to control usb otg phy of EXYNOS4210.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[Rebased on the newest git/kgene/linux-samsung #for-next]
Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h      |    2 +
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
 arch/arm/mach-exynos/setup-usb-phy.c         |   95 +++++++++++++++++++-------
 3 files changed, 75 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 7df9e74..a81c95b 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -33,6 +33,7 @@
 
 #define EXYNOS4_PA_G2D			0x12800000
 
+#define EXYNOS4_PA_USB_HSOTG		0x12480000
 #define EXYNOS4_PA_I2S0			0x03830000
 #define EXYNOS4_PA_I2S1			0xE3100000
 #define EXYNOS4_PA_I2S2			0xE2A00000
@@ -153,6 +154,7 @@
 #define S3C_PA_IIC6			EXYNOS4_PA_IIC(6)
 #define S3C_PA_IIC7			EXYNOS4_PA_IIC(7)
 #define S3C_PA_RTC			EXYNOS4_PA_RTC
+#define S3C_PA_USB_HSOTG		EXYNOS4_PA_USB_HSOTG
 #define S3C_PA_WDT			EXYNOS4_PA_WATCHDOG
 #define S3C_PA_UART			EXYNOS4_PA_UART
 #define S3C_PA_SPI0			EXYNOS4_PA_SPI0
diff --git a/arch/arm/mach-exynos/include/mach/regs-pmu.h b/arch/arm/mach-exynos/include/mach/regs-pmu.h
index 4fff8e9..e181f2a 100644
--- a/arch/arm/mach-exynos/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos/include/mach/regs-pmu.h
@@ -162,6 +162,9 @@
 #define S5P_CHECK_SLEEP				0x00000BAD
 
 /* Only for EXYNOS4210 */
+#define S5P_USBDEVICE_PHY_CONTROL	S5P_PMUREG(0x0704)
+#define S5P_USBDEVICE_PHY_ENABLE	(1 << 0)
+
 #define S5P_USBHOST_PHY_CONTROL		S5P_PMUREG(0x0708)
 #define S5P_USBHOST_PHY_ENABLE		(1 << 0)
 
diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
index 41743d2..6cf5d6a 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -26,11 +26,72 @@ static int exynos4_usb_host_phy_is_on(void)
 	return (readl(EXYNOS4_PHYPWR) & PHY1_STD_ANALOG_POWERDOWN) ? 0 : 1;
 }
 
-static int exynos4_usb_phy1_init(struct platform_device *pdev)
+static void exynos4_usb_phy_clkset(struct platform_device *pdev)
 {
-	struct clk *otg_clk;
 	struct clk *xusbxti_clk;
 	u32 phyclk;
+
+	/* set clock frequency for PLL */
+	phyclk = readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
+
+	xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
+	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
+		switch (clk_get_rate(xusbxti_clk)) {
+		case 12 * MHZ:
+			phyclk |= CLKSEL_12M;
+			break;
+		case 24 * MHZ:
+			phyclk |= CLKSEL_24M;
+			break;
+		default:
+		case 48 * MHZ:
+			/* default reference clock */
+			break;
+		}
+		clk_put(xusbxti_clk);
+	}
+
+	writel(phyclk, EXYNOS4_PHYCLK);
+}
+
+static int exynos4_usb_phy0_init(struct platform_device *pdev)
+{
+	u32 rstcon;
+
+	writel(readl(S5P_USBDEVICE_PHY_CONTROL) | S5P_USBDEVICE_PHY_ENABLE,
+			S5P_USBDEVICE_PHY_CONTROL);
+
+	exynos4_usb_phy_clkset(pdev);
+
+	/* set to normal PHY0 */
+	writel((readl(EXYNOS4_PHYPWR) & ~PHY0_NORMAL_MASK), EXYNOS4_PHYPWR);
+
+	/* reset PHY0 and Link */
+	rstcon = readl(EXYNOS4_RSTCON) | PHY0_SWRST_MASK;
+	writel(rstcon, EXYNOS4_RSTCON);
+	udelay(10);
+
+	rstcon &= ~PHY0_SWRST_MASK;
+	writel(rstcon, EXYNOS4_RSTCON);
+	udelay(80);
+
+	return 0;
+}
+
+static int exynos4_usb_phy0_exit(struct platform_device *pdev)
+{
+	writel((readl(EXYNOS4_PHYPWR) | PHY0_ANALOG_POWERDOWN |
+				PHY0_OTG_DISABLE), EXYNOS4_PHYPWR);
+
+	writel(readl(S5P_USBDEVICE_PHY_CONTROL) & ~S5P_USBDEVICE_PHY_ENABLE,
+			S5P_USBDEVICE_PHY_CONTROL);
+
+	return 0;
+}
+
+static int exynos4_usb_phy1_init(struct platform_device *pdev)
+{
+	struct clk *otg_clk;
 	u32 rstcon;
 	int err;
 
@@ -54,27 +115,7 @@ static int exynos4_usb_phy1_init(struct platform_device *pdev)
 	writel(readl(S5P_USBHOST_PHY_CONTROL) | S5P_USBHOST_PHY_ENABLE,
 			S5P_USBHOST_PHY_CONTROL);
 
-	/* set clock frequency for PLL */
-	phyclk = readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
-
-	xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
-	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
-		switch (clk_get_rate(xusbxti_clk)) {
-		case 12 * MHZ:
-			phyclk |= CLKSEL_12M;
-			break;
-		case 24 * MHZ:
-			phyclk |= CLKSEL_24M;
-			break;
-		default:
-		case 48 * MHZ:
-			/* default reference clock */
-			break;
-		}
-		clk_put(xusbxti_clk);
-	}
-
-	writel(phyclk, EXYNOS4_PHYCLK);
+	exynos4_usb_phy_clkset(pdev);
 
 	/* floating prevention logic: disable */
 	writel((readl(EXYNOS4_PHY1CON) | FPENABLEN), EXYNOS4_PHY1CON);
@@ -136,7 +177,9 @@ static int exynos4_usb_phy1_exit(struct platform_device *pdev)
 
 int s5p_usb_phy_init(struct platform_device *pdev, int type)
 {
-	if (type == S5P_USB_PHY_HOST)
+	if (type == S5P_USB_PHY_DEVICE)
+		return exynos4_usb_phy0_init(pdev);
+	else if (type == S5P_USB_PHY_HOST)
 		return exynos4_usb_phy1_init(pdev);
 
 	return -EINVAL;
@@ -144,7 +187,9 @@ int s5p_usb_phy_init(struct platform_device *pdev, int type)
 
 int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 {
-	if (type == S5P_USB_PHY_HOST)
+	if (type == S5P_USB_PHY_DEVICE)
+		return exynos4_usb_phy0_exit(pdev);
+	else if (type == S5P_USB_PHY_HOST)
 		return exynos4_usb_phy1_exit(pdev);
 
 	return -EINVAL;
-- 
1.7.2.3
