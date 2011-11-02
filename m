From: Padmavathi Venna <padma.v@samsung.com>
Subject: [RESEND][PATCH 6/6] ARM: SAMSUNG: Remove SPI bus clocks from platform
 data
Date: Wed, 02 Nov 2011 17:09:33 -0400
Message-ID: <1320268173-4756-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19054 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752630Ab1KBLO4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 07:14:56 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU1005OW5WSX3Z0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2011 20:14:52 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU100GIX5WLN150@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2011 20:14:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk

SPI bus clocks can be avoided passing through platform
data as spi driver is getting the bus clock using the
generic clock connection id registered via clkdev.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-s3c64xx/dev-spi.c                  |    7 -------
 arch/arm/mach-s5p64x0/dev-spi.c                  |    6 ------
 arch/arm/mach-s5pc100/dev-spi.c                  |    7 -------
 arch/arm/mach-s5pv210/dev-spi.c                  |    6 ------
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 --
 5 files changed, 0 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dev-spi.c b/arch/arm/mach-s3c64xx/dev-spi.c
index 5e6b420..86fb130 100644
--- a/arch/arm/mach-s3c64xx/dev-spi.c
+++ b/arch/arm/mach-s3c64xx/dev-spi.c
@@ -23,12 +23,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/devs.h>
 
-static char *spi_src_clks[] = {
-	[S3C64XX_SPI_SRCCLK_PCLK] = "pclk",
-	[S3C64XX_SPI_SRCCLK_SPIBUS] = "spi-bus",
-	[S3C64XX_SPI_SRCCLK_48M] = "spi_48m",
-};
-
 /* SPI Controller platform_devices */
 
 /* Since we emulate multi-cs capability, we do not touch the GPC-3,7.
@@ -175,5 +169,4 @@ void __init s3c64xx_spi_set_info(int cntrlr, int src_clk_nr, int num_cs)
 
 	pd->num_cs = num_cs;
 	pd->src_clk_nr = src_clk_nr;
-	pd->src_clk_name = spi_src_clks[src_clk_nr];
 }
diff --git a/arch/arm/mach-s5p64x0/dev-spi.c b/arch/arm/mach-s5p64x0/dev-spi.c
index 1fd9c79..5b5d3c0 100644
--- a/arch/arm/mach-s5p64x0/dev-spi.c
+++ b/arch/arm/mach-s5p64x0/dev-spi.c
@@ -25,11 +25,6 @@
 #include <plat/s3c64xx-spi.h>
 #include <plat/gpio-cfg.h>
 
-static char *s5p64x0_spi_src_clks[] = {
-	[S5P64X0_SPI_SRCCLK_PCLK] = "pclk",
-	[S5P64X0_SPI_SRCCLK_SCLK] = "sclk_spi",
-};
-
 /* SPI Controller platform_devices */
 
 /* Since we emulate multi-cs capability, we do not touch the CS.
@@ -220,5 +215,4 @@ void __init s5p64x0_spi_set_info(int cntrlr, int src_clk_nr, int num_cs)
 
 	pd->num_cs = num_cs;
 	pd->src_clk_nr = src_clk_nr;
-	pd->src_clk_name = s5p64x0_spi_src_clks[src_clk_nr];
 }
diff --git a/arch/arm/mach-s5pc100/dev-spi.c b/arch/arm/mach-s5pc100/dev-spi.c
index e5d6c4d..155f50d 100644
--- a/arch/arm/mach-s5pc100/dev-spi.c
+++ b/arch/arm/mach-s5pc100/dev-spi.c
@@ -21,12 +21,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/irqs.h>
 
-static char *spi_src_clks[] = {
-	[S5PC100_SPI_SRCCLK_PCLK] = "pclk",
-	[S5PC100_SPI_SRCCLK_48M] = "spi_48m",
-	[S5PC100_SPI_SRCCLK_SPIBUS] = "spi_bus",
-};
-
 /* SPI Controller platform_devices */
 
 /* Since we emulate multi-cs capability, we do not touch the CS.
@@ -223,5 +217,4 @@ void __init s5pc100_spi_set_info(int cntrlr, int src_clk_nr, int num_cs)
 
 	pd->num_cs = num_cs;
 	pd->src_clk_nr = src_clk_nr;
-	pd->src_clk_name = spi_src_clks[src_clk_nr];
 }
diff --git a/arch/arm/mach-s5pv210/dev-spi.c b/arch/arm/mach-s5pv210/dev-spi.c
index eaf9a7b..39bef19 100644
--- a/arch/arm/mach-s5pv210/dev-spi.c
+++ b/arch/arm/mach-s5pv210/dev-spi.c
@@ -20,11 +20,6 @@
 #include <plat/s3c64xx-spi.h>
 #include <plat/gpio-cfg.h>
 
-static char *spi_src_clks[] = {
-	[S5PV210_SPI_SRCCLK_PCLK] = "pclk",
-	[S5PV210_SPI_SRCCLK_SCLK] = "sclk_spi",
-};
-
 /* SPI Controller platform_devices */
 
 /* Since we emulate multi-cs capability, we do not touch the CS.
@@ -171,5 +166,4 @@ void __init s5pv210_spi_set_info(int cntrlr, int src_clk_nr, int num_cs)
 
 	pd->num_cs = num_cs;
 	pd->src_clk_nr = src_clk_nr;
-	pd->src_clk_name = spi_src_clks[src_clk_nr];
 }
diff --git a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
index 4c16fa3..c3d82a5 100644
--- a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
+++ b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
@@ -31,7 +31,6 @@ struct s3c64xx_spi_csinfo {
 /**
  * struct s3c64xx_spi_info - SPI Controller defining structure
  * @src_clk_nr: Clock source index for the CLK_CFG[SPI_CLKSEL] field.
- * @src_clk_name: Platform name of the corresponding clock.
  * @clk_from_cmu: If the SPI clock/prescalar control block is present
  *     by the platform's clock-management-unit and not in SPI controller.
  * @num_cs: Number of CS this controller emulates.
@@ -43,7 +42,6 @@ struct s3c64xx_spi_csinfo {
  */
 struct s3c64xx_spi_info {
 	int src_clk_nr;
-	char *src_clk_name;
 	bool clk_from_cmu;
 
 	int num_cs;
-- 
1.7.4.4
