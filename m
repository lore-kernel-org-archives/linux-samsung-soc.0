From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Wed, 6 Mar 2013 13:34:26 +0100
Message-ID: <20130306123426.GB17079@avionic-0098.mockup.avionic-design.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de>
 <201303051919.02638.arnd@arndb.de>
 <1781901.cQ9rKScpd8@flatron>
 <201303061050.42451.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:52089 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751493Ab3CFMef (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 07:34:35 -0500
Content-Disposition: inline
In-Reply-To: <201303061050.42451.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2013 at 10:50:42AM +0000, Arnd Bergmann wrote:
> On Tuesday 05 March 2013, Tomasz Figa wrote:
> > On Tuesday 05 of March 2013 19:19:02 Arnd Bergmann wrote:
>=20
> > > If none of these are needed for DT-based systems, we should probably
> > > build that code conditionally based on the CONFIG_EXYNOS_ATAGS symbol
> > > I introduced.
> >=20
> > Yes, none of them are needed for DT-based systems.
>=20
> Ah, good. I'll try to make more code conditional then.
> =20
> > > How are you planning to solve this? Do you want to have a combined
> > > driver that registers both a clocksource and a pwm?
> >=20
> > Let's start with a quick introduction to the s3c-pwm hardware. Each=20
> > channel has its own timer value, compare and reload value registers, so=
=20
> > they don't need any extra locking. However there are additional shared=
=20
> > configuration registers, containing things such as start and reload bit=
s=20
> > for all channels, prescaler and main divisor values, etc. Those registe=
rs=20
> > needs synchronization.
> >=20
> > Now there are several possible approaches:
> >=20
> > 1) A brute force one - two separate drivers, based on the fact that the
> >    clocksource driver will be used only on uniprocessor systems, so
> >    a simple _irqsave when accessing a shared register in both will=20
> >    guarantee correct synchronization.
> >=20
> > 2) Two separate drivers with some synchronized shared code accessing=20
> >    registers (_start, _stop, _set_reload, _set_prescaler, _set_divisor,=
=20
> >    etc.; all using a shared spinlock).
> >=20
> > 3) Single driver registering PWM channels, clocksource and clock event=
=20
> >    device. This does not seem like a bad idea, since the whole code for=
=20
> >    configuration of the PWM block would reside in one location and ther=
e=20
> >    would be no redundancy. However there is a question where such drive=
r=20
> >    should be placed - drivers/clocksource, drivers/pwm, or maybe somewh=
ere=20
> >    else?
> >=20
> > Personally I wanted to go with first option, which would require least=
=20
> > amount of changes to existing code, at a cost of some code duplication=
=20
> > (but some PWM code is duplicated already).
>=20
> I would prefer option 3. That is also easier to implement with a straight=
forward
> DT binding that defines a single node with the clock registers. The locat=
ion
> doesn't have an obvious answer, but I would probably put them into
> drivers/clocksource if the PWM maintainer agrees.
>=20
> Option 2 would probably come down to having a trivial MFD driver exposing
> a regmap. You can probably reuse drivers/mfd/syscon.c for this and make
> the node compatible with "syscon" to designate the clock registers as
> a system-wide resource, making the other device nodes register-less.

I think option 2 is the standard method if one hardware block provides
several logical devices. I find it to be a pretty nice solution to this
problem. We also have precedent in the PWM subsystem. The TWL chips for
instance use it to create a platform device which is later driven by a
PWM driver.

Thierry

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRNzfSAAoJEN0jrNd/PrOhFnIP/jJMN2oVDz6cxyNXFrVQgmw4
hS+txZWEUrvQuimyrXh6+5lL2nMCH+/qQRGkBw0uxz5g0UrADTWr8/1zGf6JRyvP
ZG5HXgXxd9y55oeh1uRFGKpZVYELpuSQdqI2OrKsCWoYOgGk4uVwm4S89sN15BrO
NB14Tn42EJKyr6RlS4JHkX5fCrV3FJQRfbl/dPmP+8F3qwx9RNdVMuwCvZd3UPYc
G3IWsHZYF/7VcKVTt3V6Me5TuX5Rnzlvw6wRSQpMbhl8MNneu89oMx5DTI8bwHdw
NxH/RnDASpSPkDWbnzQ9KF4GAOFezaYbPZrJL+Z8wwSSokrW4+LpceNQZBppV9XN
PuZuP7IKIkoIRcYMo7dgLJubDlZ1uOGSoChErLou7v+Go18UdWB1GZGnLF4R8Ww0
1A3D5vR5HV9ZMPOMkDQ/TkPTzinolnATUnbvraZMV6BUpmFeBYcjCex2ebgTvsnQ
VrX38Z8pCkxEt4UtySGnTS8CHpM+0ABNHJU+2Vdc4gNtgvQDCDRLeWS/baE+CODH
UzH457Qq+A3JU7KjPJ5lrBkyre2x3A6zSwCNp+Nnk3riaElTQzvG1JAQGfAUj6VE
rWho4sbWiQYWc5zEfjNAC3975kuESLosmh1AzxHDwCQ/dS0/4DhGblrYLCEKf2ax
dcyktRBOgEc1WYvOMHtl
=xhaK
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
