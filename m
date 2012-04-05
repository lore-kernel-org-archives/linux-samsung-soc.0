From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: SAMSUNG: Use DEFINE_RES_xxx macros for G2D resources
Date: Thu,  5 Apr 2012 09:58:25 +0530
Message-ID: <1333600105-28524-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59017 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752087Ab2DEEgf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 00:36:35 -0400
Received: by pbcun15 with SMTP id un15so1074397pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Apr 2012 21:36:34 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/devs.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index db32ec5..1013a34 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -272,16 +272,8 @@ struct platform_device s5p_device_fimc3 = {
 
 #ifdef CONFIG_S5P_DEV_G2D
 static struct resource s5p_g2d_resource[] = {
-	[0] = {
-		.start	= S5P_PA_G2D,
-		.end	= S5P_PA_G2D + SZ_4K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= IRQ_2D,
-		.end	= IRQ_2D,
-		.flags	= IORESOURCE_IRQ,
-	},
+	[0] = DEFINE_RES_MEM(S5P_PA_G2D, SZ_4K),
+	[1] = DEFINE_RES_IRQ(IRQ_2D),
 };
 
 struct platform_device s5p_device_g2d = {
-- 
1.7.4.1
