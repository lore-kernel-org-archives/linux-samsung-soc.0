From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] clocksource: exynos_mct: Fix stall after CPU
 hotplugging
Date: Tue, 15 Apr 2014 11:34:05 +0200
Message-ID: <1397554445.29169.21.camel@AMDC1943>
References: <1396011962-4467-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1396011962-4467-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On pi=C4=85, 2014-03-28 at 14:06 +0100, Krzysztof Kozlowski wrote:
> Fix stall after hotplugging CPU1. Affected are SoCs where Multi Core =
Timer
> interrupts are shared (SPI), e.g. Exynos 4210. The stall was a result=
 of
> starting the CPU1 local timer not in L1 timer but in L0 (which is use=
d
> by CPU0).

Hi,

Do you have any comments on these 3 patches? They fix the CPU stall on
Exynos4210 and also on Exynos3250 (Chanwoo Choi sent patches for it
recently).

Best regards,
Krzysztof



> Trigger:
> $ echo 0 > /sys/bus/cpu/devices/cpu1/online && echo 1 > /sys/bus/cpu/=
devices/cpu1/online
>=20
> Stall information:
> [  530.045259] INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  530.045618]  1: (6 GPs behind) idle=3D6d0/0/0 softirq=3D369/369
> [  530.050987]  (detected by 0, t=3D6589 jiffies, g=3D33, c=3D32, q=3D=
0)
> [  530.056721] Task dump for CPU 1:
> [  530.059928] swapper/1       R running      0     0      1 0x000010=
00
> [  530.066377] [<c0524e14>] (__schedule+0x414/0x9b4) from [<c00b6610>=
] (rcu_idle_enter+0x18/0x38)
> [  530.074955] [<c00b6610>] (rcu_idle_enter+0x18/0x38) from [<c0079a1=
8>] (cpu_startup_entry+0x60/0x3bc)
> [  530.084069] [<c0079a18>] (cpu_startup_entry+0x60/0x3bc) from [<c05=
17d34>] (secondary_start_kernel+0x164/0x1a0)
> [  530.094029] [<c0517d34>] (secondary_start_kernel+0x164/0x1a0) from=
 [<40517244>] (0x40517244)
>=20
> The timers for CPU1 were missed:
> [  591.668436] cpu: 1
> [  591.670430]  clock 0:
> [  591.672691]   .base:       c0ab7750
> [  591.676160]   .index:      0
> [  591.679025]   .resolution: 1 nsecs
> [  591.682404]   .get_time:   ktime_get
> [  591.685970]   .offset:     0 nsecs
> [  591.689349] active timers:
> [  591.692045]  #0: <dfb51f40>, hrtimer_wakeup, S:01
> [  591.696759]  # expires at 454687834257-454687884257 nsecs [in -136=
770537232 to -136770487232 nsecs]
>=20
> And the event_handler for next event was wrong:
> [  591.917120] Tick Device: mode:     1
> [  591.920676] Per CPU device: 0
> [  591.923621] Clock Event Device: mct_tick0
> [  591.927623]  max_delta_ns:   178956969027
> [  591.931613]  min_delta_ns:   1249
> [  591.934913]  mult:           51539608
> [  591.938557]  shift:          32
> [  591.941681]  mode:           3
> [  591.944724]  next_event:     595025000000 nsecs
> [  591.949227]  set_next_event: exynos4_tick_set_next_event
> [  591.954522]  set_mode:       exynos4_tick_set_mode
> [  591.959296]  event_handler:  hrtimer_interrupt
> [  591.963730]  retries:        0
> [  591.966761]
> [  591.968245] Tick Device: mode:     0
> [  591.971801] Per CPU device: 1
> [  591.974746] Clock Event Device: mct_tick1
> [  591.978750]  max_delta_ns:   178956969027
> [  591.982739]  min_delta_ns:   1249
> [  591.986037]  mult:           51539608
> [  591.989681]  shift:          32
> [  591.992806]  mode:           3
> [  591.995848]  next_event:     453685000000 nsecs
> [  592.000353]  set_next_event: exynos4_tick_set_next_event
> [  592.005648]  set_mode:       exynos4_tick_set_mode
> [  592.010421]  event_handler:  tick_handle_periodic
> [  592.015115]  retries:        0
> [  592.018145]
>=20
> After turning off the CPU1, the MCT L1 local timer was disabled but t=
he
> interrupt was not cleared. Turning on the CPU1 enabled the IRQ
> with setup_irq() but, before setting affinity to CPU1, the pending L1=
 timer
> interrupt was processed by CPU0 in exynos4_mct_tick_isr().
>=20
> The ISR then called event handler which set up the next timer event f=
or
> current CPU (CPU0). Therefore the MCT L1 timer wasn't actually starte=
d.
>=20
> Fix the stall by:
> 1. Setting next timer event not on current CPU but on the CPU indicat=
ed
>    by cpumask in 'clock_event_device'.
> 2. Clearing the timer interrupt upon stopping the local timer.
>=20
> The patch also moves around the call to exynos4_mct_tick_stop() but t=
his
> is done only for the code readability as it is not essential for the =
fix.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/clocksource/exynos_mct.c |   33 ++++++++++++++++++++--------=
-----
>  1 file changed, 20 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/e=
xynos_mct.c
> index 48f76bc05da0..0b49b09dd1a9 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -339,7 +339,14 @@ static void exynos4_mct_tick_start(unsigned long=
 cycles,
>  static int exynos4_tick_set_next_event(unsigned long cycles,
>  				       struct clock_event_device *evt)
>  {
> -	struct mct_clock_event_device *mevt =3D this_cpu_ptr(&percpu_mct_ti=
ck);
> +	/*
> +	 * In case of hotplugging non-boot CPU, the set_next_event could be
> +	 * called on CPU0 by ISR before IRQ affinity is set to proper CPU.
> +	 * Thus for accessing proper MCT Lx timer, 'per_cpu' for cpumask
> +	 * in event must be used instead of 'this_cpu_ptr'.
> +	 */
> +	struct mct_clock_event_device *mevt =3D &per_cpu(percpu_mct_tick,
> +			cpumask_first(evt->cpumask));
> =20
>  	exynos4_mct_tick_start(cycles, mevt);
> =20
> @@ -371,23 +378,13 @@ static inline void exynos4_tick_set_mode(enum c=
lock_event_mode mode,
> =20
>  static int exynos4_mct_tick_clear(struct mct_clock_event_device *mev=
t)
>  {
> -	struct clock_event_device *evt =3D &mevt->evt;
> -
> -	/*
> -	 * This is for supporting oneshot mode.
> -	 * Mct would generate interrupt periodically
> -	 * without explicit stopping.
> -	 */
> -	if (evt->mode !=3D CLOCK_EVT_MODE_PERIODIC)
> -		exynos4_mct_tick_stop(mevt);
> -
>  	/* Clear the MCT tick interrupt */
>  	if (__raw_readl(reg_base + mevt->base + MCT_L_INT_CSTAT_OFFSET) & 1=
) {
>  		exynos4_mct_write(0x1, mevt->base + MCT_L_INT_CSTAT_OFFSET);
>  		return 1;
> -	} else {
> -		return 0;
>  	}
> +
> +	return 0;
>  }
> =20
>  static irqreturn_t exynos4_mct_tick_isr(int irq, void *dev_id)
> @@ -395,6 +392,13 @@ static irqreturn_t exynos4_mct_tick_isr(int irq,=
 void *dev_id)
>  	struct mct_clock_event_device *mevt =3D dev_id;
>  	struct clock_event_device *evt =3D &mevt->evt;
> =20
> +	/*
> +	 * This is for supporting oneshot mode.
> +	 * Mct would generate interrupt periodically
> +	 * without explicit stopping.
> +	 */
> +	if (evt->mode !=3D CLOCK_EVT_MODE_PERIODIC)
> +		exynos4_mct_tick_stop(mevt);
>  	exynos4_mct_tick_clear(mevt);
> =20
>  	evt->event_handler(evt);
> @@ -441,7 +445,10 @@ static int exynos4_local_timer_setup(struct cloc=
k_event_device *evt)
> =20
>  static void exynos4_local_timer_stop(struct clock_event_device *evt)
>  {
> +	struct mct_clock_event_device *mevt =3D this_cpu_ptr(&percpu_mct_ti=
ck);
> +
>  	evt->set_mode(CLOCK_EVT_MODE_UNUSED, evt);
> +	exynos4_mct_tick_clear(mevt);
>  	if (mct_int_type =3D=3D MCT_INT_SPI)
>  		free_irq(evt->irq, this_cpu_ptr(&percpu_mct_tick));
>  	else
