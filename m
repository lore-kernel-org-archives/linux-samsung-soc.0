From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] clk/exynos4: Fix compilation warning
Date: Mon, 26 May 2014 09:46:28 +0530
Message-ID: <1401077788-31427-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34520 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914AbaEZESp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 00:18:45 -0400
Received: by mail-pa0-f48.google.com with SMTP id rd3so6961787pab.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2014 21:18:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, mturquette@linaro.org, sachin.kamat@linaro.org

Fixes the following warning:
WARNING: drivers/built-in.o(.text.unlikely+0x2c50): Section mismatch in reference from the function exynos4_clk_sleep_init() to the (unknown reference) .init.data:(unknown)
   The function exynos4_clk_sleep_init() references
   the (unknown reference) __initdata (unknown).
   This is often because exynos4_clk_sleep_init lacks a __initdata
   annotation or the annotation of (unknown) is wrong.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
---
 drivers/clk/samsung/clk-exynos4.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index c4df294bb7fb..4f150c9dd38c 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -324,7 +324,7 @@ static struct syscore_ops exynos4_clk_syscore_ops = {
 	.resume = exynos4_clk_resume,
 };
 
-static void exynos4_clk_sleep_init(void)
+static void __init exynos4_clk_sleep_init(void)
 {
 	exynos4_save_common = samsung_clk_alloc_reg_dump(exynos4_clk_regs,
 					ARRAY_SIZE(exynos4_clk_regs));
@@ -359,7 +359,7 @@ err_warn:
 		__func__);
 }
 #else
-static void exynos4_clk_sleep_init(void) {}
+static void __init exynos4_clk_sleep_init(void) {}
 #endif
 
 /* list of all parent clock list */
-- 
1.7.9.5
