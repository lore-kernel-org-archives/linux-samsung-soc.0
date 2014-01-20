From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH v2 6/7] ARM: Exynos: switch to using generic cpufreq-cpu0
 driver
Date: Mon, 20 Jan 2014 08:48:14 +0100
Message-ID: <20140120084814.220a8efa@amdc2363>
References: <1390047057-2239-1-git-send-email-thomas.ab@samsung.com>
 <1390047057-2239-7-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55904 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726AbaATHsV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jan 2014 02:48:21 -0500
In-reply-to: <1390047057-2239-7-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com

Hi Thomas,

> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> Remove the platform device instantiation for Exynos specific cpufreq
> driver and add the platform device for cpufreq-cpu0 driver.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-exynos/common.c          |    5 -----
>  arch/arm/mach-exynos/common.h          |    1 -
>  arch/arm/mach-exynos/mach-exynos4-dt.c |    2 +-
>  arch/arm/mach-exynos/mach-exynos5-dt.c |    2 +-
>  4 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c
> b/arch/arm/mach-exynos/common.c index f18be40..72ae5d3 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -303,11 +303,6 @@ void __init exynos_cpuidle_init(void)
>  	platform_device_register(&exynos_cpuidle);
>  }
>  
> -void __init exynos_cpufreq_init(void)
> -{
> -	platform_device_register_simple("exynos-cpufreq", -1, NULL,
> 0); -}
> -
>  void __init exynos_init_late(void)
>  {
>  	if (of_machine_is_compatible("samsung,exynos5440"))
> diff --git a/arch/arm/mach-exynos/common.h
> b/arch/arm/mach-exynos/common.h index f76967b..0c31b34 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -22,7 +22,6 @@ void exynos_init_io(void);
>  void exynos4_restart(enum reboot_mode mode, const char *cmd);
>  void exynos5_restart(enum reboot_mode mode, const char *cmd);
>  void exynos_cpuidle_init(void);
> -void exynos_cpufreq_init(void);
>  void exynos_init_late(void);
>  
>  void exynos_firmware_init(void);
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c
> b/arch/arm/mach-exynos/mach-exynos4-dt.c index d3e54b7..9a25320 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -22,8 +22,8 @@
>  static void __init exynos4_dt_machine_init(void)
>  {
>  	exynos_cpuidle_init();
> -	exynos_cpufreq_init();
>  
> +	platform_device_register_simple("cpufreq-cpu0", -1, NULL, 0);
>  	of_platform_populate(NULL, of_default_bus_match_table, NULL,
> NULL); }
>  
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c
> b/arch/arm/mach-exynos/mach-exynos5-dt.c index 37ea261..9dc3710 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -44,8 +44,8 @@ static void __init exynos5_dt_machine_init(void)
>  	}
>  
>  	exynos_cpuidle_init();
> -	exynos_cpufreq_init();
>  
> +	platform_device_register_simple("cpufreq-cpu0", -1, NULL, 0);
>  	of_platform_populate(NULL, of_default_bus_match_table, NULL,
> NULL); }
>  

Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>

-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
