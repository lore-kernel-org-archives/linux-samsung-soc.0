From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform support
Date: Sat, 13 Apr 2013 00:42:55 +0200
Message-ID: <11677814.fpOiq2szh2@flatron>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com> <7765249.PbghLduf67@wuerfel> <201304130039.24872.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:39053 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120Ab3DLWm6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 18:42:58 -0400
Received: by mail-ea0-f173.google.com with SMTP id k11so1410020eaj.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Apr 2013 15:42:57 -0700 (PDT)
In-Reply-To: <201304130039.24872.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, mark.rutland@arm.com, Tomasz Figa <t.figa@samsung.com>, buserror@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, christer@weinigel.se, sylvester.nawrocki@gmail.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, kwangwoo.lee@gmail.com, mcuelenaere@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ghcstop@gmail.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, jekhor@gmail.com, kyungmin.park@samsung.com, tglx@linutronix.de

On Saturday 13 of April 2013 00:39:24 Heiko St=C3=BCbner wrote:
> Am Samstag, 13. April 2013, 00:26:43 schrieb Arnd Bergmann:
> > On Saturday 13 April 2013 00:22:48 Heiko St=C3=BCbner wrote:
> > > Without dt support, you get this:
> > >   CC      drivers/clocksource/samsung_pwm.o
> > >=20
> > > drivers/clocksource/samsung_pwm.c:620: warning:
> > > =E2=80=98samsung_pwm_clocksource_init_of=E2=80=99 defined but not=
 used
> > >=20
> > > So, something like the following might be necessary
> >=20
> > That patch should not be required any more with the definition
> >=20
> > #ifdef CONFIG_CLKSRC_OF
> > extern void clocksource_of_init(void);
> >=20
> > #define CLOCKSOURCE_OF_DECLARE(name, compat, fn)                   =
  =20
> >  \>=20
> >         static const struct of_device_id __clksrc_of_table_##name  =
  =20
> >          \
> >        =20
> >                 __used __section(__clksrc_of_table)                =
  =20
> >                  \
> >                =20
> >                  =3D { .compatible =3D compat,                     =
      =20
> >                   \
> >                 =20
> >                      .data =3D (fn =3D=3D (clocksource_of_init_fn)N=
ULL) ? fn
> >                      : fn
> >=20
> > } #else
> > static inline void clocksource_of_init(void) {}
> > #define CLOCKSOURCE_OF_DECLARE(name, compat, fn)                   =
  =20
> >  \>=20
> >         static const struct of_device_id __clksrc_of_table_##name  =
  =20
> >          \
> >        =20
> >                 __attribute__((unused))                            =
  =20
> >                  \
> >                =20
> >                  =3D { .compatible =3D compat,                     =
      =20
> >                   \
> >                 =20
> >                      .data =3D (fn =3D=3D (clocksource_of_init_fn)N=
ULL) ? fn
> >                      : fn
> >=20
> > } #endif
> >=20
> > which turns the =E2=80=98samsung_pwm_clocksource_init_of=E2=80=99 f=
unction into an
> > unused symbol that gets silently dropped by gcc, at least in theory=
=2E
> > Are you using the latest clksrc/cleanup branch as a base?
>=20
> Nope, I just put the stuff on top of all the other changes. So it see=
ms
> everything is fine and working ... very nice :-)

Great. Thanks for testing.

I will try to rebase my patches for s3c64xx on top of this and do some=20
testing as well.

Best regards,
Tomasz
