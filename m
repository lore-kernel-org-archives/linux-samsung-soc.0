From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2][Resend] ARM: EXYNOS: Update HSOTG PHY clock setting for Exynos4x12
Date: Wed, 20 Jun 2012 10:05:16 +0530
Message-ID: <1340166917-25657-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:64774 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751419Ab2FTEq6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 00:46:58 -0400
Received: by pbbrp8 with SMTP id rp8so78198pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Jun 2012 21:46:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds clock setting entries for Exynos4212 and Exynos4412 platforms.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Based on v3.5-for-usb-2 branch of Kukjin's tree
---
 arch/arm/mach-exynos/include/mach/regs-usb-phy.h |   20 ++++++--
 arch/arm/mach-exynos/setup-usb-phy.c             |   55 ++++++++++++++++-----
 arch/arm/plat-samsung/include/plat/cpu.h         |    4 ++
 3 files changed, 61 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-phy.h b/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
index c337cf3..0727773 100644
--- a/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
+++ b/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
@@ -35,11 +35,21 @@
 #define PHY1_COMMON_ON_N		(1 << 7)
 #define PHY0_COMMON_ON_N		(1 << 4)
 #define PHY0_ID_PULLUP			(1 << 2)
-#define CLKSEL_MASK			(0x3 << 0)
-#define CLKSEL_SHIFT			(0)
-#define CLKSEL_48M			(0x0 << 0)
-#define CLKSEL_12M			(0x2 << 0)
-#define CLKSEL_24M			(0x3 << 0)
+
+#define EXYNOS4_CLKSEL_SHIFT		(0)
+
+#define EXYNOS4210_CLKSEL_MASK		(0x3 << 0)
+#define EXYNOS4210_CLKSEL_48M		(0x0 << 0)
+#define EXYNOS4210_CLKSEL_12M		(0x2 << 0)
+#define EXYNOS4210_CLKSEL_24M		(0x3 << 0)
+
+#define EXYNOS4X12_CLKSEL_MASK		(0x7 << 0)
+#define EXYNOS4X12_CLKSEL_9600K		(0x0 << 0)
+#define EXYNOS4X12_CLKSEL_10M		(0x1 << 0)
+#define EXYNOS4X12_CLKSEL_12M		(0x2 << 0)
+#define EXYNOS4X12_CLKSEL_19200K	(0x3 << 0)
+#define EXYNOS4X12_CLKSEL_20M		(0x4 << 0)
+#define EXYNOS4X12_CLKSEL_24M		(0x5 << 0)
 
 #define EXYNOS4_RSTCON			EXYNOS4_HSOTG_PHYREG(0x08)
 #define HOST_LINK_PORT_SWRST_MASK	(0xf << 6)
diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
index 1af0a7f..d26deb7 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -31,22 +31,51 @@ static void exynos4210_usb_phy_clkset(struct platform_device *pdev)
 	struct clk *xusbxti_clk;
 	u32 phyclk;
 
-	/* set clock frequency for PLL */
-	phyclk = readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
 
 	xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
 	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
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
+		if (soc_is_exynos4210()) {
+			/* set clock frequency for PLL */
+			phyclk = readl(EXYNOS4_PHYCLK) & ~EXYNOS4210_CLKSEL_MASK;
+
+			switch (clk_get_rate(xusbxti_clk)) {
+			case 12 * MHZ:
+				phyclk |= EXYNOS4210_CLKSEL_12M;
+				break;
+			default:
+			case 24 * MHZ:
+				phyclk |= EXYNOS4210_CLKSEL_24M;
+				break;
+			case 48 * MHZ:
+				phyclk |= EXYNOS4210_CLKSEL_48M;
+				break;
+			}
+		} else if (soc_is_exynos4212() || soc_is_exynos4412()) {
+			/* set clock frequency for PLL */
+			phyclk = readl(EXYNOS4_PHYCLK) & ~EXYNOS4X12_CLKSEL_MASK;
+
+			switch (clk_get_rate(xusbxti_clk)) {
+			case 9600 * KHZ:
+				phyclk |= EXYNOS4X12_CLKSEL_9600K;
+				break;
+			case 10 * MHZ:
+				phyclk |= EXYNOS4X12_CLKSEL_10M;
+				break;
+			case 12 * MHZ:
+				phyclk |= EXYNOS4X12_CLKSEL_12M;
+				break;
+			case 19200 * KHZ:
+				phyclk |= EXYNOS4X12_CLKSEL_19200K;
+				break;
+			case 20 * MHZ:
+				phyclk |= EXYNOS4X12_CLKSEL_20M;
+				break;
+			default:
+			case 24 * MHZ:
+				/* default reference clock */
+				phyclk |= EXYNOS4X12_CLKSEL_24M;
+				break;
+			}
 		}
 		clk_put(xusbxti_clk);
 	}
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 787ceac..6a6ff7e 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -132,6 +132,10 @@ IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID, EXYNOS5_SOC_MASK)
 
 #define IODESC_ENT(x) { (unsigned long)S3C24XX_VA_##x, __phys_to_pfn(S3C24XX_PA_##x), S3C24XX_SZ_##x, MT_DEVICE }
 
+#ifndef KHZ
+#define KHZ (1000)
+#endif
+
 #ifndef MHZ
 #define MHZ (1000*1000)
 #endif
-- 
1.7.4.1
