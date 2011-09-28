From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH] S3C2443: Add devname for hsmmc1 pclk
Date: Wed, 28 Sep 2011 21:59:34 +0200
Message-ID: <201109282159.35240.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:43307 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753490Ab1I1T7p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 15:59:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

S3C2443 uses hsmmc1 as its only hsmmc device and for S3C2416/2450 it's
the second hsmmc channel with the same PCLKCON bit.
The hsmmc-if clocks on both systems already got a devname, as did the
hsmmc pclk for hsmmc0 on the S3C2416.
So to make it possible to identify the hsmmc1 pclk on S3C2416 add the
correct devname for it. The sclk name on S3C2443 also is s3c-sdhci.1.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-s3c24xx/s3c2443-clock.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/plat-s3c24xx/s3c2443-clock.c
index b4b2fa1..6408650 100644
--- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2443-clock.c
@@ -416,6 +416,7 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= S3C2443_HCLKCON_DMA5,
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.1",
 		.parent		= &clk_h,
 		.enable		= s3c2443_clkcon_enable_h,
 		.ctrlbit	= S3C2443_HCLKCON_HSMMC,
-- 
1.7.2.3
