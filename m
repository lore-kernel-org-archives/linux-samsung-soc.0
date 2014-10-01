From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [GIT PULL 3/3] 3rd Round of Exynos-PM-2 Updates for v3.18
Date: Wed, 01 Oct 2014 18:49:20 +0200
Message-ID: <1836556.iSSlTrnDdl@amdc1032>
References: <54244973.7090204@samsung.com> <201410011801.29389.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31726 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752946AbaJAQtg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 12:49:36 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NCR003QPYQMIR00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Oct 2014 01:49:34 +0900 (KST)
In-reply-to: <201410011801.29389.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>


Hi,

On Wednesday, October 01, 2014 06:01:29 PM Arnd Bergmann wrote:
> On Thursday 25 September 2014, Kukjin Kim wrote:
> > Exynos 2nd PM related updates for v3.18
> > 
> > - Firmware supporting suspend and resume to excute of low
> >    level operations to enter and leave power mode for exynos
> >    : introduce suspend() and resume() firmware operations
> > 
> > - Fix AFTR mode on boards with secure firmware enabled and
> >    allows exynos cpuidle driver usage on exynos4x12 SoCs
> > 
> > - Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=y
> > 
> > - SWRESET is needed to boot secondary CPU on exynos3250
> > 
> 
> I needed another fixup to make this build, but I'm not sure about
> whether this is the right solution.

Could you please share the build errors and the used config?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> I decided not to pull this one, please test again with and without
> my patch for the case that ARM_CPU_SUSPEND is disabled.
> 
> 	Arnd
> 
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
> index 64324bf5edb4..aaab67d84bf6 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -14,9 +14,9 @@ obj-				:=
>  
>  # Core
>  
> -obj-$(CONFIG_ARCH_EXYNOS)	+= exynos.o pmu.o exynos-smc.o firmware.o sleep.o
> +obj-$(CONFIG_ARCH_EXYNOS)	+= exynos.o pmu.o exynos-smc.o firmware.o
>  
> -obj-$(CONFIG_EXYNOS_CPU_SUSPEND) += pm.o
> +obj-$(CONFIG_EXYNOS_CPU_SUSPEND) += pm.o sleep.o
>  obj-$(CONFIG_PM_SLEEP)		+= suspend.o
>  obj-$(CONFIG_PM_GENERIC_DOMAINS) += pm_domains.o
>  
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
> index 2c5bc6bfcbdf..b7ff8f25bf4a 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -129,11 +129,11 @@ static int exynos_resume(void)
>  }
>  
>  static const struct firmware_ops exynos_firmware_ops = {
> -	.do_idle		= exynos_do_idle,
> +	.do_idle		= IS_ENABLED(CONFIG_EXYNOS_CPU_SUSPEND) ? exynos_do_idle : NULL,
>  	.set_cpu_boot_addr	= exynos_set_cpu_boot_addr,
>  	.cpu_boot		= exynos_cpu_boot,
> -	.suspend		= exynos_suspend,
> -	.resume			= exynos_resume,
> +	.suspend		= IS_ENABLED(CONFIG_PM_SLEEP) ? exynos_suspend : NULL,
> +	.resume			= IS_ENABLED(CONFIG_PM_SLEEP) ? exynos_resume : NULL,
>  };
>  
>  void __init exynos_firmware_init(void)
