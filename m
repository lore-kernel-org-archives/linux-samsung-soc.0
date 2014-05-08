From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v5 04/15] clk: exynos5420: fix parent clocks for mscl sysmmu
Date: Thu, 08 May 2014 16:57:53 +0530
Message-ID: <1399548484-20626-5-git-send-email-shaik.ameer@samsung.com>
References: <1399548484-20626-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34568 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753328AbaEHL3h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 07:29:37 -0400
In-reply-to: <1399548484-20626-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, t.figa@samsung.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, alim.akhtar@samsung.com, Shaik Ameer Basha <shaik.ameer@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

This patch fixes the parent clocks for mscl sysmmu.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 68e98d4..de4431b 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -582,6 +582,9 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
 			DIV2_RATIO0, 4, 2),
 	DIV(0, "dout_gscl_blk_333", "aclk333_432_gscl", DIV2_RATIO0, 6, 2),
 
+	/* MSCL Block */
+	DIV(0, "dout_mscl_blk", "aclk400_mscl", DIV2_RATIO0, 28, 2),
+
 	/* ISP Block */
 	DIV(0, "dout_isp_sensor0", "mout_isp_sensor", SCLK_DIV_ISP0, 8, 8),
 	DIV(0, "dout_isp_sensor1", "mout_isp_sensor", SCLK_DIV_ISP0, 16, 8),
@@ -812,11 +815,11 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 	GATE(CLK_MSCL0, "mscl0", "aclk400_mscl", GATE_IP_MSCL, 0, 0, 0),
 	GATE(CLK_MSCL1, "mscl1", "aclk400_mscl", GATE_IP_MSCL, 1, 0, 0),
 	GATE(CLK_MSCL2, "mscl2", "aclk400_mscl", GATE_IP_MSCL, 2, 0, 0),
-	GATE(CLK_SMMU_MSCL0, "smmu_mscl0", "aclk400_mscl",
+	GATE(CLK_SMMU_MSCL0, "smmu_mscl0", "dout_mscl_blk",
 			GATE_IP_MSCL, 8, 0, 0),
-	GATE(CLK_SMMU_MSCL1, "smmu_mscl1", "aclk400_mscl",
+	GATE(CLK_SMMU_MSCL1, "smmu_mscl1", "dout_mscl_blk",
 			GATE_IP_MSCL, 9, 0, 0),
-	GATE(CLK_SMMU_MSCL2, "smmu_mscl2", "aclk400_mscl",
+	GATE(CLK_SMMU_MSCL2, "smmu_mscl2", "dout_mscl_blk",
 			GATE_IP_MSCL, 10, 0, 0),
 
 	GATE(CLK_FIMD1, "fimd1", "aclk300_disp1", GATE_IP_DISP1, 0, 0, 0),
-- 
1.7.9.5
