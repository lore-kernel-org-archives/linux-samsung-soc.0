From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clockevent: exynos_mct: fix lockdep warning
Date: Thu, 26 Sep 2013 02:39:25 +0200
Message-ID: <5243823D.4040208@linaro.org>
References: <1380120578-17458-1-git-send-email-tom.leiming@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:53369 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754761Ab3IZAj2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Sep 2013 20:39:28 -0400
Received: by mail-wi0-f173.google.com with SMTP id hq15so6288904wib.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Sep 2013 17:39:27 -0700 (PDT)
In-Reply-To: <1380120578-17458-1-git-send-email-tom.leiming@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ming Lei <tom.leiming@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>

On 09/25/2013 04:49 PM, Ming Lei wrote:
> This patch moves request_irq() out of cpu notifier callback
> to fix below lockdep warning:
>=20
> [    0.249513] ------------[ cut here ]------------
> [    0.249525] WARNING: CPU: 1 PID: 0 at kernel/lockdep.c:2740 lockde=
p_trace_alloc+0xc8/0x10c()
> [    0.249534] DEBUG_LOCKS_WARN_ON(irqs_disabled_flags(flags))
> [    0.249538] Modules linked in:
> [    0.249548] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 3.12.0-rc1-n=
ext-20130923+ #338
> [    0.249564] [<c00165d0>] (unwind_backtrace+0x0/0xec) from [<c0012b=
48>] (show_stack+0x20/0x24)
> [    0.249577] [<c0012b48>] (show_stack+0x20/0x24) from [<c04ebf0c>] =
(dump_stack+0x74/0xb4)
> [    0.249591] [<c04ebf0c>] (dump_stack+0x74/0xb4) from [<c00237a8>] =
(warn_slowpath_common+0x78/0x9c)
> [    0.249604] [<c00237a8>] (warn_slowpath_common+0x78/0x9c) from [<c=
0023888>] (warn_slowpath_fmt+0x40/0x48)
> [    0.249615] [<c0023888>] (warn_slowpath_fmt+0x40/0x48) from [<c007=
f194>] (lockdep_trace_alloc+0xc8/0x10c)
> [    0.249626] [<c007f194>] (lockdep_trace_alloc+0xc8/0x10c) from [<c=
01173b0>] (kmem_cache_alloc_trace+0x38/0x2
> 24)
> [    0.249638] [<c01173b0>] (kmem_cache_alloc_trace+0x38/0x224) from =
[<c006bc4c>] (request_threaded_irq+0x90/0x130)
> [    0.249651] [<c006bc4c>] (request_threaded_irq+0x90/0x130) from [<=
c0408c60>] (exynos4_local_timer_setup+0xdc/0x140)
> [    0.249663] [<c0408c60>] (exynos4_local_timer_setup+0xdc/0x140) fr=
om [<c0408d78>] (exynos4_mct_cpu_notify+0x40/0xb0)
> [    0.249675] [<c0408d78>] (exynos4_mct_cpu_notify+0x40/0xb0) from [=
<c04f4e18>] (notifier_call_chain+0x48/0x78)
> [    0.249688] [<c04f4e18>] (notifier_call_chain+0x48/0x78) from [<c0=
04abb0>] (__raw_notifier_call_chain+0x24/0x2c)
> [    0.249700] [<c004abb0>] (__raw_notifier_call_chain+0x24/0x2c) fro=
m [<c0023908>] (__cpu_notify+0x3c/0x58)
> [    0.249713] [<c0023908>] (__cpu_notify+0x3c/0x58) from [<c0023944>=
] (cpu_notify+0x20/0x24)
> [    0.249725] [<c0023944>] (cpu_notify+0x20/0x24) from [<c002407c>] =
(notify_cpu_starting+0x58/0x60)
> [    0.249737] [<c002407c>] (notify_cpu_starting+0x58/0x60) from [<c0=
0143cc>] (secondary_start_kernel+0xec/0x13
> 8)
> [    0.249748] [<c00143cc>] (secondary_start_kernel+0xec/0x138) from =
[<40008664>] (0x40008664)
> [    0.249767] ---[ end trace 3406ff24bd97382e ]---
>=20
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Ming Lei <tom.leiming@gmail.com>
> ---

Tomasz, what do you think ?

>  drivers/clocksource/exynos_mct.c |   34 +++++++++++++++++++++-------=
------
>  1 file changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/e=
xynos_mct.c
> index 5b34768..94b35aa 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -419,19 +419,10 @@ static int exynos4_local_timer_setup(struct clo=
ck_event_device *evt)
> =20
>  	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
> =20
> -	if (mct_int_type =3D=3D MCT_INT_SPI) {
> -		evt->irq =3D mct_irqs[MCT_L0_IRQ + cpu];
> -		if (request_irq(evt->irq, exynos4_mct_tick_isr,
> -				IRQF_TIMER | IRQF_NOBALANCING,
> -				evt->name, mevt)) {
> -			pr_err("exynos-mct: cannot register IRQ %d\n",
> -				evt->irq);
> -			return -EIO;
> -		}
> -		irq_set_affinity(evt->irq, cpumask_of(cpu));
> -	} else {
> +	if (mct_int_type =3D=3D MCT_INT_PPI)
>  		enable_percpu_irq(mct_irqs[MCT_L0_IRQ], 0);
> -	}
> +	else
> +		enable_irq(evt->irq);
> =20
>  	return 0;
>  }
> @@ -440,7 +431,7 @@ static void exynos4_local_timer_stop(struct clock=
_event_device *evt)
>  {
>  	evt->set_mode(CLOCK_EVT_MODE_UNUSED, evt);
>  	if (mct_int_type =3D=3D MCT_INT_SPI)
> -		free_irq(evt->irq, this_cpu_ptr(&percpu_mct_tick));
> +		disable_irq(evt->irq);
>  	else
>  		disable_percpu_irq(mct_irqs[MCT_L0_IRQ]);
>  }
> @@ -500,6 +491,23 @@ static void __init exynos4_timer_resources(struc=
t device_node *np, void __iomem
>  					 &percpu_mct_tick);
>  		WARN(err, "MCT: can't request IRQ %d (%d)\n",
>  		     mct_irqs[MCT_L0_IRQ], err);
> +	} else {
> +		int cpu;
> +
> +		for_each_possible_cpu(cpu) {
> +			struct mct_clock_event_device *mevt =3D
> +				&per_cpu(percpu_mct_tick, cpu);
> +
> +			mevt->evt.irq =3D mct_irqs[MCT_L0_IRQ + cpu];
> +			if (request_irq(mevt->evt.irq, exynos4_mct_tick_isr,
> +					IRQF_TIMER | IRQF_NOBALANCING,
> +					mevt->evt.name, mevt)) {
> +				WARN(1, "exynos-mct: cannot register IRQ %d\n",
> +				     mevt->evt.irq);
> +			}
> +			irq_set_affinity(mevt->evt.irq, cpumask_of(cpu));
> +			disable_irq(mevt->evt.irq);
> +		}
>  	}
> =20
>  	err =3D register_cpu_notifier(&exynos4_mct_cpu_nb);
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
