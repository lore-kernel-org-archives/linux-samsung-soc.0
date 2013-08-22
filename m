From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 3/7] gpio: samsung: Skip initialization if device tree
 is present
Date: Thu, 22 Aug 2013 10:48:15 +0100
Message-ID: <20130822094815.GP26118@sirena.org.uk>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com>
 <1377120111-25601-4-git-send-email-tomasz.figa@gmail.com>
 <CACRpkda2ZjPm4nEeDujPWSDCNLk4mr9izPvhqNKx5urVAg_Azg@mail.gmail.com>
 <3452017.UPhKO6xNO5@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="By57YlnFViWR/M0S"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3452017.UPhKO6xNO5@flatron>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org


--By57YlnFViWR/M0S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2013 at 10:06:46AM +0200, Tomasz Figa wrote:
> On Thursday 22 of August 2013 01:21:25 Linus Walleij wrote:

> > This seems like something I should apply to the GPIO tree
> > right now, shall I?

> Would be nice, but since this patch is a dependency for rest of this=20
> series and there are no other dependencies on GPIO tree, it might be=20
> easier to just let Kukjin take all the patches with required Acks.

Though if the rest of the series might miss v3.12 (seems likely given
the arm-soc deadlines have passed) then Linus could apply this for
v3.12?

--By57YlnFViWR/M0S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFd5cAAoJELSic+t+oim9NGoP+wfi3HmKJp+QaLURrX+Soc0B
wyNveicf/4qNNgIFR1u2Ih3a4RQaBOaHX0vOEE1e/RFmo7lQ6bd9ZjdYMbUQd7tn
pX1v164UH/Pm+ERPwZFv9pUlnj/tUzfv94LHeypwstZR4xHS46BsIcRdCVMz3tqo
XR7ByhIwDjg6DWKwzV2N8ckWUrKeLtYj/cPGdhXeZ3HJjqgHS1euFi8Zs9NOxVJq
k5lMJi0qQlYtCmRgwzjHW6x7SCwXZeU645h8keOCrjb50odwGeLhJPNVC/dcHyWE
eplajSS6EvufkP5cEx93SaexmRoZX+VjMCRg4xQ1kc42g1uBl+3DFAaMS7oyYDMg
4FTn3E1Zh43hUAo/2Eey4mnJgCkJKop6qUmQsmsKrChp4WVsToPwtlMtyslYJiKR
Cc9idoaP6UVrCemgaYJRjZ7R5OOjDJEyEhOf6+vhl9EI4sMNiu7qEksW3DofOpGj
55JP77jmoVKoqgh/SMeDWkma3XaI+1ea39OfKxza3g64X16KrV3JelweZcvPmO3r
fnjhE7uWTqKKW+p8WVa62tMlk3DMm3HjDWKTEEeYMRnEFqg+xVbD88QqerCIsIDy
UVOoyIYw/bCwXWKslXHcoWUPRANbM01BKARn49UqAdFqUBJKhVsAIwdC1WVDeR8b
XyZQ5pWg+eiSKAnvk7Hn
=fqfK
-----END PGP SIGNATURE-----

--By57YlnFViWR/M0S--
