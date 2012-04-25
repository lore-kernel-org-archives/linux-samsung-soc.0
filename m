From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 01/33] ARM: SAMSUNG: devs: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:11 +0530
Message-ID: <1335327163-11794-2-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:44854 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753214Ab2DYEVz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:21:55 -0400
Received: by dadz8 with SMTP id z8so1811908dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:21:55 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org

CC: Kukjin Kim <kgene.kim@samsung.com>
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
