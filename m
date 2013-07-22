From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 02/20] clocksource: samsung_pwm_timer: Correct definition
 of AUTORELOAD bit
Date: Mon, 22 Jul 2013 05:50:09 +0200
Message-ID: <51ECABF1.4040600@linaro.org>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <1374278673-25615-4-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:42473 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754743Ab3GVDuN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jul 2013 23:50:13 -0400
Received: by mail-wi0-f169.google.com with SMTP id c10so2230836wiw.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jul 2013 20:50:11 -0700 (PDT)
In-Reply-To: <1374278673-25615-4-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On 07/20/2013 02:04 AM, Tomasz Figa wrote:
> PWM channel 4 has its autoreload bit located at different position. T=
his
> patch fixes the driver to account for that.
>=20
> This fixes a problem with the clocksource hanging after it overflows =
because
> it is not reloaded any more.
>=20
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/clocksource/samsung_pwm_timer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocks=
ource/samsung_pwm_timer.c
> index 3fa5b07..e238fb0 100644
> --- a/drivers/clocksource/samsung_pwm_timer.c
> +++ b/drivers/clocksource/samsung_pwm_timer.c
> @@ -47,7 +47,8 @@
>  #define TCON_START(chan)		(1 << (4 * (chan) + 0))
>  #define TCON_MANUALUPDATE(chan)		(1 << (4 * (chan) + 1))
>  #define TCON_INVERT(chan)		(1 << (4 * (chan) + 2))
> -#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) + 3))
> +#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) \
> +						+ (((chan) < 5) ? 3 : 2)))

This macro is not readable. Please, fix it up with a comment please.

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
