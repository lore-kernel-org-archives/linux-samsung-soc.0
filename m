From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/5] ARM: S3C24XX: convert boards to use common restart function
Date: Thu, 23 Jan 2014 20:02:33 +0100
Message-ID: <3955130.WSqWacB8SI@phil>
References: <3105326.uFdOVLyXH8@phil> <7172372.015CdWJg1F@phil> <52E164B6.5070206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:49482 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751535AbaAWTDP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jan 2014 14:03:15 -0500
In-Reply-To: <52E164B6.5070206@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Donnerstag, 23. Januar 2014, 19:51:34 schrieb Tomasz Figa:
> On 23.01.2014 19:36, Heiko St=FCbner wrote:
> > Am Donnerstag, 23. Januar 2014, 19:12:04 schrieb Tomasz Figa:
> >> Hi Heiko,
> >>=20
> >> On 06.01.2014 19:40, Heiko St=FCbner wrote:
> >>> This converts all boards to use the new common restart function i=
nstead
> >>> of SoC specific ones.
> >>>=20
> >>> The mach-s3c2416-dt board now tries to setup either a swrst- or
> >>> watchdog-
> >>> reset so that it will be able to handle more s3c24xx-SoCs later o=
n.
> >>=20
> >> [snip]
> >>=20
> >>> diff --git a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> >>> b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c index 0a86953..88716fa4=
 100644
> >>> --- a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> >>> +++ b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> >>> @@ -24,6 +24,7 @@
> >>>=20
> >>>    #include <plat/cpu.h>
> >>>    #include <plat/pm.h>
> >>>=20
> >>> +#include <plat/watchdog-reset.h>
> >>>=20
> >>>    #include "common.h"
> >>>=20
> >>> @@ -34,6 +35,14 @@ static void __init s3c2416_dt_map_io(void)
> >>>=20
> >>>    static void __init s3c2416_dt_machine_init(void)
> >>>    {
> >>>=20
> >>> +	s3c24xx_swrst_reset_of_init();
> >>> +
> >>> +#ifdef CONFIG_SAMSUNG_WDT_RESET
> >>> +	/* if no special swrst-device exists try to find a watchdog */
> >>> +	if (!s3c24xx_swrst_reset_available())
> >>> +		samsung_wdt_reset_of_init();
> >>> +#endif
> >>=20
> >> Hmm... I think it would be safe to assume availability of soft res=
et,
> >> especially if you could move the restart code to the clock driver.
> >=20
> > ok, so something like the following:
> >=20
> > the boards would simply use samsung_watchdog_reset, which should ac=
cording
> > to the manuals be available on all architectures. And the ccf-drive=
r on
> > appropriate architectures would simple replace the arm_pm_restart
> > callback with its own SoC specific one?
> >=20
> > For the s3c2412 this also means that the clock-logic would get simp=
lified.
> >=20
> >=20
> > Like this, or do I overlook something?
>=20
> Hmm, this would mean a dependency on CONFIG_SAMSUNG_WDT_RESET then. I=
s
> there a need to fall back to it on platforms which support soft reset
> (assuming that CCF driver would always install its restart handler on
> applicable platforms)?

s3c2410, s3c2440 and s3c2442 do not have the swrst facility. They alway=
s use=20
samsung_wdt_reset.

In general, I want to try establishing some sort of general restart way=
, as in=20
the future one dt-board should hopefully be enough to cover all s3c24xx=
 soc=20
variants.


> Note that you can make the restart field NULL in mach_desc in board f=
iles.

As I said above, this is mainly meant for the dt-case. The legacy-board=
 files=20
are more or less only secondary, and the affected boards can of course =
then=20
have a NULL restart handle :-) .

So for this the dt-board could simply use the wdt-reset, which then get=
s=20
replaced by the ccf-based reset if appropriate.


Heiko
