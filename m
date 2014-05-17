From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0
 driver
Date: Sat, 17 May 2014 02:04:27 +0200
Message-ID: <5376A78B.1080903@gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com> <1400029876-5830-8-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:47375 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752143AbaEQAEi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 20:04:38 -0400
In-Reply-To: <1400029876-5830-8-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, shawn.guo@linaro.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de, thomas.ab@samsung.com



On 14.05.2014 03:11, Thomas Abraham wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> Remove the platform device instantiation for Exynos specific cpufreq
> driver and add the platform device for cpufreq-cpu0 driver.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index b32a907..489a495 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -232,7 +232,9 @@ void __init exynos_cpuidle_init(void)
>  
>  void __init exynos_cpufreq_init(void)
>  {
> -	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
> +	if (!(of_machine_is_compatible("samsung,exynos5420")) &&
> +		!(of_machine_is_compatible("samsung,exynos5440")))
> +		platform_device_register_simple("cpufreq-cpu0", -1, NULL, 0);
>  }
>  
>  void __init exynos_init_late(void)
> 

As a good intermediate step that can be completely replaced in future,
if necessary (as opposed to stable DT bindings...):

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
