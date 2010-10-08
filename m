From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/10] ARM: S5PC100: Add S/PDIF platform device
Date: Fri, 08 Oct 2010 18:54:44 +0900
Message-ID: <001601cb66ce$d87da480$8978ed80$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286191919-22356-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27494 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752185Ab0JHJyv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 05:54:51 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y00ARAU6RXC30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 18:54:27 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y005FJU6R3D@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 18:54:27 +0900 (KST)
In-reply-to: <1286191919-22356-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch add S/PDIF platform device to support S/PDIF PCM audio
> on S5PC100.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5pc100/dev-audio.c          |   54
> ++++++++++++++++++++++++++++
>  arch/arm/mach-s5pc100/include/mach/map.h   |    2 +
>  arch/arm/mach-s5pc100/mach-smdkc100.c      |    4 ++
>  arch/arm/plat-samsung/include/plat/audio.h |    9 +++++
>  arch/arm/plat-samsung/include/plat/devs.h  |    1 +
>  5 files changed, 70 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/dev-audio.c
b/arch/arm/mach-s5pc100/dev-
> audio.c
> index a699ed6..9f7b17a 100644
> --- a/arch/arm/mach-s5pc100/dev-audio.c
> +++ b/arch/arm/mach-s5pc100/dev-audio.c
> @@ -285,3 +285,57 @@ struct platform_device s5pc100_device_ac97 = {
>  		.coherent_dma_mask = DMA_BIT_MASK(32),
>  	},
>  };
> +
> +/* S/PDIF Controller platform_device */
> +static int s5pc100_spdif_cfg_gpd(struct platform_device *pdev)
> +{
> +	s3c_gpio_cfgpin_range(S5PC100_GPD(5), 2, S3C_GPIO_SFN(3));
> +
> +	return 0;
> +}
> +
> +static int s5pc100_spdif_cfg_gpg3(struct platform_device *pdev)
> +{
> +	s3c_gpio_cfgpin_range(S5PC100_GPG3(5), 2, S3C_GPIO_SFN(3));
> +
> +	return 0;
> +}
> +
> +static struct resource s5pc100_spdif_resource[] = {
> +	[0] = {
> +		.start	= S5PC100_PA_SPDIF,
> +		.end	= S5PC100_PA_SPDIF + 0x100 - 1,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +	[1] = {
> +		.start	= DMACH_SPDIF,
> +		.end	= DMACH_SPDIF,
> +		.flags	= IORESOURCE_DMA,
> +	},
> +};
> +
> +static struct s3c_audio_pdata s5p_spdif_pdata = {
> +	.cfg_gpio = s5pc100_spdif_cfg_gpd,
> +};
> +
> +static u64 s5pc100_spdif_dmamask = DMA_BIT_MASK(32);
> +
> +struct platform_device s5pc100_device_spdif = {
> +	.name		= "samsung-spdif",
> +	.id		= -1,
> +	.num_resources	= ARRAY_SIZE(s5pc100_spdif_resource),
> +	.resource	= s5pc100_spdif_resource,
> +	.dev = {
> +		.platform_data = &s5p_spdif_pdata,
> +		.dma_mask = &s5pc100_spdif_dmamask,
> +		.coherent_dma_mask = DMA_BIT_MASK(32),
> +	},
> +};
> +
> +void __init s5pc100_spdif_setup_gpio(int gpio)
> +{
> +	if (gpio == S5PC100_SPDIF_GPD)
> +		s5p_spdif_pdata.cfg_gpio = s5pc100_spdif_cfg_gpd;
> +	else
> +		s5p_spdif_pdata.cfg_gpio = s5pc100_spdif_cfg_gpg3;
> +}
> diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-
> s5pc100/include/mach/map.h
> index 8751ef4..32e9cab 100644
> --- a/arch/arm/mach-s5pc100/include/mach/map.h
> +++ b/arch/arm/mach-s5pc100/include/mach/map.h
> @@ -110,6 +110,8 @@
>  #define S5PC100_PA_PCM0		0xF2400000
>  #define S5PC100_PA_PCM1		0xF2500000
> 
> +#define S5PC100_PA_SPDIF	0xF2600000
> +
>  #define S5PC100_PA_TSADC	(0xF3000000)
> 
>  /* KEYPAD */
> diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-
> s5pc100/mach-smdkc100.c
> index 020c3f9..994a1e1 100644
> --- a/arch/arm/mach-s5pc100/mach-smdkc100.c
> +++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
> @@ -47,6 +47,7 @@
>  #include <plat/adc.h>
>  #include <plat/keypad.h>
>  #include <plat/ts.h>
> +#include <plat/audio.h>
> 
>  /* Following are default values for UCON, ULCON and UFCON UART registers
*/
>  #define SMDKC100_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
> @@ -196,6 +197,7 @@ static struct platform_device *smdkc100_devices[]
> __initdata = {
>  	&s5p_device_fimc0,
>  	&s5p_device_fimc1,
>  	&s5p_device_fimc2,
> +	&s5pc100_device_spdif,
>  };
> 
>  static struct s3c2410_ts_mach_info s3c_ts_platform __initdata = {
> @@ -226,6 +228,8 @@ static void __init smdkc100_machine_init(void)
> 
>  	samsung_keypad_set_platdata(&smdkc100_keypad_data);
> 
> +	s5pc100_spdif_setup_gpio(S5PC100_SPDIF_GPD);
> +
>  	/* LCD init */
>  	gpio_request(S5PC100_GPD(0), "GPD");
>  	gpio_request(S5PC100_GPH0(6), "GPH0");
> diff --git a/arch/arm/plat-samsung/include/plat/audio.h b/arch/arm/plat-
> samsung/include/plat/audio.h
> index e32f9ed..7712ff6 100644
> --- a/arch/arm/plat-samsung/include/plat/audio.h
> +++ b/arch/arm/plat-samsung/include/plat/audio.h
> @@ -16,6 +16,15 @@
>  #define S3C64XX_AC97_GPE  1
>  extern void s3c64xx_ac97_setup_gpio(int);
> 
> +/*
> + * The machine init code calls s5p*_spdif_setup_gpio with
> + * one of these defines in order to select appropriate bank
> + * of GPIO for S/PDIF pins
> + */
> +#define S5PC100_SPDIF_GPD  0
> +#define S5PC100_SPDIF_GPG3 1
> +extern void s5pc100_spdif_setup_gpio(int);
> +
>  /**
>   * struct s3c_audio_pdata - common platform data for audio device drivers
>   * @cfg_gpio: Callback function to setup mux'ed pins in I2S/PCM/AC97 mode
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> index 7d448e1..a1c3b93 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -106,6 +106,7 @@ extern struct platform_device s5pc100_device_pcm1;
>  extern struct platform_device s5pc100_device_iis0;
>  extern struct platform_device s5pc100_device_iis1;
>  extern struct platform_device s5pc100_device_iis2;
> +extern struct platform_device s5pc100_device_spdif;
> 
>  extern struct platform_device samsung_device_keypad;
> 
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
