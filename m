From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] clocksource: exynos_mct: Fix stall after CPU
 hotplugging
Date: Tue, 15 Apr 2014 17:41:55 +0200
Message-ID: <1397576515.752.5.camel@AMDC1943>
References: <1396011962-4467-1-git-send-email-k.kozlowski@samsung.com>
 <1397554445.29169.21.camel@AMDC1943> <534D25DC.4050400@linaro.org>
 <1397566023.29169.31.camel@AMDC1943>
 <alpine.DEB.2.02.1404151711250.22697@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <alpine.DEB.2.02.1404151711250.22697@ionos.tec.linutronix.de>
Sender: stable-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



On wto, 2014-04-15 at 17:20 +0200, Thomas Gleixner wrote:
> On Tue, 15 Apr 2014, Krzysztof Kozlowski wrote:
>=20
> > On wto, 2014-04-15 at 14:28 +0200, Daniel Lezcano wrote:
> > > On 04/15/2014 11:34 AM, Krzysztof Kozlowski wrote:
> > > > On pi=C4=85, 2014-03-28 at 14:06 +0100, Krzysztof Kozlowski wro=
te:
> > > >> Fix stall after hotplugging CPU1. Affected are SoCs where Mult=
i Core Timer
> > > >> interrupts are shared (SPI), e.g. Exynos 4210. The stall was a=
 result of
> > > >> starting the CPU1 local timer not in L1 timer but in L0 (which=
 is used
> > > >> by CPU0).
> > > >
> > > > Hi,
> > > >
> > > > Do you have any comments on these 3 patches? They fix the CPU s=
tall on
> > > > Exynos4210 and also on Exynos3250 (Chanwoo Choi sent patches fo=
r it
> > > > recently).
> > >=20
> > > You describe this issue as impacting different SoC not only the e=
xynos,=20
> > > right ?
> > >
> > > Do you know what other SoCs are impacted by this ?
> >=20
> > No, affected are only Exynos SoC-s. It was confirmed on Exynos4210
> > (Trats board) and Exynos3250 (new SoC, patches for it were recently
> > posted by Chanwoo).
> >=20
> > Other Exynos SoC-s where MCT local timers use shared interrupts (SP=
I)
> > can also be affected. Candidates are Exynos 5250 and 5420 but I hav=
en't
> > tested them.
> >=20
> > > I guess this issue is not reproducible just with the line below, =
we need=20
> > > a timer to expire right at the moment CPU1 is hotplugged, right ?
> >=20
> > Right. The timer must fire in short time between enabling local tim=
er
> > for CPU1 and setting the affinity for IRQ.
>=20
> Why do you set the affinity in the CPU_ONLINE hotplug callback and no=
t
> right away when the interrupt is requested?

Hi,

I think the problem in such code is in GIC. The gic_set_affinity() uses
cpu_online_mask:
	unsigned int cpu =3D cpumask_any_and(mask_val, cpu_online_mask);
In that time this CPU is not present in that mask so -EINVAL would be
returned.

The stall occurred also on 3.10 where the IRQ affinity is set just afte=
r
setup_irq():

if (cpu =3D=3D 0) {
	mct_tick0_event_irq.dev_id =3D mevt;
	evt->irq =3D mct_irqs[MCT_L0_IRQ];
	setup_irq(evt->irq, &mct_tick0_event_irq);
} else {
	mct_tick1_event_irq.dev_id =3D mevt;
	evt->irq =3D mct_irqs[MCT_L1_IRQ];
	setup_irq(evt->irq, &mct_tick1_event_irq);
	irq_set_affinity(evt->irq, cpumask_of(1));
}

Best regards,
Krzysztof


> Thanks,
>=20
> 	tglx
>=20
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
> +		irq_set_affinity(mct_irqs[MCT_L0_IRQ + cpu], cpumask_of(cpu));
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
>=20
>=20
>=20
