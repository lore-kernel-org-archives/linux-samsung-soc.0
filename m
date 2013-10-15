From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 7/7] clk: samsung: exynos5250: Fix parents of gate clocks from
 MFC domain
Date: Tue, 15 Oct 2013 19:41:21 +0200
Message-ID: <1381858881-25611-8-git-send-email-t.figa@samsung.com>
References: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11012 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933145Ab3JORlg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 13:41:36 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUQ004ZM159ZO90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Oct 2013 18:41:35 +0100 (BST)
In-reply-to: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds mout_aclk333_sub mux clock and updates gate clocks from
MFC domain to have it as their parent as specified in SoC documentation.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 1290da9..93b82db 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -198,6 +198,7 @@ PNAME(mout_aclk166_p)	= { "mout_cpll", "mout_mpll_user" };
 PNAME(mout_aclk200_p)	= { "mout_mpll_user", "mout_bpll_user" };
 PNAME(mout_aclk200_sub_p) = { "fin_pll", "div_aclk200" };
 PNAME(mout_aclk266_sub_p) = { "fin_pll", "div_aclk266" };
+PNAME(mout_aclk333_sub_p) = { "fin_pll", "div_aclk333" };
 PNAME(mout_hdmi_p)	= { "div_hdmi_pixel", "sclk_hdmiphy" };
 PNAME(mout_usb3_p)	= { "mout_mpll_user", "mout_cpll" };
 PNAME(mout_group1_p)	= { "fin_pll", "fin_pll", "sclk_hdmi27m",
@@ -283,6 +284,7 @@ static struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 
 	MUX(none, "mout_aclk200_disp1_sub", mout_aclk200_sub_p, SRC_TOP3, 4, 1),
 	MUX(none, "mout_aclk266_gscl_sub", mout_aclk266_sub_p, SRC_TOP3, 8, 1),
+	MUX(none, "mout_aclk333_sub", mout_aclk333_sub_p, SRC_TOP3, 24, 1),
 
 	MUX(none, "mout_cam_bayer", mout_group1_p, SRC_GSCL, 12, 4),
 	MUX(none, "mout_cam0", mout_group1_p, SRC_GSCL, 16, 4),
@@ -517,9 +519,9 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(mixer, "mixer", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 5, 0, 0),
 	GATE(hdmi, "hdmi", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 6, 0, 0),
 
-	GATE(mfc, "mfc", "div_aclk333", GATE_IP_MFC, 0, 0, 0),
-	GATE(smmu_mfcl, "smmu_mfcl", "div_aclk333", GATE_IP_MFC, 1, 0, 0),
-	GATE(smmu_mfcr, "smmu_mfcr", "div_aclk333", GATE_IP_MFC, 2, 0, 0),
+	GATE(mfc, "mfc", "mout_aclk333_sub", GATE_IP_MFC, 0, 0, 0),
+	GATE(smmu_mfcl, "smmu_mfcl", "mout_aclk333_sub", GATE_IP_MFC, 1, 0, 0),
+	GATE(smmu_mfcr, "smmu_mfcr", "mout_aclk333_sub", GATE_IP_MFC, 2, 0, 0),
 
 	GATE(rotator, "rotator", "div_aclk266", GATE_IP_GEN, 1, 0, 0),
 	GATE(jpeg, "jpeg", "div_aclk166", GATE_IP_GEN, 2, 0, 0),
-- 
1.8.3.2
