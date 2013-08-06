From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] clk: exynos4: Make exynos4_plls static
Date: Tue,  6 Aug 2013 17:01:13 +0530
Message-ID: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:65254 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755241Ab3HFLsk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Aug 2013 07:48:40 -0400
Received: by mail-pa0-f47.google.com with SMTP id kl13so619560pab.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2013 04:48:40 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, patches@linaro.org

'exynos4_plls' is used only in this file. Make it static.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/clk/samsung/clk-exynos4.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 68f9a4a..fec319d 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -984,7 +984,7 @@ static __initdata struct of_device_id ext_clk_match[] = {
 	{},
 };
 
-struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
+static struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
 	[apll] = PLL_A(pll_35xx, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, "fout_apll", NULL),
 	[mpll] = PLL_A(pll_35xx, fout_mpll, "fout_mpll", "fin_pll",
-- 
1.7.9.5
