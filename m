From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 05/20] clocksource: samsung_pwm_timer: Handle suspend/resume
 correctly
Date: Mon, 22 Jul 2013 05:57:33 +0200
Message-ID: <51ECADAD.3040303@linaro.org>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <1374278673-25615-7-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:64134 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756143Ab3GVD5g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jul 2013 23:57:36 -0400
Received: by mail-wi0-f169.google.com with SMTP id c10so2234045wiw.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jul 2013 20:57:35 -0700 (PDT)
In-Reply-To: <1374278673-25615-7-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>

On 07/20/2013 02:04 AM, Tomasz Figa wrote:
> Current suspend/resume handling of the driver was broken, because:
>  - periodic timer was being enabled in CLOCK_EVT_MODE_RESUME mode, wh=
ich
>    does not seem to be correct behavior looking at other platforms,
>  - PWM divisors need to be restored, but they were not,
>  - clockevent interrupt mask needs to be restored, but it was not,
>  - clocksource was being restored in clockevent resume callback.
>=20
> This patch fixes issues mentioned above, making suspend/resume handli=
ng
> in the driver correct.
>=20
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

>  drivers/clocksource/samsung_pwm_timer.c | 42 ++++++++++++++++++++++-=
----------
>  1 file changed, 28 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocks=
ource/samsung_pwm_timer.c
> index 753ffec..282e0e2 100644
> --- a/drivers/clocksource/samsung_pwm_timer.c
> +++ b/drivers/clocksource/samsung_pwm_timer.c
> @@ -197,17 +197,6 @@ static int samsung_set_next_event(unsigned long =
cycles,
>  	return 0;
>  }
> =20
> -static void samsung_timer_resume(void)
> -{
> -	/* event timer restart */
> -	samsung_time_setup(pwm.event_id, pwm.clock_count_per_tick - 1);
> -	samsung_time_start(pwm.event_id, true);
> -
> -	/* source timer restart */
> -	samsung_time_setup(pwm.source_id, pwm.tcnt_max);
> -	samsung_time_start(pwm.source_id, true);
> -}
> -
>  static void samsung_set_mode(enum clock_event_mode mode,
>  				struct clock_event_device *evt)
>  {
> @@ -224,20 +213,29 @@ static void samsung_set_mode(enum clock_event_m=
ode mode,
> =20
>  	case CLOCK_EVT_MODE_UNUSED:
>  	case CLOCK_EVT_MODE_SHUTDOWN:
> -		break;
> -
>  	case CLOCK_EVT_MODE_RESUME:
> -		samsung_timer_resume();
>  		break;
>  	}
>  }
> =20
> +static void samsung_clockevent_resume(struct clock_event_device *cev=
)
> +{
> +	samsung_timer_set_prescale(pwm.event_id, pwm.tscaler_div);
> +	samsung_timer_set_divisor(pwm.event_id, pwm.tdiv);
> +
> +	if (pwm.variant.has_tint_cstat) {
> +		u32 mask =3D (1 << pwm.event_id);
> +		writel(mask | (mask << 5), pwm.base + REG_TINT_CSTAT);
> +	}
> +}
> +
>  static struct clock_event_device time_event_device =3D {
>  	.name		=3D "samsung_event_timer",
>  	.features	=3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
>  	.rating		=3D 200,
>  	.set_next_event	=3D samsung_set_next_event,
>  	.set_mode	=3D samsung_set_mode,
> +	.resume		=3D samsung_clockevent_resume,
>  };
> =20
>  static irqreturn_t samsung_clock_event_isr(int irq, void *dev_id)
> @@ -288,6 +286,20 @@ static void __init samsung_clockevent_init(void)
>  	}
>  }
> =20
> +static void samsung_clocksource_suspend(struct clocksource *cs)
> +{
> +	samsung_time_stop(pwm.source_id);
> +}
> +
> +static void samsung_clocksource_resume(struct clocksource *cs)
> +{
> +	samsung_timer_set_prescale(pwm.source_id, pwm.tscaler_div);
> +	samsung_timer_set_divisor(pwm.source_id, pwm.tdiv);
> +
> +	samsung_time_setup(pwm.source_id, pwm.tcnt_max);
> +	samsung_time_start(pwm.source_id, true);
> +}
> +
>  static cycle_t samsung_clocksource_read(struct clocksource *c)
>  {
>  	return ~readl_relaxed(pwm.source_reg);
> @@ -297,6 +309,8 @@ static struct clocksource samsung_clocksource =3D=
 {
>  	.name		=3D "samsung_clocksource_timer",
>  	.rating		=3D 250,
>  	.read		=3D samsung_clocksource_read,
> +	.suspend	=3D samsung_clocksource_suspend,
> +	.resume		=3D samsung_clocksource_resume,
>  	.flags		=3D CLOCK_SOURCE_IS_CONTINUOUS,
>  };
> =20
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
