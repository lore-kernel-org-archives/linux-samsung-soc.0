From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 8/9] clk: samsung: Add explicit MPLL and EPLL clkdev aliases
 in S3C2443 driver
Date: Tue, 03 Oct 2017 12:00:15 +0200
Message-ID: <20171003100016.32029-9-m.szyprowski@samsung.com>
References: <20171003100016.32029-1-m.szyprowski@samsung.com>
        <CGME20171003100031eucas1p142552d25c13db986a50951c988073223@eucas1p1.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

S3C2443 platform still use non-dt based lookup in some of its drivers to
get MPLL and EPLL clocks. Till now it worked only because PLL() macro
implicitely created aliases for all instatiated clocks. This feature will
be removed, so explicitely create aliases for MPLL and EPLL clocks.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-s3c2443.c   | 10 ++++++----
 include/dt-bindings/clock/s3c2443.h |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
index 45166033f638..d94b85a42356 100644
--- a/drivers/clk/samsung/clk-s3c2443.c
+++ b/drivers/clk/samsung/clk-s3c2443.c
@@ -191,6 +191,8 @@ struct samsung_gate_clock s3c2443_common_gates[] __initdata = {
 struct samsung_clock_alias s3c2443_common_aliases[] __initdata = {
 	ALIAS(MSYSCLK, NULL, "msysclk"),
 	ALIAS(ARMCLK, NULL, "armclk"),
+	ALIAS(MPLL, NULL, "mpll"),
+	ALIAS(EPLL, NULL, "epll"),
 	ALIAS(HCLK, NULL, "hclk"),
 	ALIAS(HCLK_SSMC, NULL, "nand"),
 	ALIAS(PCLK_UART0, "s3c2440-uart.0", "uart"),
@@ -223,9 +225,9 @@ struct samsung_clock_alias s3c2443_common_aliases[] __initdata = {
 /* S3C2416 specific clocks */
 
 static struct samsung_pll_clock s3c2416_pll_clks[] __initdata = {
-	[mpll] = PLL(pll_6552_s3c2416, 0, "mpll", "mpllref",
+	[mpll] = PLL(pll_6552_s3c2416, MPLL, "mpll", "mpllref",
 						LOCKCON0, MPLLCON, NULL),
-	[epll] = PLL(pll_6553, 0, "epll", "epllref",
+	[epll] = PLL(pll_6553, EPLL, "epll", "epllref",
 						LOCKCON1, EPLLCON, NULL),
 };
 
@@ -277,9 +279,9 @@ struct samsung_clock_alias s3c2416_aliases[] __initdata = {
 /* S3C2443 specific clocks */
 
 static struct samsung_pll_clock s3c2443_pll_clks[] __initdata = {
-	[mpll] = PLL(pll_3000, 0, "mpll", "mpllref",
+	[mpll] = PLL(pll_3000, MPLL, "mpll", "mpllref",
 						LOCKCON0, MPLLCON, NULL),
-	[epll] = PLL(pll_2126, 0, "epll", "epllref",
+	[epll] = PLL(pll_2126, EPLL, "epll", "epllref",
 						LOCKCON1, EPLLCON, NULL),
 };
 
diff --git a/include/dt-bindings/clock/s3c2443.h b/include/dt-bindings/clock/s3c2443.h
index 37e66b054d64..f3ba68a25ecb 100644
--- a/include/dt-bindings/clock/s3c2443.h
+++ b/include/dt-bindings/clock/s3c2443.h
@@ -26,6 +26,8 @@
 #define ARMCLK			4
 #define HCLK			5
 #define PCLK			6
+#define MPLL			7
+#define EPLL			8
 
 /* Special clocks */
 #define SCLK_HSSPI0		16
-- 
2.14.2

