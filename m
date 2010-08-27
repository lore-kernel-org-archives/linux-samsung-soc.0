From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Removing unused codes
Date: Fri, 27 Aug 2010 20:22:40 +0900
Message-ID: <1282908160-9631-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58940 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983Ab0H0LjT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Aug 2010 07:39:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch removes following unused codes.

arch/arm/plat-samsung/adc.c:438: warning: unused variable 'flags'
arch/arm/mach-s5pv210/clock.c:176: warning: 's5pv210_clk_ip4_ctrl' defined but not used

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |    5 -----
 arch/arm/plat-samsung/adc.c   |    1 -
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index af91fef..10a3934 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -173,11 +173,6 @@ static int s5pv210_clk_ip3_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLKGATE_IP3, clk, enable);
 }
 
-static int s5pv210_clk_ip4_ctrl(struct clk *clk, int enable)
-{
-	return s5p_gatectrl(S5P_CLKGATE_IP4, clk, enable);
-}
-
 static int s5pv210_clk_mask0_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_CLK_SRC_MASK0, clk, enable);
diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index 04d9521..e8f2be2 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -435,7 +435,6 @@ static int s3c_adc_suspend(struct platform_device *pdev, pm_message_t state)
 static int s3c_adc_resume(struct platform_device *pdev)
 {
 	struct adc_device *adc = platform_get_drvdata(pdev);
-	unsigned long flags;
 
 	clk_enable(adc->clk);
 	enable_irq(adc->irq);
-- 
1.6.2.5
