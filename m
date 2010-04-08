From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Add System Timer
Date: Thu, 08 Apr 2010 09:59:36 +0200
Message-ID: <001b01cad6f1$71bdd890$553989b0$%szyprowski@samsung.com>
References: <1269916185-30533-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52460 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751539Ab0DHIBq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Apr 2010 04:01:46 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L0J00AS0SYSYI@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Apr 2010 17:01:41 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L0J00AD5SYOV9@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Apr 2010 17:01:40 +0900 (KST)
In-reply-to: <1269916185-30533-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Jongpill Lee' <boyko.lee@samsung.com>, kyungmin.park@samsung.com

Hello,

On Tuesday, March 30, 2010 4:30 AM Kukjin Kim wrote:

> From: Jongpill Lee <boyko.lee@samsung.com>
> 
> This patch addes system timer for Samsung S5P series SoCs
> 
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

I've tested this patch on Samsung Aquila board and it works fine.

> ...

> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
> index a278832..22ed209 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -94,5 +94,5 @@ MACHINE_START(SMDKV210, "SMDKV210")
>  	.init_irq	= s5pv210_init_irq,
>  	.map_io		= smdkv210_map_io,
>  	.init_machine	= smdkv210_machine_init,
> -	.timer		= &s3c24xx_timer,
> +	.timer		= &s5p_systimer,
>  MACHINE_END

What about mach-smdkc110.c ?

> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index d400a6a..a73fc56 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -23,3 +23,10 @@ config PLAT_S5P
>  	select SAMSUNG_IRQ_UART
>  	help
>  	  Base platform code for Samsung's S5P series SoC.
> +
> +config SYSTIMER_S5P
> +	bool
> +	depends on (ARCH_S5P6442 || ARCH_S5PV210)
> +	default y
> +	help
> +	  Support System Timer for S5P Series

IMHO 'S5P_SYSTIMER' would be a better name, but it is only a matter
of taste.

A new Kconfig option to conditionally disable plat-samsung/time.c timer
build would be nice to disable unused code on S5PV210.

> ...

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
