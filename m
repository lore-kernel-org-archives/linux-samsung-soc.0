From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 2/2] clk: samsung: add exynos5250 composite clock for hdmi
Date: Mon, 20 May 2013 19:47:08 +0530
Message-ID: <1369059428-26820-3-git-send-email-rahul.sharma@samsung.com>
References: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64360 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756270Ab3ETNyV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 09:54:21 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN300F6CNYJOTY0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 May 2013 22:54:20 +0900 (KST)
In-reply-to: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

HDMI driver needs to change the parent of sclk_hdmi clock to
sclk_pixel or to sclk_hdmiphy, depends on the status of hdmiphy.
sclk_hdmi which is gate clock doesn't support the set_parent
operation.

This patch adds sclk_hdmi as a composite clock which is a
combination of mux clock and gate clock. Being a composite
clock, above clock supports both set_parent and enable/disable
functionality. Therefore hdmi driver need not be modified
different S0Cs. This will handled inside CCF.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 5c97e75..0c9e37a 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -231,7 +231,6 @@ struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "mout_fimd1", mout_group1_p, SRC_DISP1_0, 0, 4),
 	MUX(none, "mout_mipi1", mout_group1_p, SRC_DISP1_0, 12, 4),
 	MUX(none, "mout_dp", mout_group1_p, SRC_DISP1_0, 16, 4),
-	MUX(none, "mout_hdmi", mout_hdmi_p, SRC_DISP1_0, 20, 1),
 	MUX(none, "mout_audio0", mout_audio0_p, SRC_MAU, 0, 4),
 	MUX(none, "mout_mmc0", mout_group1_p, SRC_FSYS, 0, 4),
 	MUX(none, "mout_mmc1", mout_group1_p, SRC_FSYS, 4, 4),
@@ -416,8 +415,6 @@ struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 			SRC_MASK_DISP1_0, 12, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_dp, "sclk_dp", "div_dp",
 			SRC_MASK_DISP1_0, 16, CLK_SET_RATE_PARENT, 0),
-	GATE(sclk_hdmi, "sclk_hdmi", "mout_hdmi",
-			SRC_MASK_DISP1_0, 20, 0, 0),
 	GATE(sclk_audio0, "sclk_audio0", "div_audio0",
 			SRC_MASK_MAU, 0, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_mmc0, "sclk_mmc0", "div_mmc_pre0",
@@ -464,6 +461,21 @@ struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
 };
 
+struct samsung_composite_clock exynos5250_composite_clks[] __initdata = {
+	{
+		.id = sclk_hdmi,
+		.name = "sclk_hdmi",
+		.parent_names = mout_hdmi_p,
+		.num_parents = ARRAY_SIZE(mout_hdmi_p),
+		.mux_clk = MUX(none, NULL, mout_hdmi_p, SRC_DISP1_0, 20,
+				1),
+		.gate_clk = GATE(none, NULL, NULL, SRC_MASK_DISP1_0, 20,
+				0, 0),
+		.composition_flags = SAMSUNG_CLK_TYPE_GATE |
+			SAMSUNG_CLK_TYPE_MUX,
+	},
+};
+
 static __initdata struct of_device_id ext_clk_match[] = {
 	{ .compatible = "samsung,clock-xxti", .data = (void *)0, },
 	{ },
@@ -515,6 +527,8 @@ void __init exynos5250_clk_init(struct device_node *np)
 			ARRAY_SIZE(exynos5250_div_clks));
 	samsung_clk_register_gate(exynos5250_gate_clks,
 			ARRAY_SIZE(exynos5250_gate_clks));
+	samsung_clk_register_composite(exynos5250_composite_clks,
+			ARRAY_SIZE(exynos5250_composite_clks));
 
 	pr_info("Exynos5250: clock setup completed, armclk=%ld\n",
 			_get_rate("armclk"));
-- 
1.7.10.4
