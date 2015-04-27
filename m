From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 08/10] clk: samsung: exynos5433: Add clock flag to support
 the DVFS of GPU
Date: Mon, 27 Apr 2015 20:36:35 +0900
Message-ID: <1430134597-14668-9-git-send-email-cw00.choi@samsung.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch adds the CLK_SET_RATE_PARENT flag for 'aclk_g3d' clock and parent
clocks becuase 'aclk_g3d' is used to change GPU frequency for DVFS (Dynamic
Voltage Frequency Scaling) feature and adds CLK_IGNORE_UNUSED flags to
'aclk_asyncapbs_g3d'/'aclk_asyncapbm_g3d' clocks to access the SFR
(Special Funciton Regiser) of MALI device.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
[cw00.choi: Add patch description and add CLK_SET_RATE_PARENT to 'aclk_g3d' clk]
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 5d8b4a8..256fec0 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3287,10 +3287,10 @@ static struct samsung_pll_clock g3d_pll_clks[] __initdata = {
 
 static struct samsung_mux_clock g3d_mux_clks[] __initdata = {
 	/* MUX_SEL_G3D */
-	MUX(CLK_MOUT_ACLK_G3D_400, "mout_aclk_g3d_400", mout_aclk_g3d_400_p,
-			MUX_SEL_G3D, 8, 1),
-	MUX(CLK_MOUT_G3D_PLL, "mout_g3d_pll", mout_g3d_pll_p,
-			MUX_SEL_G3D, 0, 1),
+	MUX_F(CLK_MOUT_ACLK_G3D_400, "mout_aclk_g3d_400", mout_aclk_g3d_400_p,
+			MUX_SEL_G3D, 8, 1, CLK_SET_RATE_PARENT, 0),
+	MUX_F(CLK_MOUT_G3D_PLL, "mout_g3d_pll", mout_g3d_pll_p,
+			MUX_SEL_G3D, 0, 1, CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_div_clock g3d_div_clks[] __initdata = {
@@ -3299,8 +3299,8 @@ static struct samsung_div_clock g3d_div_clks[] __initdata = {
 			8, 2),
 	DIV(CLK_DIV_PCLK_G3D, "div_pclk_g3d", "div_aclk_g3d", DIV_G3D,
 			4, 3),
-	DIV(CLK_DIV_ACLK_G3D, "div_aclk_g3d", "mout_aclk_g3d_400", DIV_G3D,
-			0, 3),
+	DIV_F(CLK_DIV_ACLK_G3D, "div_aclk_g3d", "mout_aclk_g3d_400", DIV_G3D,
+			0, 3, CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_gate_clock g3d_gate_clks[] __initdata = {
@@ -3310,9 +3310,9 @@ static struct samsung_gate_clock g3d_gate_clks[] __initdata = {
 	GATE(CLK_ACLK_BTS_G3D0, "aclk_bts_g3d0", "div_aclk_g3d",
 			ENABLE_ACLK_G3D, 6, 0, 0),
 	GATE(CLK_ACLK_ASYNCAPBS_G3D, "aclk_asyncapbs_g3d", "div_pclk_g3d",
-			ENABLE_ACLK_G3D, 5, 0, 0),
+			ENABLE_ACLK_G3D, 5, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_ASYNCAPBM_G3D, "aclk_asyncapbm_g3d", "div_aclk_g3d",
-			ENABLE_ACLK_G3D, 4, 0, 0),
+			ENABLE_ACLK_G3D, 4, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_AHB2APB_G3DP, "aclk_ahb2apb_g3dp", "div_pclk_g3d",
 			ENABLE_ACLK_G3D, 3, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_G3DNP_150, "aclk_g3dnp_150", "div_pclk_g3d",
@@ -3320,7 +3320,7 @@ static struct samsung_gate_clock g3d_gate_clks[] __initdata = {
 	GATE(CLK_ACLK_G3DND_600, "aclk_g3dnd_600", "div_aclk_g3d",
 			ENABLE_ACLK_G3D, 1, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_G3D, "aclk_g3d", "div_aclk_g3d",
-			ENABLE_ACLK_G3D, 0, 0, 0),
+			ENABLE_ACLK_G3D, 0, CLK_SET_RATE_PARENT, 0),
 
 	/* ENABLE_PCLK_G3D */
 	GATE(CLK_PCLK_BTS_G3D1, "pclk_bts_g3d1", "div_pclk_g3d",
-- 
1.8.5.5
