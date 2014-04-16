From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] clocksource: exynos_mct: Fix stall after CPU
 hotplugging
Date: Wed, 16 Apr 2014 10:51:03 +0200
Message-ID: <1397638263.6147.7.camel@AMDC1943>
References: <1396011962-4467-1-git-send-email-k.kozlowski@samsung.com>
 <1397554445.29169.21.camel@AMDC1943> <534D25DC.4050400@linaro.org>
 <1397566023.29169.31.camel@AMDC1943>
 <alpine.DEB.2.02.1404151711250.22697@ionos.tec.linutronix.de>
 <1397576515.752.5.camel@AMDC1943>
 <alpine.DEB.2.02.1404151753090.22697@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31392 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752282AbaDPIvG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 04:51:06 -0400
In-reply-to: <alpine.DEB.2.02.1404151753090.22697@ionos.tec.linutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, stable@vger.kernel.org

On wto, 2014-04-15 at 18:20 +0200, Thomas Gleixner wrote:
> B1;3202;0cOn Tue, 15 Apr 2014, Krzysztof Kozlowski wrote:
> > On wto, 2014-04-15 at 17:20 +0200, Thomas Gleixner wrote:
> > > On Tue, 15 Apr 2014, Krzysztof Kozlowski wrote:
> > >=20
> > > > On wto, 2014-04-15 at 14:28 +0200, Daniel Lezcano wrote:
> > > > > On 04/15/2014 11:34 AM, Krzysztof Kozlowski wrote:
> > > > > > On pi=C4=85, 2014-03-28 at 14:06 +0100, Krzysztof Kozlowski=
 wrote:
> > > > > >> Fix stall after hotplugging CPU1. Affected are SoCs where =
Multi Core Timer
> > > > > >> interrupts are shared (SPI), e.g. Exynos 4210. The stall w=
as a result of
> > > > > >> starting the CPU1 local timer not in L1 timer but in L0 (w=
hich is used
> > > > > >> by CPU0).
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > Do you have any comments on these 3 patches? They fix the C=
PU stall on
> > > > > > Exynos4210 and also on Exynos3250 (Chanwoo Choi sent patche=
s for it
> > > > > > recently).
> > > > >=20
> > > > > You describe this issue as impacting different SoC not only t=
he exynos,=20
> > > > > right ?
> > > > >
> > > > > Do you know what other SoCs are impacted by this ?
> > > >=20
> > > > No, affected are only Exynos SoC-s. It was confirmed on Exynos4=
210
> > > > (Trats board) and Exynos3250 (new SoC, patches for it were rece=
ntly
> > > > posted by Chanwoo).
> > > >=20
> > > > Other Exynos SoC-s where MCT local timers use shared interrupts=
 (SPI)
> > > > can also be affected. Candidates are Exynos 5250 and 5420 but I=
 haven't
> > > > tested them.
> > > >=20
> > > > > I guess this issue is not reproducible just with the line bel=
ow, we need=20
> > > > > a timer to expire right at the moment CPU1 is hotplugged, rig=
ht ?
> > > >=20
> > > > Right. The timer must fire in short time between enabling local=
 timer
> > > > for CPU1 and setting the affinity for IRQ.
> > >=20
> > > Why do you set the affinity in the CPU_ONLINE hotplug callback an=
d not
> > > right away when the interrupt is requested?
> >=20
> > Hi,
> >=20
> > I think the problem in such code is in GIC. The gic_set_affinity() =
uses
> > cpu_online_mask:
> > 	unsigned int cpu =3D cpumask_any_and(mask_val, cpu_online_mask);
> > In that time this CPU is not present in that mask so -EINVAL would =
be
> > returned.
>=20
> Hmm, indeed. Stupid me.
>=20
> Here is a complete solution to the problem. We really want the driver=
s
> to be fast and clean and not work around such issues.
>=20
> I'm quite happy that I kept the 'force' argument of set_affinity
> callbacks. I knew that I'd need it at some point.
>=20
> So with the flag set we can disable the online mask check and force
> the interrupt to the proper cpu.

Thanks for the solution.

I tested your patch on Exynos 3250 and it is still not sufficient. Afte=
r
hotplugging CPU1 ~10 times the stall happens (set_next_event is called
on wrong CPU).

The patch 3/3 ("clocksource: exynos_mct: Fix too early ISR fire up on
wrong CPU") is needed as the clockevents_config_and_register should be
called a little later.

Do you have rest of patches (2/3 and 3/3) or should I resend them?

And one minor nit in your patch: 'cpu' local variable in
exynos4_mct_cpu_notify() is no longer used so it can be removed.

Best regards,
Krzysztof


> Thanks,
>=20
> 	tglx
>=20
> Index: linux-2.6/drivers/clocksource/exynos_mct.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/drivers/clocksource/exynos_mct.c
> +++ linux-2.6/drivers/clocksource/exynos_mct.c
> @@ -430,6 +430,7 @@ static int exynos4_local_timer_setup(str
>  				evt->irq);
>  			return -EIO;
>  		}
> +		irq_force_affinity(mct_irqs[MCT_L0_IRQ + cpu], cpumask_of(cpu));
>  	} else {
>  		enable_percpu_irq(mct_irqs[MCT_L0_IRQ], 0);
>  	}
> @@ -461,12 +462,6 @@ static int exynos4_mct_cpu_notify(struct
>  		mevt =3D this_cpu_ptr(&percpu_mct_tick);
>  		exynos4_local_timer_setup(&mevt->evt);
>  		break;
> -	case CPU_ONLINE:
> -		cpu =3D (unsigned long)hcpu;
> -		if (mct_int_type =3D=3D MCT_INT_SPI)
> -			irq_set_affinity(mct_irqs[MCT_L0_IRQ + cpu],
> -						cpumask_of(cpu));
> -		break;
>  	case CPU_DYING:
>  		mevt =3D this_cpu_ptr(&percpu_mct_tick);
>  		exynos4_local_timer_stop(&mevt->evt);
> Index: linux-2.6/drivers/irqchip/irq-gic.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/drivers/irqchip/irq-gic.c
> +++ linux-2.6/drivers/irqchip/irq-gic.c
> @@ -246,10 +246,14 @@ static int gic_set_affinity(struct irq_d
>  			    bool force)
>  {
>  	void __iomem *reg =3D gic_dist_base(d) + GIC_DIST_TARGET + (gic_irq=
(d) & ~3);
> -	unsigned int shift =3D (gic_irq(d) % 4) * 8;
> -	unsigned int cpu =3D cpumask_any_and(mask_val, cpu_online_mask);
> +	unsigned int cpu, shift =3D (gic_irq(d) % 4) * 8;
>  	u32 val, mask, bit;
> =20
> +	if (!force)
> +		cpu =3D cpumask_any_and(mask_val, cpu_online_mask);
> +	else
> +		cpu =3D cpumask_first(mask_val);
> +
>  	if (cpu >=3D NR_GIC_CPU_IF || cpu >=3D nr_cpu_ids)
>  		return -EINVAL;
> =20
> Index: linux-2.6/include/linux/interrupt.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/include/linux/interrupt.h
> +++ linux-2.6/include/linux/interrupt.h
> @@ -204,6 +204,7 @@ static inline int check_wakeup_irqs(void
>  extern cpumask_var_t irq_default_affinity;
> =20
>  extern int irq_set_affinity(unsigned int irq, const struct cpumask *=
cpumask);
> +extern int irq_force_affinity(unsigned int irq, const struct cpumask=
 *cpumask);
>  extern int irq_can_set_affinity(unsigned int irq);
>  extern int irq_select_affinity(unsigned int irq);
> =20
> Index: linux-2.6/kernel/irq/manage.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/kernel/irq/manage.c
> +++ linux-2.6/kernel/irq/manage.c
> @@ -180,7 +180,7 @@ int irq_do_set_affinity(struct irq_data
>  	struct irq_chip *chip =3D irq_data_get_irq_chip(data);
>  	int ret;
> =20
> -	ret =3D chip->irq_set_affinity(data, mask, false);
> +	ret =3D chip->irq_set_affinity(data, mask, force);
>  	switch (ret) {
>  	case IRQ_SET_MASK_OK:
>  		cpumask_copy(data->affinity, mask);
> @@ -192,7 +192,8 @@ int irq_do_set_affinity(struct irq_data
>  	return ret;
>  }
> =20
> -int __irq_set_affinity_locked(struct irq_data *data, const struct cp=
umask *mask)
> +static int irq_do_set_affinity_locked(struct irq_data *data,
> +				      const struct cpumask *mask, bool force)
>  {
>  	struct irq_chip *chip =3D irq_data_get_irq_chip(data);
>  	struct irq_desc *desc =3D irq_data_to_desc(data);
> @@ -202,7 +203,7 @@ int __irq_set_affinity_locked(struct irq
>  		return -EINVAL;
> =20
>  	if (irq_can_move_pcntxt(data)) {
> -		ret =3D irq_do_set_affinity(data, mask, false);
> +		ret =3D irq_do_set_affinity(data, mask, force);
>  	} else {
>  		irqd_set_move_pending(data);
>  		irq_copy_pending(desc, mask);
> @@ -217,13 +218,13 @@ int __irq_set_affinity_locked(struct irq
>  	return ret;
>  }
> =20
> -/**
> - *	irq_set_affinity - Set the irq affinity of a given irq
> - *	@irq:		Interrupt to set affinity
> - *	@mask:		cpumask
> - *
> - */
> -int irq_set_affinity(unsigned int irq, const struct cpumask *mask)
> +int __irq_set_affinity_locked(struct irq_data *data,const struct cpu=
mask *mask)
> +{
> +	return irq_do_set_affinity_locked(data, mask, false);
> +}
> +
> +static int __irq_set_affinity(unsigned int irq, const struct cpumask=
 *mask,
> +			      bool force)
>  {
>  	struct irq_desc *desc =3D irq_to_desc(irq);
>  	unsigned long flags;
> @@ -233,11 +234,33 @@ int irq_set_affinity(unsigned int irq, c
>  		return -EINVAL;
> =20
>  	raw_spin_lock_irqsave(&desc->lock, flags);
> -	ret =3D  __irq_set_affinity_locked(irq_desc_get_irq_data(desc), mas=
k);
> +	ret =3D irq_do_set_affinity_locked(irq_desc_get_irq_data(desc), mas=
k,
> +					 force);
>  	raw_spin_unlock_irqrestore(&desc->lock, flags);
>  	return ret;
>  }
> =20
> +/**
> + *	irq_force_affinity - Force the irq affinity of a given irq
> + *	@irq:		Interrupt to set affinity
> + *	@mask:		cpumask
> + */
> +int irq_force_affinity(unsigned int irq, const struct cpumask *mask)
> +{
> +	return __irq_set_affinity(irq, mask, true);
> +}
> +
> +/**
> + *	irq_set_affinity - Set the irq affinity of a given irq
> + *	@irq:		Interrupt to set affinity
> + *	@mask:		cpumask
> + *
> + */
> +int irq_set_affinity(unsigned int irq, const struct cpumask *mask)
> +{
> +	return __irq_set_affinity(irq, mask, false);
> +}
> +
>  int irq_set_affinity_hint(unsigned int irq, const struct cpumask *m)
>  {
>  	unsigned long flags;
