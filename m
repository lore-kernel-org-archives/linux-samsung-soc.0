From: Alexander Varnin <fenixk19@mail.ru>
Subject: [PATCH] ARM: S3C2443: SPI clock channel setup is fixed
Date: Mon, 19 Nov 2012 18:33:57 +0400
Message-ID: <1353335637-29879-1-git-send-email-fenixk19@mail.ru>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback5.mail.ru ([94.100.176.59]:54727 "EHLO
	fallback5.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751778Ab2KSOx6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 09:53:58 -0500
Received: from smtp40.i.mail.ru (smtp40.i.mail.ru [94.100.177.100])
	by fallback5.mail.ru (mPOP.Fallback_MX) with ESMTP id 3FC2CC308199
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Nov 2012 18:33:22 +0400 (MSK)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexander Varnin <fenixk19@mail.ru>

Actually, SPI channel 0 on 2443 is mapped to HS SPI controller,
and to enable s3c2410-spi controller, we should power on channel
1 in PCLKCON. There is no channel 0 SPI on s3c2443, so delete its
clock.

Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 arch/arm/mach-s3c24xx/clock-s3c2443.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/clock-s3c2443.c b/arch/arm/mach-s3c24xx/clock-s3c2443.c
index 7f689ce..bdaba59 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c2443.c
@@ -158,12 +158,6 @@ static struct clk init_clocks_off[] = {
 		.devname	= "s3c2410-spi.0",
 		.parent		= &clk_p,
 		.enable		= s3c2443_clkcon_enable_p,
-		.ctrlbit	= S3C2443_PCLKCON_SPI0,
-	}, {
-		.name		= "spi",
-		.devname	= "s3c2410-spi.1",
-		.parent		= &clk_p,
-		.enable		= s3c2443_clkcon_enable_p,
 		.ctrlbit	= S3C2443_PCLKCON_SPI1,
 	}
 };
-- 
1.7.2.5
