From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 2/4] clk: exynos5420: Add 5800 specific clocks
Date: Mon, 21 Apr 2014 12:15:10 +0530
Message-ID: <1398062712-28602-3-git-send-email-arun.kk@samsung.com>
References: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:39742 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbaDUGpZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 02:45:25 -0400
In-Reply-To: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, alim.akhtar@samsung.com, tomasz.figa@gmail.com, olofj@google.com, arunkk.samsung@gmail.com

From: Alim Akhtar <alim.akhtar@samsung.com>

Exynos5800 clock structure is mostly similar to 5420 with only
a small delta changes. So the 5420 clock file is re-used for
5800 also. The common clocks for both are seggreagated and few
clocks which are different for both are separately initialized.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
 drivers/clk/samsung/clk-exynos5420.c               |  276 ++++++++++++++++----
 include/dt-bindings/clock/exynos5420.h             |    4 +
 3 files changed, 224 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
index ca88c97..d54f42c 100644
--- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
@@ -1,12 +1,13 @@
 * Samsung Exynos5420 Clock Controller
 
 The Exynos5420 clock controller generates and supplies clock to various
-controllers within the Exynos5420 SoC.
+controllers within the Exynos5420 SoC and for the Exynos5800 SoC.
 
 Required Properties:
 
 - compatible: should be one of the following.
   - "samsung,exynos5420-clock" - controller compatible with Exynos5420 SoC.
+  - "samsung,exynos5800-clock" - controller compatible with Exynos5800 SoC.
 
 - reg: physical base address of the controller and length of memory mapped
   region.
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index ddf01c2..4b21451 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -59,15 +59,19 @@
 #define SRC_TOP5		0x10214
 #define SRC_TOP6		0x10218
 #define SRC_TOP7		0x1021c
+#define SRC_TOP8		0x10220 /* 5800 specific */
+#define SRC_TOP9		0x10224 /* 5800 specific */
 #define SRC_DISP10		0x1022c
 #define SRC_MAU			0x10240
 #define SRC_FSYS		0x10244
 #define SRC_PERIC0		0x10250
 #define SRC_PERIC1		0x10254
 #define SRC_ISP			0x10270
+#define SRC_CAM			0x10274 /* 5800 specific */
 #define SRC_TOP10		0x10280
 #define SRC_TOP11		0x10284
 #define SRC_TOP12		0x10288
+#define SRC_TOP13		0x1028c
 #define SRC_MASK_TOP2		0x10308
 #define SRC_MASK_DISP10		0x1032c
 #define SRC_MASK_MAU		0x10334
@@ -77,6 +81,8 @@
 #define DIV_TOP0		0x10500
 #define DIV_TOP1		0x10504
 #define DIV_TOP2		0x10508
+#define DIV_TOP8		0x10520 /* 5800 specific */
+#define DIV_TOP9		0x10524 /* 5800 specific */
 #define DIV_DISP10		0x1052c
 #define DIV_MAU			0x10544
 #define DIV_FSYS0		0x10548
@@ -87,6 +93,7 @@
 #define DIV_PERIC2		0x10560
 #define DIV_PERIC3		0x10564
 #define DIV_PERIC4		0x10568
+#define DIV_CAM			0x10574 /* 5800 specific */
 #define SCLK_DIV_ISP0		0x10580
 #define SCLK_DIV_ISP1		0x10584
 #define DIV2_RATIO0		0x10590
@@ -108,6 +115,7 @@
 #define GATE_TOP_SCLK_ISP	0x10870
 #define GATE_IP_GSCL0		0x10910
 #define GATE_IP_GSCL1		0x10920
+#define GATE_IP_CAM		0x10924 /* 5800 specific */
 #define GATE_IP_MFC		0x1092c
 #define GATE_IP_DISP1		0x10928
 #define GATE_IP_G3D		0x10930
@@ -130,8 +138,14 @@
 #define SRC_KFC			0x28200
 #define DIV_KFC0		0x28500
 
+/* Exynos5x SoC type */
+enum exynos5x_soc {
+	EXYNOS5420,
+	EXYNOS5800,
+};
+
 /* list of PLLs */
-enum exynos5420_plls {
+enum exynos5x_plls {
 	apll, cpll, dpll, epll, rpll, ipll, spll, vpll, mpll,
 	bpll, kpll,
 	nr_plls			/* number of PLLs */
@@ -140,13 +154,13 @@ enum exynos5420_plls {
 static void __iomem *reg_base;
 
 #ifdef CONFIG_PM_SLEEP
-static struct samsung_clk_reg_dump *exynos5420_save;
+static struct samsung_clk_reg_dump *exynos5x_save;
 
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
  */
-static unsigned long exynos5420_clk_regs[] __initdata = {
+static unsigned long exynos5x_clk_regs[] __initdata = {
 	SRC_CPU,
 	DIV_CPU0,
 	DIV_CPU1,
@@ -235,16 +249,16 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
 
 static int exynos5420_clk_suspend(void)
 {
-	samsung_clk_save(reg_base, exynos5420_save,
-				ARRAY_SIZE(exynos5420_clk_regs));
+	samsung_clk_save(reg_base, exynos5x_save,
+				ARRAY_SIZE(exynos5x_clk_regs));
 
 	return 0;
 }
 
 static void exynos5420_clk_resume(void)
 {
-	samsung_clk_restore(reg_base, exynos5420_save,
-				ARRAY_SIZE(exynos5420_clk_regs));
+	samsung_clk_restore(reg_base, exynos5x_save,
+				ARRAY_SIZE(exynos5x_clk_regs));
 }
 
 static struct syscore_ops exynos5420_clk_syscore_ops = {
@@ -254,9 +268,9 @@ static struct syscore_ops exynos5420_clk_syscore_ops = {
 
 static void exynos5420_clk_sleep_init(void)
 {
-	exynos5420_save = samsung_clk_alloc_reg_dump(exynos5420_clk_regs,
-					ARRAY_SIZE(exynos5420_clk_regs));
-	if (!exynos5420_save) {
+	exynos5x_save = samsung_clk_alloc_reg_dump(exynos5x_clk_regs,
+					ARRAY_SIZE(exynos5x_clk_regs));
+	if (!exynos5x_save) {
 		pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
 			__func__);
 		return;
@@ -381,14 +395,47 @@ PNAME(mout_maudio0_p) = {"fin_pll", "maudio_clk", "mout_sclk_dpll",
 			 "mout_sclk_epll", "mout_sclk_rpll"};
 PNAME(mout_mau_epll_clk_p) = {"mout_sclk_epll", "mout_sclk_dpll",
 				"mout_sclk_mpll", "mout_sclk_spll"};
+/* List of parents specific to exynos5800 */
+PNAME(mout_epll2_5800_p)	= { "mout_sclk_epll", "ffactor_dout_epll2" };
+PNAME(mout_group1_5800_p)	= { "mout_sclk_cpll", "mout_sclk_dpll",
+				"mout_sclk_mpll", "ffactor_dout_spll2" };
+PNAME(mout_group2_5800_p)	= { "mout_sclk_cpll", "mout_sclk_dpll",
+					"mout_sclk_mpll", "ffactor_dout_spll2",
+					"mout_epll2", "mout_sclk_ipll" };
+PNAME(mout_group3_5800_p)	= { "mout_sclk_cpll", "mout_sclk_dpll",
+					"mout_sclk_mpll", "ffactor_dout_spll2",
+					"mout_epll2" };
+PNAME(mout_group4_5800_p)	= { "mout_sclk_cpll", "mout_sclk_dpll",
+					"mout_sclk_mpll", "mout_sclk_ipll" };
+PNAME(mout_group5_5800_p)	= { "mout_sclk_cpll", "mout_sclk_dpll",
+					"mout_sclk_mpll", "mout_sclk_spll" };
+PNAME(mout_group6_5800_p)	= { "mout_sclk_ipll", "mout_sclk_dpll",
+				"mout_sclk_mpll", "ffactor_dout_spll2" };
+PNAME(mout_group7_5800_p)	= { "mout_sclk_cpll", "mout_sclk_dpll",
+					"mout_sclk_mpll", "mout_sclk_spll",
+					"mout_epll2", "mout_sclk_ipll" };
+PNAME(mout_mau_epll_clk_5800_p)	= { "mout_sclk_epll", "mout_sclk_dpll",
+					"mout_sclk_mpll",
+					"ffactor_dout_spll2" };
+PNAME(mout_user_mau_epll_clk_5800_p)	= { "dout_osc_div",
+						"mout_mau_epll_clk" };
+PNAME(mout_group8_5800_p)	= { "dout_aclk432_scaler", "dout_sclk_sw" };
+PNAME(mout_group9_5800_p)	= { "dout_osc_div", "mout_sw_aclk432_scaler" };
+PNAME(mout_group10_5800_p)	= { "dout_aclk432_cam", "dout_sclk_sw" };
+PNAME(mout_group11_5800_p)	= { "dout_osc_div", "mout_sw_aclk432_cam" };
+PNAME(mout_group12_5800_p)	= { "dout_aclkfl1_550_cam", "dout_sclk_sw" };
+PNAME(mout_group13_5800_p)	= { "dout_osc_div", "mout_sw_aclkfl1_550_cam" };
+PNAME(mout_group14_5800_p)	= { "dout_aclk550_cam", "dout_sclk_sw" };
+PNAME(mout_group15_5800_p)	= { "dout_osc_div", "mout_sw_aclk550_cam" };
 
 /* fixed rate clocks generated outside the soc */
-static struct samsung_fixed_rate_clock exynos5420_fixed_rate_ext_clks[] __initdata = {
+static struct
+samsung_fixed_rate_clock exynos5x_fixed_rate_ext_clks[] __initdata = {
 	FRATE(CLK_FIN_PLL, "fin_pll", NULL, CLK_IS_ROOT, 0),
 };
 
 /* fixed rate clocks generated inside the soc */
-static struct samsung_fixed_rate_clock exynos5420_fixed_rate_clks[] __initdata = {
+static struct samsung_fixed_rate_clock exynos5x_fixed_rate_clks[] __initdata = {
 	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
 	FRATE(0, "sclk_pwi", NULL, CLK_IS_ROOT, 24000000),
 	FRATE(0, "sclk_usbh20", NULL, CLK_IS_ROOT, 48000000),
@@ -396,12 +443,120 @@ static struct samsung_fixed_rate_clock exynos5420_fixed_rate_clks[] __initdata =
 	FRATE(0, "sclk_usbh20_scan_clk", NULL, CLK_IS_ROOT, 480000000),
 };
 
-static struct samsung_fixed_factor_clock exynos5420_fixed_factor_clks[] __initdata = {
+static struct
+samsung_fixed_factor_clock exynos5x_fixed_factor_clks[] __initdata = {
 	FFACTOR(0, "ffactor_hsic_12m", "fin_pll", 1, 2, 0),
 	FFACTOR(0, "ffactor_sw_aclk66", "mout_sw_aclk66", 1, 2, 0),
 };
 
-static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
+static struct
+samsung_fixed_factor_clock exynos5800_fixed_factor_clks[] __initdata = {
+	FFACTOR(0, "ffactor_dout_epll2", "mout_sclk_epll", 1, 2, 0),
+	FFACTOR(0, "ffactor_dout_spll2", "mout_sclk_spll", 1, 2, 0),
+};
+
+struct samsung_mux_clock exynos5800_mux_clks[] __initdata = {
+	MUX(0, "sclk_bpll", mout_bpll_p, SRC_TOP7, 24, 1),
+	MUX(0, "mout_epll2", mout_epll2_5800_p, SRC_TOP7, 28, 1),
+	MUX(0, "mout_aclk100_noc", mout_group1_5800_p, SRC_TOP0, 20, 2),
+	MUX(0, "mout_aclk400_wcore", mout_group2_5800_p, SRC_TOP0, 16, 3),
+	MUX(0, "mout_aclk400_mscl", mout_group3_5800_p, SRC_TOP0, 4, 3),
+	MUX(0, "mout_aclk400_isp", mout_group3_5800_p, SRC_TOP0, 0, 3),
+	MUX(0, "mout_aclk333", mout_group1_5800_p, SRC_TOP1, 28, 2),
+	MUX(0, "mout_aclk266", mout_group5_5800_p, SRC_TOP1, 20, 2),
+	MUX(0, "mout_aclk266_isp", mout_group4_5800_p, SRC_TOP8, 12, 2),
+	MUX(0, "mout_aclk333_432_isp0", mout_group6_5800_p, SRC_TOP1, 12, 2),
+	MUX(0, "mout_aclk333_432_isp", mout_group6_5800_p, SRC_TOP1, 4, 2),
+	MUX(0, "mout_aclk333_432_gscl", mout_group6_5800_p, SRC_TOP1, 0, 2),
+	MUX(0, "mout_aclk300_gscl", mout_group5_5800_p, SRC_TOP2, 28, 2),
+	MUX(0, "mout_aclk432_scaler", mout_group6_5800_p, SRC_TOP8, 28, 2),
+	MUX(0, "mout_sw_aclk432_scaler", mout_group8_5800_p,
+							SRC_TOP13, 28, 1),
+	MUX(0, "mout_user_aclk432_scaler", mout_group9_5800_p,
+							SRC_TOP9, 28, 1),
+	MUX(0, "mout_aclk432_cam", mout_group6_5800_p, SRC_TOP8, 24, 2),
+	MUX(0, "mout_sw_aclk432_cam", mout_group10_5800_p,
+							SRC_TOP13, 24, 1),
+	MUX(0, "mout_user_aclk432_cam", mout_group11_5800_p,
+							SRC_TOP9, 24, 1),
+	MUX(0, "mout_aclkfl1_550_cam", mout_group3_5800_p, SRC_TOP8, 20, 3),
+	MUX(0, "mout_sw_aclkfl1_550_cam", mout_group12_5800_p,
+							SRC_TOP13, 20, 1),
+	MUX(0, "mout_user_aclkfl1_550_cam", mout_group13_5800_p,
+							SRC_TOP9, 20, 1),
+	MUX(0, "mout_aclk550_cam", mout_group3_5800_p, SRC_TOP8, 16, 3),
+	MUX(0, "mout_sw_aclk550_cam", mout_group14_5800_p, SRC_TOP13, 16, 1),
+	MUX(0, "mout_user_aclk550_cam", mout_group15_5800_p,
+							SRC_TOP9, 16, 1),
+	MUX(0, "mout_aclk300_disp1", mout_group5_5800_p, SRC_TOP2, 24, 2),
+	MUX(0, "mout_aclk300_jpeg", mout_group5_5800_p, SRC_TOP2, 20, 2),
+	MUX(0, "mout_aclk266_g2d", mout_group5_5800_p, SRC_TOP2, 12, 2),
+	MUX(0, "mout_aclk333_g2d", mout_group5_5800_p, SRC_TOP2, 8, 2),
+	MUX(0, "mout_aclk400_disp1", mout_group7_5800_p, SRC_TOP2, 4, 3),
+	MUX(CLK_MOUT_FIMD1, "mout_fimd1", mout_group2_p, SRC_DISP10, 4, 3),
+	MUX(0, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p, SRC_TOP7,
+			20, 2),
+	MUX(0, "mout_user_mux_mau_epll_clk", mout_user_mau_epll_clk_5800_p,
+			SRC_TOP9, 8, 1),
+};
+
+struct samsung_div_clock exynos5800_div_clks[] __initdata = {
+	DIV(0, "dout_sclk_sw", "sclk_spll", DIV_TOP9, 24, 6),
+	DIV(0, "dout_osc_div", "fin_pll", DIV_TOP9, 20, 3),
+	DIV(0, "dout_aclk400_wcore", "mout_aclk400_wcore", DIV_TOP0, 16, 3),
+	DIV(0, "dout_aclk432_scaler", "mout_aclk432_scaler",
+			DIV_TOP8, 28, 3),
+	DIV(0, "dout_aclk432_cam", "mout_aclk432_cam",
+			DIV_TOP8, 24, 3),
+	DIV(0, "dout_aclkfl1_550_cam", "mout_aclkfl1_550_cam",
+			DIV_TOP8, 20, 3),
+	DIV(0, "dout_aclk550_cam", "mout_aclk550_cam",
+			DIV_TOP8, 16, 3),
+};
+
+struct samsung_gate_clock exynos5800_gate_clks[] __initdata = {
+	GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
+			GATE_BUS_TOP, 27, 0, 0),
+	GATE(CLK_ACLK432_CAM, "aclk432_cam", "mout_user_aclk432_cam",
+			GATE_BUS_TOP, 26, 0, 0),
+	GATE(CLK_ACLK_FL1550_CAM, "aclkfl1_550_cam",
+			"mout_user_aclkfl1_550_cam", GATE_BUS_TOP, 25, 0, 0),
+	GATE(CLK_ACLK550_CAM, "aclk550_cam", "mout_user_aclk550_cam",
+			GATE_BUS_TOP, 24, 0, 0),
+};
+
+struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
+	MUX(0, "sclk_bpll", mout_bpll_p, TOP_SPARE2, 0, 1),
+	MUX(0, "mout_aclk100_noc", mout_group1_p, SRC_TOP0, 20, 2),
+	MUX(0, "mout_aclk400_wcore", mout_group1_p, SRC_TOP0, 16, 2),
+	MUX(0, "mout_aclk400_wcore_bpll", mout_aclk400_wcore_bpll_p,
+		TOP_SPARE2, 4, 1),
+	MUX_A(0, "mout_aclk400_mscl", mout_group1_p,
+			SRC_TOP0, 4, 2, "aclk400_mscl"),
+	MUX(0, "mout_aclk400_isp", mout_group1_p, SRC_TOP0, 0, 2),
+	MUX(0, "mout_aclk333", mout_group1_p, SRC_TOP1, 28, 2),
+	MUX(0, "mout_aclk266", mout_group1_p, SRC_TOP1, 20, 2),
+	MUX(0, "mout_aclk333_432_isp0", mout_group4_p, SRC_TOP1, 12, 2),
+	MUX(0, "mout_aclk333_432_isp", mout_group4_p,
+		SRC_TOP1, 4, 2),
+	MUX(0, "mout_aclk333_432_gscl", mout_group4_p, SRC_TOP1, 0, 2),
+	MUX(0, "mout_aclk300_gscl", mout_group1_p, SRC_TOP2, 28, 2),
+	MUX(0, "mout_aclk300_disp1", mout_group1_p, SRC_TOP2, 24, 2),
+	MUX(0, "mout_aclk300_jpeg", mout_group1_p, SRC_TOP2, 20, 2),
+	MUX(0, "mout_aclk266_g2d", mout_group1_p, SRC_TOP2, 12, 2),
+	MUX(0, "mout_aclk333_g2d", mout_group1_p, SRC_TOP2, 8, 2),
+	MUX(0, "mout_aclk400_disp1", mout_group1_p, SRC_TOP2, 4, 2),
+	MUX(CLK_MOUT_FIMD1, "mout_fimd1", mout_group3_p, SRC_DISP10, 4, 1),
+	MUX_F(0, "mout_mau_epll_clk", mout_mau_epll_clk_p, SRC_TOP7, 20, 2,
+		CLK_SET_RATE_PARENT, 0),
+};
+
+struct samsung_div_clock exynos5420_div_clks[] __initdata = {
+	DIV(0, "dout_aclk400_wcore", "mout_aclk400_wcore_bpll",
+		DIV_TOP0, 16, 3),
+};
+
+static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
 	MUX(0, "mout_mspll_kfc", mout_mspll_cpu_p, SRC_TOP7, 8, 2),
 	MUX(0, "mout_mspll_cpu", mout_mspll_cpu_p, SRC_TOP7, 12, 2),
 	MUX(0, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
@@ -409,26 +564,14 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 	MUX(0, "mout_kpll", mout_kpll_p, SRC_KFC, 0, 1),
 	MUX(0, "mout_kfc", mout_kfc_p, SRC_KFC, 16, 1),
 
-	MUX(0, "sclk_bpll", mout_bpll_p, TOP_SPARE2, 0, 1),
-
-	MUX_A(0, "mout_aclk400_mscl", mout_group1_p,
-			SRC_TOP0, 4, 2, "aclk400_mscl"),
 	MUX(0, "mout_aclk200", mout_group1_p, SRC_TOP0, 8, 2),
 	MUX(0, "mout_aclk200_fsys2", mout_group1_p, SRC_TOP0, 12, 2),
 	MUX(0, "mout_aclk200_fsys", mout_group1_p, SRC_TOP0, 28, 2),
 
-	MUX(0, "mout_aclk333_432_gscl", mout_group4_p, SRC_TOP1, 0, 2),
 	MUX(0, "mout_aclk66", mout_group1_p, SRC_TOP1, 8, 2),
-	MUX(0, "mout_aclk266", mout_group1_p, SRC_TOP1, 20, 2),
 	MUX(0, "mout_aclk166", mout_group1_p, SRC_TOP1, 24, 2),
-	MUX(0, "mout_aclk333", mout_group1_p, SRC_TOP1, 28, 2),
 
-	MUX(0, "mout_aclk333_g2d", mout_group1_p, SRC_TOP2, 8, 2),
-	MUX(0, "mout_aclk266_g2d", mout_group1_p, SRC_TOP2, 12, 2),
 	MUX(0, "mout_aclk_g3d", mout_group5_p, SRC_TOP2, 16, 1),
-	MUX(0, "mout_aclk300_jpeg", mout_group1_p, SRC_TOP2, 20, 2),
-	MUX(0, "mout_aclk300_disp1", mout_group1_p, SRC_TOP2, 24, 2),
-	MUX(0, "mout_aclk300_gscl", mout_group1_p, SRC_TOP2, 28, 2),
 
 	MUX(0, "mout_user_aclk400_mscl", mout_user_aclk400_mscl_p,
 			SRC_TOP3, 4, 1),
@@ -499,7 +642,6 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 			mout_sw_aclk300_gscl_p, SRC_TOP12, 28, 1),
 
 	/* DISP1 Block */
-	MUX(CLK_MOUT_FIMD1, "mout_fimd1", mout_group3_p, SRC_DISP10, 4, 1),
 	MUX(0, "mout_mipi1", mout_group2_p, SRC_DISP10, 16, 3),
 	MUX(0, "mout_dp1", mout_group2_p, SRC_DISP10, 20, 3),
 	MUX(0, "mout_pixel", mout_group2_p, SRC_DISP10, 24, 3),
@@ -538,44 +680,33 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 
 	MUX(0, "mout_user_aclk66_gpio", mout_user_aclk66_gpio_p,
 		SRC_TOP7, 4, 1),
-	MUX_F(0, "mout_mau_epll_clk", mout_mau_epll_clk_p, SRC_TOP7, 20, 2,
-		CLK_SET_RATE_PARENT, 0),
 	MUX(0, "mout_pclk200_fsys", mout_group1_p, SRC_TOP0, 24, 2),
 	MUX(0, "mout_sw_pclk200_fsys", mout_sw_pclk200_fsys_p,
 		SRC_TOP10, 24, 1),
 	MUX(0, "mout_user_pclk200_fsys", mout_user_pclk200_fsys_p,
 		SRC_TOP3, 24, 1),
-	MUX(0, "mout_aclk100_noc", mout_group1_p, SRC_TOP0, 20, 2),
 	MUX(0, "mout_sw_aclk100_noc", mout_sw_aclk100_noc_p,
 		SRC_TOP10, 20, 1),
 	MUX(0, "mout_user_aclk100_noc", mout_user_aclk100_noc_p,
 		SRC_TOP3, 20, 1),
-	MUX(0, "mout_aclk400_wcore", mout_group1_p, SRC_TOP0, 16, 2),
-	MUX(0, "mout_aclk400_wcore_bpll", mout_aclk400_wcore_bpll_p,
-		TOP_SPARE2, 4, 1),
 	MUX(0, "mout_sw_aclk400_wcore", mout_sw_aclk400_wcore_p,
 		SRC_TOP10, 16, 1),
 	MUX(0, "mout_user_aclk400_wcore", mout_user_aclk400_wcore_p,
 		SRC_TOP3, 16, 1),
-	MUX(0, "mout_aclk400_isp", mout_group1_p, SRC_TOP0, 0, 2),
 	MUX(0, "mout_sw_aclk400_isp", mout_sw_aclk400_isp_p,
 		SRC_TOP10, 0, 1),
 	MUX(0, "mout_user_aclk400_isp", mout_user_aclk400_isp_p,
 		SRC_TOP3, 0, 1),
-	MUX(0, "mout_aclk333_432_isp0", mout_group4_p, SRC_TOP1, 12, 2),
 	MUX(0, "mout_sw_aclk333_432_isp0", mout_sw_aclk333_432_isp0_p,
 		SRC_TOP11, 12, 1),
 	MUX(0, "mout_user_aclk333_432_isp0", mout_user_aclk333_432_isp0_p,
 		SRC_TOP4, 12, 1),
-	MUX(0, "mout_aclk333_432_isp", mout_group4_p,
-		SRC_TOP1, 4, 2),
 	MUX(0, "mout_sw_aclk333_432_isp", mout_sw_aclk333_432_isp_p,
 		SRC_TOP11, 4, 1),
 	MUX(0, "mout_user_aclk333_432_isp", mout_user_aclk333_432_isp_p,
 		SRC_TOP4, 4, 1),
 	MUX(0, "mout_user_aclk266_isp", mout_user_aclk266_isp_p,
 		SRC_TOP4, 16, 1),
-	MUX(0, "mout_aclk400_disp1", mout_group1_p, SRC_TOP2, 4, 2),
 	MUX(0, "mout_sw_aclk400_disp1", mout_sw_aclk400_disp1_p,
 		SRC_TOP12, 4, 1),
 	MUX(0, "mout_user_aclk400_disp1", mout_user_aclk400_disp1_p,
@@ -589,7 +720,7 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 	MUX(0, "mout_isp_sensor", mout_group2_p, SRC_ISP, 28, 3),
 };
 
-static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
+static struct samsung_div_clock exynos5x_div_clks[] __initdata = {
 	DIV(0, "dout_armclk1", "mout_cpu", DIV_CPU0, 0, 3),
 	DIV(0, "sclk_apll", "mout_apll", DIV_CPU0, 24, 3),
 	DIV(0, "dout_armclk2", "dout_armclk1", DIV_CPU0, 28, 3),
@@ -672,8 +803,6 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
 	DIV(0, "dout_aclk400_disp1", "mout_aclk400_disp1",
 		DIV_TOP2, 4, 3),
 	DIV(0, "dout_aclk100_noc", "mout_aclk100_noc", DIV_TOP0, 20, 3),
-	DIV(0, "dout_aclk400_wcore", "mout_aclk400_wcore_bpll",
-		DIV_TOP0, 16, 3),
 	DIV(0, "dout_aclk400_isp", "mout_aclk400_isp", DIV_TOP0, 0, 3),
 	DIV(0, "dout_aclk333_432_isp0", "mout_aclk333_432_isp0",
 		DIV_TOP1, 16, 3),
@@ -703,7 +832,7 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
 	DIV(0, "dout_isp_sensor2", "mout_isp_sensor", SCLK_DIV_ISP0, 24, 8),
 };
 
-static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
+static struct samsung_gate_clock exynos5x_gate_clks[] __initdata = {
 	GATE(CLK_PCLK_MCT, "pclk_mct", "aclk66_psgen",
 		GATE_BUS_PERIS1, 2, 0, 0),
 
@@ -1100,7 +1229,7 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 	GATE(CLK_ACLK_SSS, "aclk_sss", "aclk266_g2d", GATE_IP_G2D, 2, 0, 0),
 };
 
-static struct samsung_pll_clock exynos5420_plls[nr_plls] __initdata = {
+static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
 	[apll] = PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, NULL),
 	[cpll] = PLL(pll_2550, CLK_FOUT_CPLL, "fout_cpll", "fin_pll", CPLL_LOCK,
@@ -1131,7 +1260,8 @@ static struct of_device_id ext_clk_match[] __initdata = {
 };
 
 /* register exynos5420 clocks */
-static void __init exynos5420_clk_init(struct device_node *np)
+static void __init exynos5x_clk_init(struct device_node *np,
+		enum exynos5x_soc exynos5x_soc)
 {
 	if (np) {
 		reg_base = of_iomap(np, 0);
@@ -1142,22 +1272,52 @@ static void __init exynos5420_clk_init(struct device_node *np)
 	}
 
 	samsung_clk_init(np, reg_base, CLK_NR_CLKS);
-	samsung_clk_of_register_fixed_ext(exynos5420_fixed_rate_ext_clks,
-			ARRAY_SIZE(exynos5420_fixed_rate_ext_clks),
+
+	samsung_clk_of_register_fixed_ext(exynos5x_fixed_rate_ext_clks,
+			ARRAY_SIZE(exynos5x_fixed_rate_ext_clks),
 			ext_clk_match);
-	samsung_clk_register_pll(exynos5420_plls, ARRAY_SIZE(exynos5420_plls),
-					reg_base);
-	samsung_clk_register_fixed_rate(exynos5420_fixed_rate_clks,
-			ARRAY_SIZE(exynos5420_fixed_rate_clks));
-	samsung_clk_register_fixed_factor(exynos5420_fixed_factor_clks,
-			ARRAY_SIZE(exynos5420_fixed_factor_clks));
-	samsung_clk_register_mux(exynos5420_mux_clks,
-			ARRAY_SIZE(exynos5420_mux_clks));
-	samsung_clk_register_div(exynos5420_div_clks,
-			ARRAY_SIZE(exynos5420_div_clks));
-	samsung_clk_register_gate(exynos5420_gate_clks,
-			ARRAY_SIZE(exynos5420_gate_clks));
+	samsung_clk_register_pll(exynos5x_plls,
+			ARRAY_SIZE(exynos5x_plls),
+			reg_base);
+	samsung_clk_register_fixed_rate(exynos5x_fixed_rate_clks,
+			ARRAY_SIZE(exynos5x_fixed_rate_clks));
+	samsung_clk_register_fixed_factor(exynos5x_fixed_factor_clks,
+			ARRAY_SIZE(exynos5x_fixed_factor_clks));
+	samsung_clk_register_mux(exynos5x_mux_clks,
+			ARRAY_SIZE(exynos5x_mux_clks));
+	samsung_clk_register_div(exynos5x_div_clks,
+			ARRAY_SIZE(exynos5x_div_clks));
+	samsung_clk_register_gate(exynos5x_gate_clks,
+			ARRAY_SIZE(exynos5x_gate_clks));
+
+	if (exynos5x_soc == EXYNOS5420) {
+		samsung_clk_register_mux(exynos5420_mux_clks,
+				ARRAY_SIZE(exynos5420_mux_clks));
+		samsung_clk_register_div(exynos5420_div_clks,
+				ARRAY_SIZE(exynos5420_div_clks));
+	} else {
+		samsung_clk_register_fixed_factor(
+				exynos5800_fixed_factor_clks,
+				ARRAY_SIZE(exynos5800_fixed_factor_clks));
+		samsung_clk_register_mux(exynos5800_mux_clks,
+				ARRAY_SIZE(exynos5800_mux_clks));
+		samsung_clk_register_div(exynos5800_div_clks,
+				ARRAY_SIZE(exynos5800_div_clks));
+		samsung_clk_register_gate(exynos5800_gate_clks,
+				ARRAY_SIZE(exynos5800_gate_clks));
+	}
 
 	exynos5420_clk_sleep_init();
 }
+
+static void __init exynos5420_clk_init(struct device_node *np)
+{
+	exynos5x_clk_init(np, EXYNOS5420);
+}
 CLK_OF_DECLARE(exynos5420_clk, "samsung,exynos5420-clock", exynos5420_clk_init);
+
+static void __init exynos5800_clk_init(struct device_node *np)
+{
+	exynos5x_clk_init(np, EXYNOS5800);
+}
+CLK_OF_DECLARE(exynos5800_clk, "samsung,exynos5800-clock", exynos5800_clk_init);
diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
index dde01fc..a057801 100644
--- a/include/dt-bindings/clock/exynos5420.h
+++ b/include/dt-bindings/clock/exynos5420.h
@@ -221,6 +221,10 @@
 #define CLK_PCLK_MSCL1		534
 #define CLK_PCLK_MSCL2		535
 #define CLK_PCLK_MFC		536
+#define CLK_ACLK432_SCALER	537
+#define CLK_ACLK432_CAM		538
+#define CLK_ACLK_FL1550_CAM	539
+#define CLK_ACLK550_CAM		540
 
 /* mux clocks */
 #define CLK_MOUT_HDMI		640
-- 
1.7.9.5
