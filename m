From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 2/7] ARM: S3C24XX: Add clkdev support
Date: Fri, 20 May 2011 02:48:21 +0530
Message-ID: <1305839906-1815-3-git-send-email-thomas.ab@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12916 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932606Ab1ESVLX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 17:11:23 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG00BKZO6OS4F0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:21 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00EO5O6MUX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:21 +0900 (KST)
In-reply-to: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Add clkdev support for Samsung's s3c24xx platforms.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-s3c2412/clock.c               |    3 +++
 arch/arm/mach-s3c2416/clock.c               |    5 +++++
 arch/arm/mach-s3c2443/clock.c               |    4 ++++
 arch/arm/plat-s3c24xx/include/mach/clkdev.h |    7 +++++++
 arch/arm/plat-s3c24xx/s3c2410-clock.c       |    3 +++
 arch/arm/plat-s3c24xx/s3c2443-clock.c       |    4 ++++
 arch/arm/plat-samsung/pwm-clock.c           |   10 ++++++++++
 arch/arm/plat-samsung/time.c                |    2 ++
 9 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s3c24xx/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 377a7a5..225f63a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -686,6 +686,7 @@ config ARCH_S3C2410
 	select GENERIC_GPIO
 	select ARCH_HAS_CPUFREQ
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select ARCH_USES_GETTIMEOFFSET
 	select HAVE_S3C2410_I2C if I2C
 	help
diff --git a/arch/arm/mach-s3c2412/clock.c b/arch/arm/mach-s3c2412/clock.c
index 0c0505b..aff4ee9 100644
--- a/arch/arm/mach-s3c2412/clock.c
+++ b/arch/arm/mach-s3c2412/clock.c
@@ -557,18 +557,21 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= S3C2412_CLKCON_PWMT,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2412-uart.0",
 		.id		= 0,
 		.parent		= &clk_p,
 		.enable		= s3c2412_clkcon_enable,
 		.ctrlbit	= S3C2412_CLKCON_UART0,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2412-uart.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s3c2412_clkcon_enable,
 		.ctrlbit	= S3C2412_CLKCON_UART1,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2412-uart.2",
 		.id		= 2,
 		.parent		= &clk_p,
 		.enable		= s3c2412_clkcon_enable,
diff --git a/arch/arm/mach-s3c2416/clock.c b/arch/arm/mach-s3c2416/clock.c
index 3b02d85..60b98a9 100644
--- a/arch/arm/mach-s3c2416/clock.c
+++ b/arch/arm/mach-s3c2416/clock.c
@@ -42,6 +42,7 @@ static struct clksrc_clk hsmmc_div[] = {
 	[0] = {
 		.clk = {
 			.name	= "hsmmc-div",
+			.devname	= "s3c-sdhci.0",
 			.id	= 0,
 			.parent	= &clk_esysclk.clk,
 		},
@@ -50,6 +51,7 @@ static struct clksrc_clk hsmmc_div[] = {
 	[1] = {
 		.clk = {
 			.name	= "hsmmc-div",
+			.devname	= "s3c-sdhci.1",
 			.id	= 1,
 			.parent	= &clk_esysclk.clk,
 		},
@@ -62,6 +64,7 @@ static struct clksrc_clk hsmmc_mux[] = {
 		.clk	= {
 			.id	= 0,
 			.name	= "hsmmc-if",
+			.devname	= "s3c-sdhci.0",
 			.ctrlbit = (1 << 6),
 			.enable = s3c2443_clkcon_enable_s,
 		},
@@ -78,6 +81,7 @@ static struct clksrc_clk hsmmc_mux[] = {
 		.clk	= {
 			.id	= 1,
 			.name	= "hsmmc-if",
+			.devname	= "s3c-sdhci.1",
 			.ctrlbit = (1 << 12),
 			.enable = s3c2443_clkcon_enable_s,
 		},
@@ -94,6 +98,7 @@ static struct clksrc_clk hsmmc_mux[] = {
 
 static struct clk hsmmc0_clk = {
 	.name		= "hsmmc",
+	.devname	= "s3c-sdhci.0",
 	.id		= 0,
 	.parent		= &clk_h,
 	.enable		= s3c2443_clkcon_enable_h,
diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index f4ec6d5..3486955 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -196,6 +196,7 @@ static struct clksrc_clk clk_hsspi = {
 static struct clksrc_clk clk_hsmmc_div = {
 	.clk	= {
 		.name		= "hsmmc-div",
+		.devname	= "s3c-sdhci.1",
 		.id		= 1,
 		.parent		= &clk_esysclk.clk,
 	},
@@ -231,6 +232,7 @@ static int s3c2443_enable_hsmmc(struct clk *clk, int enable)
 
 static struct clk clk_hsmmc = {
 	.name		= "hsmmc-if",
+	.devname	= "s3c-sdhci.1",
 	.id		= 1,
 	.parent		= &clk_hsmmc_div.clk,
 	.enable		= s3c2443_enable_hsmmc,
@@ -300,12 +302,14 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= S3C2443_PCLKCON_IIS,
 	}, {
 		.name		= "spi",
+		.devname	= "s3c2410-spi.0",
 		.id		= 0,
 		.parent		= &clk_p,
 		.enable		= s3c2443_clkcon_enable_p,
 		.ctrlbit	= S3C2443_PCLKCON_SPI0,
 	}, {
 		.name		= "spi",
+		.devname	= "s3c2410-spi.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s3c2443_clkcon_enable_p,
diff --git a/arch/arm/plat-s3c24xx/include/mach/clkdev.h b/arch/arm/plat-s3c24xx/include/mach/clkdev.h
new file mode 100644
index 0000000..1247f5e
--- /dev/null
+++ b/arch/arm/plat-s3c24xx/include/mach/clkdev.h
@@ -0,0 +1,7 @@
+#ifndef __MACH_EXYNOS4_CLKDEV_H__
+#define __MACH_EXYNOS4_CLKDEV_H__
+
+#define __clk_get(clk) ({ 1; })
+#define __clk_put(clk) do { } while (0)
+
+#endif
diff --git a/arch/arm/plat-s3c24xx/s3c2410-clock.c b/arch/arm/plat-s3c24xx/s3c2410-clock.c
index 9ecc5d9..b84dea0 100644
--- a/arch/arm/plat-s3c24xx/s3c2410-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2410-clock.c
@@ -160,18 +160,21 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= S3C2410_CLKCON_PWMT,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2410-uart.0",
 		.id		= 0,
 		.parent		= &clk_p,
 		.enable		= s3c2410_clkcon_enable,
 		.ctrlbit	= S3C2410_CLKCON_UART0,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2410-uart.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s3c2410_clkcon_enable,
 		.ctrlbit	= S3C2410_CLKCON_UART1,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2410-uart.2",
 		.id		= 2,
 		.parent		= &clk_p,
 		.enable		= s3c2410_clkcon_enable,
diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/plat-s3c24xx/s3c2443-clock.c
index 82f2d4a..818781e 100644
--- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2443-clock.c
@@ -320,24 +320,28 @@ static struct clk init_clocks[] = {
 		.ctrlbit	= S3C2443_HCLKCON_SSMC,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2440-uart.0",
 		.id		= 0,
 		.parent		= &clk_p,
 		.enable		= s3c2443_clkcon_enable_p,
 		.ctrlbit	= S3C2443_PCLKCON_UART0,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2440-uart.1",
 		.id		= 1,
 		.parent		= &clk_p,
 		.enable		= s3c2443_clkcon_enable_p,
 		.ctrlbit	= S3C2443_PCLKCON_UART1,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2440-uart.2",
 		.id		= 2,
 		.parent		= &clk_p,
 		.enable		= s3c2443_clkcon_enable_p,
 		.ctrlbit	= S3C2443_PCLKCON_UART2,
 	}, {
 		.name		= "uart",
+		.devname	= "s3c2440-uart.3",
 		.id		= 3,
 		.parent		= &clk_p,
 		.enable		= s3c2443_clkcon_enable_p,
diff --git a/arch/arm/plat-samsung/pwm-clock.c b/arch/arm/plat-samsung/pwm-clock.c
index 46c9381..f1bba88 100644
--- a/arch/arm/plat-samsung/pwm-clock.c
+++ b/arch/arm/plat-samsung/pwm-clock.c
@@ -268,6 +268,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[0]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.0",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[0],
 		},
@@ -275,6 +276,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[1]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.1",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[0],
 		}
@@ -282,6 +284,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[2]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.2",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[1],
 		},
@@ -289,6 +292,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[3]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.3",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[1],
 		},
@@ -296,6 +300,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	[4]	= {
 		.clk	= {
 			.name	= "pwm-tdiv",
+			.devname	= "s3c24xx-pwm.4",
 			.ops	= &clk_tdiv_ops,
 			.parent	= &clk_timer_scaler[1],
 		},
@@ -361,26 +366,31 @@ static struct clk_ops clk_tin_ops = {
 static struct clk clk_tin[] = {
 	[0]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.0",
 		.id	= 0,
 		.ops	= &clk_tin_ops,
 	},
 	[1]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.1",
 		.id	= 1,
 		.ops	= &clk_tin_ops,
 	},
 	[2]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.2",
 		.id	= 2,
 		.ops	= &clk_tin_ops,
 	},
 	[3]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.3",
 		.id	= 3,
 		.ops	= &clk_tin_ops,
 	},
 	[4]	= {
 		.name	= "pwm-tin",
+		.devname	= "s3c24xx-pwm.4",
 		.id	= 4,
 		.ops	= &clk_tin_ops,
 	},
diff --git a/arch/arm/plat-samsung/time.c b/arch/arm/plat-samsung/time.c
index 2231d80..e3bb806 100644
--- a/arch/arm/plat-samsung/time.c
+++ b/arch/arm/plat-samsung/time.c
@@ -259,6 +259,8 @@ static void __init s3c2410_timer_resources(void)
 	clk_enable(timerclk);
 
 	if (!use_tclk1_12()) {
+		tmpdev.id = 4;
+		tmpdev.dev.init_name = "s3c24xx-pwm.4";
 		tin = clk_get(&tmpdev.dev, "pwm-tin");
 		if (IS_ERR(tin))
 			panic("failed to get pwm-tin clock for system timer");
-- 
1.6.6.rc2
