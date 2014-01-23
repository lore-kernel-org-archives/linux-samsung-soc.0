From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/5] ARM: S3C24XX: convert boards to use common restart function
Date: Thu, 23 Jan 2014 19:36:13 +0100
Message-ID: <7172372.015CdWJg1F@phil>
References: <3105326.uFdOVLyXH8@phil> <2227259.2cNbl9uzOp@phil> <52E15B74.3040409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:49171 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750927AbaAWSgz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jan 2014 13:36:55 -0500
In-Reply-To: <52E15B74.3040409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Donnerstag, 23. Januar 2014, 19:12:04 schrieb Tomasz Figa:
> Hi Heiko,
>=20
> On 06.01.2014 19:40, Heiko St=FCbner wrote:
> > This converts all boards to use the new common restart function ins=
tead
> > of SoC specific ones.
> >=20
> > The mach-s3c2416-dt board now tries to setup either a swrst- or wat=
chdog-
> > reset so that it will be able to handle more s3c24xx-SoCs later on.
>=20
> [snip]
>=20
> > diff --git a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> > b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c index 0a86953..88716fa4 1=
00644
> > --- a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> > +++ b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> > @@ -24,6 +24,7 @@
> >=20
> >   #include <plat/cpu.h>
> >   #include <plat/pm.h>
> >=20
> > +#include <plat/watchdog-reset.h>
> >=20
> >   #include "common.h"
> >=20
> > @@ -34,6 +35,14 @@ static void __init s3c2416_dt_map_io(void)
> >=20
> >   static void __init s3c2416_dt_machine_init(void)
> >   {
> >=20
> > +	s3c24xx_swrst_reset_of_init();
> > +
> > +#ifdef CONFIG_SAMSUNG_WDT_RESET
> > +	/* if no special swrst-device exists try to find a watchdog */
> > +	if (!s3c24xx_swrst_reset_available())
> > +		samsung_wdt_reset_of_init();
> > +#endif
>=20
> Hmm... I think it would be safe to assume availability of soft reset,
> especially if you could move the restart code to the clock driver.

ok, so something like the following:

the boards would simply use samsung_watchdog_reset, which should accord=
ing to=20
the manuals be available on all architectures. And the ccf-driver on=20
appropriate architectures would simple replace the arm_pm_restart callb=
ack=20
with its own SoC specific one?

=46or the s3c2412 this also means that the clock-logic would get simpli=
fied.


Like this, or do I overlook something?


Thanks
Heiko
