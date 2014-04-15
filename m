From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: exynos4: Use single clock ID for CLK_MDMA gate clocks
Date: Tue, 15 Apr 2014 18:30:20 +0200
Message-ID: <1397579420-18776-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57872 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019AbaDOQag (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 12:30:36 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N42004S5Z6YS810@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 01:30:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: t.figa@samsung.com
Cc: mturquette@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Exynos4210 and Exynos4x12 SoCs have the PL330 MDMA IP block clock
defined exactly in same way in documentation. Using different
names for these clocks is a bit misleading. Since there is no users
of CLK_MDMA2 in existing dts files this patch drops CLK_MDMA2 and
replaces it with CLK_MDMA in the driver. This ensures PL330 MDMA
has correct clock assigned on Exynos4x12 SoCs.

Suggested-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c   |    2 +-
 include/dt-bindings/clock/exynos4.h |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index b4f9672..5247caa 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -903,7 +903,7 @@ static struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
 	GATE(CLK_AUDSS, "audss", "sclk_epll", E4X12_GATE_IP_MAUDIO, 0, 0, 0),
 	GATE(CLK_MDNIE0, "mdnie0", "aclk160", GATE_IP_LCD0, 2, 0, 0),
 	GATE(CLK_ROTATOR, "rotator", "aclk200", E4X12_GATE_IP_IMAGE, 1, 0, 0),
-	GATE(CLK_MDMA2, "mdma2", "aclk200", E4X12_GATE_IP_IMAGE, 2, 0, 0),
+	GATE(CLK_MDMA, "mdma", "aclk200", E4X12_GATE_IP_IMAGE, 2, 0, 0),
 	GATE(CLK_SMMU_MDMA, "smmu_mdma", "aclk200", E4X12_GATE_IP_IMAGE, 5, 0,
 		0),
 	GATE(CLK_MIPI_HSI, "mipi_hsi", "aclk133", GATE_IP_FSYS, 10, 0, 0),
diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
index 75aff33..3ff13bc 100644
--- a/include/dt-bindings/clock/exynos4.h
+++ b/include/dt-bindings/clock/exynos4.h
@@ -181,7 +181,6 @@
 #define CLK_KEYIF		347
 #define CLK_AUDSS		348
 #define CLK_MIPI_HSI		349 /* Exynos4210 only */
-#define CLK_MDMA2		350 /* Exynos4210 only */
 #define CLK_PIXELASYNCM0	351
 #define CLK_PIXELASYNCM1	352
 #define CLK_FIMC_LITE0		353 /* Exynos4x12 only */
-- 
1.7.9.5
