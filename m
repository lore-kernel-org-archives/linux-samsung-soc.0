From: jassisinghbrar@gmail.com
Subject: [PATCH 2/4] S3C64XX DSP: Added PCLK clock source for the PCM controllers
Date: Mon,  2 Nov 2009 11:09:49 +0900
Message-ID: <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57290 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753579AbZKBCMu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Nov 2009 21:12:50 -0500
In-Reply-To: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/plat-s3c64xx/clock.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c64xx/clock.c b/arch/arm/plat-s3c64xx/clock.c
index 7a36e89..3ab564e 100644
--- a/arch/arm/plat-s3c64xx/clock.c
+++ b/arch/arm/plat-s3c64xx/clock.c
@@ -129,6 +129,18 @@ static struct clk init_clocks_disable[] = {
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_IIS1,
 	}, {
+		.name		= "pcm",
+		.id		= 0,
+		.parent		= &clk_p,
+		.enable		= s3c64xx_pclk_ctrl,
+		.ctrlbit	= S3C_CLKCON_PCLK_PCM0,
+	}, {
+		.name		= "pcm",
+		.id		= 1,
+		.parent		= &clk_p,
+		.enable		= s3c64xx_pclk_ctrl,
+		.ctrlbit	= S3C_CLKCON_PCLK_PCM1,
+	}, {
 		.name		= "spi",
 		.id		= 0,
 		.parent		= &clk_p,
-- 
1.6.2.5
