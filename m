From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] ARM: exynos: Adapt to cpuidle core time keeping and irq
 enable
Date: Wed, 25 Apr 2012 16:44:54 +0200
Message-ID: <4F980DE6.1020504@linaro.org>
References: <1335355912-26063-1-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:62830 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751730Ab2DYOo6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 10:44:58 -0400
Received: by bkuw12 with SMTP id w12so144396bku.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Apr 2012 07:44:57 -0700 (PDT)
In-Reply-To: <1335355912-26063-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, Robert Lee <rob.lee@linaro.org>

On 04/25/2012 02:11 PM, Amit Daniel Kachhap wrote:
> This patch enables core cpuidle timekeeping and irq enabling and
> remove those redundant parts from the exynos cpuidle drivers
>
> CC: Daniel Lezcano<daniel.lezcano@linaro.org>
> CC: Robert Lee<rob.lee@linaro.org>
> Signed-off-by: Amit Daniel<amit.kachhap@linaro.org>
> ---
>   arch/arm/mach-exynos/cpuidle.c |   53 ++++-------------------------=
----------
>   1 files changed, 6 insertions(+), 47 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cp=
uidle.c
> index 33ab4e7..26dac28 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -20,6 +20,7 @@
>   #include<asm/smp_scu.h>
>   #include<asm/suspend.h>
>   #include<asm/unified.h>
> +#include<asm/cpuidle.h>
>   #include<mach/regs-pmu.h>
>   #include<mach/pmu.h>
>
> @@ -34,22 +35,12 @@
>
>   #define S5P_CHECK_AFTR		0xFCBA0D10
>
> -static int exynos4_enter_idle(struct cpuidle_device *dev,
> -			struct cpuidle_driver *drv,
> -			      int index);
>   static int exynos4_enter_lowpower(struct cpuidle_device *dev,
>   				struct cpuidle_driver *drv,
>   				int index);
>
>   static struct cpuidle_state exynos4_cpuidle_set[] __initdata =3D {
> -	[0] =3D {
> -		.enter			=3D exynos4_enter_idle,
> -		.exit_latency		=3D 1,
> -		.target_residency	=3D 100000,
> -		.flags			=3D CPUIDLE_FLAG_TIME_VALID,
> -		.name			=3D "C0",
> -		.desc			=3D "ARM clock gating(WFI)",
> -	},
> +	[0] =3D ARM_CPUIDLE_WFI_STATE,
>   	[1] =3D {
>   		.enter			=3D exynos4_enter_lowpower,
>   		.exit_latency		=3D 300,
> @@ -63,8 +54,9 @@ static struct cpuidle_state exynos4_cpuidle_set[] _=
_initdata =3D {
>   static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_device=
);
>
>   static struct cpuidle_driver exynos4_idle_driver =3D {
> -	.name		=3D "exynos4_idle",
> -	.owner		=3D THIS_MODULE,
> +	.name			=3D "exynos4_idle",
> +	.owner			=3D THIS_MODULE,
> +	.en_core_tk_irqen	=3D 1,
>   };
>
>   /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
> @@ -103,13 +95,8 @@ static int exynos4_enter_core0_aftr(struct cpuidl=
e_device *dev,
>   				struct cpuidle_driver *drv,
>   				int index)
>   {
> -	struct timeval before, after;
> -	int idle_time;
>   	unsigned long tmp;
>
> -	local_irq_disable();
> -	do_gettimeofday(&before);
> -
>   	exynos4_set_wakeupmask();
>
>   	/* Set value of power down register for aftr mode */
> @@ -150,34 +137,6 @@ static int exynos4_enter_core0_aftr(struct cpuid=
le_device *dev,
>   	/* Clear wakeup state register */
>   	__raw_writel(0x0, S5P_WAKEUP_STAT);
>
> -	do_gettimeofday(&after);
> -
> -	local_irq_enable();
> -	idle_time =3D (after.tv_sec - before.tv_sec) * USEC_PER_SEC +
> -		    (after.tv_usec - before.tv_usec);
> -
> -	dev->last_residency =3D idle_time;
> -	return index;
> -}
> -
> -static int exynos4_enter_idle(struct cpuidle_device *dev,
> -				struct cpuidle_driver *drv,
> -				int index)
> -{
> -	struct timeval before, after;
> -	int idle_time;
> -
> -	local_irq_disable();
> -	do_gettimeofday(&before);
> -
> -	cpu_do_idle();
> -
> -	do_gettimeofday(&after);
> -	local_irq_enable();
> -	idle_time =3D (after.tv_sec - before.tv_sec) * USEC_PER_SEC +
> -		    (after.tv_usec - before.tv_usec);
> -
> -	dev->last_residency =3D idle_time;
>   	return index;
>   }
>
> @@ -192,7 +151,7 @@ static int exynos4_enter_lowpower(struct cpuidle_=
device *dev,
>   		new_index =3D drv->safe_state_index;
>
>   	if (new_index =3D=3D 0)
> -		return exynos4_enter_idle(dev, drv, new_index);
> +		return arm_cpuidle_simple_enter(dev, drv, new_index);
>   	else
>   		return exynos4_enter_core0_aftr(dev, drv, new_index);
>   }

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
