From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH V2 1/2] ARM: EXYNOS4: Add PCM audio support for WM8994
Date: Fri, 17 Jun 2011 11:50:42 +0200
Message-ID: <000301cc2cd4$06017730$12046590$%szyprowski@samsung.com>
References: <1303954372-18565-1-git-send-email-sbkim73@samsung.com>
 <1303954372-18565-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10031 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752214Ab1FQJuu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2011 05:50:50 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LMX00D5II0OJI60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Jun 2011 10:50:48 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMX00M1JI0M34@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Jun 2011 10:50:47 +0100 (BST)
In-reply-to: <1303954372-18565-2-git-send-email-sbkim73@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hello,

I've just noticed one more problem with this patch. See my comment below.

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

The above line changes clocks configuration on the board, what might have some
side effects. For example on Nuri board this kill suspend/resume. Setting
initial parents for global clocks should be done in the bootloader not the
kernel startup code.

>  }
> 
>  static struct clk *clks[] __initdata = {
> -	/* Nothing here yet */
> +	&clk_audiocdclk0,
>  };
> 
>  void __init exynos4_register_clocks(void)

(snipped)

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
