From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v8] ARM: EXYNOS: Use MCPM call-backs to support S2R on Exynos5420
Date: Mon, 6 Oct 2014 09:10:32 +0530
Message-ID: <CAM4voa=oZmqCf5=nD54cbi_fa4iHYh1nvOC0nt9hE=mQmhb3yw@mail.gmail.com>
References: <1412089142-12056-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50]:38466 "EHLO
	mail-qg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123AbaJFDkd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Oct 2014 23:40:33 -0400
Received: by mail-qg0-f50.google.com with SMTP id q108so3259974qgd.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Oct 2014 20:40:32 -0700 (PDT)
In-Reply-To: <1412089142-12056-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

Hi Javier,

[...]

> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index adb36a8..222aa3c 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -137,6 +137,18 @@ void exynos_cpu_power_down(int cpu)
>   */
>  void exynos_cpu_power_up(int cpu)
>  {
> +       if (cpu == 0 && (of_machine_is_compatible("samsung,exynos5420") ||
> +               of_machine_is_compatible("samsung,exynos5800"))) {
> +               /*
> +                * Bypass power down for CPU0 during suspend. Check for
> +                * the SYS_PWR_REG value to decide if we are suspending
> +                * the system.
> +                */
> +               int val = __raw_readl(pmu_base_addr +
> +                               EXYNOS5_ARM_CORE0_SYS_PWR_REG);
> +               if (!(val & S5P_CORE_LOCAL_PWR_EN))
> +                       return;
> +       }
>         pmu_raw_writel(S5P_CORE_LOCAL_PWR_EN,
>                         EXYNOS_ARM_CORE_CONFIGURATION(cpu));
>  }

The above block of code should be in exynos_cpu_power_down(). Can you
re-test s2r after modifying it ? I have to convert a __raw_readl to
pmu_raw_readl in this patch as well. Once Vikas re-works the base s2r
patch I will re-post a v9.

Regards,
Abhilash
