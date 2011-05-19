From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 5/7] ARM: S5PC100: Add clkdev support
Date: Fri, 20 May 2011 02:48:24 +0530
Message-ID: <1305839906-1815-6-git-send-email-thomas.ab@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12928 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932627Ab1ESVLZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 17:11:25 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG00BKZO6OS4F0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:24 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00EO5O6MUX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:24 +0900 (KST)
In-reply-to: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Add clkdev support for Samsung's s5pc100 platforms.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-s5pc100/clock.c               |   42 ++++++++++++++++++++++++++-
 arch/arm/mach-s5pc100/include/mach/clkdev.h |    7 ++++
 3 files changed, 49 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-s5pc100/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 33ad464..b329ee4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -753,6 +753,7 @@ config ARCH_S5PC100
 	bool "Samsung S5PC100"
 	select GENERIC_GPIO
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select CPU_V7
 	select ARM_L1_CACHE_SHIFT_6
 	select ARCH_USES_GETTIMEOFFSET
diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
index 0305e9b..2cad06c 100644
--- a/arch/arm/mach-s5pc100/clock.c
+++ b/arch/arm/mach-s5pc100/clock.c
@@ -453,18 +453,21 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.2",
 		.id		= 2,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_0_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.1",
 		.id		= 1,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_0_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.0",
 		.id		= 0,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_0_ctrl,
@@ -489,12 +492,14 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "pdma",
+		.devname	= "s3c-pl330.1",
 		.id		= 1,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_0_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "pdma",
+		.devname	= "s3c-pl330.0",
 		.id		= 0,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_0_ctrl,
@@ -513,18 +518,21 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "fimc",
+		.devname	= "s5p-fimc.0",
 		.id		= 0,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_1_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "fimc",
+		.devname	= "s5p-fimc.1",
 		.id		= 1,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_1_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "fimc",
+		.devname	= "s5p-fimc.2",
 		.id		= 2,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_1_ctrl,
@@ -549,7 +557,7 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "g3d",
-		.id		= 0,
+		.id		= -1,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_0_ctrl,
 		.ctrlbit	= (1 << 8),
@@ -615,30 +623,35 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 9),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c2440-i2c.0",
 		.id		= 0,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c2440-i2c.1",
 		.id		= 1,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.2",
 		.id		= 2,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
@@ -675,18 +688,21 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 13),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.0",
 		.id		= 0,
 		.parent		= &clk_div_pclkd1.clk,
 		.enable		= s5pc100_d1_5_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.1",
 		.id		= 1,
 		.parent		= &clk_div_pclkd1.clk,
 		.enable		= s5pc100_d1_5_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.2",
 		.id		= 2,
 		.parent		= &clk_div_pclkd1.clk,
 		.enable		= s5pc100_d1_5_ctrl,
@@ -699,12 +715,14 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "pcm",
+		.devname	= "samsung-pcm.0",
 		.id		= 0,
 		.parent		= &clk_div_pclkd1.clk,
 		.enable		= s5pc100_d1_5_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "pcm",
+		.devname	= "samsung-pcm.1",
 		.id		= 1,
 		.parent		= &clk_div_pclkd1.clk,
 		.enable		= s5pc100_d1_5_ctrl,
@@ -729,36 +747,42 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 8),
 	}, {
 		.name		= "spi_48m",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.parent		= &clk_mout_48m.clk,
 		.enable		= s5pc100_sclk0_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "spi_48m",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.parent		= &clk_mout_48m.clk,
 		.enable		= s5pc100_sclk0_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
 		.name		= "spi_48m",
+		.devname	= "s3c64xx-spi.2",
 		.id		= 2,
 		.parent		= &clk_mout_48m.clk,
 		.enable		= s5pc100_sclk0_ctrl,
 		.ctrlbit	= (1 << 9),
 	}, {
 		.name		= "mmc_48m",
+		.devname	= "sdhci-s3c.0",
 		.id		= 0,
 		.parent		= &clk_mout_48m.clk,
 		.enable		= s5pc100_sclk0_ctrl,
 		.ctrlbit	= (1 << 15),
 	}, {
 		.name		= "mmc_48m",
+		.devname	= "sdhci-s3c.1",
 		.id		= 1,
 		.parent		= &clk_mout_48m.clk,
 		.enable		= s5pc100_sclk0_ctrl,
 		.ctrlbit	= (1 << 16),
 	}, {
 		.name		= "mmc_48m",
+		.devname	= "sdhci-s3c.2",
 		.id		= 2,
 		.parent		= &clk_mout_48m.clk,
 		.enable		= s5pc100_sclk0_ctrl,
@@ -836,6 +860,7 @@ struct clksrc_sources clk_src_group3 = {
 static struct clksrc_clk clk_sclk_audio0 = {
 	.clk	= {
 		.name		= "sclk_audio",
+		.devname	= "samsung-pcm.0",
 		.id		= 0,
 		.ctrlbit	= (1 << 8),
 		.enable		= s5pc100_sclk1_ctrl,
@@ -862,6 +887,7 @@ struct clksrc_sources clk_src_group4 = {
 static struct clksrc_clk clk_sclk_audio1 = {
 	.clk	= {
 		.name		= "sclk_audio",
+		.devname	= "samsung-pcm.1",
 		.id		= 1,
 		.ctrlbit	= (1 << 9),
 		.enable		= s5pc100_sclk1_ctrl,
@@ -887,6 +913,7 @@ struct clksrc_sources clk_src_group5 = {
 static struct clksrc_clk clk_sclk_audio2 = {
 	.clk	= {
 		.name		= "sclk_audio",
+		.devname	= "samsung-pcm.2",
 		.id		= 2,
 		.ctrlbit	= (1 << 10),
 		.enable		= s5pc100_sclk1_ctrl,
@@ -1027,6 +1054,7 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.0",
 			.id		= 0,
 			.ctrlbit	= (1 << 4),
 			.enable		= s5pc100_sclk0_ctrl,
@@ -1038,6 +1066,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.1",
 			.id		= 1,
 			.ctrlbit	= (1 << 5),
 			.enable		= s5pc100_sclk0_ctrl,
@@ -1049,6 +1078,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.2",
 			.id		= 2,
 			.ctrlbit	= (1 << 6),
 			.enable		= s5pc100_sclk0_ctrl,
@@ -1092,6 +1122,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
+			.devname	= "s5p-fimc.0",
 			.id		= 0,
 			.ctrlbit	= (1 << 1),
 			.enable		= s5pc100_sclk1_ctrl,
@@ -1103,6 +1134,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
+			.devname	= "s5p-fimc.1",
 			.id		= 1,
 			.ctrlbit	= (1 << 2),
 			.enable		= s5pc100_sclk1_ctrl,
@@ -1114,6 +1146,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
+			.devname	= "s5p-fimc.2",
 			.id		= 2,
 			.ctrlbit	= (1 << 3),
 			.enable		= s5pc100_sclk1_ctrl,
@@ -1125,6 +1158,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.0",
 			.id		= 0,
 			.ctrlbit	= (1 << 12),
 			.enable		= s5pc100_sclk1_ctrl,
@@ -1136,6 +1170,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.1",
 			.id		= 1,
 			.ctrlbit	= (1 << 13),
 			.enable		= s5pc100_sclk1_ctrl,
@@ -1147,6 +1182,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.2",
 			.id		= 2,
 			.ctrlbit	= (1 << 14),
 			.enable		= s5pc100_sclk1_ctrl,
@@ -1339,24 +1375,28 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.0",
 		.id		= 0,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.1",
 		.id		= 1,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.2",
 		.id		= 2,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.3",
 		.id		= 3,
 		.parent		= &clk_div_d1_bus.clk,
 		.enable		= s5pc100_d1_4_ctrl,
diff --git a/arch/arm/mach-s5pc100/include/mach/clkdev.h b/arch/arm/mach-s5pc100/include/mach/clkdev.h
new file mode 100644
index 0000000..1247f5e
--- /dev/null
+++ b/arch/arm/mach-s5pc100/include/mach/clkdev.h
@@ -0,0 +1,7 @@
+#ifndef __MACH_EXYNOS4_CLKDEV_H__
+#define __MACH_EXYNOS4_CLKDEV_H__
+
+#define __clk_get(clk) ({ 1; })
+#define __clk_put(clk) do { } while (0)
+
+#endif
-- 
1.6.6.rc2
