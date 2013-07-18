From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 6/6] clk: exynos-audss: Staticize exynos_audss_clk_init
Date: Thu, 18 Jul 2013 15:31:22 +0530
Message-ID: <1374141682-29432-7-git-send-email-sachin.kamat@linaro.org>
References: <1374141682-29432-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:36780 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757524Ab3GRKRn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Jul 2013 06:17:43 -0400
Received: by mail-pb0-f52.google.com with SMTP id xa12so2968152pbc.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Jul 2013 03:17:43 -0700 (PDT)
In-Reply-To: <1374141682-29432-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

exynos_audss_clk_init() is used only in this file. Make it
static.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Acked-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/clk/samsung/clk-exynos-audss.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 9b1bbd5..51b48da 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -62,7 +62,7 @@ static struct syscore_ops exynos_audss_clk_syscore_ops = {
 #endif /* CONFIG_PM_SLEEP */
 
 /* register exynos_audss clocks */
-void __init exynos_audss_clk_init(struct device_node *np)
+static void __init exynos_audss_clk_init(struct device_node *np)
 {
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
-- 
1.7.9.5
