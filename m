From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 4/7] ARM: S5P64X0: Add clkdev support
Date: Fri, 20 May 2011 02:48:23 +0530
Message-ID: <1305839906-1815-5-git-send-email-thomas.ab@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62395 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932606Ab1ESVLY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 17:11:24 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG004X4O6LW8D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:23 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00EO5O6MUX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:23 +0900 (KST)
In-reply-to: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Add clkdev support for Samsung's s5p64x0 platforms.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-s5p64x0/clock-s5p6440.c       |   20 ++++++++++++++++++++
 arch/arm/mach-s5p64x0/clock-s5p6450.c       |   19 +++++++++++++++++++
 arch/arm/mach-s5p64x0/include/mach/clkdev.h |    7 +++++++
 arch/arm/plat-s5p/s5p-time.c                |    9 +++++++++
 5 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e0a62fe..33ad464 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -729,6 +729,7 @@ config ARCH_S5P64X0
 	select CPU_V6
 	select GENERIC_GPIO
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select GENERIC_CLOCKEVENTS
 	select HAVE_SCHED_CLOCK
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index 9f12c2e..8e77738 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -160,18 +160,21 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.0",
 		.id		= 0,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.1",
 		.id		= 1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.2",
 		.id		= 2,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
@@ -244,12 +247,14 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
@@ -262,6 +267,7 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 25),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.0",
 		.id		= 0,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
@@ -292,30 +298,35 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 31),
 	}, {
 		.name		= "sclk_spi_48",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 22),
 	}, {
 		.name		= "sclk_spi_48",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 23),
 	}, {
 		.name		= "mmc_48m",
+		.devname	= "sdhci-s3c.0",
 		.id		= 0,
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 27),
 	}, {
 		.name		= "mmc_48m",
+		.devname	= "sdhci-s3c.1",
 		.id		= 1,
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 28),
 	}, {
 		.name		= "mmc_48m",
+		.devname	= "sdhci-s3c.2",
 		.id		= 2,
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
@@ -341,24 +352,28 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.0",
 		.id		= 0,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.1",
 		.id		= 1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.2",
 		.id		= 2,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.3",
 		.id		= 3,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
@@ -420,6 +435,7 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.0",
 			.id		= 0,
 			.ctrlbit	= (1 << 24),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -430,6 +446,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.1",
 			.id		= 1,
 			.ctrlbit	= (1 << 25),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -440,6 +457,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.2",
 			.id		= 2,
 			.ctrlbit	= (1 << 26),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -460,6 +478,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.0",
 			.id		= 0,
 			.ctrlbit	= (1 << 20),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -470,6 +489,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.1",
 			.id		= 1,
 			.ctrlbit	= (1 << 21),
 			.enable		= s5p64x0_sclk_ctrl,
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index 4eec457..bd8adb7 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -196,18 +196,21 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.0",
 		.id		= 0,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.1",
 		.id		= 1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "hsmmc",
+		.devname	= "sdhci-s3c.2",
 		.id		= 2,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
@@ -244,42 +247,49 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c2440-i2c.0",
 		.id		= 0,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.0",
 		.id		= 0,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "spi",
+		.devname	= "s3c64xx-spi.1",
 		.id		= 1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 22),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.0",
 		.id		= 0,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 26),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.1",
 		.id		= 1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 15),
 	}, {
 		.name		= "iis",
+		.devname	= "samsung-i2s.2",
 		.id		= 2,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 16),
 	}, {
 		.name		= "i2c",
+		.devname	= "s3c2440-i2c.1",
 		.id		= 1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
@@ -311,24 +321,28 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.0",
 		.id		= 0,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.1",
 		.id		= 1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.2",
 		.id		= 2,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "uart",
+		.devname	= "s3c6400-uart.3",
 		.id		= 3,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
@@ -435,6 +449,7 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.0",
 			.id		= 0,
 			.ctrlbit	= (1 << 24),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -445,6 +460,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.1",
 			.id		= 1,
 			.ctrlbit	= (1 << 25),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -455,6 +471,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
+			.devname	= "sdhci-s3c.2",
 			.id		= 2,
 			.ctrlbit	= (1 << 26),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -475,6 +492,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.0",
 			.id		= 0,
 			.ctrlbit	= (1 << 20),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -485,6 +503,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
+			.devname	= "s3c64xx-spi.1",
 			.id		= 1,
 			.ctrlbit	= (1 << 21),
 			.enable		= s5p64x0_sclk_ctrl,
diff --git a/arch/arm/mach-s5p64x0/include/mach/clkdev.h b/arch/arm/mach-s5p64x0/include/mach/clkdev.h
new file mode 100644
index 0000000..1247f5e
--- /dev/null
+++ b/arch/arm/mach-s5p64x0/include/mach/clkdev.h
@@ -0,0 +1,7 @@
+#ifndef __MACH_EXYNOS4_CLKDEV_H__
+#define __MACH_EXYNOS4_CLKDEV_H__
+
+#define __clk_get(clk) ({ 1; })
+#define __clk_put(clk) do { } while (0)
+
+#endif
diff --git a/arch/arm/plat-s5p/s5p-time.c b/arch/arm/plat-s5p/s5p-time.c
index 8090403..d9efd29 100644
--- a/arch/arm/plat-s5p/s5p-time.c
+++ b/arch/arm/plat-s5p/s5p-time.c
@@ -408,6 +408,7 @@ static void __init s5p_timer_resources(void)
 
 	unsigned long event_id = timer_source.event_id;
 	unsigned long source_id = timer_source.source_id;
+	char devname[15];
 
 	timerclk = clk_get(NULL, "timers");
 	if (IS_ERR(timerclk))
@@ -415,6 +416,10 @@ static void __init s5p_timer_resources(void)
 
 	clk_enable(timerclk);
 
+	sprintf(devname, "s3c24xx-pwm.%lu", event_id);
+	s3c_device_timer[event_id].id = event_id;
+	s3c_device_timer[event_id].dev.init_name = devname;
+
 	tin_event = clk_get(&s3c_device_timer[event_id].dev, "pwm-tin");
 	if (IS_ERR(tin_event))
 		panic("failed to get pwm-tin clock for event timer");
@@ -425,6 +430,10 @@ static void __init s5p_timer_resources(void)
 
 	clk_enable(tin_event);
 
+	sprintf(devname, "s3c24xx-pwm.%lu", source_id);
+	s3c_device_timer[source_id].id = source_id;
+	s3c_device_timer[source_id].dev.init_name = devname;
+
 	tin_source = clk_get(&s3c_device_timer[source_id].dev, "pwm-tin");
 	if (IS_ERR(tin_source))
 		panic("failed to get pwm-tin clock for source timer");
-- 
1.6.6.rc2
