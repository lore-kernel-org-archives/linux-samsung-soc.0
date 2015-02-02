From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v4 13/13] clk: samsung: exynos5433: Add clocks for CMU_GSCL
 domain
Date: Mon, 02 Feb 2015 22:01:14 +0900
Message-ID: <1422882074-19758-14-git-send-email-cw00.choi@samsung.com>
References: <1422882074-19758-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40878 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933334AbbBBNBa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 08:01:30 -0500
In-reply-to: <1422882074-19758-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, pankaj.dubey@samsung.com, sangbae90.lee@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds the divider/gate of CMU_GSCL domain which contains gscaler
clocks.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 146 +++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/exynos5433.h |  37 ++++++++-
 2 files changed, 182 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 346f59f..8ae9c48 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -545,6 +545,12 @@ static struct samsung_gate_clock top_gate_clks[] __initdata = {
 	GATE(CLK_ACLK_FSYS_200, "aclk_fsys_200", "div_aclk_fsys_200",
 			ENABLE_ACLK_TOP, 18,
 			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_ACLK_GSCL_111, "aclk_gscl_111", "div_aclk_gscl_111",
+			ENABLE_ACLK_TOP, 15,
+			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_ACLK_GSCL_333, "aclk_gscl_333", "div_aclk_gscl_333",
+			ENABLE_ACLK_TOP, 14,
+			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_G2D_266, "aclk_g2d_266", "div_aclk_g2d_266",
 			ENABLE_ACLK_TOP, 2,
 			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
@@ -3247,3 +3253,143 @@ static void __init exynos5433_cmu_g3d_init(struct device_node *np)
 }
 CLK_OF_DECLARE(exynos5433_cmu_g3d, "samsung,exynos5433-cmu-g3d",
 		exynos5433_cmu_g3d_init);
+
+/*
+ * Register offset definitions for CMU_GSCL
+ */
+#define MUX_SEL_GSCL				0x0200
+#define MUX_ENABLE_GSCL				0x0300
+#define MUX_STAT_GSCL				0x0400
+#define ENABLE_ACLK_GSCL			0x0800
+#define ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL0	0x0804
+#define ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL1	0x0808
+#define ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL2	0x080c
+#define ENABLE_PCLK_GSCL			0x0900
+#define ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL0	0x0904
+#define ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL1	0x0908
+#define ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL2	0x090c
+#define ENABLE_IP_GSCL0				0x0b00
+#define ENABLE_IP_GSCL1				0x0b04
+#define ENABLE_IP_GSCL_SECURE_SMMU_GSCL0	0x0b08
+#define ENABLE_IP_GSCL_SECURE_SMMU_GSCL1	0x0b0c
+#define ENABLE_IP_GSCL_SECURE_SMMU_GSCL2	0x0b10
+
+static unsigned long gscl_clk_regs[] __initdata = {
+	MUX_SEL_GSCL,
+	MUX_ENABLE_GSCL,
+	MUX_STAT_GSCL,
+	ENABLE_ACLK_GSCL,
+	ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL0,
+	ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL1,
+	ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL2,
+	ENABLE_PCLK_GSCL,
+	ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL0,
+	ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL1,
+	ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL2,
+	ENABLE_IP_GSCL0,
+	ENABLE_IP_GSCL1,
+	ENABLE_IP_GSCL_SECURE_SMMU_GSCL0,
+	ENABLE_IP_GSCL_SECURE_SMMU_GSCL1,
+	ENABLE_IP_GSCL_SECURE_SMMU_GSCL2,
+};
+
+/* list of all parent clock list */
+PNAME(aclk_gscl_111_user_p)	= { "oscclk", "aclk_gscl_111", };
+PNAME(aclk_gscl_333_user_p)	= { "oscclk", "aclk_gscl_333", };
+
+static struct samsung_mux_clock gscl_mux_clks[] __initdata = {
+	/* MUX_SEL_GSCL */
+	MUX(CLK_MOUT_ACLK_GSCL_111_USER, "mout_aclk_gscl_111_user",
+			aclk_gscl_111_user_p, MUX_SEL_GSCL, 4, 1),
+	MUX(CLK_MOUT_ACLK_GSCL_333_USER, "mout_aclk_gscl_333_user",
+			aclk_gscl_333_user_p, MUX_SEL_GSCL, 0, 1),
+};
+
+static struct samsung_gate_clock gscl_gate_clks[] __initdata = {
+	/* ENABLE_ACLK_GSCL */
+	GATE(CLK_ACLK_BTS_GSCL2, "aclk_bts_gscl2", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL, 11, 0, 0),
+	GATE(CLK_ACLK_BTS_GSCL1, "aclk_bts_gscl1", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL, 10, 0, 0),
+	GATE(CLK_ACLK_BTS_GSCL0, "aclk_bts_gscl0", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL, 9, 0, 0),
+	GATE(CLK_ACLK_AHB2APB_GSCLP, "aclk_ahb2apb_gsclp",
+			"mout_aclk_gscl_111_user", ENABLE_ACLK_GSCL,
+			8, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_ACLK_XIU_GSCLX, "aclk_xiu_gsclx", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL, 7, 0, 0),
+	GATE(CLK_ACLK_GSCLNP_111, "aclk_gsclnp_111", "mout_aclk_gscl_111_user",
+			ENABLE_ACLK_GSCL, 6, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_ACLK_GSCLRTND_333, "aclk_gsclrtnd_333",
+			"mout_aclk_gscl_333_user", ENABLE_ACLK_GSCL, 5, 0, 0),
+	GATE(CLK_ACLK_GSCLBEND_333, "aclk_gsclbend_333",
+			"mout_aclk_gscl_333_user", ENABLE_ACLK_GSCL, 4, 0, 0),
+	GATE(CLK_ACLK_GSD, "aclk_gsd", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL, 3, 0, 0),
+	GATE(CLK_ACLK_GSCL2, "aclk_gscl2", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL, 2, 0, 0),
+	GATE(CLK_ACLK_GSCL1, "aclk_gscl1", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL, 1, 0, 0),
+	GATE(CLK_ACLK_GSCL0, "aclk_gscl0", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL, 0, 0, 0),
+
+	/* ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL0 */
+	GATE(CLK_ACLK_SMMU_GSCL0, "aclk_smmu_gscl0", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL0, 0, 0, 0),
+
+	/* ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL1 */
+	GATE(CLK_ACLK_SMMU_GSCL1, "aclk_smmu_gscl1", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL1, 0, 0, 0),
+
+	/* ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL2 */
+	GATE(CLK_ACLK_SMMU_GSCL2, "aclk_smmu_gscl2", "mout_aclk_gscl_333_user",
+			ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL2, 0, 0, 0),
+
+	/* ENABLE_PCLK_GSCL */
+	GATE(CLK_PCLK_BTS_GSCL2, "pclk_bts_gscl2", "mout_aclk_gscl_111_user",
+			ENABLE_PCLK_GSCL, 7, 0, 0),
+	GATE(CLK_PCLK_BTS_GSCL1, "pclk_bts_gscl1", "mout_aclk_gscl_111_user",
+			ENABLE_PCLK_GSCL, 6, 0, 0),
+	GATE(CLK_PCLK_BTS_GSCL0, "pclk_bts_gscl0", "mout_aclk_gscl_111_user",
+			ENABLE_PCLK_GSCL, 5, 0, 0),
+	GATE(CLK_PCLK_PMU_GSCL, "pclk_pmu_gscl", "mout_aclk_gscl_111_user",
+			ENABLE_PCLK_GSCL, 4, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_PCLK_SYSREG_GSCL, "pclk_sysreg_gscl",
+			"mout_aclk_gscl_111_user", ENABLE_PCLK_GSCL,
+			3, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_PCLK_GSCL2, "pclk_gscl2", "mout_aclk_gscl_111_user",
+			ENABLE_PCLK_GSCL, 2, 0, 0),
+	GATE(CLK_PCLK_GSCL1, "pclk_gscl1", "mout_aclk_gscl_111_user",
+			ENABLE_PCLK_GSCL, 1, 0, 0),
+	GATE(CLK_PCLK_GSCL0, "pclk_gscl0", "mout_aclk_gscl_111_user",
+			ENABLE_PCLK_GSCL, 0, 0, 0),
+
+	/* ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL0 */
+	GATE(CLK_PCLK_SMMU_GSCL0, "pclk_smmu_gscl0", "mout_aclk_gscl_111_user",
+		ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL0, 0, 0, 0),
+
+	/* ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL1 */
+	GATE(CLK_PCLK_SMMU_GSCL1, "pclk_smmu_gscl1", "mout_aclk_gscl_111_user",
+		ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL0, 0, 0, 0),
+
+	/* ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL2 */
+	GATE(CLK_PCLK_SMMU_GSCL2, "pclk_smmu_gscl2", "mout_aclk_gscl_111_user",
+		ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL0, 0, 0, 0),
+};
+
+static struct samsung_cmu_info gscl_cmu_info __initdata = {
+	.mux_clks		= gscl_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(gscl_mux_clks),
+	.gate_clks		= gscl_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(gscl_gate_clks),
+	.nr_clk_ids		= GSCL_NR_CLK,
+	.clk_regs		= gscl_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(gscl_clk_regs),
+};
+
+static void __init exynos5433_cmu_gscl_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &gscl_cmu_info);
+}
+CLK_OF_DECLARE(exynos5433_cmu_gscl, "samsung,exynos5433-cmu-gscl",
+		exynos5433_cmu_gscl_init);
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index dae83cc..f855859 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -147,8 +147,10 @@
 #define CLK_SCLK_UFSUNIPRO_FSYS		229
 #define CLK_SCLK_USBHOST30_FSYS		230
 #define CLK_SCLK_USBDRD30_FSYS		231
+#define CLK_ACLK_GSCL_111		232
+#define CLK_ACLK_GSCL_333		233
 
-#define TOP_NR_CLK			232
+#define TOP_NR_CLK			234
 
 /* CMU_CPIF */
 #define CLK_FOUT_MPHY_PLL		1
@@ -819,4 +821,37 @@
 
 #define G3D_NR_CLK					20
 
+/* CMU_GSCL */
+#define CLK_MOUT_ACLK_GSCL_111_USER			1
+#define CLK_MOUT_ACLK_GSCL_333_USER			2
+
+#define CLK_ACLK_BTS_GSCL2				3
+#define CLK_ACLK_BTS_GSCL1				4
+#define CLK_ACLK_BTS_GSCL0				5
+#define CLK_ACLK_AHB2APB_GSCLP				6
+#define CLK_ACLK_XIU_GSCLX				7
+#define CLK_ACLK_GSCLNP_111				8
+#define CLK_ACLK_GSCLRTND_333				9
+#define CLK_ACLK_GSCLBEND_333				10
+#define CLK_ACLK_GSD					11
+#define CLK_ACLK_GSCL2					12
+#define CLK_ACLK_GSCL1					13
+#define CLK_ACLK_GSCL0					14
+#define CLK_ACLK_SMMU_GSCL0				15
+#define CLK_ACLK_SMMU_GSCL1				16
+#define CLK_ACLK_SMMU_GSCL2				17
+#define CLK_PCLK_BTS_GSCL2				18
+#define CLK_PCLK_BTS_GSCL1				19
+#define CLK_PCLK_BTS_GSCL0				20
+#define CLK_PCLK_PMU_GSCL				21
+#define CLK_PCLK_SYSREG_GSCL				22
+#define CLK_PCLK_GSCL2					23
+#define CLK_PCLK_GSCL1					24
+#define CLK_PCLK_GSCL0					25
+#define CLK_PCLK_SMMU_GSCL0				26
+#define CLK_PCLK_SMMU_GSCL1				27
+#define CLK_PCLK_SMMU_GSCL2				28
+
+#define GSCL_NR_CLK					29
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
-- 
1.8.5.5
