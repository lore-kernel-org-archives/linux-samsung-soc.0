From: dron0gus@gmail.com
Subject: [PATCH 1/2] ARM: S3C64XX: Remove duplicated camera clock
Date: Sat, 10 Nov 2012 18:07:56 +0400
Message-ID: <509e602f.a766980a.0f91.14f4@mx.google.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:33975 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356Ab2KJOJy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Nov 2012 09:09:54 -0500
Received: by mail-la0-f46.google.com with SMTP id h6so3612105lag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Nov 2012 06:09:52 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
Cc: sylvester.nawrocki@gmail.com, Andrey Gusakov <dron_gus@mail.ru>, Andrey Gusakov <dron0gus@gmail.com>

From: Andrey Gusakov <dron_gus@mail.ru>

Camera clock defined two times. One in init_clocks_off array with
"cam" name, second in clksrcs array with "camera" name. Leave
second definition because clock have divider.

Signed-off-by: Andrey Gusakov <dron0gus@gmail.com>
---
 arch/arm/mach-s3c64xx/clock.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index cacbe45..b2d08fa 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -319,10 +319,6 @@ static struct clk init_clocks_off[] = {
 		.enable		= s3c64xx_sclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_SCLK_MFC,
 	}, {
-		.name		= "cam",
-		.enable		= s3c64xx_sclk_ctrl,
-		.ctrlbit	= S3C_CLKCON_SCLK_CAM,
-	}, {
 		.name		= "sclk_jpeg",
 		.enable		= s3c64xx_sclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_SCLK_JPEG,
-- 
1.7.0.4
