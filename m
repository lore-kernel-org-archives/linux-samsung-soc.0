From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 4/4] S3C2443: Add hsspi-clock from pclk and rename unused S3C2443 hsspi sclk
Date: Sun, 28 Aug 2011 20:11:59 +0200
Message-ID: <201108282011.59948.heiko@sntech.de>
References: <201108282006.31667.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:34166 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751591Ab1H1SMG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Aug 2011 14:12:06 -0400
In-Reply-To: <201108282006.31667.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

This clock is common to S3C2443/2416/2450.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Changes since v1: rename s3c2443 hsspi sclk (until now unused)
 arch/arm/mach-s3c2443/clock.c         |    2 +-
 arch/arm/plat-s3c24xx/s3c2443-clock.c |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index 966bde5..6b9ae46 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -169,7 +169,7 @@ static struct clksrc_clk clk_arm = {
 
 static struct clksrc_clk clk_hsspi = {
 	.clk	= {
-		.name		= "hsspi",
+		.name		= "hsspi-if",
 		.parent		= &clk_esysclk.clk,
 		.ctrlbit	= S3C2443_SCLKCON_HSSPICLK,
 		.enable		= s3c2443_clkcon_enable_s,
diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/plat-s3c24xx/s3c2443-clock.c
index 8132939..2e8492c 100644
--- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2443-clock.c
@@ -259,6 +259,11 @@ static struct clk init_clocks_off[] = {
 		.enable		= s3c2443_clkcon_enable_p,
 		.ctrlbit	= S3C2443_PCLKCON_IIS,
 	}, {
+		.name		= "hsspi",
+		.parent		= &clk_p,
+		.enable		= s3c2443_clkcon_enable_p,
+		.ctrlbit	= S3C2443_PCLKCON_HSSPI,
+	}, {
 		.name		= "adc",
 		.parent		= &clk_p,
 		.enable		= s3c2443_clkcon_enable_p,
-- 
1.7.2.3
