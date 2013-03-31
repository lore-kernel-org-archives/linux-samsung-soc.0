From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] ARM: timer: Shutdown clock event device when stopping
 local timer
Date: Mon, 01 Apr 2013 01:41:44 +0200
Message-ID: <5158C9B8.3070208@linaro.org>
References: <1364549049-29278-1-git-send-email-ning.n.jiang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1364549049-29278-1-git-send-email-ning.n.jiang@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: ning.n.jiang@gmail.com
Cc: linux@arm.linux.org.uk, kgene.kim@samsung.com, davidb@codeaurora.org, dwalker@fifo99.com, bryanh@codeaurora.org, john.stultz@linaro.org, tglx@linutronix.de, linus.walleij@linaro.org, shawn.guo@linaro.org, rob.herring@calxeda.com, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/29/2013 10:24 AM, ning.n.jiang@gmail.com wrote:
> From: Ning Jiang <ning.n.jiang@gmail.com>
>=20
> Currently there are two problems when we try to stop local timer.
> First, it calls set_mode function directly so mode state is not
> updated for the clock event device. Second, it makes the device
> unused instead of shutdown.
>=20
> A subtle error will happen because of it. When a cpu is plugged out
> it will stop the local timer. It will call tick_nohz_idle_enter()
> in idle thread afterwards. It will cancel the sched timer and try
> to reprogram the next event. This is wrong since the local timer
> is supposed to be stopped.
>=20
> The right way to stop the local timer is to shutdown it by calling
> clockevents_set_mode(). Thus when we try to reprogram the clock
> event device, it will return directly without doing anything since
> the clock mode is CLOCK_EVT_MODE_SHUTDOWN.
>=20
> Signed-off-by: Ning Jiang <ning.n.jiang@gmail.com>
> ---
>  arch/arm/kernel/smp_twd.c                |    2 +-
>  arch/arm/mach-exynos/mct.c               |    2 +-
>  arch/arm/mach-msm/timer.c                |    2 +-
>  drivers/clocksource/arm_arch_timer.c     |    2 +-
>  drivers/clocksource/time-armada-370-xp.c |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/kernel/smp_twd.c b/arch/arm/kernel/smp_twd.c
> index 3f25650..c1d4ab4 100644
> --- a/arch/arm/kernel/smp_twd.c
> +++ b/arch/arm/kernel/smp_twd.c
> @@ -92,7 +92,7 @@ static int twd_timer_ack(void)
> =20
>  static void twd_timer_stop(struct clock_event_device *clk)
>  {
> -	twd_set_mode(CLOCK_EVT_MODE_UNUSED, clk);
> +	clockevents_set_mode(clk, CLOCK_EVT_MODE_SHUTDOWN);
>  	disable_percpu_irq(clk->irq);

Wouldn't be clockevents_shutdown more adequate here ? The next event
will be also set.



--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
