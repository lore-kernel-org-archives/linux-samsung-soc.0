From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 17/21] clk: samsung: exynos4: Add E4210 prefix to LCD1 clock
 registers
Date: Wed, 27 Mar 2013 12:02:54 +0100
Message-ID: <1364382178-25248-18-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59957 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752276Ab3C0LIM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:08:12 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB008C3G9MB6P0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:08:11 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

This patch adds E4210 prefix to all registers related to LCD1 clock
domain, because they are present only on Exynos4210.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index aa8e907..c84dbc9 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -41,7 +41,7 @@
 #define SRC_G3D			0xc22c
 #define E4210_SRC_IMAGE		0xc230
 #define SRC_LCD0		0xc234
-#define SRC_LCD1		0xc238
+#define E4210_SRC_LCD1		0xc238
 #define E4X12_SRC_ISP		0xc238
 #define SRC_MAUDIO		0xc23c
 #define SRC_FSYS		0xc240
@@ -51,7 +51,7 @@
 #define SRC_MASK_CAM		0xc320
 #define SRC_MASK_TV		0xc324
 #define SRC_MASK_LCD0		0xc334
-#define SRC_MASK_LCD1		0xc338
+#define E4210_SRC_MASK_LCD1	0xc338
 #define E4X12_SRC_MASK_ISP	0xc338
 #define SRC_MASK_MAUDIO		0xc33c
 #define SRC_MASK_FSYS		0xc340
@@ -85,7 +85,7 @@
 #define GATE_IP_G3D		0xc92c
 #define E4210_GATE_IP_IMAGE	0xc930
 #define GATE_IP_LCD0		0xc934
-#define GATE_IP_LCD1		0xc938
+#define E4210_GATE_IP_LCD1	0xc938
 #define E4X12_GATE_IP_ISP	0xc938
 #define E4X12_GATE_IP_MAUDIO	0xc93c
 #define GATE_IP_FSYS		0xc940
@@ -326,8 +326,8 @@ struct samsung_mux_clock exynos4210_mux_clks[] __initdata = {
 	MUX(none, "mout_g2d0", sclk_ampll_p4210, E4210_SRC_IMAGE, 0, 1),
 	MUX(none, "mout_g2d1", sclk_evpll_p, E4210_SRC_IMAGE, 4, 1),
 	MUX(none, "mout_g2d", mout_g2d_p, E4210_SRC_IMAGE, 8, 1),
-	MUX(none, "mout_fimd1", group1_p4210, SRC_LCD1, 0, 4),
-	MUX(none, "mout_mipi1", group1_p4210, SRC_LCD1, 12, 4),
+	MUX(none, "mout_fimd1", group1_p4210, E4210_SRC_LCD1, 0, 4),
+	MUX(none, "mout_mipi1", group1_p4210, E4210_SRC_LCD1, 12, 4),
 	MUX_A(sclk_mpll, "sclk_mpll", mout_mpll_p, SRC_CPU, 8, 1, "sclk_mpll"),
 	MUX_A(mout_core, "mout_core", mout_core_p4210, SRC_CPU, 16, 1, "mout_core"),
 	MUX_A(sclk_vpll, "sclk_vpll", sclk_vpll_p4210,
@@ -537,10 +537,10 @@ struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
 	GATE(jpeg, "jpeg", "aclk160", GATE_IP_CAM, 6, 0, 0),
 	GATE(mie0, "mie0", "aclk160", GATE_IP_LCD0, 1, 0, 0),
 	GATE(dsim0, "dsim0", "aclk160", GATE_IP_LCD0, 3, 0, 0),
-	GATE(fimd1, "fimd1", "aclk160", GATE_IP_LCD1, 0, 0, 0),
-	GATE(mie1, "mie1", "aclk160", GATE_IP_LCD1, 1, 0, 0),
-	GATE(dsim1, "dsim1", "aclk160", GATE_IP_LCD1, 3, 0, 0),
-	GATE(smmu_fimd1, "smmu_fimd1", "aclk160", GATE_IP_LCD1, 4, 0, 0),
+	GATE(fimd1, "fimd1", "aclk160", E4210_GATE_IP_LCD1, 0, 0, 0),
+	GATE(mie1, "mie1", "aclk160", E4210_GATE_IP_LCD1, 1, 0, 0),
+	GATE(dsim1, "dsim1", "aclk160", E4210_GATE_IP_LCD1, 3, 0, 0),
+	GATE(smmu_fimd1, "smmu_fimd1", "aclk160", E4210_GATE_IP_LCD1, 4, 0, 0),
 	GATE(tsi, "tsi", "aclk133", GATE_IP_FSYS, 4, 0, 0),
 	GATE(sromc, "sromc", "aclk133", GATE_IP_FSYS, 11, 0, 0),
 	GATE(sclk_g3d, "sclk_g3d", "div_g3d", GATE_IP_G3D, 0,
@@ -737,7 +737,7 @@ struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
 	GATE(smmu_rotator, "smmu_rotator", "aclk200",
 			E4210_GATE_IP_IMAGE, 4, 0, 0),
 	GATE(sclk_mipi1, "sclk_mipi1", "div_mipi_pre1",
-			SRC_MASK_LCD1, 12, CLK_SET_RATE_PARENT, 0),
+			E4210_SRC_MASK_LCD1, 12, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_sata, "sclk_sata", "div_sata",
 			SRC_MASK_FSYS, 24, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_mixer, "sclk_mixer", "mout_mixer", SRC_MASK_TV, 4, 0, 0),
@@ -748,7 +748,7 @@ struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
 	GATE_A(rtc, "rtc", "aclk100", GATE_IP_PERIR, 15, 0, 0, "rtc"),
 	GATE_A(keyif, "keyif", "aclk100", GATE_IP_PERIR, 16, 0, 0, "keypad"),
 	GATE_DA(sclk_fimd1, "exynos4-fb.1", "sclk_fimd1", "div_fimd1",
-			SRC_MASK_LCD1, 0, CLK_SET_RATE_PARENT, 0, "sclk_fimd"),
+			E4210_SRC_MASK_LCD1, 0, CLK_SET_RATE_PARENT, 0, "sclk_fimd"),
 };
 
 /* list of gate clocks supported in exynos4x12 soc */
-- 
1.8.1.5
