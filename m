From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 12/12] ARM: Exynos: add support for mct clock setup
Date: Sun, 25 Nov 2012 02:48:05 +0530
Message-ID: <1353791885-2566-13-git-send-email-thomas.abraham@linaro.org>
References: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:49385 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752257Ab2KXVTi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 16:19:38 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so3117828dak.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Nov 2012 13:19:38 -0800 (PST)
In-Reply-To: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>

Add support for mct clock lookup and setup to ensure that the mct clock
is has been turned on.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/mct.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index 71e1502..843856f 100644
--- a/arch/arm/mach-exynos/mct.c
+++ b/arch/arm/mach-exynos/mct.c
@@ -488,7 +488,12 @@ static struct local_timer_ops exynos4_mct_tick_ops __cpuinitdata = {
 static void __init exynos4_timer_resources(struct device_node *np)
 {
 #ifdef CONFIG_COMMON_CLK
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
