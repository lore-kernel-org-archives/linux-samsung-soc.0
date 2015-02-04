From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] clk: samsung: exynos5433: Move CLK_SCLK_HDMI_SPDIF_DISP clock
 to CMU_TOP domain
Date: Wed, 04 Feb 2015 10:12:59 +0900
Message-ID: <1423012379-508-1-git-send-email-cw00.choi@samsung.com>
References: <1422922437-7414-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1422922437-7414-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes the bug of CLK_SCLK_HDMI_SPDIF_DISP clock because this clock
should be included in CMU_TOP domain. So, this patch moves the CLK_SCLK_HDMI_
SPDIF_DISP clock from CMU_MIF to CMU_TOP domain.

Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reported-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Depend on:
This patches has the dependnecy on patch-set[1][2].

[1] [PATCH v5 00/13] clk: samsung: Add the support for exynos5433 clocks
- https://lkml.org/lkml/2015/2/2/368
[2] [PATCH v3 0/9] clk: samsung: Add clocks for remaining domains of Exynos5433
- https://lkml.org/lkml/2015/2/2/784

drivers/clk/samsung/clk-exynos5433.c   | 10 +++++-----
 include/dt-bindings/clock/exynos5433.h |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 83edbd2..bdd4113 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -661,6 +661,11 @@ static struct samsung_gate_clock top_gate_clks[] __initdata = {
 	GATE(CLK_SCLK_ISP_SPI0_CAM1, "sclk_isp_spi0_cam1", "div_sclk_isp_spi0_b",
 			ENABLE_SCLK_TOP_CAM1, 0, 0, 0),
 
+	/* ENABLE_SCLK_TOP_DISP */
+	GATE(CLK_SCLK_HDMI_SPDIF_DISP, "sclk_hdmi_spdif_disp",
+			"mout_sclk_hdmi_spdif", ENABLE_SCLK_TOP_DISP, 0,
+			CLK_IGNORE_UNUSED, 0),
+
 	/* ENABLE_SCLK_TOP_FSYS */
 	GATE(CLK_SCLK_PCIE_100_FSYS, "sclk_pcie_100_fsys", "div_sclk_pcie_100",
 			ENABLE_SCLK_TOP_FSYS, 7, 0, 0),
@@ -1521,11 +1526,6 @@ static struct samsung_gate_clock mif_gate_clks[] __initdata = {
 			ENABLE_SCLK_MIF, 1, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_SCLK_BUS_PLL_ATLAS, "sclk_bus_pll_atlas", "sclk_bus_pll",
 			ENABLE_SCLK_MIF, 0, CLK_IGNORE_UNUSED, 0),
-
-	/* ENABLE_SCLK_TOP_DISP */
-	GATE(CLK_SCLK_HDMI_SPDIF_DISP, "sclk_hdmi_spdif_disp",
-			"mout_sclk_hdmi_spdif", ENABLE_SCLK_TOP_DISP, 0,
-			CLK_IGNORE_UNUSED, 0),
 };
 
 static struct samsung_cmu_info mif_cmu_info __initdata = {
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 8df9841..13204f5 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -189,8 +189,9 @@
 #define CLK_SCLK_ISP_UART_CAM1		250
 #define CLK_SCLK_ISP_SPI1_CAM1		251
 #define CLK_SCLK_ISP_SPI0_CAM1		252
+#define CLK_SCLK_HDMI_SPDIF_DISP	253
 
-#define TOP_NR_CLK			253
+#define TOP_NR_CLK			254
 
 /* CMU_CPIF */
 #define CLK_FOUT_MPHY_PLL		1
@@ -397,9 +398,8 @@
 #define CLK_SCLK_BUS_PLL		198
 #define CLK_SCLK_BUS_PLL_APOLLO		199
 #define CLK_SCLK_BUS_PLL_ATLAS		200
-#define CLK_SCLK_HDMI_SPDIF_DISP	201
 
-#define MIF_NR_CLK			202
+#define MIF_NR_CLK			201
 
 /* CMU_PERIC */
 #define CLK_PCLK_SPI2			1
-- 
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
