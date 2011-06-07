From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH V2 1/2] ARM: EXYNOS4: Add PCM audio support for WM8994
Date: Tue, 07 Jun 2011 08:41:41 +0200
Message-ID: <003a01cc24dd$f5f2e390$e1d8aab0$%szyprowski@samsung.com>
References: <1303954372-18565-1-git-send-email-sbkim73@samsung.com>
 <1303954372-18565-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:59467 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127Ab1FGGlu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 02:41:50 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LME00CG4QLOKP50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 07:41:48 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LME006N5QLM8A@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 07:41:47 +0100 (BST)
In-reply-to: <1303954372-18565-2-git-send-email-sbkim73@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

I've just noticed that there is a problem with this patch on 
kgene/for-next branch. It causes compilation break:

arch/arm/mach-exynos4/cpu.c:106: error: 'S5P_VA_AUDSS' undeclared here (not in a
function)
make[1]: *** [arch/arm/mach-exynos4/cpu.o] Error 1
make: *** [arch/arm/mach-exynos4] Error 2
make: *** Waiting for unfinished jobs....

It looks that some definitions are still missing there.

On Thursday, April 28, 2011 3:33 AM Sangbeom Kim wrote:

> This patch add pcm audio configuration for SMDKV310 and SMDKC210.
> Platform device and pcm clock initialization code is added.
> 
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> Acked-by: Liam Girdwood <lrg@ti.com>
> ---
>  arch/arm/mach-exynos4/clock.c                   |  169
> ++++++++++++++++++++++-
>  arch/arm/mach-exynos4/cpu.c                     |    5 +
>  arch/arm/mach-exynos4/dev-audio.c               |    5 +
>  arch/arm/mach-exynos4/include/mach/map.h        |    3 +
>  arch/arm/mach-exynos4/include/mach/regs-audss.h |   25 ++++
>  arch/arm/mach-exynos4/mach-smdkc210.c           |    7 +
>  arch/arm/mach-exynos4/mach-smdkv310.c           |    7 +
>  arch/arm/plat-samsung/include/plat/audio.h      |    8 +
>  8 files changed, 227 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/include/mach/regs-audss.h
> 
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 871f9d5..77cd81f 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -23,6 +23,7 @@
> 
>  #include <mach/map.h>
>  #include <mach/regs-clock.h>
> +#include <mach/regs-audss.h>
>  #include <mach/sysmmu.h>
> 
>  static struct clk clk_sclk_hdmi27m = {
> @@ -47,6 +48,31 @@ static struct clk clk_sclk_usbphy1 = {
>  	.id		= -1,
>  };
> 
> +static struct clk clk_sclk_xxti = {
> +	.name		= "sclk_usbphy1",
> +	.id		= -1,
> +};
> +
> +static struct clk clk_sclk_xusbxti = {
> +	.name		= "sclk_usbphy1",
> +	.id		= -1,
> +};
> +
> +static struct clk clk_audiocdclk0 = {
> +	.name		= "audiocdclk",
> +	.id		= 0,
> +};
> +
> +static struct clk clk_audiocdclk1 = {
> +	.name		= "audiocdclk",
> +	.id		= 1,
> +};
> +
> +static struct clk clk_audiocdclk2 = {
> +	.name		= "audiocdclk",
> +	.id		= 2,
> +};
> +
>  static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enable)
>  {
>  	return s5p_gatectrl(S5P_CLKSRC_MASK_TOP, clk, enable);
> @@ -127,6 +153,16 @@ static int exynos4_clk_ip_perir_ctrl(struct clk *clk,
> int enable)
>  	return s5p_gatectrl(S5P_CLKGATE_IP_PERIR, clk, enable);
>  }
> 
> +static int exynos4_clksrc_mask_maudio_ctrl(struct clk *clk, int enable)
> +{
> +        return s5p_gatectrl(S5P_CLKSRC_MASK_MAUDIO, clk, enable);
> +}
> +
> +static int exynos4_clk_audss_ctrl(struct clk *clk, int enable)
> +{
> +        return s5p_gatectrl(S5P_CLKGATE_AUDSS, clk, enable);
> +}
> +
>  /* Core list of CMU_CPU side */
> 
>  static struct clksrc_clk clk_mout_apll = {
> @@ -561,6 +597,21 @@ static struct clk init_clocks_off[] = {
>  		.enable		= exynos4_clk_ip_peril_ctrl,
>  		.ctrlbit	= (1 << 27),
>  	}, {
> +		.name		= "pcm",
> +		.id		= 0,
> +		.enable		= exynos4_clk_audss_ctrl,
> +		.ctrlbit	= S5P_AUDSS_CLKGATE_PCMSPECIAL,
> +	}, {
> +		.name		= "pcm",
> +		.id		= 1,
> +		.enable		= exynos4_clk_ip_peril_ctrl,
> +		.ctrlbit	= (1 << 22),
> +	}, {
> +		.name		= "pcm",
> +		.id		= 2,
> +		.enable		= exynos4_clk_ip_peril_ctrl,
> +		.ctrlbit	= (1 << 23),
> +        }, {
>  		.name		= "fimg2d",
>  		.id		= -1,
>  		.enable		= exynos4_clk_ip_image_ctrl,
> @@ -686,6 +737,93 @@ static struct clk init_clocks_off[] = {
>  	}
>  };
> 
> +static struct clk *clkset_sclk_audio0_list[] = {
> +	[0] = &clk_audiocdclk0,
> +	[1] = NULL,
> +	[2] = &clk_sclk_hdmi27m,
> +	[3] = &clk_sclk_usbphy0,
> +	[4] = &clk_sclk_xxti,
> +	[5] = &clk_sclk_xusbxti,
> +	[6] = &clk_mout_mpll.clk,
> +	[7] = &clk_mout_epll.clk,
> +	[8] = &clk_sclk_vpll.clk,
> +};
> +
> +static struct clksrc_sources clkset_sclk_audio0 = {
> +	.sources	= clkset_sclk_audio0_list,
> +	.nr_sources	= ARRAY_SIZE(clkset_sclk_audio0_list),
> +};
> +
> +static struct clksrc_clk clk_sclk_audio0 = {
> +	.clk	= {
> +		.name		= "audio-bus",
> +		.id		= 0,
> +		.enable		= exynos4_clksrc_mask_maudio_ctrl,
> +		.ctrlbit	= (1 << 0),
> +	},
> +	.sources = &clkset_sclk_audio0,
> +	.reg_src = { .reg = S5P_CLKSRC_MAUDIO, .shift = 0, .size = 4 },
> +	.reg_div = { .reg = S5P_CLKDIV_MAUDIO, .shift = 0, .size = 4 },
> +};
> +
> +static struct clk *clkset_sclk_audio1_list[] = {
> +	[0] = &clk_audiocdclk1,
> +	[1] = NULL,
> +	[2] = &clk_sclk_hdmi27m,
> +	[3] = &clk_sclk_usbphy0,
> +	[4] = &clk_sclk_xxti,
> +	[5] = &clk_sclk_xusbxti,
> +	[6] = &clk_mout_mpll.clk,
> +	[7] = &clk_mout_epll.clk,
> +	[8] = &clk_sclk_vpll.clk,
> +};
> +
> +static struct clksrc_sources clkset_sclk_audio1 = {
> +	.sources	= clkset_sclk_audio1_list,
> +	.nr_sources	= ARRAY_SIZE(clkset_sclk_audio1_list),
> +};
> +
> +static struct clksrc_clk clk_sclk_audio1 = {
> +	.clk	= {
> +		.name		= "audio-bus",
> +		.id		= 1,
> +		.enable		= exynos4_clksrc_mask_peril1_ctrl,
> +		.ctrlbit	= (1 << 0),
> +        },
> +	.sources = &clkset_sclk_audio1,
> +	.reg_src = { .reg = S5P_CLKSRC_PERIL1, .shift = 0, .size = 4 },
> +	.reg_div = { .reg = S5P_CLKDIV_PERIL4, .shift = 4, .size = 8 },
> +};
> +
> +static struct clk *clkset_sclk_audio2_list[] = {
> +	[0] = &clk_audiocdclk2,
> +	[1] = NULL,
> +	[2] = &clk_sclk_hdmi27m,
> +	[3] = &clk_sclk_usbphy0,
> +	[4] = &clk_sclk_xxti,
> +	[5] = &clk_sclk_xusbxti,
> +	[6] = &clk_mout_mpll.clk,
> +	[7] = &clk_mout_epll.clk,
> +	[8] = &clk_sclk_vpll.clk,
> +};
> +
> +static struct clksrc_sources clkset_sclk_audio2 = {
> +	.sources        = clkset_sclk_audio2_list,
> +	.nr_sources     = ARRAY_SIZE(clkset_sclk_audio2_list),
> +};
> +
> +static struct clksrc_clk clk_sclk_audio2 = {
> +	.clk	= {
> +		.name		= "audio-bus",
> +		.id		= 2,
> +		.enable		= exynos4_clksrc_mask_peril1_ctrl,
> +		.ctrlbit	= (1 << 4),
> +	},
> +	.sources = &clkset_sclk_audio2,
> +	.reg_src = { .reg = S5P_CLKSRC_PERIL1, .shift = 4, .size = 4 },
> +	.reg_div = { .reg = S5P_CLKDIV_PERIL4, .shift = 16, .size = 4 },
> +};
> +
>  static struct clk init_clocks[] = {
>  	{
>  		.name		= "uart",
> @@ -1079,7 +1217,28 @@ static struct clksrc_clk clksrcs[] = {
>  			.ctrlbit	= (1 << 16),
>  		},
>  		.reg_div = { .reg = S5P_CLKDIV_FSYS3, .shift = 8, .size = 8 },
> -	}
> +	}, {
> +		.clk		= {
> +			.name		= "sclk_pcm",
> +			.id		= 0,
> +			.parent		= &clk_sclk_audio0.clk,
> +                },
> +                .reg_div = { .reg = S5P_CLKDIV_MAUDIO, .shift = 4, .size =
> 8 },
> +        }, {
> +                .clk            = {
> +                        .name           = "sclk_pcm",
> +                        .id             = 1,
> +                        .parent         = &clk_sclk_audio1.clk,
> +                },
> +                .reg_div = { .reg = S5P_CLKDIV_PERIL4, .shift = 4, .size =
> 8 },
> +        }, {
> +                .clk            = {
> +                        .name           = "sclk_pcm",
> +                        .id             = 2,
> +                        .parent         = &clk_sclk_audio2.clk,
> +                },
> +                .reg_div = { .reg = S5P_CLKDIV_PERIL4, .shift = 20, .size
> = 8 },
> +        },
>  };
> 
>  /* Clock initialization code */
> @@ -1112,6 +1271,9 @@ static struct clksrc_clk *sysclks[] = {
>  	&clk_dout_mmc2,
>  	&clk_dout_mmc3,
>  	&clk_dout_mmc4,
> +	&clk_sclk_audio0,
> +	&clk_sclk_audio1,
> +	&clk_sclk_audio2,
>  };
> 
>  static int xtal_rate;
> @@ -1191,10 +1353,13 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
> 
>  	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
>  		s3c_set_clksrc(&clksrcs[ptr], true);
> +
> +	clk_audiocdclk0.rate = PCM_EXTCLK0;
> +	clk_set_parent(&clk_sclk_audio0.clk, &clk_audiocdclk0);
>  }
> 
>  static struct clk *clks[] __initdata = {
> -	/* Nothing here yet */
> +	&clk_audiocdclk0,
>  };
> 
>  void __init exynos4_register_clocks(void)
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
> index 7930113..620b41f 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos4/cpu.c
> @@ -97,6 +97,11 @@ static struct map_desc exynos4_iodesc[] __initdata = {
>  		.pfn		= __phys_to_pfn(EXYNOS4_PA_SROMC),
>  		.length		= SZ_4K,
>  		.type		= MT_DEVICE,
> +	}, {
> +		.virtual	= (unsigned long)S5P_VA_AUDSS,
> +		.pfn		= __phys_to_pfn(EXYNOS4_PA_AUDSS),
> +		.length		= SZ_1K,
> +		.type		= MT_DEVICE,
>  	},
>  };
> 
> diff --git a/arch/arm/mach-exynos4/dev-audio.c b/arch/arm/mach-exynos4/dev-
> audio.c
> index 1eed5f9..6347594 100644
> --- a/arch/arm/mach-exynos4/dev-audio.c
> +++ b/arch/arm/mach-exynos4/dev-audio.c
> @@ -187,6 +187,11 @@ static int exynos4_pcm_cfg_gpio(struct platform_device
> *pdev)
> 
>  static struct s3c_audio_pdata s3c_pcm_pdata = {
>  	.cfg_gpio = exynos4_pcm_cfg_gpio,
> +	.type = {
> +		.pcm = {
> +			.quirks = QUIRK_NO_DIV,
> +		},
> +	},
>  };
> 
>  static struct resource exynos4_pcm0_resource[] = {
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-
> exynos4/include/mach/map.h
> index 6330b73..063854e 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -30,6 +30,8 @@
>  #define EXYNOS4_PA_FIMC2		0x11820000
>  #define EXYNOS4_PA_FIMC3		0x11830000
> 
> +#define EXYNOS4_PA_AUDSS		0x03810000
> +
>  #define EXYNOS4_PA_I2S0			0x03830000
>  #define EXYNOS4_PA_I2S1			0xE3100000
>  #define EXYNOS4_PA_I2S2			0xE2A00000
> @@ -143,6 +145,7 @@
>  #define S5P_PA_SROMC			EXYNOS4_PA_SROMC
>  #define S5P_PA_SYSCON			EXYNOS4_PA_SYSCON
>  #define S5P_PA_TIMER			EXYNOS4_PA_TIMER
> +#define S5P_PA_AUDSS			EXYNOS4_PA_AUDSS
> 
>  #define SAMSUNG_PA_KEYPAD		EXYNOS4_PA_KEYPAD
> 
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-audss.h
> b/arch/arm/mach-exynos4/include/mach/regs-audss.h
> new file mode 100644
> index 0000000..3a797b8
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/include/mach/regs-audss.h
> @@ -0,0 +1,25 @@
> +/* arch/arm/mach-exynos4/include/mach/regs-audss.h
> + *
> + * Copyright (c) 2011 Samsung Electronics
> + *		http://www.samsung.com
> + *
> + * Exynos4 Audio SubSystem clock register definitions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __PLAT_REGS_AUDSS_H
> +#define __PLAT_REGS_AUDSS_H __FILE__
> +
> +#define S5P_AUDSSREG(x)		(S5P_VA_AUDSS + (x))
> +
> +#define S5P_CLKGATE_AUDSS	S5P_AUDSSREG(0x8)
> +
> +#define PCM_EXTCLK0		16934400
> +
> +/* IP Clock Gate 0 Registers */
> +#define S5P_AUDSS_CLKGATE_PCMSPECIAL	(1<<5)
> +
> +#endif /* _PLAT_REGS_AUDSS_H */
> diff --git a/arch/arm/mach-exynos4/mach-smdkc210.c b/arch/arm/mach-
> exynos4/mach-smdkc210.c
> index e645f7a..ac53e49 100644
> --- a/arch/arm/mach-exynos4/mach-smdkc210.c
> +++ b/arch/arm/mach-exynos4/mach-smdkc210.c
> @@ -142,6 +142,11 @@ static struct platform_device smdkc210_smsc911x = {
>  	},
>  };
> 
> +static struct platform_device smdkc210_pcm_device = {
> +	.name		= "samsung-smdk-pcm",
> +	.id		= -1,
> +};
> +
>  static struct i2c_board_info i2c_devs1[] __initdata = {
>  	{I2C_BOARD_INFO("wm8994", 0x1a),},
>  };
> @@ -156,6 +161,7 @@ static struct platform_device *smdkc210_devices[]
> __initdata = {
>  	&s3c_device_wdt,
>  	&exynos4_device_ac97,
>  	&exynos4_device_i2s0,
> +	&exynos4_device_pcm0,
>  	&exynos4_device_pd[PD_MFC],
>  	&exynos4_device_pd[PD_G3D],
>  	&exynos4_device_pd[PD_LCD0],
> @@ -166,6 +172,7 @@ static struct platform_device *smdkc210_devices[]
> __initdata = {
>  	&exynos4_device_sysmmu,
>  	&samsung_asoc_dma,
>  	&smdkc210_smsc911x,
> +	&smdkc210_pcm_device,
>  };
> 
>  static void __init smdkc210_smsc911x_init(void)
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> index 1526764..7e3ee6c 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -163,6 +163,11 @@ static struct samsung_keypad_platdata
> smdkv310_keypad_data __initdata = {
>  	.cols		= 8,
>  };
> 
> +static struct platform_device smdkv310_pcm_device = {
> +	.name		= "samsung-smdk-pcm",
> +	.id		= -1,
> +};
> +
>  static struct i2c_board_info i2c_devs1[] __initdata = {
>  	{I2C_BOARD_INFO("wm8994", 0x1a),},
>  };
> @@ -186,8 +191,10 @@ static struct platform_device *smdkv310_devices[]
> __initdata = {
>  	&exynos4_device_pd[PD_TV],
>  	&exynos4_device_pd[PD_GPS],
>  	&exynos4_device_sysmmu,
> +	&exynos4_device_pcm0,
>  	&samsung_asoc_dma,
>  	&smdkv310_smsc911x,
> +	&smdkv310_pcm_device,
>  };
> 
>  static void __init smdkv310_smsc911x_init(void)
> diff --git a/arch/arm/plat-samsung/include/plat/audio.h b/arch/arm/plat-
> samsung/include/plat/audio.h
> index a0826ed..5cee225 100644
> --- a/arch/arm/plat-samsung/include/plat/audio.h
> +++ b/arch/arm/plat-samsung/include/plat/audio.h
> @@ -46,6 +46,13 @@ struct samsung_i2s {
>  	const char **src_clk;
>  };
> 
> +struct samsung_pcm {
> +/* If the PCM block has no internal prescalar or MUX */
> +#define QUIRK_NO_DIV		(1 << 0)
> +	/* Quirks of the PCM controller */
> +	u32 quirks;
> +};
> +
>  /**
>   * struct s3c_audio_pdata - common platform data for audio device drivers
>   * @cfg_gpio: Callback function to setup mux'ed pins in I2S/PCM/AC97 mode
> @@ -54,5 +61,6 @@ struct s3c_audio_pdata {
>  	int (*cfg_gpio)(struct platform_device *);
>  	union {
>  		struct samsung_i2s i2s;
> +		struct samsung_pcm pcm;
>  	} type;
>  };
> --
> 1.7.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
