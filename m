From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: JPEG: board definition and device
 registration
Date: Fri, 14 Oct 2011 20:10:55 +0900
Message-ID: <000001cc8a61$f1ab2dd0$d5018970$%kim@samsung.com>
References: <1318335553-13355-1-git-send-email-andrzej.p@samsung.com>
 <1318335553-13355-2-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56038 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035Ab1JNLK5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Oct 2011 07:10:57 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LT1000I5Z22R3M0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 20:10:56 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LT100I1QZ27L840@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 20:10:55 +0900 (KST)
In-reply-to: <1318335553-13355-2-git-send-email-andrzej.p@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Andrzej Pietrasiewicz' <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Andrzej Pietrasiewicz wrote:
> 
> Exynos4 JPEG IP board definition and device registration
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/Kconfig               |    1 +
>  arch/arm/mach-exynos4/clock.c               |    5 +++
>  arch/arm/mach-exynos4/include/mach/map.h    |    3 ++
>  arch/arm/mach-exynos4/mach-universal_c210.c |    2 +
>  arch/arm/plat-s5p/Kconfig                   |    5 +++
>  arch/arm/plat-s5p/Makefile                  |    1 +
>  arch/arm/plat-s5p/dev-jpeg.c                |   46
> +++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h   |    1 +
>  8 files changed, 64 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/dev-jpeg.c
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index cf5b8e2..001d742 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -175,6 +175,7 @@ config MACH_UNIVERSAL_C210
>  	select S5P_DEV_FIMC2
>  	select S5P_DEV_FIMC3
>  	select S5P_DEV_CSIS0
> +	select S5P_DEV_JPEG
>  	select S5P_DEV_FIMD0
>  	select S5P_DEV_G2D
>  	select S3C_DEV_HSMMC
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 38ebce3..fa4d954 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -469,6 +469,11 @@ static struct clk init_clocks_off[] = {
>  		.enable		= exynos4_clk_ip_cam_ctrl,
>  		.ctrlbit	= (1 << 5),
>  	}, {
> +		.name		= "jpeg",
> +		.id		= 0,
> +		.enable		= exynos4_clk_ip_cam_ctrl,
> +		.ctrlbit	= (1 << 6),
> +	}, {
>  		.name		= "fimc",
>  		.devname	= "exynos4-fimc.0",
>  		.enable		= exynos4_clk_ip_cam_ctrl,
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-
> exynos4/include/mach/map.h
> index 8078644..16209fe 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -31,6 +31,8 @@
>  #define EXYNOS4_PA_FIMC2		0x11820000
>  #define EXYNOS4_PA_FIMC3		0x11830000
> 
> +#define EXYNOS4_PA_JPEG			0x11840000
> +
>  #define EXYNOS4_PA_G2D			0x12800000
> 
>  #define EXYNOS4_PA_HSOTG		0x12480000
> @@ -162,6 +164,7 @@
>  #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
>  #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
>  #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
> +#define S5P_PA_JPEG			EXYNOS4_PA_JPEG
>  #define S5P_PA_G2D			EXYNOS4_PA_G2D
>  #define S5P_PA_MIPI_CSIS0		EXYNOS4_PA_MIPI_CSIS0
>  #define S5P_PA_MIPI_CSIS1		EXYNOS4_PA_MIPI_CSIS1
> diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-
> exynos4/mach-universal_c210.c
> index f2fe3dd..8eeebcc 100644
> --- a/arch/arm/mach-exynos4/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos4/mach-universal_c210.c
> @@ -1173,6 +1173,7 @@ static struct platform_device *universal_devices[]
> __initdata = {
>  	&s5p_device_onenand,
>  	&s5p_device_fimd0,
>  	&s3c_device_usb_hsotg,
> +	&s5p_device_jpeg,
>  	&universal_spi_gpio,
>  	&s5p_device_mfc,
>  	&s5p_device_mfc_l,
> @@ -1260,6 +1261,7 @@ static void __init universal_machine_init(void)
>  	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
>  	clk_xusbxti.rate = 24000000;
> 
> +	s5p_device_jpeg.dev.parent =  &exynos4_device_pd[PD_CAM].dev;
>  	s5p_device_fimc0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
>  	s5p_device_fimc1.dev.parent = &exynos4_device_pd[PD_CAM].dev;
>  	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index b0b3632..feb9c29 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -68,6 +68,11 @@ config S5P_DEV_FIMC3
>  	help
>  	  Compile in platform device definitions for FIMC controller 3
> 
> +config S5P_DEV_JPEG
> +	bool
> +	help
> +	  Compile in platform device definitions for JPEG codec
> +
>  config S5P_DEV_G2D
>  	bool
>  	help
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index 8712ccf..8c5aa54 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_S5P_DEV_FIMC0)	+= dev-fimc0.o
>  obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
>  obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
>  obj-$(CONFIG_S5P_DEV_FIMC3)	+= dev-fimc3.o
> +obj-$(CONFIG_S5P_DEV_JPEG)	+= dev-jpeg.o
>  obj-$(CONFIG_S5P_DEV_FIMD0)	+= dev-fimd0.o
>  obj-$(CONFIG_S5P_DEV_G2D)	+= dev-g2d.o
>  obj-$(CONFIG_S5P_DEV_I2C_HDMIPHY) += dev-i2c-hdmiphy.o
> diff --git a/arch/arm/plat-s5p/dev-jpeg.c b/arch/arm/plat-s5p/dev-jpeg.c
> new file mode 100644
> index 0000000..cad8ae4
> --- /dev/null
> +++ b/arch/arm/plat-s5p/dev-jpeg.c
> @@ -0,0 +1,46 @@
> +/* linux/arch/arm/plat-s5p/dev-jpeg.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * Author: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> + *
> + * Base S5P JPEG resource and device definitions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/ioport.h>
> +#include <mach/map.h>
> +
> +static struct resource s5p_jpeg_resource[] = {
> +	[0] = {
> +		.start	= S5P_PA_JPEG,
> +		.end	= S5P_PA_JPEG + SZ_4K - 1,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +	[1] = {
> +		.start	= IRQ_JPEG,
> +		.end	= IRQ_JPEG,
> +		.flags	= IORESOURCE_IRQ,
> +	},
> +};
> +
> +static u64 s5p_jpeg_dma_mask = DMA_BIT_MASK(32);
> +
> +struct platform_device s5p_device_jpeg = {
> +	.name		= "s5p-jpeg",
> +	.id		= 0,
> +	.num_resources	= ARRAY_SIZE(s5p_jpeg_resource),
> +	.resource	= s5p_jpeg_resource,
> +	.dev		= {
> +		.dma_mask		= &s5p_jpeg_dma_mask,
> +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> +	},
> +};
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> index a048795..076bdc9 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -139,6 +139,7 @@ extern struct platform_device s5p_device_fimc0;
>  extern struct platform_device s5p_device_fimc1;
>  extern struct platform_device s5p_device_fimc2;
>  extern struct platform_device s5p_device_fimc3;
> +extern struct platform_device s5p_device_jpeg;
>  extern struct platform_device s5p_device_g2d;
>  extern struct platform_device s5p_device_mfc;
>  extern struct platform_device s5p_device_mfc_l;
> --
> 1.7.0.4

Err, you need to rebase against on latest -next and all regarding
platform_devices and resources have been moved into plat-samsung. In
addition, you can find the DEFINE_RES_XXX() is used in there......

And in this case, just one patch, you don't need to add cover-letter, what's
difference with this?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
