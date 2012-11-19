From: Alexander Varnin <fenixk19@mail.ru>
Subject: [PATCH] ARM: S3C2443: SPI clock channel setup is fixed
Date: Tue, 20 Nov 2012 01:55:10 +0400
Message-ID: <50AAAABE.8090607@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030601090600040107090306"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp38.i.mail.ru ([94.100.177.98]:45166 "EHLO smtp38.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752159Ab2KSV4R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 16:56:17 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexander Varnin <fenixk19@mail.ru>, Kukjin Kim <kgene.kim@samsung.com>

This is a multi-part message in MIME format.
--------------030601090600040107090306
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit

Actually, SPI channel 0 on 2443 is mapped to HS SPI controller,
and to enable s3c2410-spi controller, we should power on channel
1 in PCLKCON. There is no channel 0 SPI on s3c2443, so delete its
clock.

Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/clock-s3c2443.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/clock-s3c2443.c
b/arch/arm/mach-s3c24xx/clock-s3c2443.c
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

--------------030601090600040107090306
Content-Type: text/plain; charset=UTF-8;
 name="=?windows-1251?Q?=D7=E0=F1=F2=FC_=E2=EB=EE=E6=E5=ED=ED=EE=E3=EE_=F1=EE?=
 =?windows-1251?Q?=EE=E1=F9=E5=ED=E8=FF?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0*=windows-1251''%D7%E0%F1%F2%FC%20%E2%EB%EE%E6%E5%ED%ED%EE%E3%EE;
 filename*1*=%20%F1%EE%EE%E1%F9%E5%ED%E8%FF


--------------030601090600040107090306--
