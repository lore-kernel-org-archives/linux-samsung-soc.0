From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2] pinctrl: Add pinctrl-s3c24xx driver
Date: Thu, 11 Apr 2013 11:54:21 +0200
Message-ID: <201304111154.22073.heiko@sntech.de>
References: <201304110116.41525.heiko@sntech.de> <201304111132.05009.heiko@sntech.de> <3973166.f1dd7C8GWR@amdc1227>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54401 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752454Ab3DKJy0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 05:54:26 -0400
In-Reply-To: <3973166.f1dd7C8GWR@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>

Am Donnerstag, 11. April 2013, 11:43:19 schrieb Tomasz Figa:
> On Thursday 11 of April 2013 11:32:03 Heiko St=FCbner wrote:
> > Am Donnerstag, 11. April 2013, 10:54:45 schrieb Tomasz Figa:
> > > Hi Heiko,
> > >=20
> > > As previously, generally looks good to me, but see my comments in=
line.
> > >=20
> > > On Thursday 11 of April 2013 01:16:41 Heiko St=FCbner wrote:
> > > > The s3c24xx pins follow a similar pattern as the other Samsung =
SoCs
> > > > and can therefore reuse the already introduced infrastructure.
> > > >=20
> > > > The s3c24xx SoCs have one design oddity in that the first 4 ext=
ernal
> > > > interrupts do not reside in the eint pending register but in th=
e main
> > > > interrupt controller instead. We solve this by forwarding the
> > > > external interrupt from the main controller into the irq domain=
 of
> > > > the pin bank. The masking/acking of these interrupts is handled=
 in
> > > > the same way.
> > > >=20
> > > > Furthermore the S3C2412/2413 SoCs contain another oddity in tha=
t they
> > > > keep the same 4 eints in the main interrupt controller and eint=
pend
> > > > register and requiring ack operations to happen in both. To sol=
ve
> > > > this a ctrl_type enum is introduced which can keep the type of
> > > > controller
> > >=20
> > > Hmm, I think you forgot to edit the commit message, since we deci=
ded to
> > > replace ctrl_type with another compatible string.
> >=20
> > One should not do these things after midnight :-) [true for most of=
 the
> > other mistakes below too].
> >=20
> > > > in the samsung_pin_ctrl struct for later retrieval.
> > > >=20
> > > > The ctrl_type enum contains only S3C24XX and S3C2412 types, as =
the
> > > > eint-speciality is currently the only use-case. But it can be e=
xpaned
> > > > if other SoCs gain special handling requirements later on.
> > > >=20
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > > > changes since v1:
> > > >=20
> > > > - address comments from Tomasz Figa:
> > > >   * split handling functions for eints 0-3 for s3c2412 and all =
others
> > > >   * change the handling for s3c2412 eints 0-3 in that they now =
use
> > > >  =20
> > > >     chained_irq_* for the outer parent interrupt
> > >=20
> > > OK, so you finally decided to use the way I suggested. Have you m=
anaged
> > > to do some testing on a S3C2412?
> >=20
> > Nope, after pondering everything a bit more ... your description ju=
st
> > sounded more plausible :-) . I only have access to s3c2416 and s3c2=
450
> > boards, so everything else is just done according to datasheets and=
 in
> > the hope of it being correct. S3C2412 is really the only familiy me=
mber
> > having the 4 eints in both registers.
> >=20
> > Also the (reworked) legacy eint code also uses this scheme ... so a=
t
> > least now both are either correct or wrong. We will only know if so=
meone
> > with a s3c2412 comes along at some point :-) .
>=20
> That's why I was wondering whether it is possible to get a board with
> S3C2412 or 13 somewhere. The Logitech controller would be pretty
> interesting, but is it still possible to get it? (Btw. Is it mach-jiv=
e in
> the kernel?)

The squeezebox controller is still available in some shops, but the pri=
ces=20
their asking (>=3D160 EUR for the controller alone) are in no relation =
to the=20
age and "power" of the hardware. And yes they're the jive mach.
