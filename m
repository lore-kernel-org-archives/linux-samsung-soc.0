From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] pinctrl: Add pinctrl-s3c24xx driver
Date: Thu, 11 Apr 2013 11:43:19 +0200
Message-ID: <3973166.f1dd7C8GWR@amdc1227>
References: <201304110116.41525.heiko@sntech.de> <3905101.tGGPWFz8Ff@amdc1227>
 <201304111132.05009.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56267 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121Ab3DKJnk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 05:43:40 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML3005IU4CJFSZ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Apr 2013 18:43:39 +0900 (KST)
In-reply-to: <201304111132.05009.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>

On Thursday 11 of April 2013 11:32:03 Heiko St=FCbner wrote:
> Am Donnerstag, 11. April 2013, 10:54:45 schrieb Tomasz Figa:
> > Hi Heiko,
> >=20
> > As previously, generally looks good to me, but see my comments inli=
ne.
> >=20
> > On Thursday 11 of April 2013 01:16:41 Heiko St=FCbner wrote:
> > > The s3c24xx pins follow a similar pattern as the other Samsung So=
Cs and
> > > can therefore reuse the already introduced infrastructure.
> > >=20
> > > The s3c24xx SoCs have one design oddity in that the first 4 exter=
nal
> > > interrupts do not reside in the eint pending register but in the =
main
> > > interrupt controller instead. We solve this by forwarding the ext=
ernal
> > > interrupt from the main controller into the irq domain of the pin=
 bank.
> > > The masking/acking of these interrupts is handled in the same way=
=2E
> > >=20
> > > Furthermore the S3C2412/2413 SoCs contain another oddity in that =
they
> > > keep the same 4 eints in the main interrupt controller and eintpe=
nd
> > > register and requiring ack operations to happen in both. To solve=
 this
> > > a ctrl_type enum is introduced which can keep the type of control=
ler
> >=20
> > Hmm, I think you forgot to edit the commit message, since we decide=
d to
> > replace ctrl_type with another compatible string.
>=20
> One should not do these things after midnight :-) [true for most of t=
he
> other mistakes below too].
>=20
> > > in the samsung_pin_ctrl struct for later retrieval.
> > >=20
> > > The ctrl_type enum contains only S3C24XX and S3C2412 types, as th=
e
> > > eint-speciality is currently the only use-case. But it can be exp=
aned
> > > if other SoCs gain special handling requirements later on.
> > >=20
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > > changes since v1:
> > >=20
> > > - address comments from Tomasz Figa:
> > >   * split handling functions for eints 0-3 for s3c2412 and all ot=
hers
> > >   * change the handling for s3c2412 eints 0-3 in that they now us=
e
> > >  =20
> > >     chained_irq_* for the outer parent interrupt
> >=20
> > OK, so you finally decided to use the way I suggested. Have you man=
aged to
> > do some testing on a S3C2412?
>=20
> Nope, after pondering everything a bit more ... your description just
> sounded more plausible :-) . I only have access to s3c2416 and s3c245=
0
> boards, so everything else is just done according to datasheets and i=
n the
> hope of it being correct. S3C2412 is really the only familiy member h=
aving
> the 4 eints in both registers.
>=20
> Also the (reworked) legacy eint code also uses this scheme ... so at =
least
> now both are either correct or wrong. We will only know if someone wi=
th a
> s3c2412 comes along at some point :-) .

That's why I was wondering whether it is possible to get a board with S=
3C2412=20
or 13 somewhere. The Logitech controller would be pretty interesting, b=
ut is=20
it still possible to get it? (Btw. Is it mach-jive in the kernel?)

Best regards,
--=20
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
