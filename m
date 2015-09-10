From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 08/12] clk: samsung: exynos7: Corrects CMU_PERIS clocks names
Date: Thu, 10 Sep 2015 14:14:33 +0530
Message-ID: <1441874677-24148-9-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch renames CMU_PERIS clocks names to match with user manual.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 7796712..ae6836e 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -791,7 +791,7 @@ CLK_OF_DECLARE(exynos7_clk_peric1, "samsung,exynos7-clock-peric1",
 #define ENABLE_SCLK_PERIS_SECURE_CHIPID	0x0A10
 
 /* List of parent clocks for Muxes in CMU_PERIS */
-PNAME(mout_aclk_peris_66_p) = { "fin_pll", "dout_aclk_peris_66" };
+PNAME(mout_aclk_peris_66_user_p) = { "fin_pll", "aclk_peris_66" };
 
 static unsigned long peris_clk_regs[] __initdata = {
 	MUX_SEL_PERIS,
@@ -803,7 +803,7 @@ static unsigned long peris_clk_regs[] __initdata = {
 
 static struct samsung_mux_clock peris_mux_clks[] __initdata = {
 	MUX(0, "mout_aclk_peris_66_user",
-		mout_aclk_peris_66_p, MUX_SEL_PERIS, 0, 1),
+		mout_aclk_peris_66_user_p, MUX_SEL_PERIS, 0, 1),
 };
 
 static struct samsung_gate_clock peris_gate_clks[] __initdata = {
-- 
1.7.10.4

