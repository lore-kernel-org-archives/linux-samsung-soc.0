From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] clk: exynos5420: Make exynos5420_plls static
Date: Tue,  6 Aug 2013 17:01:15 +0530
Message-ID: <1375788675-2638-3-git-send-email-sachin.kamat@linaro.org>
References: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:64677 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755241Ab3HFLsr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Aug 2013 07:48:47 -0400
Received: by mail-pa0-f46.google.com with SMTP id fa1so619253pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2013 04:48:47 -0700 (PDT)
In-Reply-To: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, patches@linaro.org

'exynos5420_plls' is used only in this file. Make is static.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/clk/samsung/clk-exynos5420.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index ca352695..872e13d 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -727,7 +727,7 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 	GATE(smmu_mscl2, "smmu_mscl2", "aclk400_mscl", GATE_IP_MSCL, 10, 0, 0),
 };
 
-struct __initdata samsung_pll_clock exynos5420_plls[nr_plls] = {
+static struct __initdata samsung_pll_clock exynos5420_plls[nr_plls] = {
 	[apll] = PLL(pll_2550, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, NULL),
 	[cpll] = PLL(pll_2550, fout_mpll, "fout_mpll", "fin_pll", MPLL_LOCK,
-- 
1.7.9.5
