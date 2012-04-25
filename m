From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 33/33] ARM: S5PV210: mach-smdkv210: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:43 +0530
Message-ID: <1335327163-11794-34-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:36558 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754489Ab2DYEYb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:24:31 -0400
Received: by mail-pz0-f51.google.com with SMTP id z8so1813007dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:24:30 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org

CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s5pv210/mach-smdkv210.c |   19 ++++---------------
 1 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 91d4ad8..fa1b612 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -119,21 +119,10 @@ static struct samsung_keypad_platdata smdkv210_keypad_data __initdata = {
 };
 
 static struct resource smdkv210_dm9000_resources[] = {
-	[0] = {
-		.start	= S5PV210_PA_SROM_BANK5,
-		.end	= S5PV210_PA_SROM_BANK5,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= S5PV210_PA_SROM_BANK5 + 2,
-		.end	= S5PV210_PA_SROM_BANK5 + 2,
-		.flags	= IORESOURCE_MEM,
-	},
-	[2] = {
-		.start	= IRQ_EINT(9),
-		.end	= IRQ_EINT(9),
-		.flags	= IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHLEVEL,
-	},
+	[0] = DEFINE_RES_MEM(S5PV210_PA_SROM_BANK5, 1),
+	[1] = DEFINE_RES_MEM(S5PV210_PA_SROM_BANK5 + 2, 1),
+	[2] = DEFINE_RES_NAMED(IRQ_EINT(9), 1, NULL, IORESOURCE_IRQ \
+				| IORESOURCE_IRQ_HIGHLEVEL),
 };
 
 static struct dm9000_plat_data smdkv210_dm9000_platdata = {
-- 
1.7.4.1
