From: Jassi Brar <jassi.brar@samsung.com>
Subject: [PATCH 2/6] S3C64XX SPI: Define SPI-48M clock sources
Date: Sat, 21 Nov 2009 11:52:04 +0900
Message-ID: <1258771924-14152-1-git-send-email-jassi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38611 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754186AbZKUC5E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2009 21:57:04 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

Defined special 48MHz clock sources for SPI-0,1.

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/plat-s3c64xx/clock.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c64xx/clock.c b/arch/arm/plat-s3c64xx/clock.c
index 7a36e89..7b9d79c 100644
--- a/arch/arm/plat-s3c64xx/clock.c
+++ b/arch/arm/plat-s3c64xx/clock.c
@@ -141,6 +141,18 @@ static struct clk init_clocks_disable[] = {
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_SPI1,
 	}, {
+		.name		= "spi_48m",
+		.id		= 0,
+		.parent		= &clk_48m,
+		.enable		= s3c64xx_sclk_ctrl,
+		.ctrlbit	= S3C_CLKCON_SCLK_SPI0_48,
+	}, {
+		.name		= "spi_48m",
+		.id		= 1,
+		.parent		= &clk_48m,
+		.enable		= s3c64xx_sclk_ctrl,
+		.ctrlbit	= S3C_CLKCON_SCLK_SPI1_48,
+	}, {
 		.name		= "48m",
 		.id		= 0,
 		.parent		= &clk_48m,
-- 
1.6.2.5
