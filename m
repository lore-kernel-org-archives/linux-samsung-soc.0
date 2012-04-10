From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix compile error in pm.c
Date: Tue, 10 Apr 2012 10:04:31 -0700
Message-ID: <4F84681F.9020106@samsung.com>
References: <1333754316-9194-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:45706 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930Ab2DJREf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Apr 2012 13:04:35 -0400
Received: by pbcun15 with SMTP id un15so193196pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Apr 2012 10:04:35 -0700 (PDT)
In-Reply-To: <1333754316-9194-1-git-send-email-jhbird.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonghwan Choi <jhbird.choi@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>

Jonghwan Choi wrote:
> Fix compile error when ARCH_EXYNOS5 is only enabled without ARCH_EXYNOS4.
> 
> arch/arm/mach-exynos/built-in.o: In function `exynos4_pm_prepare':
> linux/arch/arm/mach-exynos/pm.c:185: undefined reference to `exynos4_sys_powerdown_conf'
> arch/arm/mach-exynos/built-in.o: In function `__virt_to_phys':
> linux/arch/arm/include/asm/memory.h:175: undefined reference to `s3c_cpu_resume'
> linux/arch/arm/include/asm/memory.h:175: undefined reference to `s3c_cpu_resume'
> arch/arm/plat-samsung/built-in.o: In function `s3c_irqext_wake':
> linux/arch/arm/plat-samsung/pm.c:151: undefined reference to `s3c_irqwake_eintallow'
> arch/arm/plat-samsung/built-in.o: In function `s3c_pm_enter':
> linux/arch/arm/plat-samsung/pm.c:274: undefined reference to `s3c_pm_save_core'
> linux/arch/arm/plat-samsung/pm.c:278: undefined reference to `s3c_pm_configure_extint'
> linux/arch/arm/plat-samsung/pm.c:307: undefined reference to `s3c_pm_restore_core'
> linux/arch/arm/plat-samsung/pm.c:329: undefined reference to `s3c_irqwake_intallow'
> linux/arch/arm/plat-samsung/pm.c:329: undefined reference to `s3c_irqwake_eintallow'
> 

Yes, right. When we build for exynos5 with only ARCH_EXYNOS5, above
build failure happens. But this cannot fix it. See below my comments.

> Signed-off-by: Jonghwan Choi<jhbird.choi@samsung.com>
> ---
>   arch/arm/mach-exynos/Kconfig  |    2 ++
>   arch/arm/mach-exynos/Makefile |    2 +-
>   2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 0491cee..676d3fa 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -61,6 +61,8 @@ config SOC_EXYNOS5250
>   	bool "SAMSUNG EXYNOS5250"
>   	default y
>   	depends on ARCH_EXYNOS5
> +	select S5P_PM if PM
> +	select S5P_SLEEP if PM

No, current mainline cannot support PM for exynos5 and we need Jongpill
Lee's patch for it.

>   	help
>   	  Enable EXYNOS5250 SoC support
> 
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
> index 8631840..1524efb 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -22,7 +22,7 @@ obj-$(CONFIG_PM)		+= pm.o
>   obj-$(CONFIG_PM_GENERIC_DOMAINS) += pm_domains.o
>   obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
> 
> -obj-$(CONFIG_ARCH_EXYNOS4)	+= pmu.o
> +obj-$(CONFIG_ARCH_EXYNOS)	+= pmu.o
> 
same as above, not support yet.

>   obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
> 

I think, we need to fix it but need other method. Could you please check it?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
