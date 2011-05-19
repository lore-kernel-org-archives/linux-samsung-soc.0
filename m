From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 3/7] ARM: S3C64XX: Add clkdev support
Date: Fri, 20 May 2011 02:48:22 +0530
Message-ID: <1305839906-1815-4-git-send-email-thomas.ab@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62395 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932627Ab1ESVLY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 17:11:24 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG004X4O6LW8D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:22 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00EO5O6MUX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:22 +0900 (KST)
In-reply-to: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Add clkdev support for Samsung's s3c64xx platforms.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-s3c64xx/clock.c               |   25 +++++++++++++++++++++++++
 arch/arm/mach-s3c64xx/include/mach/clkdev.h |    7 +++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s3c64xx/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 225f63a..e0a62fe 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -704,6 +704,7 @@ config ARCH_S3C64XX
 	select CPU_V6
 	select ARM_VIC
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select NO_IOPORT
 	select ARCH_USES_GETTIMEOFFSET
 	select ARCH_HAS_CPUFREQ
diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index fdfc4d5..3b6fb54 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -152,18 +152,21 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= S3C_CLKCON_PCLK_IIC,
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c2440-i2c.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C6410_CLKCON_PCLK_I2C1,
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.0",
 		.id		= 0,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_IIS0,
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
@@ -184,42 +187,49 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= S3C_CLKCON_PCLK_KEYPAD,
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_SPI0,
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_SPI1,
 	}, {
 		.name		= "spi_48m",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.parent		= &clk_48m,
 		.enable		= s3c64xx_sclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_SCLK_SPI0_48,
 	}, {
 		.name		= "spi_48m",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.parent		= &clk_48m,
 		.enable		= s3c64xx_sclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_SCLK_SPI1_48,
 	}, {
 		.name		= "48m",
+		.devname	= "s3c-sdhci.0",
 		.id		= 0,
 		.parent		= &clk_48m,
 		.enable		= s3c64xx_sclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_SCLK_MMC0_48,
 	}, {
 		.name		= "48m",
+		.devname	= "s3c-sdhci.1",
 		.id		= 1,
 		.parent		= &clk_48m,
 		.enable		= s3c64xx_sclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_SCLK_MMC1_48,
 	}, {
 		.name		= "48m",
+		.devname	= "s3c-sdhci.2",
 		.id		= 2,
 		.parent		= &clk_48m,
 		.enable		= s3c64xx_sclk_ctrl,
@@ -260,18 +270,21 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= S3C_CLKCON_HCLK_UHOST,
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.0",
 		.id		= 0,
 		.parent		= &clk_h,
 		.enable		= s3c64xx_hclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_HCLK_HSMMC0,
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.1",
 		.id		= 1,
 		.parent		= &clk_h,
 		.enable		= s3c64xx_hclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_HCLK_HSMMC1,
 	}, {
 		.name		= "hsmmc",
+		.devname	= "s3c-sdhci.2",
 		.id		= 2,
 		.parent		= &clk_h,
 		.enable		= s3c64xx_hclk_ctrl,
@@ -290,24 +303,28 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= S3C_CLKCON_PCLK_PWM,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.0",
 		.id		= 0,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_UART0,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_UART1,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.2",
 		.id		= 2,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_UART2,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.3",
 		.id		= 3,
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
@@ -610,6 +627,7 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "mmc_bus",
+			.devname	= "s3c-sdhci.0",
 			.id		= 0,
 			.ctrlbit        = S3C_CLKCON_SCLK_MMC0,
 			.enable		= s3c64xx_sclk_ctrl,
@@ -620,6 +638,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "mmc_bus",
+			.devname	= "s3c-sdhci.1",
 			.id		= 1,
 			.ctrlbit        = S3C_CLKCON_SCLK_MMC1,
 			.enable		= s3c64xx_sclk_ctrl,
@@ -630,6 +649,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "mmc_bus",
+			.devname	= "s3c-sdhci.2",
 			.id		= 2,
 			.ctrlbit        = S3C_CLKCON_SCLK_MMC2,
 			.enable		= s3c64xx_sclk_ctrl,
@@ -661,6 +681,7 @@ static struct clksrc_clk clksrcs[] = {
 /* Where does UCLK0 come from? */
 		.clk	= {
 			.name		= "spi-bus",
+			.devname	= "s3c64xx-spi.0",
 			.id		= 0,
 			.ctrlbit        = S3C_CLKCON_SCLK_SPI0,
 			.enable		= s3c64xx_sclk_ctrl,
@@ -671,6 +692,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "spi-bus",
+			.devname	= "s3c64xx-spi.1",
 			.id		= 1,
 			.ctrlbit        = S3C_CLKCON_SCLK_SPI1,
 			.enable		= s3c64xx_sclk_ctrl,
@@ -681,6 +703,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "audio-bus",
+			.devname	= "samsung-i2s.0",
 			.id		= 0,
 			.ctrlbit        = S3C_CLKCON_SCLK_AUDIO0,
 			.enable		= s3c64xx_sclk_ctrl,
@@ -691,6 +714,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "audio-bus",
+			.devname	= "samsung-i2s.1",
 			.id		= 1,
 			.ctrlbit        = S3C_CLKCON_SCLK_AUDIO1,
 			.enable		= s3c64xx_sclk_ctrl,
@@ -701,6 +725,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "audio-bus",
+			.devname	= "samsung-i2s.2",
 			.id		= 2,
 			.ctrlbit        = S3C6410_CLKCON_SCLK_AUDIO2,
 			.enable		= s3c64xx_sclk_ctrl,
diff --git a/arch/arm/mach-s3c64xx/include/mach/clkdev.h b/arch/arm/mach-s3c64xx/include/mach/clkdev.h
new file mode 100644
index 0000000..1247f5e
--- /dev/null
+++ b/arch/arm/mach-s3c64xx/include/mach/clkdev.h
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
