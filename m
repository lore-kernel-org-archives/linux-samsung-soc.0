From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/10] ARM: S5PV210: Add S/PDIF platform device
Date: Fri, 08 Oct 2010 19:14:01 +0900
Message-ID: <001a01cb66d1$9a5f83a0$cf1e8ae0$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286192800-18487-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34339 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756914Ab0JHKOv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:14:51 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y007OJV3OGV50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:14:12 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y0071SV3NDZ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:14:12 +0900 (KST)
In-reply-to: <1286192800-18487-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch add S/PDIF platform device to support S/PDIF PCM audio
> on S5PV210.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5pv210/dev-audio.c         |   40
> +++++++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/include/mach/map.h  |    3 ++
>  arch/arm/mach-s5pv210/mach-smdkc110.c     |    1 +
>  arch/arm/mach-s5pv210/mach-smdkv210.c     |    1 +
>  arch/arm/plat-samsung/include/plat/devs.h |    1 +
>  5 files changed, 46 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/dev-audio.c
b/arch/arm/mach-s5pv210/dev-
> audio.c
> index 21dc6cf..4a02cdd 100644
> --- a/arch/arm/mach-s5pv210/dev-audio.c
> +++ b/arch/arm/mach-s5pv210/dev-audio.c
> @@ -325,3 +325,43 @@ struct platform_device s5pv210_device_ac97 = {
>  		.coherent_dma_mask = DMA_BIT_MASK(32),
>  	},
>  };
> +
> +/* S/PDIF Controller platform_device */
> +
> +static int s5pv210_spdif_cfg_gpio(struct platform_device *pdev)
> +{
> +	s3c_gpio_cfgpin_range(S5PV210_GPC1(0), 2, S3C_GPIO_SFN(3));
> +
> +	return 0;
> +}
> +
> +static struct resource s5pv210_spdif_resource[] = {
> +	[0] = {
> +		.start	= S5PV210_PA_SPDIF,
> +		.end	= S5PV210_PA_SPDIF + 0x100 - 1,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +	[1] = {
> +		.start	= DMACH_SPDIF,
> +		.end	= DMACH_SPDIF,
> +		.flags	= IORESOURCE_DMA,
> +	},
> +};
> +
> +static struct s3c_audio_pdata samsung_spdif_pdata = {
> +	.cfg_gpio = s5pv210_spdif_cfg_gpio,
> +};
> +
> +static u64 s5pv210_spdif_dmamask = DMA_BIT_MASK(32);
> +
> +struct platform_device s5pv210_device_spdif = {
> +	.name		= "samsung-spdif",
> +	.id		= -1,
> +	.num_resources	= ARRAY_SIZE(s5pv210_spdif_resource),
> +	.resource	= s5pv210_spdif_resource,
> +	.dev = {
> +		.platform_data = &samsung_spdif_pdata,
> +		.dma_mask = &s5pv210_spdif_dmamask,
> +		.coherent_dma_mask = DMA_BIT_MASK(32),
> +	},
> +};
> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-
> s5pv210/include/mach/map.h
> index 12a409f..9669f69 100644
> --- a/arch/arm/mach-s5pv210/include/mach/map.h
> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
> @@ -84,6 +84,9 @@
>  #define S5PV210_PA_SDRAM	(0x20000000)
>  #define S5P_PA_SDRAM		S5PV210_PA_SDRAM
> 
> +/* S/PDIF */
> +#define S5PV210_PA_SPDIF	0xE1100000
> +
>  /* I2S */
>  #define S5PV210_PA_IIS0		0xEEE30000
>  #define S5PV210_PA_IIS1		0xE2100000
> diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-
> s5pv210/mach-smdkc110.c
> index 8211bb8..a282513 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkc110.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
> @@ -81,6 +81,7 @@ static struct s3c_ide_platdata smdkc110_ide_pdata
> __initdata = {
>  static struct platform_device *smdkc110_devices[] __initdata = {
>  	&s5pv210_device_iis0,
>  	&s5pv210_device_ac97,
> +	&s5pv210_device_spdif,
>  	&s3c_device_cfcon,
>  	&s3c_device_i2c0,
>  	&s3c_device_i2c1,
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-
> s5pv210/mach-smdkv210.c
> index fbbc0a3..c38c110 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -103,6 +103,7 @@ static struct samsung_keypad_platdata
> smdkv210_keypad_data __initdata = {
>  static struct platform_device *smdkv210_devices[] __initdata = {
>  	&s5pv210_device_iis0,
>  	&s5pv210_device_ac97,
> +	&s5pv210_device_spdif,
>  	&s3c_device_adc,
>  	&s3c_device_cfcon,
>  	&s3c_device_hsmmc0,
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> index a1c3b93..328b40d 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -87,6 +87,7 @@ extern struct platform_device s5pv210_device_pcm2;
>  extern struct platform_device s5pv210_device_iis0;
>  extern struct platform_device s5pv210_device_iis1;
>  extern struct platform_device s5pv210_device_iis2;
> +extern struct platform_device s5pv210_device_spdif;
> 
>  extern struct platform_device s5p6442_device_pcm0;
>  extern struct platform_device s5p6442_device_pcm1;
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
