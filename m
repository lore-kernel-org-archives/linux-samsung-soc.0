From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos: Remove unused non-dt support for dwmci
 controller
Date: Tue, 27 Nov 2012 09:53:39 +0900
Message-ID: <15c901cdcc39$a3b913b0$eb2b3b10$%kim@samsung.com>
References: <1353914155-1716-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44714 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757561Ab2K0Axl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 19:53:41 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME400IW2FTELAD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:53:40 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME4006RVFTFJS70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:53:39 +0900 (KST)
In-reply-to: <1353914155-1716-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, tgih.jun@samsung.com, yuvaraj.cd@gmail.com

Thomas Abraham wrote:
> 
> With device tree support enabled for dwmci controller, the unused non-dt
> support
> for dwmci controller can be removed.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos/Makefile             |    1 -
>  arch/arm/mach-exynos/dev-dwmci.c          |   75
---------------------------
> --
>  arch/arm/mach-exynos/include/mach/dwmci.h |   20 --------
>  3 files changed, 0 insertions(+), 96 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/dev-dwmci.c
>  delete mode 100644 arch/arm/mach-exynos/include/mach/dwmci.h
> 
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
> index c12ed6a..b189881 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -50,7 +50,6 @@ obj-$(CONFIG_MACH_EXYNOS5_DT)		+= mach-
> exynos5-dt.o
>  obj-y					+= dev-uart.o
>  obj-$(CONFIG_ARCH_EXYNOS4)		+= dev-audio.o
>  obj-$(CONFIG_EXYNOS4_DEV_AHCI)		+= dev-ahci.o
> -obj-$(CONFIG_EXYNOS4_DEV_DWMCI)		+= dev-dwmci.o
>  obj-$(CONFIG_EXYNOS_DEV_DMA)		+= dma.o
>  obj-$(CONFIG_EXYNOS4_DEV_USB_OHCI)	+= dev-ohci.o
>  obj-$(CONFIG_EXYNOS_DEV_SYSMMU)		+= dev-sysmmu.o
> diff --git a/arch/arm/mach-exynos/dev-dwmci.c b/arch/arm/mach-exynos/dev-
> dwmci.c
> deleted file mode 100644
> index 7903501..0000000
> --- a/arch/arm/mach-exynos/dev-dwmci.c
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -/*
> - * linux/arch/arm/mach-exynos4/dev-dwmci.c
> - *
> - * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com
> - *
> - * Platform device for Synopsys DesignWare Mobile Storage IP
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/platform_device.h>
> -#include <linux/interrupt.h>
> -#include <linux/ioport.h>
> -#include <linux/mmc/dw_mmc.h>
> -
> -#include <plat/devs.h>
> -
> -#include <mach/map.h>
> -
> -static int exynos4_dwmci_get_bus_wd(u32 slot_id)
> -{
> -	return 4;
> -}
> -
> -static int exynos4_dwmci_init(u32 slot_id, irq_handler_t handler, void
> *data)
> -{
> -	return 0;
> -}
> -
> -static struct resource exynos4_dwmci_resource[] = {
> -	[0] = DEFINE_RES_MEM(EXYNOS4_PA_DWMCI, SZ_4K),
> -	[1] = DEFINE_RES_IRQ(EXYNOS4_IRQ_DWMCI),
> -};
> -
> -static struct dw_mci_board exynos4_dwci_pdata = {
> -	.num_slots			= 1,
> -	.quirks				=
> DW_MCI_QUIRK_BROKEN_CARD_DETECTION,
> -	.bus_hz				= 80 * 1000 * 1000,
> -	.detect_delay_ms	= 200,
> -	.init				= exynos4_dwmci_init,
> -	.get_bus_wd			= exynos4_dwmci_get_bus_wd,
> -};
> -
> -static u64 exynos4_dwmci_dmamask = DMA_BIT_MASK(32);
> -
> -struct platform_device exynos4_device_dwmci = {
> -	.name		= "dw_mmc",
> -	.id		= -1,
> -	.num_resources	= ARRAY_SIZE(exynos4_dwmci_resource),
> -	.resource	= exynos4_dwmci_resource,
> -	.dev		= {
> -		.dma_mask		= &exynos4_dwmci_dmamask,
> -		.coherent_dma_mask	= DMA_BIT_MASK(32),
> -		.platform_data	= &exynos4_dwci_pdata,
> -	},
> -};
> -
> -void __init exynos4_dwmci_set_platdata(struct dw_mci_board *pd)
> -{
> -	struct dw_mci_board *npd;
> -
> -	npd = s3c_set_platdata(pd, sizeof(struct dw_mci_board),
> -			&exynos4_device_dwmci);
> -
> -	if (!npd->init)
> -		npd->init = exynos4_dwmci_init;
> -	if (!npd->get_bus_wd)
> -		npd->get_bus_wd = exynos4_dwmci_get_bus_wd;
> -}
> diff --git a/arch/arm/mach-exynos/include/mach/dwmci.h b/arch/arm/mach-
> exynos/include/mach/dwmci.h
> deleted file mode 100644
> index 7ce6574..0000000
> --- a/arch/arm/mach-exynos/include/mach/dwmci.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -/* linux/arch/arm/mach-exynos4/include/mach/dwmci.h
> - *
> - * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com/
> - *
> - * Synopsys DesignWare Mobile Storage for EXYNOS4210
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */
> -
> -#ifndef __ASM_ARM_ARCH_DWMCI_H
> -#define __ASM_ARM_ARCH_DWMCI_H __FILE__
> -
> -#include <linux/mmc/dw_mmc.h>
> -
> -extern void exynos4_dwmci_set_platdata(struct dw_mci_board *pd);
> -
> -#endif /* __ASM_ARM_ARCH_DWMCI_H */
> --
> 1.7.5.4

Looks good to me, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
