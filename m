From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2 5/7] ARM: S5PV210: Enable USB HSOTG gadget build
Date: Tue, 28 Sep 2010 16:53:27 +0900
Message-ID: <006001cb5ee2$40765db0$c1631910$%kim@samsung.com>
References: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
 <1284987337-15365-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19169 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702Ab0I1HxQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 03:53:16 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9G0099J5WQFLA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 16:53:14 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9G009VA5WQB9@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 16:53:14 +0900 (KST)
In-reply-to: <1284987337-15365-6-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek wrote:
> 
> Add the necessary definitions and mapping information to enable the
> s3c-hsotg gadget to build.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> s5pv210 otg

Maybe miss typing? ;-)

> ---
>  arch/arm/mach-s5pv210/cpu.c                   |    5 +++++
>  arch/arm/mach-s5pv210/include/mach/map.h      |    4 ++++
>  arch/arm/mach-s5pv210/include/mach/regs-sys.h |   19
> +++++++++++++++++++
>  arch/arm/plat-s5p/include/plat/map-s5p.h      |    1 +
>  4 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv210/include/mach/regs-sys.h
> 
> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
> index c551ab1..8e4a39f 100644
> --- a/arch/arm/mach-s5pv210/cpu.c
> +++ b/arch/arm/mach-s5pv210/cpu.c
> @@ -84,6 +84,11 @@ static struct map_desc s5pv210_iodesc[] __initdata = {
>  		.pfn		= __phys_to_pfn(S5PV210_PA_SROMC),
>  		.length		= SZ_4K,
>  		.type		= MT_DEVICE,
> +	}, {
> +		.virtual	= (unsigned long)S3C_VA_USB_HSPHY,
> +		.pfn		=__phys_to_pfn(S5PV210_PA_HSPHY),
> +		.length		= SZ_4K,
> +		.type		= MT_DEVICE,
>  	}
>  };
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-
> s5pv210/include/mach/map.h
> index b86d040..abe20d0 100644
> --- a/arch/arm/mach-s5pv210/include/mach/map.h
> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
> @@ -73,6 +73,9 @@
> 
>  #define S5PV210_PA_HSMMC(x)	(0xEB000000 + ((x) * 0x100000))
> 
> +#define S5PV210_PA_HSOTG	(0xEC000000)
> +#define S5PV210_PA_HSPHY	(0xEC100000)
> +
>  #define S5PV210_PA_VIC0		(0xF2000000)
>  #define S5PV210_PA_VIC1		(0xF2100000)
>  #define S5PV210_PA_VIC2		(0xF2200000)
> @@ -108,6 +111,7 @@
>  #define S3C_PA_FB		S5PV210_PA_FB
>  #define S3C_PA_RTC		S5PV210_PA_RTC
>  #define S3C_PA_WDT		S5PV210_PA_WATCHDOG
> +#define S3C_PA_USB_HSOTG	S5PV210_PA_HSOTG
>  #define S5P_PA_FIMC0		S5PV210_PA_FIMC0
>  #define S5P_PA_FIMC1		S5PV210_PA_FIMC1
>  #define S5P_PA_FIMC2		S5PV210_PA_FIMC2
> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-sys.h
b/arch/arm/mach-
> s5pv210/include/mach/regs-sys.h
> new file mode 100644
> index 0000000..26691d3
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/regs-sys.h
> @@ -0,0 +1,19 @@
> +/* arch/arm/mach-s5pv210/include/mach/regs-sys.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5PV210 - System registers definitions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#define S5PV210_USB_PHY_CON	(S3C_VA_SYS + 0xE80C)
> +#define S5PV210_USB_PHY0_EN	(1 << 0)
> +#define S5PV210_USB_PHY1_EN	(1 << 1)
> +
> +/* compatibility defines for s3c-hsotg driver */
> +#define S3C64XX_OTHERS		S5PV210_USB_PHY_CON
> +#define S3C64XX_OTHERS_USBMASK	S5PV210_USB_PHY0_EN
> diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat-
> s5p/include/plat/map-s5p.h
> index c4ff88b..dc5bce9 100644
> --- a/arch/arm/plat-s5p/include/plat/map-s5p.h
> +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
> @@ -18,6 +18,7 @@
>  #define S5P_VA_SYSTIMER		S3C_ADDR(0x01200000)
>  #define S5P_VA_SROMC		S3C_ADDR(0x01100000)
>  #define S5P_VA_SYSRAM		S3C_ADDR(0x01180000)
> +#define S3C_VA_USB_HSPHY	S3C_ADDR(0x02000000)
> 
>  #define S5P_VA_COMBINER_BASE	S3C_ADDR(0x00600000)
>  #define S5P_VA_COMBINER(x)	(S5P_VA_COMBINER_BASE + ((x) >> 2) *
> 0x10)
> --

Looks ok...will apply with removing above miss typing.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
