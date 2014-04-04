From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 08/17] ARM: exynos: cpuidle: Move scu_enable in the cpu_pm notifier
Date: Fri, 4 Apr 2014 14:27:04 +0530
Message-ID: <CAKohpomqrOFL=D-1v40szizp0UsY=fdquthJbr9TuXdE4D8D0A@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-9-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:49950 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752066AbaDDI5F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 04:57:05 -0400
Received: by mail-ob0-f180.google.com with SMTP id wn1so3235808obc.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 01:57:04 -0700 (PDT)
In-Reply-To: <1396597683-6969-9-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> We make the cpuidle code less arch dependent.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |    6 ------
>  arch/arm/mach-exynos/pm.c      |    3 +++
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index 4b090cf..c63ad05 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -18,7 +18,6 @@
>  #include <linux/platform_device.h>
>
>  #include <asm/proc-fns.h>
> -#include <asm/smp_scu.h>
>  #include <asm/suspend.h>
>  #include <asm/unified.h>
>  #include <asm/cpuidle.h>
> @@ -94,11 +93,6 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
>
>         cpu_pm_enter();
>         cpu_suspend(0, idle_finisher);
> -
> -#ifdef CONFIG_SMP
> -       if (!soc_is_exynos5250())
> -               scu_enable(S5P_VA_SCU);
> -#endif
>         cpu_pm_exit();
>
>         /*
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index b2a075e..f43a004 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -386,6 +386,9 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
>                 break;
>
>         case CPU_PM_EXIT:
> +#ifdef CONFIG_SMP
> +               scu_enable(S5P_VA_SCU);

We used to do this only when: !soc_is_exynos5250().
Why this changed?

> +#endif

You don't need these #ifdefs here.. How would you reach here on a non
SMP system?

>                 exynos_cpu_restore_register();
>                 break;
>         }
> --
> 1.7.9.5
>
>
> _______________________________________________
> linaro-kernel mailing list
> linaro-kernel@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-kernel
