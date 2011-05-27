From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 6/7] ARM: S5PV210: Add clkdev support
Date: Fri, 27 May 2011 20:56:35 +0530
Message-ID: <1306509996-30280-7-git-send-email-thomas.ab@samsung.com>
References: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11682 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753040Ab1E0PT1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 11:19:27 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLV00AJ9180Y240@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 May 2011 00:19:26 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLV00IAA17ZX8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 May 2011 00:19:26 +0900 (KST)
In-reply-to: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Add clkdev support for Samsung's s5pv210 platform.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-s5pv210/clock.c               |  130 ++++++++------------------
 arch/arm/mach-s5pv210/include/mach/clkdev.h |    7 ++
 3 files changed, 48 insertions(+), 90 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b329ee4..8d010f2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -769,6 +769,7 @@ config ARCH_S5PV210
 	select ARCH_SPARSEMEM_ENABLE
 	select GENERIC_GPIO
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select ARM_L1_CACHE_SHIFT_6
 	select ARCH_HAS_CPUFREQ
 	select GENERIC_CLOCKEVENTS
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 2d59949..cf74205 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -36,7 +36,6 @@ static unsigned long xtal;
 static struct clksrc_clk clk_mout_apll = {
 	.clk	= {
 		.name		= "mout_apll",
-		.id		= -1,
 	},
 	.sources	= &clk_src_apll,
 	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
@@ -45,7 +44,6 @@ static struct clksrc_clk clk_mout_apll = {
 static struct clksrc_clk clk_mout_epll = {
 	.clk	= {
 		.name		= "mout_epll",
-		.id		= -1,
 	},
 	.sources	= &clk_src_epll,
 	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 8, .size = 1 },
@@ -54,7 +52,6 @@ static struct clksrc_clk clk_mout_epll = {
 static struct clksrc_clk clk_mout_mpll = {
 	.clk = {
 		.name		= "mout_mpll",
-		.id		= -1,
 	},
 	.sources	= &clk_src_mpll,
 	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 4, .size = 1 },
@@ -73,7 +70,6 @@ static struct clksrc_sources clkset_armclk = {
 static struct clksrc_clk clk_armclk = {
 	.clk	= {
 		.name		= "armclk",
-		.id		= -1,
 	},
 	.sources	= &clkset_armclk,
 	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 16, .size = 1 },
@@ -83,7 +79,6 @@ static struct clksrc_clk clk_armclk = {
 static struct clksrc_clk clk_hclk_msys = {
 	.clk	= {
 		.name		= "hclk_msys",
-		.id		= -1,
 		.parent		= &clk_armclk.clk,
 	},
 	.reg_div	= { .reg = S5P_CLK_DIV0, .shift = 8, .size = 3 },
@@ -92,7 +87,6 @@ static struct clksrc_clk clk_hclk_msys = {
 static struct clksrc_clk clk_pclk_msys = {
 	.clk	= {
 		.name		= "pclk_msys",
-		.id		= -1,
 		.parent		= &clk_hclk_msys.clk,
 	},
 	.reg_div        = { .reg = S5P_CLK_DIV0, .shift = 12, .size = 3 },
@@ -101,7 +95,6 @@ static struct clksrc_clk clk_pclk_msys = {
 static struct clksrc_clk clk_sclk_a2m = {
 	.clk	= {
 		.name		= "sclk_a2m",
-		.id		= -1,
 		.parent		= &clk_mout_apll.clk,
 	},
 	.reg_div	= { .reg = S5P_CLK_DIV0, .shift = 4, .size = 3 },
@@ -120,7 +113,6 @@ static struct clksrc_sources clkset_hclk_sys = {
 static struct clksrc_clk clk_hclk_dsys = {
 	.clk	= {
 		.name	= "hclk_dsys",
-		.id	= -1,
 	},
 	.sources	= &clkset_hclk_sys,
 	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 20, .size = 1 },
@@ -130,7 +122,6 @@ static struct clksrc_clk clk_hclk_dsys = {
 static struct clksrc_clk clk_pclk_dsys = {
 	.clk	= {
 		.name	= "pclk_dsys",
-		.id	= -1,
 		.parent	= &clk_hclk_dsys.clk,
 	},
 	.reg_div = { .reg = S5P_CLK_DIV0, .shift = 20, .size = 3 },
@@ -139,7 +130,6 @@ static struct clksrc_clk clk_pclk_dsys = {
 static struct clksrc_clk clk_hclk_psys = {
 	.clk	= {
 		.name	= "hclk_psys",
-		.id	= -1,
 	},
 	.sources	= &clkset_hclk_sys,
 	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 24, .size = 1 },
@@ -149,7 +139,6 @@ static struct clksrc_clk clk_hclk_psys = {
 static struct clksrc_clk clk_pclk_psys = {
 	.clk	= {
 		.name	= "pclk_psys",
-		.id	= -1,
 		.parent	= &clk_hclk_psys.clk,
 	},
 	.reg_div        = { .reg = S5P_CLK_DIV0, .shift = 28, .size = 3 },
@@ -187,38 +176,31 @@ static int s5pv210_clk_mask1_ctrl(struct clk *clk, int enable)
 
 static struct clk clk_sclk_hdmi27m = {
 	.name		= "sclk_hdmi27m",
-	.id		= -1,
 	.rate		= 27000000,
 };
 
 static struct clk clk_sclk_hdmiphy = {
 	.name		= "sclk_hdmiphy",
-	.id		= -1,
 };
 
 static struct clk clk_sclk_usbphy0 = {
 	.name		= "sclk_usbphy0",
-	.id		= -1,
 };
 
 static struct clk clk_sclk_usbphy1 = {
 	.name		= "sclk_usbphy1",
-	.id		= -1,
 };
 
 static struct clk clk_pcmcdclk0 = {
 	.name		= "pcmcdclk",
-	.id		= -1,
 };
 
 static struct clk clk_pcmcdclk1 = {
 	.name		= "pcmcdclk",
-	.id		= -1,
 };
 
 static struct clk clk_pcmcdclk2 = {
 	.name		= "pcmcdclk",
-	.id		= -1,
 };
 
 static struct clk *clkset_vpllsrc_list[] = {
@@ -234,7 +216,6 @@ static struct clksrc_sources clkset_vpllsrc = {
 static struct clksrc_clk clk_vpllsrc = {
 	.clk	= {
 		.name		= "vpll_src",
-		.id		= -1,
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 7),
 	},
@@ -255,7 +236,6 @@ static struct clksrc_sources clkset_sclk_vpll = {
 static struct clksrc_clk clk_sclk_vpll = {
 	.clk	= {
 		.name		= "sclk_vpll",
-		.id		= -1,
 	},
 	.sources	= &clkset_sclk_vpll,
 	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 12, .size = 1 },
@@ -276,7 +256,6 @@ static struct clksrc_sources clkset_moutdmc0src = {
 static struct clksrc_clk clk_mout_dmc0 = {
 	.clk	= {
 		.name		= "mout_dmc0",
-		.id		= -1,
 	},
 	.sources	= &clkset_moutdmc0src,
 	.reg_src	= { .reg = S5P_CLK_SRC6, .shift = 24, .size = 2 },
@@ -285,7 +264,6 @@ static struct clksrc_clk clk_mout_dmc0 = {
 static struct clksrc_clk clk_sclk_dmc0 = {
 	.clk	= {
 		.name		= "sclk_dmc0",
-		.id		= -1,
 		.parent		= &clk_mout_dmc0.clk,
 	},
 	.reg_div	= { .reg = S5P_CLK_DIV6, .shift = 28, .size = 4 },
@@ -312,181 +290,169 @@ static struct clk_ops clk_fout_apll_ops = {
 static struct clk init_clocks_off[] = {
 	{
 		.name		= "pdma",
-		.id		= 0,
+		.devname	= "s3c-pl330.0",
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "pdma",
-		.id		= 1,
+		.devname	= "s3c-pl330.1",
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "rot",
-		.id		= -1,
 		.parent		= &clk_hclk_dsys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1<<29),
 	}, {
 		.name		= "fimc",
-		.id		= 0,
+		.devname	= "s5pv210-fimc.0",
 		.parent		= &clk_hclk_dsys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 24),
 	}, {
 		.name		= "fimc",
-		.id		= 1,
+		.devname	= "s5pv210-fimc.1",
 		.parent		= &clk_hclk_dsys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 25),
 	}, {
 		.name		= "fimc",
-		.id		= 2,
+		.devname	= "s5pv210-fimc.2",
 		.parent		= &clk_hclk_dsys.clk,
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 26),
 	}, {
 		.name		= "otg",
-		.id		= -1,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1<<16),
 	}, {
 		.name		= "usb-host",
-		.id		= -1,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1<<17),
 	}, {
 		.name		= "lcd",
-		.id		= -1,
 		.parent		= &clk_hclk_dsys.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1<<0),
 	}, {
 		.name		= "cfcon",
-		.id		= 0,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1<<25),
 	}, {
 		.name		= "hsmmc",
-		.id		= 0,
+		.devname	= "s3c-sdhci.0",
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
 		.ctrlbit	= (1<<16),
 	}, {
 		.name		= "hsmmc",
-		.id		= 1,
+		.devname	= "s3c-sdhci.1",
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
 		.ctrlbit	= (1<<17),
 	}, {
 		.name		= "hsmmc",
-		.id		= 2,
+		.devname	= "s3c-sdhci.2",
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
 		.ctrlbit	= (1<<18),
 	}, {
 		.name		= "hsmmc",
-		.id		= 3,
+		.devname	= "s3c-sdhci.3",
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip2_ctrl,
 		.ctrlbit	= (1<<19),
 	}, {
 		.name		= "systimer",
-		.id		= -1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<16),
 	}, {
 		.name		= "watchdog",
-		.id		= -1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<22),
 	}, {
 		.name		= "rtc",
-		.id		= -1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<15),
 	}, {
 		.name		= "i2c",
-		.id		= 0,
+		.devname	= "s3c2440-i2c.0",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<7),
 	}, {
 		.name		= "i2c",
-		.id		= 1,
+		.devname	= "s3c2440-i2c.1",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 10),
 	}, {
 		.name		= "i2c",
-		.id		= 2,
+		.devname	= "s3c2440-i2c.2",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<9),
 	}, {
 		.name		= "spi",
-		.id		= 0,
+		.devname	= "s3c64xx-spi.0",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<12),
 	}, {
 		.name		= "spi",
-		.id		= 1,
+		.devname	= "s3c64xx-spi.1",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<13),
 	}, {
 		.name		= "spi",
-		.id		= 2,
+		.devname	= "s3c64xx-spi.2",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<14),
 	}, {
 		.name		= "timers",
-		.id		= -1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<23),
 	}, {
 		.name		= "adc",
-		.id		= -1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<24),
 	}, {
 		.name		= "keypad",
-		.id		= -1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<21),
 	}, {
 		.name		= "iis",
-		.id		= 0,
+		.devname	= "samsung-i2s.0",
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<4),
 	}, {
 		.name		= "iis",
-		.id		= 1,
+		.devname	= "samsung-i2s.1",
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "iis",
-		.id		= 2,
+		.devname	= "samsung-i2s.2",
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "spdif",
-		.id		= -1,
 		.parent		= &clk_p,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 0),
@@ -496,38 +462,36 @@ static struct clk init_clocks_off[] = {
 static struct clk init_clocks[] = {
 	{
 		.name		= "hclk_imem",
-		.id		= -1,
 		.parent		= &clk_hclk_msys.clk,
 		.ctrlbit	= (1 << 5),
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ops		= &clk_hclk_imem_ops,
 	}, {
 		.name		= "uart",
-		.id		= 0,
+		.devname	= "s5pv210-uart.0",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "uart",
-		.id		= 1,
+		.devname	= "s5pv210-uart.1",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "uart",
-		.id		= 2,
+		.devname	= "s5pv210-uart.2",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 19),
 	}, {
 		.name		= "uart",
-		.id		= 3,
+		.devname	= "s5pv210-uart.3",
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 20),
 	}, {
 		.name		= "sromc",
-		.id		= -1,
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1 << 26),
@@ -579,7 +543,6 @@ static struct clksrc_sources clkset_sclk_dac = {
 static struct clksrc_clk clk_sclk_dac = {
 	.clk		= {
 		.name		= "sclk_dac",
-		.id		= -1,
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 2),
 	},
@@ -590,7 +553,6 @@ static struct clksrc_clk clk_sclk_dac = {
 static struct clksrc_clk clk_sclk_pixel = {
 	.clk		= {
 		.name		= "sclk_pixel",
-		.id		= -1,
 		.parent		= &clk_sclk_vpll.clk,
 	},
 	.reg_div	= { .reg = S5P_CLK_DIV1, .shift = 0, .size = 4},
@@ -609,7 +571,6 @@ static struct clksrc_sources clkset_sclk_hdmi = {
 static struct clksrc_clk clk_sclk_hdmi = {
 	.clk		= {
 		.name		= "sclk_hdmi",
-		.id		= -1,
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 0),
 	},
@@ -647,7 +608,7 @@ static struct clksrc_sources clkset_sclk_audio0 = {
 static struct clksrc_clk clk_sclk_audio0 = {
 	.clk		= {
 		.name		= "sclk_audio",
-		.id		= 0,
+		.devname	= "soc-audio.0",
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 24),
 	},
@@ -676,7 +637,7 @@ static struct clksrc_sources clkset_sclk_audio1 = {
 static struct clksrc_clk clk_sclk_audio1 = {
 	.clk		= {
 		.name		= "sclk_audio",
-		.id		= 1,
+		.devname	= "soc-audio.1",
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 25),
 	},
@@ -705,7 +666,7 @@ static struct clksrc_sources clkset_sclk_audio2 = {
 static struct clksrc_clk clk_sclk_audio2 = {
 	.clk		= {
 		.name		= "sclk_audio",
-		.id		= 2,
+		.devname	= "soc-audio.2",
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 26),
 	},
@@ -763,7 +724,6 @@ static struct clk_ops s5pv210_sclk_spdif_ops = {
 static struct clksrc_clk clk_sclk_spdif = {
 	.clk		= {
 		.name		= "sclk_spdif",
-		.id		= -1,
 		.enable		= s5pv210_clk_mask0_ctrl,
 		.ctrlbit	= (1 << 27),
 		.ops		= &s5pv210_sclk_spdif_ops,
@@ -793,7 +753,6 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "sclk_dmc",
-			.id		= -1,
 		},
 		.sources = &clkset_group1,
 		.reg_src = { .reg = S5P_CLK_SRC6, .shift = 24, .size = 2 },
@@ -801,7 +760,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_onenand",
-			.id		= -1,
 		},
 		.sources = &clkset_sclk_onenand,
 		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 28, .size = 1 },
@@ -809,7 +767,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "uclk1",
-			.id		= 0,
+			.devname	= "s5pv210-uart.0",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 12),
 		},
@@ -819,7 +777,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
-			.id		= 1,
+			.devname	= "s5pv210-uart.1",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 13),
 		},
@@ -829,7 +787,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
-			.id		= 2,
+			.devname	= "s5pv210-uart.2",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 14),
 		},
@@ -839,7 +797,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "uclk1",
-			.id		= 3,
+			.devname	= "s5pv210-uart.3",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 15),
 		},
@@ -849,7 +807,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mixer",
-			.id		= -1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 1),
 		},
@@ -858,7 +815,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
-			.id		= 0,
+			.devname	= "s5pv210-fimc.0",
 			.enable		= s5pv210_clk_mask1_ctrl,
 			.ctrlbit	= (1 << 2),
 		},
@@ -868,7 +825,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
-			.id		= 1,
+			.devname	= "s5pv210-fimc.1",
 			.enable		= s5pv210_clk_mask1_ctrl,
 			.ctrlbit	= (1 << 3),
 		},
@@ -878,7 +835,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
-			.id		= 2,
+			.devname	= "s5pv210-fimc.2",
 			.enable		= s5pv210_clk_mask1_ctrl,
 			.ctrlbit	= (1 << 4),
 		},
@@ -888,7 +845,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_cam",
-			.id		= 0,
+			.devname	= "s5pv210-fimc.0",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 3),
 		},
@@ -898,7 +855,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_cam",
-			.id		= 1,
+			.devname	= "s5pv210-fimc.1",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 4),
 		},
@@ -908,7 +865,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_fimd",
-			.id		= -1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 5),
 		},
@@ -918,7 +874,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
-			.id		= 0,
+			.devname	= "sdhci-s3c.0",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 8),
 		},
@@ -928,7 +884,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
-			.id		= 1,
+			.devname	= "sdhci-s3c.1",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 9),
 		},
@@ -938,7 +894,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
-			.id		= 2,
+			.devname	= "sdhci-s3c.2",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 10),
 		},
@@ -948,7 +904,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mmc",
-			.id		= 3,
+			.devname	= "sdhci-s3c.3",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 11),
 		},
@@ -958,7 +914,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_mfc",
-			.id		= -1,
 			.enable		= s5pv210_clk_ip0_ctrl,
 			.ctrlbit	= (1 << 16),
 		},
@@ -968,7 +923,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_g2d",
-			.id		= -1,
 			.enable		= s5pv210_clk_ip0_ctrl,
 			.ctrlbit	= (1 << 12),
 		},
@@ -978,7 +932,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_g3d",
-			.id		= -1,
 			.enable		= s5pv210_clk_ip0_ctrl,
 			.ctrlbit	= (1 << 8),
 		},
@@ -988,7 +941,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_csis",
-			.id		= -1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 6),
 		},
@@ -998,7 +950,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
-			.id		= 0,
+			.devname	= "s3c64xx-spi.0",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 16),
 		},
@@ -1008,7 +960,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_spi",
-			.id		= 1,
+			.devname	= "s3c64xx-spi.1",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 17),
 		},
@@ -1018,7 +970,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_pwi",
-			.id		= -1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 29),
 		},
@@ -1028,7 +979,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk		= {
 			.name		= "sclk_pwm",
-			.id		= -1,
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 19),
 		},
diff --git a/arch/arm/mach-s5pv210/include/mach/clkdev.h b/arch/arm/mach-s5pv210/include/mach/clkdev.h
new file mode 100644
index 0000000..4c281c9
--- /dev/null
+++ b/arch/arm/mach-s5pv210/include/mach/clkdev.h
@@ -0,0 +1,7 @@
+#ifndef __MACH_S5PV210_CLKDEV_H__
+#define __MACH_S5PV210_CLKDEV_H__
+
+#define __clk_get(clk) ({ 1; })
+#define __clk_put(clk) do { } while (0)
+
+#endif
-- 
1.6.6.rc2
