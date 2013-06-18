From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/5] clk/exynos5420: add hdmi mux to change parents in hdmi
 driver
Date: Tue, 18 Jun 2013 20:03:17 +0530
Message-ID: <1371565998-3642-5-git-send-email-rahul.sharma@samsung.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51136 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932855Ab3FROJw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 10:09:52 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOL00175E07N890@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 23:09:51 +0900 (KST)
In-reply-to: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

hdmi driver needs to change the parent of hdmi clock
to pixel clock or hdmiphy clock, based on the stability
of hdmiphy. This patch is exposing the mux for changing
the parent.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5420-clock.txt |    5 +++++
 drivers/clk/samsung/clk-exynos5420.c                         |    5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
index f0b1ce0..c7a319d 100644
--- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
@@ -182,6 +182,11 @@ clock which they consume.
   g3d			501
   smmu_tv		502
 
+  Mux			ID
+  ----------------------------
+
+  mout_hdmi		1024
+
 Example 1: An example of a clock controller node is listed below.
 
 	clock: clock-controller@0x10010000 {
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 193d25e..59cf177 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -111,6 +111,9 @@ enum exynos5420_clks {
 	aclk333_g2d = 480, g2d, aclk333_432_gscl = 490, smmu_3aa, smmu_fimcl0,
 	smmu_fimcl1, smmu_fimcl3, fimc_lite3, aclk_g3d = 500, g3d, smmu_tv,
 
+	/* mux clocks */
+	mout_hdmi = 1024,
+
 	nr_clks,
 };
 
@@ -371,7 +374,7 @@ struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 	MUX(none, "mout_mipi1", group2_p, SRC_DISP10, 16, 3),
 	MUX(none, "mout_dp1", group2_p, SRC_DISP10, 20, 3),
 	MUX(none, "mout_pixel", group2_p, SRC_DISP10, 24, 3),
-	MUX(none, "mout_hdmi", hdmi_p, SRC_DISP10, 28, 1),
+	MUX(mout_hdmi, "mout_hdmi", hdmi_p, SRC_DISP10, 28, 1),
 
 	/* MAU Block */
 	MUX(none, "mout_maudio0", maudio0_p, SRC_MAU, 28, 3),
-- 
1.7.10.4
