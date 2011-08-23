From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: EXYNOS4: Add USB PHY initialization for device
Date: Tue, 23 Aug 2011 16:58:57 +0530
Message-ID: <1314098937-4727-3-git-send-email-sachin.kamat@linaro.org>
References: <1314098937-4727-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:42320 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706Ab1HWLcA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 07:32:00 -0400
Received: by gxk21 with SMTP id 21so4535gxk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2011 04:31:59 -0700 (PDT)
In-Reply-To: <1314098937-4727-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org, Pankaj Dubey <pankaj.dubey@samsung.com>

From: Pankaj Dubey <pankaj.dubey@samsung.com>

This patch modifies USB PHY initialization code so that USB host
and device can be initialized with the same function.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/include/mach/regs-pmu.h |    2 +-
 arch/arm/mach-exynos4/setup-usb-phy.c         |  159 ++++++++++++++++--------
 2 files changed, 107 insertions(+), 54 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
index cdf9b47..c4709f2 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
@@ -34,7 +34,7 @@
 #define S5P_WAKEUP_STAT				S5P_PMUREG(0x0600)
 #define S5P_EINT_WAKEUP_MASK			S5P_PMUREG(0x0604)
 #define S5P_WAKEUP_MASK				S5P_PMUREG(0x0608)
-
+#define S5P_USBDEVICE_PHY_CONTROL		S5P_PMUREG(0x0704)
 #define S5P_USBHOST_PHY_CONTROL			S5P_PMUREG(0x0708)
 #define S5P_USBHOST_PHY_ENABLE			(1 << 0)
 
diff --git a/arch/arm/mach-exynos4/setup-usb-phy.c b/arch/arm/mach-exynos4/setup-usb-phy.c
index f4c944a..69878a1 100644
--- a/arch/arm/mach-exynos4/setup-usb-phy.c
+++ b/arch/arm/mach-exynos4/setup-usb-phy.c
@@ -21,51 +21,65 @@
 
 int s5p_usb_phy_init(struct platform_device *pdev, int type)
 {
+	struct clk *otg_clk, *usbhost_clk;
+	struct clk *xusbxti_clk;
+	u32 phyclk;
+	u32 rstcon;
+	int err;
+	if ((type != S5P_USB_PHY_HOST) && (type != S5P_USB_PHY_DEVICE))
+		return -EINVAL;
+
+	otg_clk = clk_get(&pdev->dev, "otg");
+	if (IS_ERR(otg_clk)) {
+		dev_err(&pdev->dev, "Failed to get otg clock\n");
+		return PTR_ERR(otg_clk);
+	}
+
+	err = clk_enable(otg_clk);
+	if (err) {
+		clk_put(otg_clk);
+		return err;
+	}
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
+	clk_put(xusbxti_clk);
+	}
+
+	writel(phyclk, EXYNOS4_PHYCLK);
+
 	if (type == S5P_USB_PHY_HOST) {
-		struct clk *otg_clk;
-		struct clk *xusbxti_clk;
-		u32 phyclk;
-		u32 rstcon;
-		int err;
-
-		otg_clk = clk_get(&pdev->dev, "otg");
-		if (IS_ERR(otg_clk)) {
-			dev_err(&pdev->dev, "Failed to get otg clock\n");
-			return PTR_ERR(otg_clk);
+		usbhost_clk = clk_get(&pdev->dev, "usbhost");
+
+		if (IS_ERR(usbhost_clk)) {
+			dev_err(&pdev->dev, "Failed to get usbhost clock\n");
+			return PTR_ERR(usbhost_clk);
 		}
 
-		err = clk_enable(otg_clk);
+		err = clk_enable(usbhost_clk);
 		if (err) {
-			clk_put(otg_clk);
+			clk_put(usbhost_clk);
 			return err;
 		}
 
 		writel(readl(S5P_USBHOST_PHY_CONTROL) | S5P_USBHOST_PHY_ENABLE,
 			S5P_USBHOST_PHY_CONTROL);
 
-		/* set clock frequency for PLL */
-		phyclk = readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
-
-		xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
-		if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
-			switch (clk_get_rate(xusbxti_clk)) {
-			case 12 * MHZ:
-				phyclk |= CLKSEL_12M;
-				break;
-			case 24 * MHZ:
-				phyclk |= CLKSEL_24M;
-				break;
-			default:
-			case 48 * MHZ:
-				/* default reference clock */
-				break;
-			}
-		clk_put(xusbxti_clk);
-		}
-
-		writel(phyclk, EXYNOS4_PHYCLK);
-
-		/* floating prevention logic: disable */
 		writel((readl(EXYNOS4_PHY1CON) | FPENABLEN), EXYNOS4_PHY1CON);
 
 		/* set to normal HSIC 0 and 1 of PHY1 */
@@ -84,30 +98,61 @@ int s5p_usb_phy_init(struct platform_device *pdev, int type)
 
 		rstcon &= ~(HOST_LINK_PORT_SWRST_MASK | PHY1_SWRST_MASK);
 		writel(rstcon, EXYNOS4_RSTCON);
-		udelay(80);
+	} else if (type == S5P_USB_PHY_DEVICE) {
+		writel(readl(S5P_USBDEVICE_PHY_CONTROL) | (0x1<<0),
+				S5P_USBDEVICE_PHY_CONTROL);
+		writel((readl(EXYNOS4_PHYPWR) & ~(0x7<<3)&~(0x1<<0)),
+				EXYNOS4_PHYPWR);
+		writel((readl(EXYNOS4_PHYCLK) & ~(0x5<<2))|(0x3<<0),
+				EXYNOS4_PHYCLK);
+		writel((readl(EXYNOS4_RSTCON) & ~(0x3<<1))|(0x1<<0),
+				EXYNOS4_RSTCON);
+		udelay(10);
+		writel(readl(EXYNOS4_RSTCON) & ~(0x7<<0),
+				EXYNOS4_RSTCON);
+	}
+	udelay(80);
 
-		clk_disable(otg_clk);
-		clk_put(otg_clk);
+	clk_disable(otg_clk);
+	clk_put(otg_clk);
+	if (type == S5P_USB_PHY_HOST)
+		clk_put(usbhost_clk);
 
-		return 0;
-	}
-	return -EINVAL;
+	return 0;
 }
 
 int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 {
+	struct clk *otg_clk, *usbhost_clk;
+	int err;
+
+	if ((type != S5P_USB_PHY_HOST) && (type != S5P_USB_PHY_DEVICE))
+		return -EINVAL;
+
+	otg_clk = clk_get(&pdev->dev, "otg");
+	if (IS_ERR(otg_clk)) {
+		dev_err(&pdev->dev, "Failed to get otg clock\n");
+		return PTR_ERR(otg_clk);
+	}
+
+	err = clk_enable(otg_clk);
+	if (err) {
+		clk_put(otg_clk);
+		return err;
+	}
+
 	if (type == S5P_USB_PHY_HOST) {
-		struct clk *otg_clk;
-		int err;
-		otg_clk = clk_get(&pdev->dev, "otg");
-		if (IS_ERR(otg_clk)) {
-			dev_err(&pdev->dev, "Failed to get otg clock\n");
-			return PTR_ERR(otg_clk);
+
+		usbhost_clk = clk_get(&pdev->dev, "usbhost");
+
+		if (IS_ERR(usbhost_clk)) {
+			dev_err(&pdev->dev, "Failed to get usbhost clock\n");
+			return PTR_ERR(usbhost_clk);
 		}
 
-		err = clk_enable(otg_clk);
+		err = clk_enable(usbhost_clk);
 		if (err) {
-			clk_put(otg_clk);
+			clk_put(usbhost_clk);
 			return err;
 		}
 
@@ -117,10 +162,18 @@ int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 		writel(readl(S5P_USBHOST_PHY_CONTROL) & ~S5P_USBHOST_PHY_ENABLE,
 			S5P_USBHOST_PHY_CONTROL);
 
-		clk_disable(otg_clk);
-		clk_put(otg_clk);
+	} else if (type == S5P_USB_PHY_DEVICE) {
+		writel(readl(EXYNOS4_PHYPWR) | (0x3<<3),
+				EXYNOS4_PHYPWR);
 
-		return 0;
+		writel(readl(S5P_USBDEVICE_PHY_CONTROL) & ~(1<<0),
+				S5P_USBDEVICE_PHY_CONTROL);
 	}
-	return -EINVAL;
+
+	clk_disable(otg_clk);
+	clk_put(otg_clk);
+	if (type == S5P_USB_PHY_HOST)
+		clk_put(usbhost_clk);
+
+	return 0;
 }
-- 
1.7.4.1
