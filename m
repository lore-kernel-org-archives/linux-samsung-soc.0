From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform support
Date: Sat, 13 Apr 2013 00:26:43 +0200
Message-ID: <7765249.PbghLduf67@wuerfel>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com> <201304130022.49987.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:51672 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974Ab3DLW1M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 18:27:12 -0400
In-Reply-To: <201304130022.49987.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, robherring2@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de

On Saturday 13 April 2013 00:22:48 Heiko St=C3=BCbner wrote:
>=20
> Without dt support, you get this:
>=20
>   CC      drivers/clocksource/samsung_pwm.o
> drivers/clocksource/samsung_pwm.c:620: warning: =E2=80=98samsung_pwm_=
clocksource_init_of=E2=80=99 defined but not used
>=20
> So, something like the following might be necessary

That patch should not be required any more with the definition

#ifdef CONFIG_CLKSRC_OF
extern void clocksource_of_init(void);

#define CLOCKSOURCE_OF_DECLARE(name, compat, fn)                       =
 \
        static const struct of_device_id __clksrc_of_table_##name      =
 \
                __used __section(__clksrc_of_table)                    =
 \
                 =3D { .compatible =3D compat,                         =
     \
                     .data =3D (fn =3D=3D (clocksource_of_init_fn)NULL)=
 ? fn : fn }
#else
static inline void clocksource_of_init(void) {}
#define CLOCKSOURCE_OF_DECLARE(name, compat, fn)                       =
 \
        static const struct of_device_id __clksrc_of_table_##name      =
 \
                __attribute__((unused))                                =
 \
                 =3D { .compatible =3D compat,                         =
     \
                     .data =3D (fn =3D=3D (clocksource_of_init_fn)NULL)=
 ? fn : fn }
#endif

which turns the =E2=80=98samsung_pwm_clocksource_init_of=E2=80=99 funct=
ion into an unused
symbol that gets silently dropped by gcc, at least in theory. Are you
using the latest clksrc/cleanup branch as a base?

	Arnd
