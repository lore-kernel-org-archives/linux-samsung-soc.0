From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: enable 4 cores secondary cpu up for exynos5440
Date: Wed, 7 Jan 2015 10:31:02 +0800
Message-ID: <CACVXFVMWJa3rg45s2CmC_Oz=eO5Oxa+s0PEUjKdYhRqeYu73Hw@mail.gmail.com>
References: <1356980980-3387-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:35388 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932908AbbAGCbD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jan 2015 21:31:03 -0500
Received: by mail-ob0-f169.google.com with SMTP id vb8so1227080obc.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2015 18:31:02 -0800 (PST)
In-Reply-To: <1356980980-3387-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org

Hi Kukjin,

On Tue, Jan 1, 2013 at 3:09 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> No need to check power on/off with pmu control to support hotplug
> in/out on exynos5440. And this patch enables 4 cores on exynos5440.

Without this patch, oops will be triggered during kernel booting on
exynos5440, so could this one be pushed out?

Thanks,
Ming Lei

>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c |   37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index c5c840e..495a501 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -40,6 +40,8 @@ static inline void __iomem *cpu_boot_reg_base(void)
>  {
>         if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_1_1)
>                 return S5P_INFORM5;
> +       else if (soc_is_exynos5440())
> +               return (S5P_VA_CHIPID + 0x560);
>         return S5P_VA_SYSRAM;
>  }
>
> @@ -116,27 +118,30 @@ static int __cpuinit exynos_boot_secondary(unsigned int cpu, struct task_struct
>          */
>         write_pen_release(phys_cpu);
>
> -       if (!(__raw_readl(S5P_ARM_CORE1_STATUS) & S5P_CORE_LOCAL_PWR_EN)) {
> -               __raw_writel(S5P_CORE_LOCAL_PWR_EN,
> -                            S5P_ARM_CORE1_CONFIGURATION);
> +       if (!soc_is_exynos5440()) {
> +               if (!(__raw_readl(S5P_ARM_CORE1_STATUS) & S5P_CORE_LOCAL_PWR_EN)) {
> +                       __raw_writel(S5P_CORE_LOCAL_PWR_EN,
> +                                    S5P_ARM_CORE1_CONFIGURATION);
>
> -               timeout = 10;
> +                       timeout = 10;
>
> -               /* wait max 10 ms until cpu1 is on */
> -               while ((__raw_readl(S5P_ARM_CORE1_STATUS)
> -                       & S5P_CORE_LOCAL_PWR_EN) != S5P_CORE_LOCAL_PWR_EN) {
> -                       if (timeout-- == 0)
> -                               break;
> +                       /* wait max 10 ms until cpu1 is on */
> +                       while ((__raw_readl(S5P_ARM_CORE1_STATUS)
> +                               & S5P_CORE_LOCAL_PWR_EN) != S5P_CORE_LOCAL_PWR_EN) {
> +                               if (timeout-- == 0)
> +                                       break;
>
> -                       mdelay(1);
> -               }
> +                               mdelay(1);
> +                       }
>
> -               if (timeout == 0) {
> -                       printk(KERN_ERR "cpu1 power enable failed");
> -                       spin_unlock(&boot_lock);
> -                       return -ETIMEDOUT;
> +                       if (timeout == 0) {
> +                               printk(KERN_ERR "cpu1 power enable failed");
> +                               spin_unlock(&boot_lock);
> +                               return -ETIMEDOUT;
> +                       }
>                 }
>         }
> +
>         /*
>          * Send the secondary CPU a soft interrupt, thereby causing
>          * the boot monitor to read the system wide flags register,
> @@ -178,6 +183,8 @@ static void __init exynos_smp_init_cpus(void)
>
>         if (soc_is_exynos5250())
>                 ncores = 2;
> +       else if (soc_is_exynos5440())
> +               ncores = 4;
>         else
>                 ncores = scu_base ? scu_get_core_count(scu_base) : 1;
>
> --
> 1.7.10.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Ming Lei
