From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Sun, 19 Jun 2011 23:39:17 +0200
Message-ID: <4DFE6C85.8060306@gmail.com>
References: <1308315708-14958-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020704050409040807060504"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:43252 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752366Ab1FSVjY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 19 Jun 2011 17:39:24 -0400
Received: by ewy4 with SMTP id 4so1035899ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Jun 2011 14:39:22 -0700 (PDT)
In-Reply-To: <1308315708-14958-1-git-send-email-jg1.han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, linux-samsung-soc@vger.kernel.org, Jonghun Han <jonghun.han@samsung.com>, Anand Kumar N <anand.kn@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Inki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

This is a multi-part message in MIME format.
--------------020704050409040807060504
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jingoo,

On 06/17/2011 03:01 PM, Jingoo Han wrote:
> This patch changes clock name for FIMD from "fimd" to "lcd".
> 
> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
> ---
>   arch/arm/mach-exynos4/clock.c |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 871f9d5..12e6853 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -433,12 +433,12 @@ static struct clk init_clocks_off[] = {
>   		.enable		= exynos4_clk_ip_cam_ctrl,
>   		.ctrlbit	= (1<<  3),
>   	}, {
> -		.name		= "fimd",
> +		.name		= "lcd",
>   		.id		= 0,
>   		.enable		= exynos4_clk_ip_lcd0_ctrl,

I think we're inevitably heading to disaster with this kind of implicit
clocks mapping across various SoCs. It is getting harder to figure out
what's going on with every new SoC support added.  
The "fimd" clock in this case (exynos4) is not really a HCLK clock, like,
for instance, in case of s5pv210. But after this patch they would both be 
named "lcd". You cannot set frequency on "fimd" clock, it is only
for gating the bus clock to the LCD controller, right ? Whereas "lcd"
indicates HCLK on s5pv210 and can also be used to generate the LCD pixel
clock.
I know you are not going to use "lcd" clock in the driver for setting up
the pixel clock frequency on exynos4 but it's all confusing this way.

I dug in the datasheets and it looks like the LCD controller's IP main
(bus) clock is named HCLK there and "lcd" throughout the code.

          | LCD controller    |                            |
          | (IP core) clock   | LCD pixel clock            |
----------+------------------------+-----------------------+
s3c2440   |  HCLK (lcd)       | x  |  N/A ?                |
----------+------------------------+-----------------------+
s3c6410   |  HCLK (lcd)       | x  |  LCD                  |
----------+------------------------+-----------------------+
s5pc100   |  HCLK (lcd)       | x  |  SCLK_LCD  (sclk_lcd) |
----------+------------------------+-----------------------+
s5pv210   |  HCLK(_DSYS) (lcd)| x  |  SCLK_FIMD (sclk_fimd)|
----------+-----------------------+-----------------------+
exynos4   |  ?                | -  |  SCLK_FIMD?(sclk_fimd)|
----------+------------------------+-----------------------+

I think we could try to create two clock connection ids to the 
framebuffer device in the first place, e.g. "bus_ck", "pix_ck".
And then think about how handle that in the driver.

But this requires conversion to the omap-style clock registration
method, something like in the attached patch. The patch is only
for s5pv210 and and compile tested only as I didn't have any board
to test it here.
It's based on for-next branch at http://tinyurl.com/6yzravy
I think there might be more issues to convert the old s3c24xx
platforms, nevertheless the attached patch should not affect them.

--
Regards,
Sylwester

--------------020704050409040807060504
Content-Type: text/x-patch;
 name="0001-ARM-S5PV210-Do-not-embed-clk_lookup-and-device-name-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ARM-S5PV210-Do-not-embed-clk_lookup-and-device-name-.pa";
 filename*1="tch"

>From e3941b4fcfb8ce64f43cf7851cfda0af05d99006 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <snjw23@gmail.com>
Date: Sun, 19 Jun 2011 23:28:17 +0200
Subject: [PATCH] ARM: S5PV210: Do not embed clk_lookup and device name in struct clk

- Create the clock tables for registration with clkdev to allow
  mapping of a platform clock name to the device clock connection id;
- Rename s3c_register_clksrc() to s3c_bulk_register_clksrc();
- Add s3c_register_clksrc() function to register single clock
  of struct clksrc_clk type;
- Leave struct clk devname and lookup fields untouched
  for compatibility with other platforms not converted
  in this patch;

Based on arch/arm/mach-omap2/clock*_data.c

Signed-off-by: Sylwester Nawrocki <snjw23@gmail.com>
---
 arch/arm/mach-exynos4/clock.c                     |    4 +-
 arch/arm/mach-s3c2416/clock.c                     |    2 +-
 arch/arm/mach-s3c2443/clock.c                     |    2 +-
 arch/arm/mach-s3c64xx/clock.c                     |    2 +-
 arch/arm/mach-s5p64x0/clock-s5p6440.c             |    4 +-
 arch/arm/mach-s5p64x0/clock-s5p6450.c             |    4 +-
 arch/arm/mach-s5pc100/clock.c                     |    4 +-
 arch/arm/mach-s5pv210/clock.c                     | 1134 ++++++++++++---------
 arch/arm/plat-s3c24xx/s3c2443-clock.c             |    4 +-
 arch/arm/plat-s5p/clock.c                         |   39 +-
 arch/arm/plat-samsung/clock-clksrc.c              |   68 +-
 arch/arm/plat-samsung/clock.c                     |   18 +-
 arch/arm/plat-samsung/include/plat/clock-clksrc.h |   25 +-
 arch/arm/plat-samsung/include/plat/clock.h        |   20 +
 14 files changed, 766 insertions(+), 564 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 937335a..b37d139 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -1301,9 +1301,9 @@ void __init exynos4_register_clocks(void)
 	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
 
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
-		s3c_register_clksrc(sysclks[ptr], 1);
+		s3c_register_clksrc(sysclks[ptr]);
 
-	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
+	s3c_bulk_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
 	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
diff --git a/arch/arm/mach-s3c2416/clock.c b/arch/arm/mach-s3c2416/clock.c
index 21a5e81..a5c154a 100644
--- a/arch/arm/mach-s3c2416/clock.c
+++ b/arch/arm/mach-s3c2416/clock.c
@@ -134,7 +134,7 @@ void __init s3c2416_init_clocks(int xtal)
 	s3c2443_common_init_clocks(xtal, s3c2416_get_pll, s3c2416_fclk_div);
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
-		s3c_register_clksrc(clksrcs[ptr], 1);
+		s3c_register_clksrc(clksrcs[ptr]);
 
 	s3c24xx_register_clock(&hsmmc0_clk);
 
diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index a1a7176..727d0eb 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -343,7 +343,7 @@ void __init s3c2443_init_clocks(int xtal)
 	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
-		s3c_register_clksrc(clksrcs[ptr], 1);
+		s3c_register_clksrc(clksrcs[ptr]);
 
 	/* register clocks from clock array */
 
diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index 8cf39e3..2d89740 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -815,6 +815,6 @@ void __init s3c64xx_register_clocks(unsigned long xtal,
 	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
 
 	s3c24xx_register_clocks(clks1, ARRAY_SIZE(clks1));
-	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
+	s3c_bulk_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_pwmclk_init();
 }
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index 0e9cd30..b4c07a9 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -573,9 +573,9 @@ void __init s5p6440_register_clocks(void)
 	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
 
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
-		s3c_register_clksrc(sysclks[ptr], 1);
+		s3c_register_clksrc(sysclks[ptr]);
 
-	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
+	s3c_bulk_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
 	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index d9dc16c..580bc30 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -624,9 +624,9 @@ void __init s5p6450_register_clocks(void)
 	int ptr;
 
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
-		s3c_register_clksrc(sysclks[ptr], 1);
+		s3c_register_clksrc(sysclks[ptr]);
 
-	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
+	s3c_bulk_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
 	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
index cd248e6..803f0b0 100644
--- a/arch/arm/mach-s5pc100/clock.c
+++ b/arch/arm/mach-s5pc100/clock.c
@@ -1303,9 +1303,9 @@ void __init s5pc100_register_clocks(void)
 	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
 
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
-		s3c_register_clksrc(sysclks[ptr], 1);
+		s3c_register_clksrc(sysclks[ptr]);
 
-	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
+	s3c_bulk_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
 	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index b5c95e6..827f6ac 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -17,6 +17,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/clk.h>
+#include <linux/clkdev.h>
 #include <linux/sysdev.h>
 #include <linux/io.h>
 
@@ -287,215 +288,257 @@ static struct clk_ops clk_fout_apll_ops = {
 	.get_rate	= s5pv210_clk_fout_apll_get_rate,
 };
 
-static struct clk init_clocks_off[] = {
-	{
-		.name		= "pdma",
-		.devname	= "s3c-pl330.0",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip0_ctrl,
-		.ctrlbit	= (1 << 3),
-	}, {
-		.name		= "pdma",
-		.devname	= "s3c-pl330.1",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip0_ctrl,
-		.ctrlbit	= (1 << 4),
-	}, {
-		.name		= "rot",
-		.parent		= &clk_hclk_dsys.clk,
-		.enable		= s5pv210_clk_ip0_ctrl,
-		.ctrlbit	= (1<<29),
-	}, {
-		.name		= "fimc",
-		.devname	= "s5pv210-fimc.0",
-		.parent		= &clk_hclk_dsys.clk,
-		.enable		= s5pv210_clk_ip0_ctrl,
-		.ctrlbit	= (1 << 24),
-	}, {
-		.name		= "fimc",
-		.devname	= "s5pv210-fimc.1",
-		.parent		= &clk_hclk_dsys.clk,
-		.enable		= s5pv210_clk_ip0_ctrl,
-		.ctrlbit	= (1 << 25),
-	}, {
-		.name		= "fimc",
-		.devname	= "s5pv210-fimc.2",
-		.parent		= &clk_hclk_dsys.clk,
-		.enable		= s5pv210_clk_ip0_ctrl,
-		.ctrlbit	= (1 << 26),
-	}, {
-		.name		= "otg",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1<<16),
-	}, {
-		.name		= "usb-host",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1<<17),
-	}, {
-		.name		= "lcd",
-		.parent		= &clk_hclk_dsys.clk,
-		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1<<0),
-	}, {
-		.name		= "cfcon",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1<<25),
-	}, {
-		.name		= "hsmmc",
-		.devname	= "s3c-sdhci.0",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip2_ctrl,
-		.ctrlbit	= (1<<16),
-	}, {
-		.name		= "hsmmc",
-		.devname	= "s3c-sdhci.1",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip2_ctrl,
-		.ctrlbit	= (1<<17),
-	}, {
-		.name		= "hsmmc",
-		.devname	= "s3c-sdhci.2",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip2_ctrl,
-		.ctrlbit	= (1<<18),
-	}, {
-		.name		= "hsmmc",
-		.devname	= "s3c-sdhci.3",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip2_ctrl,
-		.ctrlbit	= (1<<19),
-	}, {
-		.name		= "systimer",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<16),
-	}, {
-		.name		= "watchdog",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<22),
-	}, {
-		.name		= "rtc",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<15),
-	}, {
-		.name		= "i2c",
-		.devname	= "s3c2440-i2c.0",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<7),
-	}, {
-		.name		= "i2c",
-		.devname	= "s3c2440-i2c.1",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1 << 10),
-	}, {
-		.name		= "i2c",
-		.devname	= "s3c2440-i2c.2",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<9),
-	}, {
-		.name		= "spi",
-		.devname	= "s3c64xx-spi.0",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<12),
-	}, {
-		.name		= "spi",
-		.devname	= "s3c64xx-spi.1",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<13),
-	}, {
-		.name		= "spi",
-		.devname	= "s3c64xx-spi.2",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<14),
-	}, {
-		.name		= "timers",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<23),
-	}, {
-		.name		= "adc",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<24),
-	}, {
-		.name		= "keypad",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<21),
-	}, {
-		.name		= "iis",
-		.devname	= "samsung-i2s.0",
-		.parent		= &clk_p,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<4),
-	}, {
-		.name		= "iis",
-		.devname	= "samsung-i2s.1",
-		.parent		= &clk_p,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1 << 5),
-	}, {
-		.name		= "iis",
-		.devname	= "samsung-i2s.2",
-		.parent		= &clk_p,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1 << 6),
-	}, {
-		.name		= "spdif",
-		.parent		= &clk_p,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1 << 0),
-	},
+static struct clk clk_pdma0 = {
+	.name		= "pdma0",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip0_ctrl,
+	.ctrlbit	= (1 << 3),
 };
 
-static struct clk init_clocks[] = {
-	{
-		.name		= "hclk_imem",
-		.parent		= &clk_hclk_msys.clk,
-		.ctrlbit	= (1 << 5),
-		.enable		= s5pv210_clk_ip0_ctrl,
-		.ops		= &clk_hclk_imem_ops,
-	}, {
-		.name		= "uart",
-		.devname	= "s5pv210-uart.0",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1 << 17),
-	}, {
-		.name		= "uart",
-		.devname	= "s5pv210-uart.1",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1 << 18),
-	}, {
-		.name		= "uart",
-		.devname	= "s5pv210-uart.2",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1 << 19),
-	}, {
-		.name		= "uart",
-		.devname	= "s5pv210-uart.3",
-		.parent		= &clk_pclk_psys.clk,
-		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1 << 20),
-	}, {
-		.name		= "sromc",
-		.parent		= &clk_hclk_psys.clk,
-		.enable		= s5pv210_clk_ip1_ctrl,
-		.ctrlbit	= (1 << 26),
-	},
+static struct clk clk_pdma1 = {
+	.name		= "pdma1",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip0_ctrl,
+	.ctrlbit	= (1 << 4),
+};
+
+static struct clk clk_rot = {
+	.name		= "rot",
+	.parent		= &clk_hclk_dsys.clk,
+	.enable		= s5pv210_clk_ip0_ctrl,
+	.ctrlbit	= (1<<29),
+};
+
+static struct clk clk_fimc0 = {
+	.name		= "fimc0",
+	.parent		= &clk_hclk_dsys.clk,
+	.enable		= s5pv210_clk_ip0_ctrl,
+	.ctrlbit	= (1 << 24),
+};
+
+static struct clk clk_fimc1 = {
+	.name		= "fimc1",
+	.parent		= &clk_hclk_dsys.clk,
+	.enable		= s5pv210_clk_ip0_ctrl,
+	.ctrlbit	= (1 << 25),
+};
+
+static struct clk clk_fimc2 = {
+	.name		= "fimc2",
+	.parent		= &clk_hclk_dsys.clk,
+	.enable		= s5pv210_clk_ip0_ctrl,
+	.ctrlbit	= (1 << 26),
+};
+
+static struct clk clk_otg = {
+	.name		= "otg",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip1_ctrl,
+	.ctrlbit	= (1<<16),
+};
+
+static struct clk clk_usb_host = {
+	.name		= "usb-host",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip1_ctrl,
+	.ctrlbit	= (1<<17),
+};
+
+static struct clk clk_lcd = {
+	.name		= "lcd",
+	.parent		= &clk_hclk_dsys.clk,
+	.enable		= s5pv210_clk_ip1_ctrl,
+	.ctrlbit	= (1<<0),
+};
+
+static struct clk clk_cfcon0 = {
+	.name		= "cfcon0",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip1_ctrl,
+	.ctrlbit	= (1<<25),
+};
+
+static struct clk clk_hsmmc0 = {
+	.name		= "hsmmc0",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip2_ctrl,
+	.ctrlbit	= (1<<16),
+};
+
+static struct clk clk_hsmmc1 = {
+	.name		= "hsmmc1",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip2_ctrl,
+	.ctrlbit	= (1<<17),
+};
+
+static struct clk clk_hsmmc2 = {
+	.name		= "hsmmc2",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip2_ctrl,
+	.ctrlbit	= (1<<18),
+};
+
+static struct clk clk_hsmmc3 = {
+	.name		= "hsmmc3",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip2_ctrl,
+	.ctrlbit	= (1<<19),
+};
+
+static struct clk clk_systimer = {
+	.name		= "systimer",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<16),
+};
+
+static struct clk clk_watchdog = {
+	.name		= "watchdog",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<22),
+};
+
+static struct clk clk_rtc = {
+	.name		= "rtc",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<15),
+};
+
+static struct clk clk_i2c0 = {
+	.name		= "i2c0",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<7),
+};
+
+static struct clk clk_i2c1 = {
+	.name		= "i2c1",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1 << 10),
+};
+
+static struct clk clk_i2c2 = {
+	.name		= "i2c2",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<9),
+};
+
+static struct clk clk_spi0 = {
+	.name		= "spi0",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<12),
+};
+
+static struct clk clk_spi1 = {
+	.name		= "spi1",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<13),
+};
+
+static struct clk clk_spi2 = {
+	.name		= "spi2",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<14),
+};
+
+static struct clk clk_timers = {
+	.name		= "timers",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<23),
+};
+
+static struct clk clk_adc = {
+	.name		= "adc",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<24),
+};
+
+static struct clk clk_keypad = {
+	.name		= "keypad",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<21),
+};
+
+static struct clk clk_iis1 = {
+	.name		= "iis1",
+	.parent		= &clk_p,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1<<4),
+};
+
+static struct clk clk_iis2 = {
+	.name		= "iis2",
+	.parent		= &clk_p,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1 << 5),
+};
+
+static struct clk clk_iis3 = {
+	.name		= "iis3",
+	.parent		= &clk_p,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1 << 6),
+};
+
+static struct clk clk_spdif = {
+	.name		= "spdif",
+	.parent		= &clk_p,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1 << 0),
+};
+
+static struct clk hclk_imem = {
+	.name		= "hclk_imem",
+	.parent		= &clk_hclk_msys.clk,
+	.ctrlbit 	= (1 << 5),
+	.enable		= s5pv210_clk_ip0_ctrl,
+	.ops		= &clk_hclk_imem_ops,
+};
+
+static struct clk clk_uart0 = {
+	.name		= "uart0",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1 << 17),
+};
+
+static struct clk clk_uart1 = {
+	.name		= "uart1",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1 << 18),
+};
+
+static struct clk clk_uart2 = {
+	.name		= "uart2",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1 << 19),
+};
+
+static struct clk clk_uart3 = {
+	.name		= "uart3",
+	.parent		= &clk_pclk_psys.clk,
+	.enable		= s5pv210_clk_ip3_ctrl,
+	.ctrlbit	= (1 << 20),
+};
+
+static struct clk clk_sromc = {
+	.name		= "sromc",
+	.parent		= &clk_hclk_psys.clk,
+	.enable		= s5pv210_clk_ip1_ctrl,
+	.ctrlbit	= (1 << 26),
 };
 
 static struct clk *clkset_uart_list[] = {
@@ -607,8 +650,7 @@ static struct clksrc_sources clkset_sclk_audio0 = {
 
 static struct clksrc_clk clk_sclk_audio0 = {
 	.clk		= {
-		.name		= "sclk_audio",
-		.devname	= "soc-audio.0",
+		.name		= "sclk_audio0",
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 24),
 	},
@@ -636,8 +678,7 @@ static struct clksrc_sources clkset_sclk_audio1 = {
 
 static struct clksrc_clk clk_sclk_audio1 = {
 	.clk		= {
-		.name		= "sclk_audio",
-		.devname	= "soc-audio.1",
+		.name		= "sclk_audio1",
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 25),
 	},
@@ -665,8 +706,7 @@ static struct clksrc_sources clkset_sclk_audio2 = {
 
 static struct clksrc_clk clk_sclk_audio2 = {
 	.clk		= {
-		.name		= "sclk_audio",
-		.devname	= "soc-audio.2",
+		.name		= "sclk_audio2",
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 26),
 	},
@@ -749,269 +789,274 @@ static struct clksrc_sources clkset_group2 = {
 	.nr_sources	= ARRAY_SIZE(clkset_group2_list),
 };
 
-static struct clksrc_clk clksrcs[] = {
-	{
-		.clk	= {
-			.name		= "sclk_dmc",
-		},
-		.sources = &clkset_group1,
-		.reg_src = { .reg = S5P_CLK_SRC6, .shift = 24, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV6, .shift = 28, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "sclk_onenand",
-		},
-		.sources = &clkset_sclk_onenand,
-		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 28, .size = 1 },
-		.reg_div = { .reg = S5P_CLK_DIV6, .shift = 12, .size = 3 },
-	}, {
-		.clk	= {
-			.name		= "uclk1",
-			.devname	= "s5pv210-uart.0",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 12),
-		},
-		.sources = &clkset_uart,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 16, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 16, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "uclk1",
-			.devname	= "s5pv210-uart.1",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 13),
-		},
-		.sources = &clkset_uart,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 20, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 20, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "uclk1",
-			.devname	= "s5pv210-uart.2",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 14),
-		},
-		.sources = &clkset_uart,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 24, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 24, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "uclk1",
-			.devname	= "s5pv210-uart.3",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 15),
-		},
-		.sources = &clkset_uart,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 28, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 28, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "sclk_mixer",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 1),
-		},
-		.sources = &clkset_sclk_mixer,
-		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 4, .size = 1 },
-	}, {
-		.clk	= {
-			.name		= "sclk_fimc",
-			.devname	= "s5pv210-fimc.0",
-			.enable		= s5pv210_clk_mask1_ctrl,
-			.ctrlbit	= (1 << 2),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC3, .shift = 12, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 12, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "sclk_fimc",
-			.devname	= "s5pv210-fimc.1",
-			.enable		= s5pv210_clk_mask1_ctrl,
-			.ctrlbit	= (1 << 3),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC3, .shift = 16, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 16, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "sclk_fimc",
-			.devname	= "s5pv210-fimc.2",
-			.enable		= s5pv210_clk_mask1_ctrl,
-			.ctrlbit	= (1 << 4),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC3, .shift = 20, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 20, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_cam",
-			.devname	= "s5pv210-fimc.0",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 3),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 12, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 12, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_cam",
-			.devname	= "s5pv210-fimc.1",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 4),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 16, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 16, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_fimd",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 5),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 20, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 20, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_mmc",
-			.devname	= "s3c-sdhci.0",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 8),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 0, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 0, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_mmc",
-			.devname	= "s3c-sdhci.1",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 9),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 4, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 4, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_mmc",
-			.devname	= "s3c-sdhci.2",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 10),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 8, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 8, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_mmc",
-			.devname	= "s3c-sdhci.3",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 11),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 12, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 12, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_mfc",
-			.enable		= s5pv210_clk_ip0_ctrl,
-			.ctrlbit	= (1 << 16),
-		},
-		.sources = &clkset_group1,
-		.reg_src = { .reg = S5P_CLK_SRC2, .shift = 4, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 4, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_g2d",
-			.enable		= s5pv210_clk_ip0_ctrl,
-			.ctrlbit	= (1 << 12),
-		},
-		.sources = &clkset_group1,
-		.reg_src = { .reg = S5P_CLK_SRC2, .shift = 8, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 8, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_g3d",
-			.enable		= s5pv210_clk_ip0_ctrl,
-			.ctrlbit	= (1 << 8),
-		},
-		.sources = &clkset_group1,
-		.reg_src = { .reg = S5P_CLK_SRC2, .shift = 0, .size = 2 },
-		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 0, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_csis",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 6),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 24, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 28, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_spi",
-			.devname	= "s3c64xx-spi.0",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 16),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC5, .shift = 0, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV5, .shift = 0, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_spi",
-			.devname	= "s3c64xx-spi.1",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 17),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC5, .shift = 4, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV5, .shift = 4, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_pwi",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 29),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC6, .shift = 20, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV6, .shift = 24, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_pwm",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 19),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC5, .shift = 12, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV5, .shift = 12, .size = 4 },
+static struct clksrc_clk cksrc_sclk_dmc = {
+	.clk	= {
+		.name		= "sclk_dmc",
 	},
+	.sources = &clkset_group1,
+	.reg_src = { .reg = S5P_CLK_SRC6, .shift = 24, .size = 2 },
+	.reg_div = { .reg = S5P_CLK_DIV6, .shift = 28, .size = 4 },
 };
 
-/* Clock initialisation code */
-static struct clksrc_clk *sysclks[] = {
-	&clk_mout_apll,
-	&clk_mout_epll,
-	&clk_mout_mpll,
-	&clk_armclk,
-	&clk_hclk_msys,
-	&clk_sclk_a2m,
-	&clk_hclk_dsys,
-	&clk_hclk_psys,
-	&clk_pclk_msys,
-	&clk_pclk_dsys,
-	&clk_pclk_psys,
-	&clk_vpllsrc,
-	&clk_sclk_vpll,
-	&clk_sclk_dac,
-	&clk_sclk_pixel,
-	&clk_sclk_hdmi,
-	&clk_mout_dmc0,
-	&clk_sclk_dmc0,
-	&clk_sclk_audio0,
-	&clk_sclk_audio1,
-	&clk_sclk_audio2,
-	&clk_sclk_spdif,
+static struct clksrc_clk cksrc_sclk_onenand = {
+	.clk	= {
+		.name		= "sclk_onenand",
+	},
+	.sources = &clkset_sclk_onenand,
+	.reg_src = { .reg = S5P_CLK_SRC0, .shift = 28, .size = 1 },
+	.reg_div = { .reg = S5P_CLK_DIV6, .shift = 12, .size = 3 },
+};
+
+static struct clksrc_clk cksrc_uclk0 = {
+	.clk	= {
+		.name		= "uclk0",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 12),
+	},
+	.sources = &clkset_uart,
+	.reg_src = { .reg = S5P_CLK_SRC4, .shift = 16, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 16, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_uclk1 = {
+	.clk		= {
+		.name		= "uclk1",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 13),
+	},
+	.sources = &clkset_uart,
+	.reg_src = { .reg = S5P_CLK_SRC4, .shift = 20, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 20, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_uclk2 = {
+	.clk		= {
+		.name		= "uclk2",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 14),
+	},
+	.sources = &clkset_uart,
+	.reg_src = { .reg = S5P_CLK_SRC4, .shift = 24, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 24, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_uclk3 = {
+	.clk		= {
+		.name		= "uclk3",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 15),
+	},
+	.sources = &clkset_uart,
+	.reg_src = { .reg = S5P_CLK_SRC4, .shift = 28, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 28, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_mixer = {
+	.clk	= {
+		.name		= "sclk_mixer",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 1),
+	},
+	.sources = &clkset_sclk_mixer,
+	.reg_src = { .reg = S5P_CLK_SRC1, .shift = 4, .size = 1 },
+};
+
+static struct clksrc_clk cksrc_sclk_fimc0 = {
+	.clk	= {
+		.name		= "sclk_fimc0",
+		.enable		= s5pv210_clk_mask1_ctrl,
+		.ctrlbit	= (1 << 2),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC3, .shift = 12, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV3, .shift = 12, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_fimc1 = {
+	.clk	= {
+		.name		= "sclk_fimc1",
+		.enable		= s5pv210_clk_mask1_ctrl,
+		.ctrlbit	= (1 << 3),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC3, .shift = 16, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV3, .shift = 16, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_fimc2 = {
+	.clk	= {
+		.name		= "sclk_fimc2",
+		.enable		= s5pv210_clk_mask1_ctrl,
+		.ctrlbit	= (1 << 4),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC3, .shift = 20, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV3, .shift = 20, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_cam0 = {
+	.clk		= {
+		.name		= "sclk_cam0",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 3),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC1, .shift = 12, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV1, .shift = 12, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_cam1 = {
+	.clk		= {
+		.name		= "sclk_cam1",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 4),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC1, .shift = 16, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV1, .shift = 16, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_fimd = {
+	.clk		= {
+		.name		= "sclk_fimd",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 5),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC1, .shift = 20, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV1, .shift = 20, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_mmc0 = {
+	.clk		= {
+		.name		= "sclk_mmc0",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 8),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC4, .shift = 0, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_mmc1 = {
+	.clk		= {
+		.name		= "sclk_mmc1",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 9),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC4, .shift = 4, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 4, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_mmc2 = {
+	.clk		= {
+		.name		= "sclk_mmc2",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 10),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC4, .shift = 8, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 8, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_mmc3 = {
+	.clk		= {
+		.name		= "sclk_mmc3",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 11),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC4, .shift = 12, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 12, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_mfc = {
+	.clk		= {
+		.name		= "sclk_mfc",
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 16),
+	},
+	.sources = &clkset_group1,
+	.reg_src = { .reg = S5P_CLK_SRC2, .shift = 4, .size = 2 },
+	.reg_div = { .reg = S5P_CLK_DIV2, .shift = 4, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_g2d = {
+	.clk		= {
+		.name		= "sclk_g2d",
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 12),
+	},
+	.sources = &clkset_group1,
+	.reg_src = { .reg = S5P_CLK_SRC2, .shift = 8, .size = 2 },
+	.reg_div = { .reg = S5P_CLK_DIV2, .shift = 8, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_g3d = {
+	.clk		= {
+		.name		= "sclk_g3d",
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 8),
+	},
+	.sources = &clkset_group1,
+	.reg_src = { .reg = S5P_CLK_SRC2, .shift = 0, .size = 2 },
+	.reg_div = { .reg = S5P_CLK_DIV2, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_csis = {
+	.clk		= {
+		.name		= "sclk_csis",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 6),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC1, .shift = 24, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV1, .shift = 28, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_spi0 = {
+	.clk		= {
+		.name		= "sclk_spi0",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 16),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC5, .shift = 0, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV5, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_spi1 = {
+	.clk		= {
+		.name		= "sclk_spi1",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 17),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC5, .shift = 4, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV5, .shift = 4, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_pwi = {
+	.clk		= {
+		.name		= "sclk_pwi",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 29),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC6, .shift = 20, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV6, .shift = 24, .size = 4 },
+};
+
+static struct clksrc_clk cksrc_sclk_pwm = {
+	.clk		= {
+		.name		= "sclk_pwm",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 19),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC5, .shift = 12, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV5, .shift = 12, .size = 4 },
 };
 
 static u32 epll_div[][6] = {
@@ -1090,6 +1135,112 @@ static struct clk_ops s5pv210_epll_ops = {
 	.get_rate = s5p_epll_get_rate,
 };
 
+static struct s3c_clk_lk clks[] = {
+	CLK(NULL,		"sclk_hdmi27m",	&clk_sclk_hdmi27m,	0),
+	CLK(NULL,		"sclk_hdmiphy",	&clk_sclk_hdmiphy,	0),
+	CLK(NULL,		"sclk_usbphy0",	&clk_sclk_usbphy0,	0),
+	CLK(NULL,		"sclk_usbphy1",	&clk_sclk_usbphy1,	0),
+	/* FIXME: These clocks are weird, 3 clocks of same name not associated
+	   with any device ? Should be registered at all ? */
+	CLK(NULL,		"pcmcdclk",	&clk_pcmcdclk0,		0),
+	CLK(NULL,		"pcmcdclk",	&clk_pcmcdclk1,		0),
+	CLK(NULL,		"pcmcdclk",	&clk_pcmcdclk2,		0),
+};
+
+static struct s3c_clk_lk init_clocks[] = {
+	CLK(NULL,		"hclk_imem",	&hclk_imem,	0),
+	CLK("s5pv210-uart.0",	"uart",		&clk_uart0,	0),
+	CLK("s5pv210-uart.1",	"uart",		&clk_uart1,	0),
+	CLK("s5pv210-uart.2",	"uart",		&clk_uart2,	0),
+	CLK("s5pv210-uart.3",	"uart",		&clk_uart3,	0),
+	CLK(NULL,		"sromc",	&clk_sromc,	0),
+	CLK("s3c-pl330.0",	"pdma",		&clk_pdma0,	CK_OFF),
+	CLK("s3c-pl330.1",	"pdma",		&clk_pdma1,	CK_OFF),
+	CLK(NULL,		"rot",		&clk_rot,	CK_OFF),
+	CLK("s5pv210-fimc.0",	"fimc",		&clk_fimc0,	CK_OFF),
+	CLK("s5pv210-fimc.1",	"fimc",		&clk_fimc1,	CK_OFF),
+	CLK("s5pv210-fimc.2",	"fimc",		&clk_fimc2,	CK_OFF),
+	CLK(NULL,		"otg",		&clk_otg,	CK_OFF),
+	CLK(NULL,		"usb-host",	&clk_usb_host,	CK_OFF),
+	CLK("s5pv210-fb",	"bus_ck",	&clk_lcd,	CK_OFF),
+	CLK(NULL,		"cfcon",	&clk_cfcon0,	CK_OFF),
+	CLK("s3c-sdhci.0",	"hsmmc",	&clk_hsmmc0,	CK_OFF),
+	CLK("s3c-sdhci.1",	"hsmmc",	&clk_hsmmc1,	CK_OFF),
+	CLK("s3c-sdhci.2",	"hsmmc",	&clk_hsmmc2,	CK_OFF),
+	CLK("s3c-sdhci.3",	"hsmmc",	&clk_hsmmc3,	CK_OFF),
+	CLK(NULL,		"systimer",	&clk_systimer,	CK_OFF),
+	CLK(NULL,		"watchdog",	&clk_watchdog,	CK_OFF),
+	CLK(NULL,		"rtc",		&clk_rtc,	CK_OFF),
+	CLK("s3c2440-i2c.0",	"i2c",		&clk_i2c0,	CK_OFF),
+	CLK("s3c2440-i2c.1",	"i2c",		&clk_i2c1,	CK_OFF),
+	CLK("s3c2440-i2c.2",	"i2c",		&clk_i2c2,	CK_OFF),
+	CLK("s3c64xx-spi.0",	"spi",		&clk_spi0,	CK_OFF),
+	CLK("s3c64xx-spi.1",	"spi",		&clk_spi1,	CK_OFF),
+	CLK("s3c64xx-spi.2",	"spi",		&clk_spi2,	CK_OFF),
+	CLK(NULL,		"timers",	&clk_timers,	CK_OFF),
+	CLK(NULL,		"adc",		&clk_adc,	CK_OFF),
+	CLK(NULL,		"keypad",	&clk_keypad,	CK_OFF),
+	CLK("samsung-i2s.0",	"iis",		&clk_iis1,	CK_OFF),
+	CLK("samsung-i2s.1",	"iis",		&clk_iis2,	CK_OFF),
+	CLK("samsung-i2s.2",	"iis",		&clk_iis3,	CK_OFF),
+	CLK(NULL,		"spdif",	&clk_spdif,	CK_OFF),
+};
+
+static struct s3c_clk_lk sysclks[] = {
+	CLK(NULL,		"mout_apll",	&clk_mout_apll.clk,	0),
+	CLK(NULL,		"mout_epll",	&clk_mout_epll.clk,	0),
+	CLK(NULL,		"mout_mpll",	&clk_mout_mpll.clk,	0),
+	CLK(NULL,		"armclk",	&clk_armclk.clk,	0),
+	CLK(NULL,		"hclk_msys",	&clk_hclk_msys.clk,	0),
+	CLK(NULL,		"sclk_a2m",	&clk_sclk_a2m.clk,	0),
+	CLK(NULL,		"hclk_dsys",	&clk_hclk_dsys.clk,	0),
+	CLK(NULL,		"hclk_psys",	&clk_hclk_psys.clk,	0),
+	CLK(NULL,		"pclk_msys",	&clk_pclk_msys.clk,	0),
+	CLK(NULL,		"pclk_dsys",	&clk_pclk_dsys.clk,	0),
+	CLK(NULL,		"pclk_psys",	&clk_pclk_psys.clk,	0),
+	CLK(NULL,		"vpll_src",	&clk_vpllsrc.clk,	0),
+	CLK(NULL,		"sclk_vpll",	&clk_sclk_vpll.clk,	0),
+	CLK(NULL,		"sclk_dac",	&clk_sclk_dac.clk,	0),
+	CLK(NULL,		"sclk_pixel",	&clk_sclk_pixel.clk,	0),
+	CLK(NULL,		"sclk_hdmi",	&clk_sclk_hdmi.clk,	0),
+	CLK(NULL,		"mout_dmc0",	&clk_mout_dmc0.clk,	0),
+	CLK(NULL,		"sclk_dmc0",	&clk_sclk_dmc0.clk,	0),
+	CLK("soc-audio.0",	"sclk_audio",	&clk_sclk_audio0.clk,	0),
+	CLK("soc-audio.1",	"sclk_audio",	&clk_sclk_audio1.clk,	0),
+	CLK("soc-audio.2",	"sclk_audio",	&clk_sclk_audio2.clk,	0),
+	CLK(NULL,		"sclk_spdif",	&clk_sclk_spdif.clk,	0),
+};
+
+/* Properties of these clocks are logged during the system booting */
+static struct s3c_clk_lk clksrcs[] = {
+	CLK(NULL,		"sclk_dmc",	&cksrc_sclk_dmc.clk,	0),
+	CLK(NULL,		"sclk_onenand",	&cksrc_sclk_onenand.clk, 0),
+	CLK("s5pv210-uart.0",	"uclk1",	&cksrc_uclk0.clk,	0),
+	CLK("s5pv210-uart.1",	"uclk1",	&cksrc_uclk1.clk,	0),
+	CLK("s5pv210-uart.2",	"uclk1",	&cksrc_uclk2.clk,	0),
+	CLK("s5pv210-uart.3",	"uclk1",	&cksrc_uclk3.clk,	0),
+	CLK(NULL,		"sclk_mixer",	&cksrc_sclk_mixer.clk,	0),
+	CLK("s5pv210-fimc.0",	"sclk_fimc",	&cksrc_sclk_fimc0.clk,	0),
+	CLK("s5pv210-fimc.1",	"sclk_fimc",	&cksrc_sclk_fimc1.clk,	0),
+	CLK("s5pv210-fimc.2",	"sclk_fimc",	&cksrc_sclk_fimc2.clk,	0),
+	CLK("s5p-fimc-md",	"sclk_cam0",	&cksrc_sclk_cam0.clk,	0),
+	CLK("s5p-fimc-md",	"sclk_cam1",	&cksrc_sclk_cam1.clk,	0),
+	CLK("s5pv210-fb",	"pix_ck",	&cksrc_sclk_fimd.clk,	0),
+	CLK("s3c-sdhci.0",	"sclk_mmc",	&cksrc_sclk_mmc0.clk,	0),
+	CLK("s3c-sdhci.1",	"sclk_mmc",	&cksrc_sclk_mmc1.clk,	0),
+	CLK("s3c-sdhci.2",	"sclk_mmc",	&cksrc_sclk_mmc2.clk,	0),
+	CLK("s3c-sdhci.3",	"sclk_mmc",	&cksrc_sclk_mmc3.clk,	0),
+	CLK(NULL,		"sclk_mfc",	&cksrc_sclk_mfc.clk,	0),
+	CLK(NULL,		"sclk_g2d",	&cksrc_sclk_g2d.clk,	0),
+	CLK(NULL,		"sclk_g3d",	&cksrc_sclk_g3d.clk,	0),
+	CLK("s5p-mipi-csis",	"sclk_csis",	&cksrc_sclk_csis.clk,	0),
+	CLK("s3c64xx-spi.0",	"sclk_spi",	&cksrc_sclk_spi0.clk,	0),
+	CLK("s3c64xx-spi.1",	"sclk_spi",	&cksrc_sclk_spi1.clk,	0),
+	CLK(NULL,		"sclk_pwi",	&cksrc_sclk_pwi.clk,	0),
+	CLK(NULL,		"sclk_pwm",	&cksrc_sclk_pwm.clk,	0),
+};
+
+/* Clock initialization code */
 void __init_or_cpufreq s5pv210_setup_clocks(void)
 {
 	struct clk *xtal_clk;
@@ -1160,34 +1311,29 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
 	clk_h.rate = hclk_psys;
 	clk_p.rate = pclk_psys;
 
-	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
-		s3c_set_clksrc(&clksrcs[ptr], true);
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++) {
+		struct clksrc_clk *src;
+		src = clk_to_clksrc(clksrcs[ptr].lk.clk);
+		s3c_set_clksrc(src, true);
+	}
 }
 
-static struct clk *clks[] __initdata = {
-	&clk_sclk_hdmi27m,
-	&clk_sclk_hdmiphy,
-	&clk_sclk_usbphy0,
-	&clk_sclk_usbphy1,
-	&clk_pcmcdclk0,
-	&clk_pcmcdclk1,
-	&clk_pcmcdclk2,
-};
-
 void __init s5pv210_register_clocks(void)
 {
-	int ptr;
-
-	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
+	int i;
 
-	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
-		s3c_register_clksrc(sysclks[ptr], 1);
+	for (i = 0; i < ARRAY_SIZE(clks); i++)
+		s3c_register_clock(&clks[i]);
 
-	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
-	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
+	s3c_register_clksrc_table(sysclks, ARRAY_SIZE(sysclks));
+	s3c_register_clksrc_table(clksrcs, ARRAY_SIZE(clksrcs));
 
-	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
-	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
+	for (i = 0; i < ARRAY_SIZE(init_clocks); i++) {
+		struct clk *clk = init_clocks[i].lk.clk;
 
+		s3c_register_clock(&init_clocks[i]);
+		if (init_clocks[i].flags & CK_OFF)
+			(clk->enable)(clk, 0);
+	}
 	s3c_pwmclk_init();
 }
diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/plat-s3c24xx/s3c2443-clock.c
index 59552c0..65a1930 100644
--- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2443-clock.c
@@ -428,9 +428,9 @@ void __init s3c2443_common_init_clocks(int xtal, pll_fn get_mpll,
 	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
-		s3c_register_clksrc(clksrcs[ptr], 1);
+		s3c_register_clksrc(clksrcs[ptr]);
 
-	s3c_register_clksrc(clksrc_clks, ARRAY_SIZE(clksrc_clks));
+	s3c_bulk_register_clksrc(clksrc_clks, ARRAY_SIZE(clksrc_clks));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
 	/* See s3c2443/etc notes on disabling clocks at init time */
diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
index 8d081d9..2d6e6cc 100644
--- a/arch/arm/plat-s5p/clock.c
+++ b/arch/arm/plat-s5p/clock.c
@@ -32,24 +32,20 @@
 */
 struct clk clk_ext_xtal_mux = {
 	.name		= "ext_xtal",
-	.id		= -1,
 };
 
 struct clk clk_xusbxti = {
 	.name		= "xusbxti",
-	.id		= -1,
 };
 
 struct clk s5p_clk_27m = {
 	.name		= "clk_27m",
-	.id		= -1,
 	.rate		= 27000000,
 };
 
 /* 48MHz USB Phy clock output */
 struct clk clk_48m = {
 	.name		= "clk_48m",
-	.id		= -1,
 	.rate		= 48000000,
 };
 
@@ -58,7 +54,6 @@ struct clk clk_48m = {
 */
 struct clk clk_fout_apll = {
 	.name		= "fout_apll",
-	.id		= -1,
 };
 
 /* MPLL clock output
@@ -66,27 +61,23 @@ struct clk clk_fout_apll = {
 */
 struct clk clk_fout_mpll = {
 	.name		= "fout_mpll",
-	.id		= -1,
 };
 
 /* EPLL clock output */
 struct clk clk_fout_epll = {
 	.name		= "fout_epll",
-	.id		= -1,
 	.ctrlbit	= (1 << 31),
 };
 
 /* DPLL clock output */
 struct clk clk_fout_dpll = {
 	.name		= "fout_dpll",
-	.id		= -1,
 	.ctrlbit	= (1 << 31),
 };
 
 /* VPLL clock output */
 struct clk clk_fout_vpll = {
 	.name		= "fout_vpll",
-	.id		= -1,
 	.ctrlbit	= (1 << 31),
 };
 
@@ -136,7 +127,6 @@ struct clksrc_sources clk_src_dpll = {
 
 struct clk clk_vpll = {
 	.name		= "vpll",
-	.id		= -1,
 };
 
 int s5p_gatectrl(void __iomem *reg, struct clk *clk, int enable)
@@ -168,26 +158,25 @@ unsigned long s5p_epll_get_rate(struct clk *clk)
 	return clk->rate;
 }
 
-static struct clk *s5p_clks[] __initdata = {
-	&clk_ext_xtal_mux,
-	&clk_48m,
-	&s5p_clk_27m,
-	&clk_fout_apll,
-	&clk_fout_mpll,
-	&clk_fout_epll,
-	&clk_fout_dpll,
-	&clk_fout_vpll,
-	&clk_vpll,
-	&clk_xusbxti,
+static struct s3c_clk_lk s5p_clks[] = {
+	CLK(NULL,	"ext_xtal",	&clk_ext_xtal_mux,	0),
+	CLK(NULL,	"clk_48m",	&clk_48m,		0),
+	CLK(NULL,	"clk_27m",	&s5p_clk_27m,		0),
+	CLK(NULL,	"fout_pll",	&clk_fout_apll,		0),
+	CLK(NULL,	"fout_mpll",	&clk_fout_mpll,		0),
+	CLK(NULL,	"fout_epll",	&clk_fout_epll,		0),
+	CLK(NULL,	"fout_dpll",	&clk_fout_dpll,		0),
+	CLK(NULL,	"fout_vpll",	&clk_fout_vpll,		0),
+	CLK(NULL,	"vpll",		&clk_vpll,		0),
+	CLK(NULL,	"xusbxti",	&clk_xusbxti,		0),
 };
 
 void __init s5p_register_clocks(unsigned long xtal_freq)
 {
-	int ret;
+	int i;
 
 	clk_ext_xtal_mux.rate = xtal_freq;
 
-	ret = s3c24xx_register_clocks(s5p_clks, ARRAY_SIZE(s5p_clks));
-	if (ret > 0)
-		printk(KERN_ERR "Failed to register s5p clocks\n");
+	for (i = 0; i < ARRAY_SIZE(s5p_clks); i++)
+		s3c_register_clock(&s5p_clks[i]);
 }
diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index ae8b850..ac2cc1a 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -175,38 +175,50 @@ static struct clk_ops clksrc_ops_nosrc = {
 	.round_rate	= s3c_roundrate_clksrc,
 };
 
-void __init s3c_register_clksrc(struct clksrc_clk *clksrc, int size)
+static void __init s3c_init_clksrc(struct clksrc_clk *clksrc)
 {
-	int ret;
+	if (!clksrc->reg_div.reg && !clksrc->reg_src.reg)
+		printk(KERN_ERR "%s: clock %s has no registers set\n",
+		       __func__, clksrc->clk.name);
+
+	/* fill in the default functions */
+	if (!clksrc->clk.ops) {
+		if (!clksrc->reg_div.reg)
+			clksrc->clk.ops = &clksrc_ops_nodiv;
+		else if (!clksrc->reg_src.reg)
+			clksrc->clk.ops = &clksrc_ops_nosrc;
+		else
+			clksrc->clk.ops = &clksrc_ops;
+	}
 
-	for (; size > 0; size--, clksrc++) {
-		if (!clksrc->reg_div.reg && !clksrc->reg_src.reg)
-			printk(KERN_ERR "%s: clock %s has no registers set\n",
-			       __func__, clksrc->clk.name);
-
-		/* fill in the default functions */
-
-		if (!clksrc->clk.ops) {
-			if (!clksrc->reg_div.reg)
-				clksrc->clk.ops = &clksrc_ops_nodiv;
-			else if (!clksrc->reg_src.reg)
-				clksrc->clk.ops = &clksrc_ops_nosrc;
-			else
-				clksrc->clk.ops = &clksrc_ops;
-		}
+	/*
+	 * setup the clocksource, but do not announce it
+	 * as it may be re-set by the setup routines
+	 * called after the rest of the clocks have been
+	 * registered
+	 */
+	s3c_set_clksrc(clksrc, false);
+}
 
-		/* setup the clocksource, but do not announce it
-		 * as it may be re-set by the setup routines
-		 * called after the rest of the clocks have been
-		 * registered
-		 */
-		s3c_set_clksrc(clksrc, false);
+void __init s3c_register_clksrc(struct clksrc_clk *clksrc)
+{
+	s3c_init_clksrc(clksrc);
+	s3c24xx_register_clock(&clksrc->clk);
+}
 
-		ret = s3c24xx_register_clock(&clksrc->clk);
+void __init s3c_bulk_register_clksrc(struct clksrc_clk *clksrc, int size)
+{
+	for (; size > 0; size--, clksrc++) {
+		s3c_init_clksrc(clksrc);
+		s3c24xx_register_clock(&clksrc->clk);
+	}
+}
 
-		if (ret < 0) {
-			printk(KERN_ERR "%s: failed to register %s (%d)\n",
-			       __func__, clksrc->clk.name, ret);
-		}
+void __init s3c_register_clksrc_table(struct s3c_clk_lk *cl, unsigned int size)
+{
+	while (size--) {
+		s3c_init_clksrc(clk_to_clksrc(cl->lk.clk));
+		s3c_register_clock(cl);
+		cl++;
 	}
 }
diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index aecf9e9..f5d052d 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -37,6 +37,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/clk.h>
+#include <linux/clkdev.h>
 #include <linux/spinlock.h>
 #include <linux/io.h>
 #if defined(CONFIG_DEBUG_FS)
@@ -276,6 +277,20 @@ int s3c24xx_register_clock(struct clk *clk)
 }
 
 /**
+ * s3c_register_clock() - register a clock
+ * @lk: The clkdev lookup object associated with the clock @clk
+ *
+ * Add the specified clock to the list of clocks known by the system.
+ */
+void s3c_register_clock(struct s3c_clk_lk *cl)
+{
+	if (cl->lk.clk->enable == NULL)
+		cl->lk.clk->enable = clk_null_enable;
+
+	clkdev_add(&cl->lk);
+}
+
+/**
  * s3c24xx_register_clocks() - register an array of clock pointers
  * @clks: Pointer to an array of struct clk pointers
  * @nr_clks: The number of clocks in the @clks array.
@@ -378,9 +393,8 @@ static int clk_debugfs_register_one(struct clk *c)
 	struct dentry *d, *child, *child_tmp;
 	struct clk *pa = c->parent;
 	char s[255];
-	char *p = s;
 
-	p += sprintf(p, "%s", c->devname);
+	snprintf(s, sizeof(s), "%s", c->devname[0] ? c->devname : c->name);
 
 	d = debugfs_create_dir(s, pa ? pa->dent : clk_debugfs_root);
 	if (!d)
diff --git a/arch/arm/plat-samsung/include/plat/clock-clksrc.h b/arch/arm/plat-samsung/include/plat/clock-clksrc.h
index 50a8ca7..16f5e5e 100644
--- a/arch/arm/plat-samsung/include/plat/clock-clksrc.h
+++ b/arch/arm/plat-samsung/include/plat/clock-clksrc.h
@@ -63,6 +63,8 @@ struct clksrc_clk {
 	struct clksrc_reg	reg_div;
 };
 
+#define clk_to_clksrc(__clk) container_of(__clk, struct clksrc_clk, clk)
+
 /**
  * s3c_set_clksrc() - setup the clock from the register settings
  * @clk: The clock to setup.
@@ -74,10 +76,29 @@ struct clksrc_clk {
 extern void s3c_set_clksrc(struct clksrc_clk *clk, bool announce);
 
 /**
- * s3c_register_clksrc() register clocks from an array of clksrc clocks
+ * s3c_register_clksrc() - register a clock
+ * @clk: The clock to register
+ *
+ * Initialise and register a clock described by @clk.
+ */
+extern void s3c_register_clksrc(struct clksrc_clk *clk);
+
+/**
+ * s3c_bulk_register_clksrc() register clocks from an array of clksrc clocks
  * @srcs: The array of clocks to register
  * @size: The size of the @srcs array.
  *
  * Initialise and register the array of clocks described by @srcs.
  */
-extern void s3c_register_clksrc(struct clksrc_clk *srcs, int size);
+extern void s3c_bulk_register_clksrc(struct clksrc_clk *srcs, int size);
+
+struct s3c_clk_lk;
+/**
+ * s3c_register_clksrc_table() - register an array of clocks
+ * @cl: Pointer to the first clock lookup in the array
+ * @size: Number of clocks to register
+ *
+ * Initialise and register the array of clocks described by @cl.
+ */
+void s3c_register_clksrc_table(struct s3c_clk_lk *cl, unsigned int size);
+
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index 87d5b38..3c9a51a 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -55,6 +55,24 @@ struct clk {
 #endif
 };
 
+#define CK_OFF			(1 << 0)
+#define CK_SRC			(1 << 1)
+
+struct s3c_clk_lk {
+	u16			flags;
+	struct clk_lookup	lk;
+};
+
+#define CLK(dev, con, ck, fl)		\
+	{				\
+		.flags = fl,		\
+		.lk = {			\
+			.dev_id = dev,	\
+			.con_id = con,	\
+			.clk = ck,	\
+		},			\
+	}
+
 /* other clocks which may be registered by board support */
 
 extern struct clk s3c24xx_dclk0;
@@ -121,3 +139,5 @@ extern int s3c64xx_sclk_ctrl(struct clk *clk, int enable);
 
 extern void s3c_pwmclk_init(void);
 
+/* Common clock registration and setup functions */
+void s3c_register_clock(struct s3c_clk_lk *lk);
-- 
1.7.1


--------------020704050409040807060504--
