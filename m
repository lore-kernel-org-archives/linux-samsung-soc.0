From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 04/20] clocksource: samsung_pwm_timer: Do not use clocksource_mmio
Date: Mon, 22 Jul 2013 05:56:16 +0200
Message-ID: <51ECAD60.1000109@linaro.org>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <1374278673-25615-6-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:38820 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756157Ab3GVD4T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jul 2013 23:56:19 -0400
Received: by mail-wi0-f180.google.com with SMTP id c10so1401693wiw.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jul 2013 20:56:18 -0700 (PDT)
In-Reply-To: <1374278673-25615-6-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On 07/20/2013 02:04 AM, Tomasz Figa wrote:
> In case of Samsung PWM timer, clocksource MMIO can not be used, becau=
se
> custom suspend/resume callbacks are required.
>=20
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Please in the future Cc me and Thomas Gleixner (clocksource/clockevent
maintainers).

Thanks
  -- Daniel

>  drivers/clocksource/Kconfig             |  1 -
>  drivers/clocksource/samsung_pwm_timer.c | 19 +++++++++++++++----
>  2 files changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index b7b9b04..41c6946 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -99,7 +99,6 @@ config CLKSRC_EXYNOS_MCT
> =20
>  config CLKSRC_SAMSUNG_PWM
>  	bool
> -	select CLKSRC_MMIO
>  	help
>  	  This is a new clocksource driver for the PWM timer found in
>  	  Samsung S3C, S5P and Exynos SoCs, replacing an earlier driver
> diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocks=
ource/samsung_pwm_timer.c
> index 823279b..753ffec 100644
> --- a/drivers/clocksource/samsung_pwm_timer.c
> +++ b/drivers/clocksource/samsung_pwm_timer.c
> @@ -288,6 +288,18 @@ static void __init samsung_clockevent_init(void)
>  	}
>  }
> =20
> +static cycle_t samsung_clocksource_read(struct clocksource *c)
> +{
> +	return ~readl_relaxed(pwm.source_reg);
> +}
> +
> +static struct clocksource samsung_clocksource =3D {
> +	.name		=3D "samsung_clocksource_timer",
> +	.rating		=3D 250,
> +	.read		=3D samsung_clocksource_read,
> +	.flags		=3D CLOCK_SOURCE_IS_CONTINUOUS,
> +};
> +
>  /*
>   * Override the global weak sched_clock symbol with this
>   * local implementation which uses the clocksource to get some
> @@ -297,7 +309,7 @@ static void __init samsung_clockevent_init(void)
>   */
>  static u32 notrace samsung_read_sched_clock(void)
>  {
> -	return ~__raw_readl(pwm.source_reg);
> +	return samsung_clocksource_read(NULL);
>  }
> =20
>  static void __init samsung_clocksource_init(void)
> @@ -324,9 +336,8 @@ static void __init samsung_clocksource_init(void)
>  	setup_sched_clock(samsung_read_sched_clock,
>  						pwm.variant.bits, clock_rate);
> =20
> -	ret =3D clocksource_mmio_init(pwm.source_reg, "samsung_clocksource_=
timer",
> -					clock_rate, 250, pwm.variant.bits,
> -					clocksource_mmio_readl_down);
> +	samsung_clocksource.mask =3D CLOCKSOURCE_MASK(pwm.variant.bits);
> +	ret =3D clocksource_register_hz(&samsung_clocksource, clock_rate);
>  	if (ret)
>  		panic("samsung_clocksource_timer: can't register clocksource\n");
>  }
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
