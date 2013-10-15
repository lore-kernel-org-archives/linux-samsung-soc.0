From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/7] clk: samsung: exynos5250: Fix parent of gate clocks from
 DISP1 domain
Date: Tue, 15 Oct 2013 19:41:18 +0200
Message-ID: <1381858881-25611-5-git-send-email-t.figa@samsung.com>
References: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24266 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933380Ab3JORli (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 13:41:38 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUQ00HAT159VQC0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Oct 2013 18:41:34 +0100 (BST)
In-reply-to: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds mux_aclk_200_disp1_sub mux clock, which according to SoC
documentation is the correct parent of DISP1 gate clocks.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index f91e77d..b3793fe 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -196,6 +196,7 @@ PNAME(mout_mpll_user_p)	= { "fin_pll", "mout_mpll" };
 PNAME(mout_bpll_user_p)	= { "fin_pll", "mout_bpll" };
 PNAME(mout_aclk166_p)	= { "mout_cpll", "mout_mpll_user" };
 PNAME(mout_aclk200_p)	= { "mout_mpll_user", "mout_bpll_user" };
+PNAME(mout_aclk200_sub_p) = { "fin_pll", "div_aclk200" };
 PNAME(mout_aclk266_sub_p) = { "fin_pll", "div_aclk266" };
 PNAME(mout_hdmi_p)	= { "div_hdmi_pixel", "sclk_hdmiphy" };
 PNAME(mout_usb3_p)	= { "mout_mpll_user", "mout_cpll" };
@@ -272,6 +273,7 @@ static struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "mout_mpll_user", mout_mpll_user_p, SRC_TOP2, 20, 1),
 	MUX(none, "mout_bpll_user", mout_bpll_user_p, SRC_TOP2, 24, 1),
 
+	MUX(none, "mout_aclk200_disp1_sub", mout_aclk200_sub_p, SRC_TOP3, 4, 1),
 	MUX(none, "mout_aclk266_gscl_sub", mout_aclk266_sub_p, SRC_TOP3, 8, 1),
 
 	MUX(none, "mout_cam_bayer", mout_group1_p, SRC_GSCL, 12, 4),
@@ -500,12 +502,12 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(smmu_gscl3, "smmu_gscl3", "mout_aclk266_gscl_sub",
 			GATE_IP_GSCL, 10, 0, 0),
 
-	GATE(fimd1, "fimd1", "div_aclk200", GATE_IP_DISP1, 0, 0, 0),
-	GATE(mie1, "mie1", "div_aclk200", GATE_IP_DISP1, 1, 0, 0),
-	GATE(dsim0, "dsim0", "div_aclk200", GATE_IP_DISP1, 3, 0, 0),
-	GATE(dp, "dp", "div_aclk200", GATE_IP_DISP1, 4, 0, 0),
-	GATE(mixer, "mixer", "mout_aclk200_disp1", GATE_IP_DISP1, 5, 0, 0),
-	GATE(hdmi, "hdmi", "mout_aclk200_disp1", GATE_IP_DISP1, 6, 0, 0),
+	GATE(fimd1, "fimd1", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 0, 0, 0),
+	GATE(mie1, "mie1", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 1, 0, 0),
+	GATE(dsim0, "dsim0", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 3, 0, 0),
+	GATE(dp, "dp", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 4, 0, 0),
+	GATE(mixer, "mixer", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 5, 0, 0),
+	GATE(hdmi, "hdmi", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 6, 0, 0),
 
 	GATE(mfc, "mfc", "div_aclk333", GATE_IP_MFC, 0, 0, 0),
 	GATE(smmu_mfcl, "smmu_mfcl", "div_aclk333", GATE_IP_MFC, 1, 0, 0),
-- 
1.8.3.2
