From: dron0gus@gmail.com
Subject: [PATCH 2/2] ARM: S3C64XX: Staticly define parent clock of "camera" clock
Date: Sat, 10 Nov 2012 18:07:57 +0400
Message-ID: <509e6047.a766980a.0f91.14f6@mx.google.com>
References: <1352556477-3700-1-git-send-email-y>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:33975 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356Ab2KJOKQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Nov 2012 09:10:16 -0500
Received: by mail-la0-f46.google.com with SMTP id h6so3612105lag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Nov 2012 06:10:16 -0800 (PST)
In-Reply-To: <1352556477-3700-1-git-send-email-y>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
Cc: sylvester.nawrocki@gmail.com, Andrey Gusakov <dron_gus@mail.ru>, Andrey Gusakov <dron0gus@gmail.com>

From: Andrey Gusakov <dron_gus@mail.ru>

The "camera" clock have only one parent. Define it staticly and
remove unused source clock list.

Signed-off-by: Andrey Gusakov <dron0gus@gmail.com>
---
 arch/arm/mach-s3c64xx/clock.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index b2d08fa..19228f3 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -677,15 +677,6 @@ static struct clksrc_sources clkset_audio2 = {
 	.nr_sources	= ARRAY_SIZE(clkset_audio2_list),
 };
 
-static struct clk *clkset_camif_list[] = {
-	&clk_h2,
-};
-
-static struct clksrc_sources clkset_camif = {
-	.sources	= clkset_camif_list,
-	.nr_sources	= ARRAY_SIZE(clkset_camif_list),
-};
-
 static struct clk *clkset_mfc_list[] = {
 	&clk_h2,
 	&clk_mout_epll.clk,
@@ -750,10 +741,9 @@ static struct clksrc_clk clksrcs[] = {
 			.name		= "camera",
 			.ctrlbit        = S3C_CLKCON_SCLK_CAM,
 			.enable		= s3c64xx_sclk_ctrl,
+			.parent		= &clk_h2,
 		},
 		.reg_div	= { .reg = S3C_CLK_DIV0, .shift = 20, .size = 4  },
-		.reg_src	= { .reg = NULL, .shift = 0, .size = 0  },
-		.sources	= &clkset_camif,
 	}, {
 		.clk	= {
 			.name		= "sclk_mfc",
-- 
1.7.0.4
