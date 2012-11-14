From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 11/11] ARM: Exynos: add support for mct clock setup
Date: Thu, 15 Nov 2012 03:37:33 +0530
Message-ID: <1352930853-12268-12-git-send-email-thomas.abraham@linaro.org>
References: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:44128 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933141Ab2KNWJg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 17:09:36 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so608817pad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Nov 2012 14:09:36 -0800 (PST)
In-Reply-To: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>

Add support for mct clock lookup and setup to ensure that the mct clock
is has been turned on.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/mct.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index 47bc6b35..09815a9 100644
--- a/arch/arm/mach-exynos/mct.c
+++ b/arch/arm/mach-exynos/mct.c
@@ -489,7 +489,12 @@ static struct local_timer_ops exynos4_mct_tick_ops __cpuinitdata = {
 
 static void __init exynos4_timer_resources(struct device_node *np)
 {
-	struct clk *tick_clk;
+	struct clk *mct_clk, *tick_clk;
+
+	mct_clk = clk_get(NULL, "mct");
+	if (IS_ERR(mct_clk))
+		panic("%s: unable to retrieve mct clock instance\n", __func__);
+	clk_prepare_enable(mct_clk);
 
 	tick_clk = clk_get(NULL, "fin_pll");
 	if (IS_ERR(tick_clk))
-- 
1.7.4.4
