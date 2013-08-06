From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] clk: exynos5250: Make exynos5250_plls static
Date: Tue,  6 Aug 2013 17:01:14 +0530
Message-ID: <1375788675-2638-2-git-send-email-sachin.kamat@linaro.org>
References: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:56620 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755241Ab3HFLso (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Aug 2013 07:48:44 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz10so618136pad.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2013 04:48:43 -0700 (PDT)
In-Reply-To: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, patches@linaro.org

exynos5250_plls is used only in this file. Make it static.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index df3628c..5865cef 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -517,7 +517,7 @@ static __initdata struct samsung_pll_rate_table epll_24mhz_tbl[] = {
 	{ },
 };
 
-struct __initdata samsung_pll_clock exynos5250_plls[nr_plls] = {
+static struct __initdata samsung_pll_clock exynos5250_plls[nr_plls] = {
 	[apll] = PLL_A(pll_35xx, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, "fout_apll", NULL),
 	[mpll] = PLL_A(pll_35xx, fout_mpll, "fout_mpll", "fin_pll", MPLL_LOCK,
-- 
1.7.9.5
