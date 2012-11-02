From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Fix up IRQ mapping for balblair on Cragganmore
Date: Fri,  2 Nov 2012 10:38:53 +0000
Message-ID: <1351852733-3346-1-git-send-email-dp@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:47111 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754986Ab2KBKko (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Nov 2012 06:40:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

We are using S3C_EINT(4) instead of S3C_EINT(5).

Change-Id: Ia197069ddc736813f2711c763469eaf655ea58ac
Signed-off-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410-module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index 4744c42..c6d8dba 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -60,7 +60,7 @@ static struct spi_board_info balblair_devs[] = {
 		.bus_num	= 0,
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
-		.irq		= S3C_EINT(5),
+		.irq		= S3C_EINT(4),
 		.controller_data = &wm0010_spi_csinfo,
 		.platform_data = &wm0010_pdata,
 	},
-- 
1.8.0
