From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH 1/3] watchdog: s3c2410: add restart notifier
Date: Tue, 8 Jul 2014 09:21:18 -0700
Message-ID: <20140708162118.GA9157@roeck-us.net>
References: <1531376.ijR0PPyvmJ@diego>
 <10183342.ZfePbPvRx9@diego>
 <53BBFE55.4080202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:38432 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752106AbaGHQVW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 12:21:22 -0400
Content-Disposition: inline
In-Reply-To: <53BBFE55.4080202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Wim Van Sebroeck <wim@iguana.be>, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>

On Tue, Jul 08, 2014 at 04:21:09PM +0200, Tomasz Figa wrote:
> Hi Heiko,
>=20
> On 06.07.2014 20:42, Heiko St=FCbner wrote:
> > On a lot of Samsung systems the watchdog is responsible for restart=
ing the
> > system and until now this code was contained in plat-samsung/watchd=
og-reset.c .
> >=20
> > With the introduction of the restart notifiers, this code can now m=
ove into
> > driver itself, removing the need for arch-specific code.
> >=20
> > Tested on a S3C2442 based GTA02
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c | 33 ++++++++++++++++++++++++++++++=
+++
> >  1 file changed, 33 insertions(+)
> >=20
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2=
410_wdt.c
> > index 7c6ccd0..3f89912 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -41,6 +41,7 @@
> >  #include <linux/of.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/regmap.h>
> > +#include <linux/reboot.h>
> > =20
> >  #define S3C2410_WTCON		0x00
> >  #define S3C2410_WTDAT		0x04
> > @@ -438,6 +439,31 @@ static inline void s3c2410wdt_cpufreq_deregist=
er(struct s3c2410_wdt *wdt)
> >  }
> >  #endif
> > =20
> > +static struct s3c2410_wdt *s3c2410wdt_restart_ctx;
>=20
> This isn't the most elegant way to store context data. Maybe you coul=
d
> embed the notifier_block struct into s3c2410_wdt struct and then use
> container of to retrieve it from s3c2410wdt_restart_notify()?
>=20
Excellent idea. I'll do that for the moxart handler as well.

Guenter
