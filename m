From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] clk: exynos4: Add PCLK_ADC gate clock on Exynos4x12
Date: Thu, 11 Jun 2015 17:26:29 +0900
Message-ID: <1434011190-24563-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15409 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825AbbFKI0u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 04:26:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Add proper gate clock for the Analog to Digital Converter (ADC) on
Exynos4x12.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c   | 3 +++
 include/dt-bindings/clock/exynos4.h | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 714d6ba782c8..5f32410a01f8 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -85,6 +85,7 @@
 #define DIV_PERIL4		0xc560
 #define DIV_PERIL5		0xc564
 #define E4X12_DIV_CAM1		0xc568
+#define E4X12_GATE_BUS_FSYS1	0xc744
 #define GATE_SCLK_CAM		0xc820
 #define GATE_IP_CAM		0xc920
 #define GATE_IP_TV		0xc924
@@ -1095,6 +1096,8 @@ static struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
 		0),
 	GATE(CLK_PPMUIMAGE, "ppmuimage", "aclk200", E4X12_GATE_IP_IMAGE, 9, 0,
 		0),
+	GATE(CLK_PCLK_ADC, "pclk_adc", "aclk133", E4X12_GATE_BUS_FSYS1, 16, 0,
+		0),
 	GATE(CLK_MIPI_HSI, "mipi_hsi", "aclk133", GATE_IP_FSYS, 10, 0, 0),
 	GATE(CLK_CHIPID, "chipid", "aclk100", E4X12_GATE_IP_PERIR, 0, 0, 0),
 	GATE(CLK_SYSREG, "sysreg", "aclk100", E4X12_GATE_IP_PERIR, 1,
diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
index c4b1676ea674..4548531736c1 100644
--- a/include/dt-bindings/clock/exynos4.h
+++ b/include/dt-bindings/clock/exynos4.h
@@ -268,7 +268,10 @@
 #define CLK_DIV_GDL		459
 #define CLK_DIV_GDR		460
 
+/* Exynos4x12 only */
+#define CLK_PCLK_ADC		461
+
 /* must be greater than maximal clock id */
-#define CLK_NR_CLKS		461
+#define CLK_NR_CLKS		462
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_4_H */
-- 
1.9.1
