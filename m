From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RFC PATCH 1/3] watchdog: s3c2410: add restart notifier
Date: Tue, 08 Jul 2014 16:21:09 +0200
Message-ID: <53BBFE55.4080202@samsung.com>
References: <1531376.ijR0PPyvmJ@diego> <10183342.ZfePbPvRx9@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:8257 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752253AbaGHOVm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 10:21:42 -0400
In-reply-to: <10183342.ZfePbPvRx9@diego>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Wim Van Sebroeck <wim@iguana.be>, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>

Hi Heiko,

On 06.07.2014 20:42, Heiko St=FCbner wrote:
> On a lot of Samsung systems the watchdog is responsible for restartin=
g the
> system and until now this code was contained in plat-samsung/watchdog=
-reset.c .
>=20
> With the introduction of the restart notifiers, this code can now mov=
e into
> driver itself, removing the need for arch-specific code.
>=20
> Tested on a S3C2442 based GTA02
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 33 ++++++++++++++++++++++++++++++++=
+
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c241=
0_wdt.c
> index 7c6ccd0..3f89912 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -41,6 +41,7 @@
>  #include <linux/of.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <linux/reboot.h>
> =20
>  #define S3C2410_WTCON		0x00
>  #define S3C2410_WTDAT		0x04
> @@ -438,6 +439,31 @@ static inline void s3c2410wdt_cpufreq_deregister=
(struct s3c2410_wdt *wdt)
>  }
>  #endif
> =20
> +static struct s3c2410_wdt *s3c2410wdt_restart_ctx;

This isn't the most elegant way to store context data. Maybe you could
embed the notifier_block struct into s3c2410_wdt struct and then use
container of to retrieve it from s3c2410wdt_restart_notify()?

> +static int s3c2410wdt_restart_notify(struct notifier_block *this,
> +				     unsigned long mode, void *cmd)
> +{
> +	void __iomem *wdt_base =3D s3c2410wdt_restart_ctx->reg_base;
> +
> +	/* disable watchdog, to be safe  */
> +	writel(0, wdt_base + S3C2410_WTCON);
> +
> +	/* put initial values into count and data */
> +	writel(0x80, wdt_base + S3C2410_WTCNT);
> +	writel(0x80, wdt_base + S3C2410_WTDAT);
> +
> +	/* set the watchdog to go and reset... */
> +	writel(S3C2410_WTCON_ENABLE | S3C2410_WTCON_DIV16 |
> +		S3C2410_WTCON_RSTEN | S3C2410_WTCON_PRESCALE(0x20),
> +		wdt_base + S3C2410_WTCON);

I wonder whether you shouldn't wait a bit here for the reset to be
actually triggered.

Best regards,
Tomasz
