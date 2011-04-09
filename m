From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 3/3] ARM: S5P64X0: Add PCM audio support for WM8580
Date: Sat,  9 Apr 2011 10:58:01 +0900
Message-ID: <1302314281-11466-4-git-send-email-sbkim73@samsung.com>
References: <1302314281-11466-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34942 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751553Ab1DIC35 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2011 22:29:57 -0400
In-Reply-To: <1302314281-11466-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

This patch add pcm audio configuration for SMDK6450 and SMDK6440.
Platform device and pcm clock initialization code is added.

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6440.c              |   63 +++++++++++---------
 arch/arm/mach-s5p64x0/clock-s5p6450.c              |   27 +++++++--
 arch/arm/mach-s5p64x0/clock.c                      |   11 ++++
 arch/arm/mach-s5p64x0/dev-audio.c                  |   56 ++++++++++++++++-
 arch/arm/mach-s5p64x0/include/mach/regs-clock.h    |    3 +
 arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h |    4 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c              |    7 ++
 arch/arm/mach-s5p64x0/mach-smdk6450.c              |    7 ++
 8 files changed, 141 insertions(+), 37 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index 9f12c2e..99405f4 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -372,14 +372,12 @@ static struct clk init_clocks[] = {
 	},
 };
 
-static struct clk clk_iis_cd_v40 = {
-	.name		= "iis_cdclk_v40",
-	.id		= -1,
-};
-
-static struct clk clk_pcm_cd = {
-	.name		= "pcm_cdclk",
-	.id		= -1,
+static struct clksrc_clk clk_dout_epll = {
+	.clk	= {
+		.name	= "dout_epll",
+		.id	= -1,
+		.parent = &clk_mout_epll.clk,
+	},
 };
 
 static struct clk *clkset_group1_list[] = {
@@ -403,17 +401,30 @@ static struct clksrc_sources clkset_uart = {
 	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
 };
 
-static struct clk *clkset_audio_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll.clk,
-	&clk_fin_epll,
-	&clk_iis_cd_v40,
-	&clk_pcm_cd,
+static struct clk *clkset_sclk_audio_list[] = {
+	[0] = &clk_dout_epll.clk,
+	[1] = &clk_dout_mpll.clk,
+	[2] = &clk_ext,
+	[3] = &clk_i2s_v40_cdclk,
+	[4] = &clk_pcmcdclk0,
+};
+
+static struct clksrc_sources clkset_sclk_audio = {
+	.sources	= clkset_sclk_audio_list,
+	.nr_sources	= ARRAY_SIZE(clkset_sclk_audio_list),
 };
 
-static struct clksrc_sources clkset_audio = {
-	.sources	= clkset_audio_list,
-	.nr_sources	= ARRAY_SIZE(clkset_audio_list),
+struct clksrc_clk clk_sclk_audio = {
+	.clk		= {
+		.name		= "audio-bus",
+		.id		= -1,
+		.enable		= s5p64x0_sclk_ctrl,
+		.ctrlbit	= (1 << 11),
+		.parent		= &clk_ext_xtal_mux,
+	},
+	.sources	= &clkset_sclk_audio,
+	.reg_src	= { .reg = S5P64X0_CLK_SRC1, .shift = 0, .size = 3 },
+	.reg_div	= { .reg = S5P64X0_CLK_DIV2, .shift = 24, .size = 4 },
 };
 
 static struct clksrc_clk clksrcs[] = {
@@ -507,16 +518,6 @@ static struct clksrc_clk clksrcs[] = {
 		.sources = &clkset_group1,
 		.reg_src = { .reg = S5P64X0_CLK_SRC1, .shift = 8, .size = 2 },
 		.reg_div = { .reg = S5P64X0_CLK_DIV3, .shift = 4, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "sclk_audio2",
-			.id		= -1,
-			.ctrlbit	= (1 << 11),
-			.enable		= s5p64x0_sclk_ctrl,
-		},
-		.sources = &clkset_audio,
-		.reg_src = { .reg = S5P64X0_CLK_SRC1, .shift = 0, .size = 3 },
-		.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 24, .size = 4 },
 	},
 };
 
@@ -526,11 +527,13 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_mout_epll,
 	&clk_mout_mpll,
 	&clk_dout_mpll,
+	&clk_dout_epll,
 	&clk_armclk,
 	&clk_hclk,
 	&clk_pclk,
 	&clk_hclk_low,
 	&clk_pclk_low,
+	&clk_sclk_audio,
 };
 
 void __init_or_cpufreq s5p6440_setup_clocks(void)
@@ -590,14 +593,16 @@ void __init_or_cpufreq s5p6440_setup_clocks(void)
 	clk_h.rate = hclk;
 	clk_p.rate = pclk;
 
+	clk_set_parent(&clk_sclk_audio.clk, &clk_pcmcdclk0);
+
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
 		s3c_set_clksrc(&clksrcs[ptr], true);
 }
 
 static struct clk *clks[] __initdata = {
 	&clk_ext,
-	&clk_iis_cd_v40,
-	&clk_pcm_cd,
+	&clk_i2s_v40_cdclk,
+	&clk_pcmcdclk0,
 };
 
 void __init s5p6440_register_clocks(void)
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index 4eec457..e4db264 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -290,7 +290,14 @@ static struct clk init_clocks_off[] = {
 		.parent		= &clk_pclk.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 30),
-	}
+	}, {
+		.name		= "pcm",
+		.id		= 0,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p64x0_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_PCM0,
+	},
+
 };
 
 /*
@@ -408,9 +415,9 @@ static struct clksrc_sources clkset_hsmmc44 = {
 static struct clk *clkset_sclk_audio0_list[] = {
 	[0] = &clk_dout_epll.clk,
 	[1] = &clk_dout_mpll.clk,
-	[2] = &clk_ext_xtal_mux,
-	[3] = NULL,
-	[4] = NULL,
+	[2] = &clk_ext,
+	[3] = &clk_i2s_v40_cdclk,
+	[4] = &clk_pcmcdclk0,
 };
 
 static struct clksrc_sources clkset_sclk_audio0 = {
@@ -418,7 +425,7 @@ static struct clksrc_sources clkset_sclk_audio0 = {
 	.nr_sources	= ARRAY_SIZE(clkset_sclk_audio0_list),
 };
 
-static struct clksrc_clk clk_sclk_audio0 = {
+struct clksrc_clk clk_sclk_audio0 = {
 	.clk		= {
 		.name		= "audio-bus",
 		.id		= -1,
@@ -647,12 +654,22 @@ void __init_or_cpufreq s5p6450_setup_clocks(void)
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
 		s3c_set_clksrc(&clksrcs[ptr], true);
+
+	clk_set_parent(&clk_sclk_audio0.clk, &clk_pcmcdclk0);
 }
 
+static struct clk *clks[] __initdata = {
+	&clk_ext,
+	&clk_i2s_v40_cdclk,
+	&clk_pcmcdclk0,
+};
+
 void __init s5p6450_register_clocks(void)
 {
 	int ptr;
 
+	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
+
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
 		s3c_register_clksrc(sysclks[ptr], 1);
 
diff --git a/arch/arm/mach-s5p64x0/clock.c b/arch/arm/mach-s5p64x0/clock.c
index b52c6e2..432bb06 100644
--- a/arch/arm/mach-s5p64x0/clock.c
+++ b/arch/arm/mach-s5p64x0/clock.c
@@ -233,3 +233,14 @@ int s5p64x0_clk48m_ctrl(struct clk *clk, int enable)
 
 	return 0;
 }
+
+struct clk clk_pcmcdclk0 = {
+	.name		= "pcmcdclk",
+	.id		= 0,
+	.rate		= 4096000,
+};
+
+struct clk clk_i2s_v40_cdclk = {
+	.name		= "i2s_v40_cdclk",
+	.id		= 0,
+};
diff --git a/arch/arm/mach-s5p64x0/dev-audio.c b/arch/arm/mach-s5p64x0/dev-audio.c
index 35f1f22..c0ef455 100644
--- a/arch/arm/mach-s5p64x0/dev-audio.c
+++ b/arch/arm/mach-s5p64x0/dev-audio.c
@@ -207,7 +207,7 @@ static struct s3c_audio_pdata s5p6440_pcm_pdata = {
 	.cfg_gpio = s5p6440_pcm_cfg_gpio,
 };
 
-static struct resource s5p6440_pcm0_resource[] = {
+static struct resource s5p6440_pcm_resource[] = {
 	[0] = {
 		.start	= S5P64X0_PA_PCM,
 		.end	= S5P64X0_PA_PCM + 0x100 - 1,
@@ -228,9 +228,59 @@ static struct resource s5p6440_pcm0_resource[] = {
 struct platform_device s5p6440_device_pcm = {
 	.name		= "samsung-pcm",
 	.id		= 0,
-	.num_resources	= ARRAY_SIZE(s5p6440_pcm0_resource),
-	.resource	= s5p6440_pcm0_resource,
+	.num_resources	= ARRAY_SIZE(s5p6440_pcm_resource),
+	.resource	= s5p6440_pcm_resource,
 	.dev = {
 		.platform_data = &s5p6440_pcm_pdata,
 	},
 };
+
+static int s5p6450_pcm_cfg_gpio(struct platform_device *pdev)
+{
+	switch (pdev->id) {
+	case 0:
+		s3c_gpio_cfgpin(S5P6450_GPR(4), S3C_GPIO_SFN(2));
+		s3c_gpio_cfgpin(S5P6450_GPR(7), S3C_GPIO_SFN(2));
+		s3c_gpio_cfgpin(S5P6450_GPR(8), S3C_GPIO_SFN(2));
+		s3c_gpio_cfgpin(S5P6450_GPR(13), S3C_GPIO_SFN(2));
+		s3c_gpio_cfgpin(S5P6450_GPR(14), S3C_GPIO_SFN(2));
+		break;
+	default:
+		printk(KERN_DEBUG "Invalid PCM Controller number!");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct s3c_audio_pdata s3c_pcm_pdata = {
+		.cfg_gpio = s5p6450_pcm_cfg_gpio,
+};
+
+static struct resource s5p6450_pcm0_resource[] = {
+		[0] = {
+			.start = S5P64X0_PA_PCM,
+			.end   = S5P64X0_PA_PCM + 0x100 - 1,
+			.flags = IORESOURCE_MEM,
+		},
+		[1] = {
+			.start = DMACH_PCM0_TX,
+			.end   = DMACH_PCM0_TX,
+			.flags = IORESOURCE_DMA,
+		},
+		[2] = {
+			.start = DMACH_PCM0_RX,
+			.end   = DMACH_PCM0_RX,
+			.flags = IORESOURCE_DMA,
+		},
+};
+
+struct platform_device s5p6450_device_pcm0 = {
+		.name		= "samsung-pcm",
+		.id		= 0,
+		.num_resources	= ARRAY_SIZE(s5p6450_pcm0_resource),
+		.resource	= s5p6450_pcm0_resource,
+		.dev = {
+				.platform_data = &s3c_pcm_pdata,
+		},
+};
diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-clock.h b/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
index a133f22..323c97c 100644
--- a/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
@@ -62,4 +62,7 @@
 
 #define S5P_EPLL_CON			S5P64X0_EPLL_CON
 
+#define S5P_CLKCON_SCLK0_AUDIO0	(1<<8)
+#define S5P_CLKCON_PCLK_PCM0		(1<<8)
+
 #endif /* __ASM_ARCH_REGS_CLOCK_H */
diff --git a/arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h b/arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h
index ff85b4b..88a8065 100644
--- a/arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h
+++ b/arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h
@@ -34,6 +34,10 @@ extern struct clksrc_clk clk_dout_mpll;
 extern struct clk *clkset_hclk_low_list[];
 extern struct clksrc_sources clkset_hclk_low;
 
+extern struct clksrc_clk clk_sclk_audio0;
+extern struct clk clk_pcmcdclk0;
+extern struct clk clk_i2s_v40_cdclk;
+
 extern int s5p64x0_pclk_ctrl(struct clk *clk, int enable);
 extern int s5p64x0_hclk0_ctrl(struct clk *clk, int enable);
 extern int s5p64x0_hclk1_ctrl(struct clk *clk, int enable);
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/mach-smdk6440.c
index 2d559f1..0fa500e 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -130,6 +130,11 @@ static struct platform_device smdk6440_backlight_device = {
 	},
 };
 
+static struct platform_device smdk6440_pcm_device = {
+	.name		= "samsung-smdk-pcm",
+	.id		= -1,
+};
+
 static struct platform_device *smdk6440_devices[] __initdata = {
 	&s3c_device_adc,
 	&s3c_device_rtc,
@@ -139,8 +144,10 @@ static struct platform_device *smdk6440_devices[] __initdata = {
 	&s3c_device_wdt,
 	&samsung_asoc_dma,
 	&s5p6440_device_iis,
+	&s5p6440_device_pcm,
 	&s3c_device_timer[1],
 	&smdk6440_backlight_device,
+	&smdk6440_pcm_device,
 };
 
 static struct s3c2410_platform_i2c s5p6440_i2c0_data __initdata = {
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c
index d19c469..69de257 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -148,6 +148,11 @@ static struct platform_device smdk6450_backlight_device = {
 	},
 };
 
+static struct platform_device smdk6450_pcm_device = {
+	.name		= "samsung-smdk-pcm",
+	.id		= -1,
+};
+
 static struct platform_device *smdk6450_devices[] __initdata = {
 	&s3c_device_adc,
 	&s3c_device_rtc,
@@ -157,8 +162,10 @@ static struct platform_device *smdk6450_devices[] __initdata = {
 	&s3c_device_wdt,
 	&samsung_asoc_dma,
 	&s5p6450_device_iis0,
+	&s5p6450_device_pcm0,
 	&s3c_device_timer[1],
 	&smdk6450_backlight_device,
+	&smdk6450_pcm_device,
 	/* s5p6450_device_spi0 will be added */
 };
 
-- 
1.7.1
