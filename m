From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag to mout_apll
Date: Thu, 19 Dec 2013 14:03:39 +0530
Message-ID: <1387442019-2445-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:40162 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477Ab3LSIgx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 03:36:53 -0500
Received: by mail-pa0-f50.google.com with SMTP id kl14so856596pab.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2013 00:36:53 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, t.figa@samsung.com, mturquette@linaro.org, sachin.kamat@linaro.org

Add CLK_SET_RATE_PARENT flag to mout_apll clock. This will let us set the
clock rate in the cpufreq driver.

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
