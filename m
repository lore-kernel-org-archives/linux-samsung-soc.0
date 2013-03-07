From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Thu, 7 Mar 2013 08:22:03 +0100
Message-ID: <20130307072203.GC3451@avionic-0098.mockup.avionic-design.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de>
 <201303061050.42451.arnd@arndb.de>
 <20130306123426.GB17079@avionic-0098.mockup.avionic-design.de>
 <201303070302.46593.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:51882 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753268Ab3CGHWS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 02:22:18 -0500
Content-Disposition: inline
In-Reply-To: <201303070302.46593.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 03:02:46AM +0000, Arnd Bergmann wrote:
> On Wednesday 06 March 2013, Thierry Reding wrote:
> > > Option 2 would probably come down to having a trivial MFD driver expo=
sing
> > > a regmap. You can probably reuse drivers/mfd/syscon.c for this and ma=
ke
> > > the node compatible with "syscon" to designate the clock registers as
> > > a system-wide resource, making the other device nodes register-less.
> >=20
> > I think option 2 is the standard method if one hardware block provides
> > several logical devices. I find it to be a pretty nice solution to this
> > problem. We also have precedent in the PWM subsystem. The TWL chips for
> > instance use it to create a platform device which is later driven by a
> > PWM driver.
>=20
> One difference though is that the TWL chip is a heterogenous MFD that has
> a lot of different sub-devices, where in case of Exynos the timer device
> has a set of identical units, each of which can be used either as a PWM or
> as a clocksource or other timer.

I didn't know that. However I still making this an MFD driver is a good
fit because it'll move the logic of defining the mode of each unit is
kept in a parent driver which can instantiate the proper child devices
for the corresponding subsystems.

One big disadvantage of this approach is that if this is continued there
is a risk that MFD will turn into a dump for all kinds of devices that
provide more than a single service.

So if people prefer option 3 I'm fine with it as well.

Thierry

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJROEAbAAoJEN0jrNd/PrOh118QAK3P1ApN0WljMMEIMriaSWNk
iJUEys8UQAu1TWgmWKxaxVoWisTM2ORzM/b6nCpbq5N5JlbnGQ0G+zrPtrqYEt4m
Velzh1+NDtlB+7bhNTR+vEjcKv1IZXzgo5+h9cGtoIx6ImV+HpPW6kMQidBpzDN3
4OvasJ7NSY3Qllm+us1JY4+It1ShUXP43YhdA92t2tavvxVh+UvAgKyPCEXc+s/Q
xOJpjR37k9dHV8DeYGjcYu/ehrVnov0BNZ4xuQXg4aXx5bhJeFkawcDs6Ch/j8jI
tiUytGZ2x7hoV1PHTjJScM7orzfOk/gyfcua74bCu/PAw363lD9WENF8YSEP8GvS
z1OzJyPCRlGGXQOwPxfk6IK1kzHgtqhVT5vz7SwvxpCa9fxRnpHMP6nzvlh36Kdc
cZyIWP48U/iXG5gpdsdlDdJ+WdpStG5ypBLJPZw/opZ+BEwwHgpB4CKayXMBYgkN
L1hWL3aI/Upcz3a8FXIgybJlae79oBDcS7gr55ORLkxbdvGMLptC8dkKPiIINTUb
lFE40TeuX3gRaOD7uLE7+/FwzRhfR7DeV+i3EH+dXuElzax8rhVdtX3I6Uhf9Lnx
ijbjd/25Yd2O8AcSebX76tid7TrNbaxAwcN57a/K75yTyPBCwB3rH9bxvH4v8Wf6
orsoMf5NxMrKvKQcX1mU
=O2zq
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
