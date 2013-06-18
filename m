From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/5] clk/exynos5420: add gate clock for tv sysmmu
Date: Tue, 18 Jun 2013 20:03:15 +0530
Message-ID: <1371565998-3642-3-git-send-email-rahul.sharma@samsung.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51131 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932855Ab3FROJr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 10:09:47 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOL00175E07N890@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 23:09:47 +0900 (KST)
In-reply-to: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Adding sysmmu clock for tv for exynos5420.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5420-clock.txt |    1 +
 drivers/clk/samsung/clk-exynos5420.c                         |    3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
index 596a368..f0b1ce0 100644
--- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
@@ -180,6 +180,7 @@ clock which they consume.
   fimc_lite3		495
   aclk_g3d		500
   g3d			501
+  smmu_tv		502
 
 Example 1: An example of a clock controller node is listed below.
 
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 0945435..e8be481 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -109,7 +109,7 @@ enum exynos5420_clks {
 	aclk300_gscl = 460, smmu_gscl0, smmu_gscl1, gscl_wa, gscl_wb, gscl0,
 	gscl1, clk_3aa, aclk266_g2d = 470, sss, slim_sss, mdma0,
 	aclk333_g2d = 480, g2d, aclk333_432_gscl = 490, smmu_3aa, smmu_fimcl0,
-	smmu_fimcl1, smmu_fimcl3, fimc_lite3, aclk_g3d = 500, g3d,
+	smmu_fimcl1, smmu_fimcl3, fimc_lite3, aclk_g3d = 500, g3d, smmu_tv,
 
 	nr_clks,
 };
@@ -696,6 +696,7 @@ struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 	GATE(smmu_mscl0, "smmu_mscl0", "aclk400_mscl", GATE_IP_MSCL, 8, 0, 0),
 	GATE(smmu_mscl1, "smmu_mscl1", "aclk400_mscl", GATE_IP_MSCL, 9, 0, 0),
 	GATE(smmu_mscl2, "smmu_mscl2", "aclk400_mscl", GATE_IP_MSCL, 10, 0, 0),
+	GATE(smmu_tv, "smmu_tv", "aclk200_disp1", GATE_IP_DISP1, 9, 0, 0),
 };
 
 static __initdata struct of_device_id ext_clk_match[] = {
-- 
1.7.10.4
