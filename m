From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 06/10] clk: samsung: exynos5433: Add CLK_SET_RATE_PARENT to
 support DVFS for big.LITTLE core
Date: Mon, 27 Apr 2015 20:36:33 +0900
Message-ID: <1430134597-14668-7-git-send-email-cw00.choi@samsung.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds CLK_SET_RATE_PARENT flag to support DVFS of Cortex-{A53|A57}
core (big.LITTLE core) because 'sclk_{apollo|atlas}' leaf clock is used to
change the CPU frequency of Cortex-{A53|A57} core in arm_big_little.c driver.
- 'apollo' word means the LITTLE core (Cortex-A53 core) in Exynos5433 TRM.
- 'atlas' word means the big core (Cortex-A57 core) in Exynos5433 TRM.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 9e04ae2..e4a6771 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3582,7 +3582,7 @@ static struct samsung_pll_clock apollo_pll_clks[] __initdata = {
 static struct samsung_mux_clock apollo_mux_clks[] __initdata = {
 	/* MUX_SEL_APOLLO0 */
 	MUX_F(CLK_MOUT_APOLLO_PLL, "mout_apollo_pll", mout_apollo_pll_p,
-			MUX_SEL_APOLLO0, 0, 1, 0, CLK_MUX_READ_ONLY),
+			MUX_SEL_APOLLO0, 0, 1, CLK_SET_RATE_PARENT, 0),
 
 	/* MUX_SEL_APOLLO1 */
 	MUX(CLK_MOUT_BUS_PLL_APOLLO_USER, "mout_bus_pll_apollo_user",
@@ -3590,7 +3590,7 @@ static struct samsung_mux_clock apollo_mux_clks[] __initdata = {
 
 	/* MUX_SEL_APOLLO2 */
 	MUX_F(CLK_MOUT_APOLLO, "mout_apollo", mout_apollo_p, MUX_SEL_APOLLO2,
-			0, 1, 0, CLK_MUX_READ_ONLY),
+			0, 1, CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_div_clock apollo_div_clks[] __initdata = {
@@ -3611,11 +3611,9 @@ static struct samsung_div_clock apollo_div_clks[] __initdata = {
 			DIV_APOLLO0, 8, 3, CLK_GET_RATE_NOCACHE,
 			CLK_DIVIDER_READ_ONLY),
 	DIV_F(CLK_DIV_APOLLO2, "div_apollo2", "div_apollo1",
-			DIV_APOLLO0, 4, 3, CLK_GET_RATE_NOCACHE,
-			CLK_DIVIDER_READ_ONLY),
+			DIV_APOLLO0, 4, 3, CLK_SET_RATE_PARENT, 0),
 	DIV_F(CLK_DIV_APOLLO1, "div_apollo1", "mout_apollo",
-			DIV_APOLLO0, 0, 3, CLK_GET_RATE_NOCACHE,
-			CLK_DIVIDER_READ_ONLY),
+			DIV_APOLLO0, 0, 3, CLK_SET_RATE_PARENT, 0),
 
 	/* DIV_APOLLO1 */
 	DIV_F(CLK_DIV_SCLK_HPM_APOLLO, "div_sclk_hpm_apollo", "mout_apollo",
@@ -3666,7 +3664,8 @@ static struct samsung_gate_clock apollo_gate_clks[] __initdata = {
 	GATE(CLK_SCLK_HPM_APOLLO, "sclk_hpm_apollo", "div_sclk_hpm_apollo",
 			ENABLE_SCLK_APOLLO, 1, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_SCLK_APOLLO, "sclk_apollo", "div_apollo2",
-			ENABLE_SCLK_APOLLO, 0, CLK_IGNORE_UNUSED, 0),
+			ENABLE_SCLK_APOLLO, 0,
+			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_cmu_info apollo_cmu_info __initdata = {
@@ -3775,7 +3774,7 @@ static struct samsung_pll_clock atlas_pll_clks[] __initdata = {
 static struct samsung_mux_clock atlas_mux_clks[] __initdata = {
 	/* MUX_SEL_ATLAS0 */
 	MUX_F(CLK_MOUT_ATLAS_PLL, "mout_atlas_pll", mout_atlas_pll_p,
-			MUX_SEL_ATLAS0, 0, 1, 0, CLK_MUX_READ_ONLY),
+			MUX_SEL_ATLAS0, 0, 1, CLK_SET_RATE_PARENT, 0),
 
 	/* MUX_SEL_ATLAS1 */
 	MUX(CLK_MOUT_BUS_PLL_ATLAS_USER, "mout_bus_pll_atlas_user",
@@ -3783,7 +3782,7 @@ static struct samsung_mux_clock atlas_mux_clks[] __initdata = {
 
 	/* MUX_SEL_ATLAS2 */
 	MUX_F(CLK_MOUT_ATLAS, "mout_atlas", mout_atlas_p, MUX_SEL_ATLAS2,
-			0, 1, 0, CLK_MUX_READ_ONLY),
+			0, 1, CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_div_clock atlas_div_clks[] __initdata = {
@@ -3804,11 +3803,9 @@ static struct samsung_div_clock atlas_div_clks[] __initdata = {
 			DIV_ATLAS0, 8, 3, CLK_GET_RATE_NOCACHE,
 			CLK_DIVIDER_READ_ONLY),
 	DIV_F(CLK_DIV_ATLAS2, "div_atlas2", "div_atlas1",
-			DIV_ATLAS0, 4, 3, CLK_GET_RATE_NOCACHE,
-			CLK_DIVIDER_READ_ONLY),
+			DIV_ATLAS0, 4, 3, CLK_SET_RATE_PARENT, 0),
 	DIV_F(CLK_DIV_ATLAS1, "div_atlas1", "mout_atlas",
-			DIV_ATLAS0, 0, 3, CLK_GET_RATE_NOCACHE,
-			CLK_DIVIDER_READ_ONLY),
+			DIV_ATLAS0, 0, 3, CLK_SET_RATE_PARENT, 0),
 
 	/* DIV_ATLAS1 */
 	DIV_F(CLK_DIV_SCLK_HPM_ATLAS, "div_sclk_hpm_atlas", "mout_atlas",
@@ -3885,7 +3882,8 @@ static struct samsung_gate_clock atlas_gate_clks[] __initdata = {
 	GATE(CLK_ATCLK, "atclk", "div_atclk_atlas",
 			ENABLE_SCLK_ATLAS, 1, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_SCLK_ATLAS, "sclk_atlas", "div_atlas2",
-			ENABLE_SCLK_ATLAS, 0, CLK_IGNORE_UNUSED, 0),
+			ENABLE_SCLK_ATLAS, 0,
+			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_cmu_info atlas_cmu_info __initdata = {
-- 
1.8.5.5
