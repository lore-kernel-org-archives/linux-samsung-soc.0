From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 3/3] ARM: S5P: Add platform support for MFC v5.1
Date: Tue, 15 Mar 2011 22:48:57 +0900
Message-ID: <011b01cbe317$bd3e97e0$37bbc7a0$%kim@samsung.com>
References: <1300089842-13140-1-git-send-email-jtp.park@samsung.com>
 <1300089842-13140-3-git-send-email-jtp.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60406 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752613Ab1CONu0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 09:50:26 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LI300L3VQDOAB00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 22:49:01 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LI300FTKQDP03@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 22:49:01 +0900 (KST)
In-reply-to: <1300089842-13140-3-git-send-email-jtp.park@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jeongtae Park' <jtp.park@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Kamil Debski' <k.debski@samsung.com>

Jeongtae Park wrote:
> 
> Add platform support for MFC v5.1 is a module available
> on S5PC110 and S5PC210 Samsung SoCs.
> 
> Reviewed-by: Peter Oh <jaeryul.oh@samsung.com>
> Signed-off-by: Jeongtae Park <jtp.park@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kamil Debski <k.debski@samsung.com>
> ---
>  arch/arm/plat-s5p/Kconfig   |    5 ++++
>  arch/arm/plat-s5p/Makefile  |    1 +
>  arch/arm/plat-s5p/dev-mfc.c |   46
> +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/dev-mfc.c
> 
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index 6390ac7..af980d4 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -60,6 +60,11 @@ config S5P_DEV_FIMC2
>  	help
>  	  Compile in platform device definitions for FIMC controller 2
> 
> +config S5P_DEV_MFC
> +	bool
> +	help
> +	  Compile in platform device definitions for MFC
> +
>  config S5P_DEV_ONENAND
>  	bool
>  	help
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index 4bd5cf9..b1d2b2b 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_PM)		+= irq-pm.o
>  obj-$(CONFIG_S5P_DEV_FIMC0)	+= dev-fimc0.o
>  obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
>  obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
> +obj-$(CONFIG_S5P_DEV_MFC)	+= dev-mfc.o
>  obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
>  obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
>  obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
> diff --git a/arch/arm/plat-s5p/dev-mfc.c b/arch/arm/plat-s5p/dev-mfc.c
> new file mode 100644
> index 0000000..67afdae
> --- /dev/null
> +++ b/arch/arm/plat-s5p/dev-mfc.c
> @@ -0,0 +1,46 @@
> +/* linux/arch/arm/plat-s5p/dev-mfc.c
> + *
> + * Copyright (c) 2010 Samsung Electronics
> + *
> + * Base S5P MFC resource and device definitions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/ioport.h>
> +#include <linux/dma-mapping.h>
> +
> +#include <mach/map.h>
> +#include <plat/devs.h>
> +#include <plat/irqs.h>
> +
> +static struct resource s5p_mfc_resource[] = {
> +	[0] = {
> +		.start	= S5P_PA_MFC,
> +		.end	= S5P_PA_MFC + SZ_64K - 1,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +	[1] = {
> +		.start	= IRQ_MFC,
> +		.end	= IRQ_MFC,
> +		.flags	= IORESOURCE_IRQ,
> +	}
> +};
> +
> +static u64 s5p_mfc_dma_mask = DMA_BIT_MASK(32);
> +
> +struct platform_device s5p_device_mfc = {
> +	.name		= "s5p-mfc",
> +	.id		= -1,
> +	.num_resources	= ARRAY_SIZE(s5p_mfc_resource),
> +	.resource	= s5p_mfc_resource,
> +	.dev		= {
> +		.dma_mask		= &s5p_mfc_dma_mask,
> +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> +	},
> +};
> --

Hi all,

Kamil and Jeongtae, thanks for re-submitting.

I'm afraid that I decided to drop both Kamil's and Jeongtae's MFC platform
devices.
Because it is not needed now, and its driver gets review in mailing list.

This is just postponing until the final MFC driver is ready :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
