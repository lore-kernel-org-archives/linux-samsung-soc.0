From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 6/7] ARM: SAMSUNG: use clk_prepare_enable in samsung-time
Date: Thu, 14 Mar 2013 00:16:34 +0100
Message-ID: <201303140016.35152.heiko@sntech.de>
References: <201303120141.31262.heiko@sntech.de> <201303120145.21072.heiko@sntech.de> <CADTbHxq-gxoN9HKkjPsZ5uBt7PhrvO8XdQdmAyscOA+xPy9Z7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:35329 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932166Ab3CMXQm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 19:16:42 -0400
In-Reply-To: <CADTbHxq-gxoN9HKkjPsZ5uBt7PhrvO8XdQdmAyscOA+xPy9Z7A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Jangra <jangra.pankaj9@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Hi,

Am Mittwoch, 13. M=E4rz 2013, 17:59:04 schrieb Pankaj Jangra:
> Hi,
>=20
> On Tue, Mar 12, 2013 at 6:15 AM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > The common clock framework expects clocks to be prepared
> > before they are enabled.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  arch/arm/plat-samsung/samsung-time.c |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/arm/plat-samsung/samsung-time.c
> > b/arch/arm/plat-samsung/samsung-time.c index f899cbc..6ebb851 10064=
4
> > --- a/arch/arm/plat-samsung/samsung-time.c
> > +++ b/arch/arm/plat-samsung/samsung-time.c
> > @@ -355,7 +355,7 @@ static void __init samsung_timer_resources(void=
)
> >=20
> >         if (IS_ERR(timerclk))
> >        =20
> >                 panic("failed to get timers clock for timer");
>=20
> Also how about calling the clk_prepare_enable() only if the clk_get()
> call is a sucess? Though clk framework will take care of it. Just
> thinking even to avoid that call if clk_get() fails since you are
> modifying the code.

I remember there was a discussion about panic vc error handling when th=
is was=20
introduced but I don't remember the specifics, but it seems they agreed=
 to do=20
it this way with letting the kernel panic when the clock is missing.


Also the current plan seems to replace the clocksource and pwm drivers =
that=20
occupy the same register space with a driver handling both, making the =
pwm=20
specific clocks obsolete and only the timers clock will remain. So this=
 was=20
merely meant as a fixup when using the clock changes with the current=20
clocksource code.


> > -       clk_enable(timerclk);
> > +       clk_prepare_enable(timerclk);
> >=20
> >         sprintf(devname, "s3c24xx-pwm.%lu", event_id);
> >         s3c_device_timer[event_id].id =3D event_id;
> >=20
> > @@ -369,7 +369,7 @@ static void __init samsung_timer_resources(void=
)
> >=20
> >         if (IS_ERR(tdiv_event))
> >        =20
> >                 panic("failed to get pwm-tdiv clock for event timer=
");
>=20
> Same here...
>=20
> > -       clk_enable(tin_event);
> > +       clk_prepare_enable(tin_event);
> >=20
> >         sprintf(devname, "s3c24xx-pwm.%lu", source_id);
>=20
> Regards,
> Pankaj Jangra
