From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 07/21] clk: samsung: exynos4: Export clocks used by exynos
 cpufreq drivers
Date: Wed, 27 Mar 2013 12:02:44 +0100
Message-ID: <1364382178-25248-8-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29159 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751879Ab3C0LFj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:05:39 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB0057EG5ELZS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:05:39 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

From: Lukasz Majewski <l.majewski@samsung.com>

This patch exports clocks used by Exynos cpufreq drivers to allow lookup
using device tree. (Support to cpufreq drivers will be added in further
patches.)

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos4-clock.txt | 2 ++
 drivers/clk/samsung/clk-exynos4.c                         | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
index ac7cec4..51c572a 100644
--- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
@@ -44,6 +44,8 @@ Exynos4 SoC and this is specified where applicable.
   aclk133             16
   mout_mpll_user_t    17      Exynos4x12
   mout_mpll_user_c    18      Exynos4x12
+  mout_core           19
+  mout_apll           20
 
 
             [Clock Gate for Special Clocks]
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index c1e6451..5592a78 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -112,7 +112,8 @@ enum exynos4_clks {
 	/* core clocks */
 	xxti, xusbxti, fin_pll, fout_apll, fout_mpll, fout_epll, fout_vpll,
 	sclk_apll, sclk_mpll, sclk_epll, sclk_vpll, arm_clk, aclk200, aclk100,
-	aclk160, aclk133, mout_mpll_user_t, mout_mpll_user_c, /* 18 */
+	aclk160, aclk133, mout_mpll_user_t, mout_mpll_user_c, mout_core,
+	mout_apll, /* 20 */
 
 	/* gate for special clocks (sclk) */
 	sclk_fimc0 = 128, sclk_fimc1, sclk_fimc2, sclk_fimc3, sclk_cam0,
@@ -284,7 +285,8 @@ struct samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata = {
 
 /* list of mux clocks supported in all exynos4 soc's */
 struct samsung_mux_clock exynos4_mux_clks[] __initdata = {
-	MUX(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
+	MUX_F(mout_apll, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
+			CLK_SET_RATE_PARENT, 0),
 	MUX(none, "mout_hdmi", mout_hdmi_p, SRC_TV, 0, 1),
 	MUX(none, "mout_mfc1", sclk_evpll_p, SRC_MFC, 4, 1),
 	MUX(none, "mout_mfc", mout_mfc_p, SRC_MFC, 8, 1),
@@ -362,7 +364,7 @@ struct samsung_mux_clock exynos4x12_mux_clks[] __initdata = {
 			E4X12_SRC_DMC, 12, 1, "sclk_mpll"),
 	MUX_A(sclk_vpll, "sclk_vpll", mout_vpll_p,
 			SRC_TOP0, 8, 1, "sclk_vpll"),
-	MUX(none, "mout_core", mout_core_p4x12, SRC_CPU, 16, 1),
+	MUX(mout_core, "mout_core", mout_core_p4x12, SRC_CPU, 16, 1),
 	MUX(none, "mout_fimc0", group1_p4x12, SRC_CAM, 0, 4),
 	MUX(none, "mout_fimc1", group1_p4x12, SRC_CAM, 4, 4),
 	MUX(none, "mout_fimc2", group1_p4x12, SRC_CAM, 8, 4),
-- 
1.8.1.5
