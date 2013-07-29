From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v6 02/20] clocksource: samsung_pwm_timer: Correct definition
 of AUTORELOAD bit
Date: Mon, 29 Jul 2013 15:08:52 +0200
Message-ID: <51F66964.1090803@linaro.org>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <1658534.7nG6RFjcTc@flatron> <51EDA3EA.9020502@linaro.org> <2416336.ny4L9Sf7Ts@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:57348 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751989Ab3G2NIx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 09:08:53 -0400
Received: by mail-ea0-f175.google.com with SMTP id m14so952426eaj.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 06:08:52 -0700 (PDT)
In-Reply-To: <2416336.ny4L9Sf7Ts@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On 07/24/2013 01:32 AM, Tomasz Figa wrote:
> PWM channel 4 has its autoreload bit located at different position. T=
his
> patch fixes the driver to account for that.
>=20
> This fixes a problem with the clocksource hanging after it overflows =
because
> it is not reloaded any more.
>=20
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


>  drivers/clocksource/samsung_pwm_timer.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> Changes since v5:
>  - Added more detailed comment about bit layout in TCON register.
>=20
> diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocks=
ource/samsung_pwm_timer.c
> index 3fa5b07..5d0049f 100644
> --- a/drivers/clocksource/samsung_pwm_timer.c
> +++ b/drivers/clocksource/samsung_pwm_timer.c
> @@ -44,10 +44,21 @@
>  #define TCFG1_SHIFT(x)	  		((x) * 4)
>  #define TCFG1_MUX_MASK	  		0xf
> =20
> +/*
> + * Each channel occupies 4 bits in TCON register, but there is a gap=
 of 4
> + * bits (one channel) after channel 0, so channels have different nu=
mbering
> + * when accessing TCON register.
> + *
> + * In addition, the location of autoreload bit for channel 4 (TCON c=
hannel 5)
> + * in its set of bits is 2 as opposed to 3 for other channels.
> + */
>  #define TCON_START(chan)		(1 << (4 * (chan) + 0))
>  #define TCON_MANUALUPDATE(chan)		(1 << (4 * (chan) + 1))
>  #define TCON_INVERT(chan)		(1 << (4 * (chan) + 2))
> -#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) + 3))
> +#define _TCON_AUTORELOAD(chan)		(1 << (4 * (chan) + 3))
> +#define _TCON_AUTORELOAD4(chan)		(1 << (4 * (chan) + 2))
> +#define TCON_AUTORELOAD(chan)		\
> +	((chan < 5) ? _TCON_AUTORELOAD(chan) : _TCON_AUTORELOAD4(chan))
> =20
>  DEFINE_SPINLOCK(samsung_pwm_lock);
>  EXPORT_SYMBOL(samsung_pwm_lock);
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
