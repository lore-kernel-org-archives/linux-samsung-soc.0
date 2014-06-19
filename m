From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] clk/exynos5250: fix bit number for tv sysmmu clock
Date: Thu, 19 Jun 2014 11:17:16 +0530
Message-ID: <1403156836-24421-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55423 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751674AbaFSFsY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 01:48:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Change bit from 2 to 9 for tv (mixer) sysmmu clock.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
Based on Kukjin's for-next branch.

 drivers/clk/samsung/clk-exynos5250.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 1fad4c5..184f642 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -661,7 +661,7 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(CLK_RTC, "rtc", "div_aclk66", GATE_IP_PERIS, 20, 0, 0),
 	GATE(CLK_TMU, "tmu", "div_aclk66", GATE_IP_PERIS, 21, 0, 0),
 	GATE(CLK_SMMU_TV, "smmu_tv", "mout_aclk200_disp1_sub",
-			GATE_IP_DISP1, 2, 0, 0),
+			GATE_IP_DISP1, 9, 0, 0),
 	GATE(CLK_SMMU_FIMD1, "smmu_fimd1", "mout_aclk200_disp1_sub",
 			GATE_IP_DISP1, 8, 0, 0),
 	GATE(CLK_SMMU_2D, "smmu_2d", "div_aclk200", GATE_IP_ACP, 7, 0, 0),
-- 
1.7.9.5
