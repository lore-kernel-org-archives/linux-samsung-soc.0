From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag to mout_apll
Date: Thu, 21 Nov 2013 09:47:34 +0530
Message-ID: <1385007454-5234-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55003 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827Ab3KUETo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Nov 2013 23:19:44 -0500
Received: by mail-pb0-f46.google.com with SMTP id md12so4478276pbc.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Nov 2013 20:19:44 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, t.figa@samsung.com, sachin.kamat@linaro.org

Add CLK_SET_RATE_PARENT flag to be able to change the frequency
to desired value.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 80f652053cb5..11178b1ad735 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -303,7 +303,8 @@ static struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	/*
 	 * CMU_CPU
 	 */
-	MUX_A(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1, "mout_apll"),
+	MUX_FA(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
+					CLK_SET_RATE_PARENT, 0, "mout_apll"),
 	MUX_A(none, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1, "mout_cpu"),
 
 	/*
-- 
1.7.9.5
