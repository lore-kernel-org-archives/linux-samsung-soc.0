From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 01/17] ARM: exynos: cpuidle: Prevent forward declaration
Date: Fri, 4 Apr 2014 14:12:09 +0530
Message-ID: <CAKohpomrQK=6pjuVNnZempTeNep859LPzRRbc2OPrJ-Ctx7V4g@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:63226 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888AbaDDImK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 04:42:10 -0400
Received: by mail-oa0-f48.google.com with SMTP id m1so3187562oag.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 01:42:09 -0700 (PDT)
In-Reply-To: <1396597683-6969-2-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> Move the structure below the 'exynos4_enter_lowpower' function so no more
> need of forward declaration.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |   40 ++++++++++++++++++----------------------
>  1 file changed, 18 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index f57cb91..bd2142a 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -60,30 +60,8 @@
>  #define PWR_CTRL2_CORE2_UP_RATIO               (1 << 4)
>  #define PWR_CTRL2_CORE1_UP_RATIO               (1 << 0)
>
> -static int exynos4_enter_lowpower(struct cpuidle_device *dev,
> -                               struct cpuidle_driver *drv,
> -                               int index);
> -
>  static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_device);
>
> -static struct cpuidle_driver exynos4_idle_driver = {
> -       .name                   = "exynos4_idle",
> -       .owner                  = THIS_MODULE,
> -       .states = {
> -               [0] = ARM_CPUIDLE_WFI_STATE,
> -               [1] = {
> -                       .enter                  = exynos4_enter_lowpower,
> -                       .exit_latency           = 300,
> -                       .target_residency       = 100000,
> -                       .flags                  = CPUIDLE_FLAG_TIME_VALID,
> -                       .name                   = "C1",
> -                       .desc                   = "ARM power down",
> -               },
> -       },
> -       .state_count = 2,
> -       .safe_state_index = 0,
> -};
> -
>  /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
>  static void exynos4_set_wakeupmask(void)
>  {
> @@ -214,6 +192,24 @@ static void __init exynos5_core_down_clk(void)
>         __raw_writel(tmp, EXYNOS5_PWR_CTRL2);
>  }
>
> +static struct cpuidle_driver exynos4_idle_driver = {
> +       .name                   = "exynos4_idle",
> +       .owner                  = THIS_MODULE,
> +       .states = {
> +               [0] = ARM_CPUIDLE_WFI_STATE,
> +               [1] = {
> +                       .enter                  = exynos4_enter_lowpower,
> +                       .exit_latency           = 300,
> +                       .target_residency       = 100000,
> +                       .flags                  = CPUIDLE_FLAG_TIME_VALID,
> +                       .name                   = "C1",
> +                       .desc                   = "ARM power down",
> +               },
> +       },
> +       .state_count = 2,
> +       .safe_state_index = 0,
> +};
> +
>  static int exynos_cpuidle_probe(struct platform_device *pdev)
>  {
>         int cpu_id, ret;

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
