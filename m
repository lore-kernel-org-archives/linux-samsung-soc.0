From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 7/9] clk: samsung: Rework clkdev alias handling in S3C2443
 driver
Date: Tue, 03 Oct 2017 12:00:14 +0200
Message-ID: <20171003100016.32029-8-m.szyprowski@samsung.com>
References: <20171003100016.32029-1-m.szyprowski@samsung.com>
        <CGME20171003100031eucas1p29f34d4e1878d839a7af9ea05ba15ece9@eucas1p2.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

S3C2443 SoCs still uses old, non-dt CPUfreq driver, which requires clkdev
aliases to get access to proper clocks. Create those aliases using
samsung_clk_register_alias() function instead of using *_A clock macros,
which will be removed soon.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-s3c2443.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
index abb935c42916..45166033f638 100644
--- a/drivers/clk/samsung/clk-s3c2443.c
+++ b/drivers/clk/samsung/clk-s3c2443.c
@@ -117,8 +117,8 @@ struct samsung_mux_clock s3c2443_common_muxes[] __initdata = {
 	MUX(0, "epllref", epllref_p, CLKSRC, 7, 2),
 	MUX(ESYSCLK, "esysclk", esysclk_p, CLKSRC, 6, 1),
 	MUX(0, "mpllref", mpllref_p, CLKSRC, 3, 1),
-	MUX_A(MSYSCLK, "msysclk", msysclk_p, CLKSRC, 4, 1, "msysclk"),
-	MUX_A(ARMCLK, "armclk", armclk_p, CLKDIV0, 13, 1, "armclk"),
+	MUX(MSYSCLK, "msysclk", msysclk_p, CLKSRC, 4, 1),
+	MUX(ARMCLK, "armclk", armclk_p, CLKDIV0, 13, 1),
 	MUX(0, "mux_i2s0", i2s0_p, CLKSRC, 14, 2),
 };
 
@@ -189,6 +189,8 @@ struct samsung_gate_clock s3c2443_common_gates[] __initdata = {
 };
 
 struct samsung_clock_alias s3c2443_common_aliases[] __initdata = {
+	ALIAS(MSYSCLK, NULL, "msysclk"),
+	ALIAS(ARMCLK, NULL, "armclk"),
 	ALIAS(HCLK, NULL, "hclk"),
 	ALIAS(HCLK_SSMC, NULL, "nand"),
 	ALIAS(PCLK_UART0, "s3c2440-uart.0", "uart"),
-- 
2.14.2

