From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 14:50:11 +0200
Message-ID: <6835645.2kTGeWTa9p@wuerfel>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com> <1400029876-5830-8-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:59716 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754683AbaENMu4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 08:50:56 -0400
In-Reply-To: <1400029876-5830-8-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org, devicetree@vger.kernel.org, l.majewski@samsung.com, kgene.kim@samsung.com, mturquette@linaro.org, heiko@sntech.de, viresh.kumar@linaro.org, t.figa@samsung.com, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, shawn.guo@linaro.org

On Wednesday 14 May 2014 06:41:15 Thomas Abraham wrote:
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
> -       platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
> +       if (!(of_machine_is_compatible("samsung,exynos5420")) &&
> +               !(of_machine_is_compatible("samsung,exynos5440")))
> +               platform_device_register_simple("cpufreq-cpu0", -1, NULL, 0);
>  }
>  

Could we please come up with a way to probe this from DT in the cpufreq-cpu0
driver itself, so we don't have to add a device in every platform using it?

I realize you copied it from the other platforms using this driver, but
it still seems really wrong.

	Arnd
