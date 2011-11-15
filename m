From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/6] ARM: SAMSUNG: Consolidation of SPI platform devices to
 plat-samsung
Date: Tue, 15 Nov 2011 16:08:52 +0900
Message-ID: <003301cca365$6e8758d0$4b960a70$%kim@samsung.com>
References: <1320410634-10788-1-git-send-email-padma.v@samsung.com>
 <1320410634-10788-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15275 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752648Ab1KOHIy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 02:08:54 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUO004Y9X3VNL20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 16:08:53 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUO00JGCX6SAD40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 16:08:52 +0900 (KST)
In-reply-to: <1320410634-10788-2-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, broonie@opensource.wolfsonmicro.com, ian@opensource.wolfsonmicro.com, dp@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com

Padmavathi Venna wrote:
> 
> SPI platform device definitions consolidated from respective machine
> folder to plat-samsung
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/mach-s3c64xx/Makefile                   |    1 -
>  arch/arm/mach-s3c64xx/dev-spi.c                  |  172 -----------------
>  arch/arm/mach-s5p64x0/Makefile                   |    1 -
>  arch/arm/mach-s5p64x0/dev-spi.c                  |  218
---------------------
>  arch/arm/mach-s5pc100/Makefile                   |    1 -
>  arch/arm/mach-s5pc100/dev-spi.c                  |  220
----------------------
>  arch/arm/mach-s5pv210/Makefile                   |    1 -
>  arch/arm/mach-s5pv210/dev-spi.c                  |  169 -----------------
>  arch/arm/plat-samsung/Kconfig                    |   14 ++-
>  arch/arm/plat-samsung/devs.c                     |  112 +++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h        |    8 +-
>  arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |   13 +-
>  12 files changed, 133 insertions(+), 797 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c64xx/dev-spi.c
>  delete mode 100644 arch/arm/mach-s5p64x0/dev-spi.c
>  delete mode 100644 arch/arm/mach-s5pc100/dev-spi.c
>  delete mode 100644 arch/arm/mach-s5pv210/dev-spi.c
> 

Hi Padma,

Basically, looks good and there are some comments below.

(snip)

> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 313eb26..8a2b23a 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -226,7 +226,19 @@ config SAMSUNG_DEV_IDE
>  	help
>  	  Compile in platform device definitions for IDE
> 
> -config S3C64XX_DEV_SPI
> +config S3C64XX_DEV_SPI0
> +	bool
> +	help
> +	  Compile in platform device definitions for S3C64XX's type
> +	  SPI controllers.
> +
> +config S3C64XX_DEV_SPI1
> +	bool
> +	help
> +	  Compile in platform device definitions for S3C64XX's type
> +	  SPI controllers.
> +
> +config S3C64XX_DEV_SPI2

Yeah, needs above config to check the channel now...but I'm thinking need to
sort out it anyway.

>  	bool
>  	help
>  	  Compile in platform device definitions for S3C64XX's type
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 4ca8b57..76e374d 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -61,6 +61,7 @@
>  #include <plat/regs-iic.h>
>  #include <plat/regs-serial.h>
>  #include <plat/regs-spi.h>
> +#include <plat/s3c64xx-spi.h>
> 
>  static u64 samsung_device_dma_mask = DMA_BIT_MASK(32);
> 
> @@ -1461,3 +1462,114 @@ struct platform_device s3c_device_wdt = {
>  	.resource	= s3c_wdt_resource,
>  };
>  #endif /* CONFIG_S3C_DEV_WDT */
> +
> +#ifdef CONFIG_S3C64XX_DEV_SPI0
> +static struct resource s3c64xx_spi0_resource[] = {
> +	[0] = DEFINE_RES_MEM(S3C_PA_SPI0, SZ_256),
> +	[1] = DEFINE_RES_DMA(DMACH_SPI0_TX),
> +	[2] = DEFINE_RES_DMA(DMACH_SPI0_RX),
> +	[3] = DEFINE_RES_IRQ(IRQ_SPI0),
> +};
> +
> +struct platform_device s3c64xx_device_spi0 = {
> +	.name		= "s3c64xx-spi",
> +	.id		= 0,
> +	.num_resources	= ARRAY_SIZE(s3c64xx_spi0_resource),
> +	.resource	= s3c64xx_spi0_resource,
> +	.dev = {
> +		.dma_mask		= &samsung_device_dma_mask,
> +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> +	},
> +};
> +
> +void __init s3c64xx_spi0_set_info(struct s3c64xx_spi_info *pd,
> +					int src_clk_nr, int num_cs)

How about 's3c64xx_spi_set_platdata' like others in plat-samsung/devs.c?

> +{
> +	if (!pd) {
> +		pr_err("%s:Need to pass platform data\n", __func__);
> +		return;
> +	}

Needs empty line here.

> +	/* Reject invalid configuration */
> +	if (!num_cs || src_clk_nr < 0) {
> +		pr_err("%s: Invalid SPI configuration\n", __func__);
> +		return;
> +	}

Same as above.

> +	pd->num_cs = num_cs;
> +	pd->src_clk_nr = src_clk_nr;
> +	s3c_set_platdata(pd, sizeof(*pd), &s3c64xx_device_spi0);

If we know the SPI controller number here, we can merge this function to
just one. So how about to add it to the 'struct s3c64xx_spi_info'?

> +}

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
