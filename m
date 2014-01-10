From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH 5/6] arm: exynos4-dt: statically add platform device for
 cpufreq-cpu0 platform driver
Date: Fri, 10 Jan 2014 11:23:41 +0100
Message-ID: <20140110112341.64049da3@amdc2363>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
 <1389283165-17708-6-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <1389283165-17708-6-git-send-email-thomas.ab@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, t.figa@samsung.com, kgene.kim@samsung.com, viresh.kumar@linaro.org, shawn.guo@linaro.org, thomas.ab@samsung.com, Lukasz Majewski <l.majewski@majess.pl>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thomas,

> In order to use the cpufreq-cpu0 driver on Exynos4 based platforms,
> statically add the platform device for cpufreq-cpu0 platform driver.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos4-dt.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c
> b/arch/arm/mach-exynos/mach-exynos4-dt.c index d3e54b7..8b8ad41 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -19,11 +19,17 @@
>  
>  #include "common.h"
>  
> +static struct platform_device cpufreq_device = {
> +	.name		= "cpufreq-cpu0",
> +	.id		= -1,
> +};
> +
>  static void __init exynos4_dt_machine_init(void)
>  {
>  	exynos_cpuidle_init();
>  	exynos_cpufreq_init();
>  
> +	platform_device_register(&cpufreq_device);
>  	of_platform_populate(NULL, of_default_bus_match_table, NULL,
> NULL); }
>  

Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>

-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
