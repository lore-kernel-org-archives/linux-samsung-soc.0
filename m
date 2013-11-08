From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] clk: exynos5250: save/restore EPLL0 configuration
Date: Fri,  8 Nov 2013 15:44:06 +0530
Message-ID: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:40480 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752830Ab3KHKPu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Nov 2013 05:15:50 -0500
Received: by mail-pa0-f53.google.com with SMTP id kx10so1995408pab.40
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Nov 2013 02:15:50 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, t.figa@samsung.com, sachin.kamat@linaro.org, Andrew Bresticker <abrestic@chromium.org>

From: Andrew Bresticker <abrestic@chromium.org>

The EPLL configuration register needs to be saved across
suspend/resume.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index ee866e377c80..6767635dc895 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -143,6 +143,7 @@ static unsigned long exynos5250_clk_regs[] __initdata = {
 	SRC_CPU,
 	DIV_CPU0,
 	SRC_CORE1,
+	EPLL_CON0,
 	SRC_TOP0,
 	SRC_TOP2,
 	SRC_TOP3,
-- 
1.7.9.5
