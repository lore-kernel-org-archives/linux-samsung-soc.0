From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 05/33] ARM: EXYNOS: mach-smdkv310: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:15 +0530
Message-ID: <1335327163-11794-6-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:44854 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416Ab2DYEWL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:22:11 -0400
Received: by mail-pz0-f51.google.com with SMTP id z8so1811908dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:22:10 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org

CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-smdkv310.c |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index f7b6e12..4f18e82 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -179,16 +179,9 @@ static struct s3c_fb_platdata smdkv310_lcd0_pdata __initdata = {
 };
 
 static struct resource smdkv310_smsc911x_resources[] = {
-	[0] = {
-		.start	= EXYNOS4_PA_SROM_BANK(1),
-		.end	= EXYNOS4_PA_SROM_BANK(1) + SZ_64K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= IRQ_EINT(5),
-		.end	= IRQ_EINT(5),
-		.flags	= IORESOURCE_IRQ | IRQF_TRIGGER_LOW,
-	},
+	[0] = DEFINE_RES_MEM(EXYNOS4_PA_SROM_BANK(1), SZ_64K),
+	[1] = DEFINE_RES_NAMED(IRQ_EINT(5), 1, NULL, IORESOURCE_IRQ \
+						| IRQF_TRIGGER_LOW),
 };
 
 static struct smsc911x_platform_config smsc9215_config = {
-- 
1.7.4.1
