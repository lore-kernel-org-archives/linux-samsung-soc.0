From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: EXYNOS4: Code cleanup and remove extra functions.
Date: Tue, 23 Aug 2011 16:58:56 +0530
Message-ID: <1314098937-4727-2-git-send-email-sachin.kamat@linaro.org>
References: <1314098937-4727-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:47771 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706Ab1HWLbx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 07:31:53 -0400
Received: by mail-pz0-f42.google.com with SMTP id 37so12788pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2011 04:31:53 -0700 (PDT)
In-Reply-To: <1314098937-4727-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org, Pankaj Dubey <pankaj.dubey@samsung.com>

From: Pankaj Dubey <pankaj.dubey@samsung.com>

This patch removes the intermediate exynos4_usb_phy1_init and
exynos4_usb_phy1_exit function calls.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/setup-usb-phy.c |  166 +++++++++++++++-----------------
 1 files changed, 78 insertions(+), 88 deletions(-)

diff --git a/arch/arm/mach-exynos4/setup-usb-phy.c b/arch/arm/mach-exynos4/setup-usb-phy.c
index 39aca04..f4c944a 100644
--- a/arch/arm/mach-exynos4/setup-usb-phy.c
+++ b/arch/arm/mach-exynos4/setup-usb-phy.c
@@ -19,118 +19,108 @@
 #include <plat/cpu.h>
 #include <plat/usb-phy.h>
 
-static int exynos4_usb_phy1_init(struct platform_device *pdev)
+int s5p_usb_phy_init(struct platform_device *pdev, int type)
 {
-	struct clk *otg_clk;
-	struct clk *xusbxti_clk;
-	u32 phyclk;
-	u32 rstcon;
-	int err;
-
-	otg_clk = clk_get(&pdev->dev, "otg");
-	if (IS_ERR(otg_clk)) {
-		dev_err(&pdev->dev, "Failed to get otg clock\n");
-		return PTR_ERR(otg_clk);
-	}
+	if (type == S5P_USB_PHY_HOST) {
+		struct clk *otg_clk;
+		struct clk *xusbxti_clk;
+		u32 phyclk;
+		u32 rstcon;
+		int err;
+
+		otg_clk = clk_get(&pdev->dev, "otg");
+		if (IS_ERR(otg_clk)) {
+			dev_err(&pdev->dev, "Failed to get otg clock\n");
+			return PTR_ERR(otg_clk);
+		}
 
-	err = clk_enable(otg_clk);
-	if (err) {
-		clk_put(otg_clk);
-		return err;
-	}
+		err = clk_enable(otg_clk);
+		if (err) {
+			clk_put(otg_clk);
+			return err;
+		}
 
-	writel(readl(S5P_USBHOST_PHY_CONTROL) | S5P_USBHOST_PHY_ENABLE,
+		writel(readl(S5P_USBHOST_PHY_CONTROL) | S5P_USBHOST_PHY_ENABLE,
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
+		/* set clock frequency for PLL */
+		phyclk = readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
+
+		xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
+		if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
+			switch (clk_get_rate(xusbxti_clk)) {
+			case 12 * MHZ:
+				phyclk |= CLKSEL_12M;
+				break;
+			case 24 * MHZ:
+				phyclk |= CLKSEL_24M;
+				break;
+			default:
+			case 48 * MHZ:
+				/* default reference clock */
+				break;
+			}
 		clk_put(xusbxti_clk);
-	}
+		}
 
-	writel(phyclk, EXYNOS4_PHYCLK);
+		writel(phyclk, EXYNOS4_PHYCLK);
 
-	/* floating prevention logic: disable */
-	writel((readl(EXYNOS4_PHY1CON) | FPENABLEN), EXYNOS4_PHY1CON);
+		/* floating prevention logic: disable */
+		writel((readl(EXYNOS4_PHY1CON) | FPENABLEN), EXYNOS4_PHY1CON);
 
-	/* set to normal HSIC 0 and 1 of PHY1 */
-	writel((readl(EXYNOS4_PHYPWR) & ~PHY1_HSIC_NORMAL_MASK),
+		/* set to normal HSIC 0 and 1 of PHY1 */
+		writel((readl(EXYNOS4_PHYPWR) & ~PHY1_HSIC_NORMAL_MASK),
 			EXYNOS4_PHYPWR);
 
-	/* set to normal standard USB of PHY1 */
-	writel((readl(EXYNOS4_PHYPWR) & ~PHY1_STD_NORMAL_MASK), EXYNOS4_PHYPWR);
+		/* set to normal standard USB of PHY1 */
+		writel((readl(EXYNOS4_PHYPWR) & ~PHY1_STD_NORMAL_MASK),
+			EXYNOS4_PHYPWR);
 
-	/* reset all ports of both PHY and Link */
-	rstcon = readl(EXYNOS4_RSTCON) | HOST_LINK_PORT_SWRST_MASK |
-		PHY1_SWRST_MASK;
-	writel(rstcon, EXYNOS4_RSTCON);
-	udelay(10);
+		/* reset all ports of both PHY and Link */
+		rstcon = readl(EXYNOS4_RSTCON) | HOST_LINK_PORT_SWRST_MASK |
+			PHY1_SWRST_MASK;
+		writel(rstcon, EXYNOS4_RSTCON);
+		udelay(10);
 
-	rstcon &= ~(HOST_LINK_PORT_SWRST_MASK | PHY1_SWRST_MASK);
-	writel(rstcon, EXYNOS4_RSTCON);
-	udelay(80);
+		rstcon &= ~(HOST_LINK_PORT_SWRST_MASK | PHY1_SWRST_MASK);
+		writel(rstcon, EXYNOS4_RSTCON);
+		udelay(80);
 
-	clk_disable(otg_clk);
-	clk_put(otg_clk);
+		clk_disable(otg_clk);
+		clk_put(otg_clk);
 
-	return 0;
+		return 0;
+	}
+	return -EINVAL;
 }
 
-static int exynos4_usb_phy1_exit(struct platform_device *pdev)
+int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 {
-	struct clk *otg_clk;
-	int err;
-
-	otg_clk = clk_get(&pdev->dev, "otg");
-	if (IS_ERR(otg_clk)) {
-		dev_err(&pdev->dev, "Failed to get otg clock\n");
-		return PTR_ERR(otg_clk);
-	}
+	if (type == S5P_USB_PHY_HOST) {
+		struct clk *otg_clk;
+		int err;
+		otg_clk = clk_get(&pdev->dev, "otg");
+		if (IS_ERR(otg_clk)) {
+			dev_err(&pdev->dev, "Failed to get otg clock\n");
+			return PTR_ERR(otg_clk);
+		}
 
-	err = clk_enable(otg_clk);
-	if (err) {
-		clk_put(otg_clk);
-		return err;
-	}
+		err = clk_enable(otg_clk);
+		if (err) {
+			clk_put(otg_clk);
+			return err;
+		}
 
-	writel((readl(EXYNOS4_PHYPWR) | PHY1_STD_ANALOG_POWERDOWN),
+		writel((readl(EXYNOS4_PHYPWR) | PHY1_STD_ANALOG_POWERDOWN),
 			EXYNOS4_PHYPWR);
 
-	writel(readl(S5P_USBHOST_PHY_CONTROL) & ~S5P_USBHOST_PHY_ENABLE,
+		writel(readl(S5P_USBHOST_PHY_CONTROL) & ~S5P_USBHOST_PHY_ENABLE,
 			S5P_USBHOST_PHY_CONTROL);
 
-	clk_disable(otg_clk);
-	clk_put(otg_clk);
-
-	return 0;
-}
-
-int s5p_usb_phy_init(struct platform_device *pdev, int type)
-{
-	if (type == S5P_USB_PHY_HOST)
-		return exynos4_usb_phy1_init(pdev);
-
-	return -EINVAL;
-}
-
-int s5p_usb_phy_exit(struct platform_device *pdev, int type)
-{
-	if (type == S5P_USB_PHY_HOST)
-		return exynos4_usb_phy1_exit(pdev);
+		clk_disable(otg_clk);
+		clk_put(otg_clk);
 
+		return 0;
+	}
 	return -EINVAL;
 }
-- 
1.7.4.1
