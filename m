From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Kill exynos_pm_late_initcall()
Date: Sat, 21 Dec 2013 06:36:33 +0900
Message-ID: <52B4B861.2050506@samsung.com>
References: <1387574758-28489-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:62733 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753519Ab3LTVgi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 16:36:38 -0500
Received: by mail-pd0-f180.google.com with SMTP id q10so3013927pdj.25
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 13:36:38 -0800 (PST)
In-Reply-To: <1387574758-28489-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org

On 12/21/13 06:25, Sylwester Nawrocki wrote:
> The only thing exynos_pm_late_initcall() does is calling
> pm_genpd_poweroff_unused(), which is already stubbed when
> CONFIG_PM_GENERIC_DOMAINS is not enabled. So replace
> exynos_pm_late_initcall() with a direct call to
> pm_genpd_poweroff_unused().
>
> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
> ---
>   arch/arm/mach-exynos/common.c     |    3 ++-
>   arch/arm/mach-exynos/common.h     |    6 ------
>   arch/arm/mach-exynos/pm_domains.c |    6 ------
>   3 files changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 8ae4797..09e6898 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -23,6 +23,7 @@
>   #include<linux/of.h>
>   #include<linux/of_fdt.h>
>   #include<linux/of_irq.h>
> +#include<linux/pm_domain.h>
>   #include<linux/export.h>
>   #include<linux/irqdomain.h>
>   #include<linux/of_address.h>
> @@ -324,7 +325,7 @@ void __init exynos_init_late(void)
>   		/* to be supported later */
>   		return;
>
> -	exynos_pm_late_initcall();
> +	pm_genpd_poweroff_unused();
>   }
>
>   static int __init exynos_fdt_map_chipid(unsigned long node, const char *uname,
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index ff9b6a9..0c31b34 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -26,12 +26,6 @@ void exynos_init_late(void);
>
>   void exynos_firmware_init(void);
>
> -#ifdef CONFIG_PM_GENERIC_DOMAINS
> -int exynos_pm_late_initcall(void);
> -#else
> -static inline int exynos_pm_late_initcall(void) { return 0; }
> -#endif
> -
>   extern struct smp_operations exynos_smp_ops;
>
>   extern void exynos_cpu_die(unsigned int cpu);
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index ff50836..8fd2488 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -184,9 +184,3 @@ static __init int exynos4_pm_init_power_domain(void)
>   	return 0;
>   }
>   arch_initcall(exynos4_pm_init_power_domain);
> -
> -int __init exynos_pm_late_initcall(void)
> -{
> -	pm_genpd_poweroff_unused();
> -	return 0;
> -}

Yes, right. Applied BTW, how about same thing in mach-s3c64xx? ;-)

Thanks and Merry Christmas.

- Kukjin
