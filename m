From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 1/2] Samsung cleanup PWM for v3.11
Date: Tue, 25 Jun 2013 22:08:52 +0200
Message-ID: <20130625200851.GA8663@mithrandir>
References: <51C87D32.6050607@samsung.com>
 <51C9C6B3.4040003@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:39817 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484Ab3FYUI4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 16:08:56 -0400
Received: by mail-ee0-f44.google.com with SMTP id c13so7042492eek.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jun 2013 13:08:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51C9C6B3.4040003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 01:34:59AM +0900, Kukjin Kim wrote:
> On 06/25/13 02:09, Kukjin Kim wrote:
> >The following changes since commit
> >db3824e6bf0b0f421b0d43f08d905935e826a965:
> >
> >ARM: SAMSUNG: Remove unused plat/regs-watchdog.h header (2013-06-19
> >03:13:18 +0900)
> >
> >are available in the git repository at:
> >
> >git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> >tags/samsung-cleanup-2
> >
> >for you to fetch changes up to 329d2fb35f05bd9255b4618813d534b8192555a4:
> >
> >ARM: SAMSUNG: Remove plat/regs-timer.h header (2013-06-25 01:13:49 +0900)
> >
> >----------------------------------------------------------------
> >based on tags/samsung-cleanup-1
> >
> >This cleanup of PWM Samsung is for:
> >1) moving remaining Samsung platforms to the new clocksource driver
> >2) removing old clocksource driver
> >3) adding new multiplatform- and DT-aware PWM driver
> >4) moving all Samsung platforms to use the new PWM driver
> >5) removing old PWM driver
> >6) removing all PWM-related code that is not used anymore
> >
> >----------------------------------------------------------------
> >Tomasz Figa (18):
> >ARM: SAMSUNG: Unify base address definitions of timer block
> >ARM: SAMSUNG: Add new PWM platform device
> >ARM: SAMSUNG: Set PWM platform data
> >clocksource: samsung_pwm_timer: Cache clocksource register address
> >clocksource: samsung_pwm_timer: Do not use clocksource_mmio
> >clocksource: samsung_pwm_timer: Handle suspend/resume correctly
> >ARM: SAMSUNG: Move all platforms to new clocksource driver
> >ARM: SAMSUNG: Remove old samsung-time driver
> >ARM: SAMSUNG: Remove unused PWM timer IRQ chip code
> >pwm: samsung: Rename to pwm-samsung-legacy
> >pwm: Add new pwm-samsung driver
> >ARM: SAMSUNG: Rework private data handling in dev-backlight
> >ARM: SAMSUNG: Modify board files to use new PWM platform device
> >pwm: Remove superseded pwm-samsung-legacy driver
> >ARM: SAMSUNG: Remove old PWM timer platform devices
> >ARM: SAMSUNG: Remove pwm-clock infrastructure
> >ARM: SAMSUNG: Remove remaining uses of plat/regs-timer.h header
> >ARM: SAMSUNG: Remove plat/regs-timer.h header
> >
>=20
> [...]
>=20
> >drivers/pwm/pwm-samsung.c | 694 ++++++++++++++-------
>=20
> (+ Thierry Reding)
>=20
> Hi Arnd and Olof
>=20
> Please hold on pulling this one because Thierry Reding has objection
> on this. I think, this can be queued for next time.

If it's really just my objection keeping this back, then I'm fine with
adding the comment in a follow-up patch.

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRyfjTAAoJEN0jrNd/PrOhDKcQAIJBUzhVTE610AT6TTbFj2YE
TZD0pvE7M5n5CR4Gp69uoQaO/SJWdK7qLr4DjqVTK1pCVDhifhPWPZyDbIHX7URu
lrYJfpSm+AigUISVeKD1JHvqLnt3wU01f7vpYHh/9DBpBRzq3O2F7x/tmm12s6yd
VjbFB9Rt5FEM+5zAVC1KYEZ+0dz5hh6PeAcOb21fVJhHW0LihH6k/VizbrAc/1lT
vdvxvLuh7TRvTN7Qo7UksyRh1QfcgAQD3zQXAhoIEM94BooWddzldiIPDoqi0oug
p45J+Ur6PnB7lIh26ysa4V0NBHpl5ADlIst7tlDn9dlCw+O1OxT5JRN5roQFu50c
7U0jD63CIrudcI6ZDNCz9urEXIeJy9WvGuJulluHvBt3BOcOg1LSs00e9RtNDDGd
prXxjx3eUTTPJ3e9RVAG7J/FOLG4+Ksj6cDrDX8+yT3Hus64uhTjeKWArt+48ucT
/pOjpbyYGut2MEYleQEQ3/XX/MG3cNqTw5cugAZhSnEGraslT5KJiPyWR11KQJgL
37JqJ17XC3biZR1tTPpT9NYjrmvWjzHVeSWQIo9/DRUp44C2sFD94oZJPsVG8Ocu
VKeU2JYqqfrjXe8EGwpHJ/hZhmQk77S2WklPYDuJVSyVMMUbrMU8kDi0FRBhBkm5
WS0yOwSpUZGXOP/5I0jO
=jZyZ
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
