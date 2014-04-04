From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 05/17] ARM: exynos: cpuidle: Move some code inside the idle_finisher
Date: Fri, 4 Apr 2014 14:20:31 +0530
Message-ID: <CAKohponNuanWf2jbD+P0v=05O4CmJV2wBV9wDbLK5GJBCoNGTA@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-6-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:40158 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751655AbaDDIuc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 04:50:32 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so3274409oag.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 01:50:31 -0700 (PDT)
In-Reply-To: <1396597683-6969-6-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> Move the code around to differentiate different section of code and prepare it
> to be factored out in the next patches.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |   17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index 18f6aba..9cd1ed9 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -88,7 +88,16 @@ static void restore_cpu_arch_register(void)
>
>  static int idle_finisher(unsigned long flags)
>  {
> +       exynos_set_wakeupmask();
> +
> +       __raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
> +       __raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
> +
> +       /* Set value of power down register for aftr mode */
> +       exynos_sys_powerdown_conf(SYS_AFTR);

Just to highlight this, you have changed the order in which these
things were done earlier.. In case that have any side effects.

>         cpu_do_idle();
> +
>         return 1;
>  }
>
> @@ -98,14 +107,6 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
>  {
>         unsigned long tmp;
>
> -       exynos_set_wakeupmask();
> -
> -       /* Set value of power down register for aftr mode */
> -       exynos_sys_powerdown_conf(SYS_AFTR);
> -
> -       __raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
> -       __raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
> -
>         save_cpu_arch_register();
>
>         /* Setting Central Sequence Register for power down mode */

Here as well, we do all above (-) things after this sequence now:

save_cpu_arch_register();

/* Setting Central Sequence Register for power down mode */
tmp = __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
tmp &= ~S5P_CENTRAL_LOWPWR_CFG;
__raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);

cpu_pm_enter();

Probably mention that in log too, that it doesn't have any side effects?

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
