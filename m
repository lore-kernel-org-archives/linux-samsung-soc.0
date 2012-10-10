From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 01/16] ARM: dts: exynos4210: Replace legacy GPIO bank nodes with pinctrl bank nodes
Date: Wed, 10 Oct 2012 20:26:25 +0200
Message-ID: <1760725.iUz22fJjbN@flatron>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com> <5075A1EF.60900@wwwdotorg.org> <20121010181253.GQ12552@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:38116 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756871Ab2JJS0Y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 14:26:24 -0400
Received: by mail-ee0-f46.google.com with SMTP id b15so600529eek.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 11:26:23 -0700 (PDT)
In-Reply-To: <20121010181253.GQ12552@atomide.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

Dnia =C5=9Broda, 10 pa=C5=BAdziernika 2012 11:12:53 Tony Lindgren pisze=
:
> * Stephen Warren <swarren@wwwdotorg.org> [121010 09:36]:
> > On 10/10/2012 01:26 AM, Linus Walleij wrote:
> > > On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com>=
=20
wrote:
> > >> Seuqential patches from this series introduce SoC-specific data
> > >> parsing
> > >> from device tree.
> > >>=20
> > >> This patch removes legacy GPIO bank nodes from exynos4210.dtsi a=
nd
> > >> replaces them with nodes and properties required for these patch=
es.
> > >=20
> > > So to be clear:
> > >> +       pinctrl-bank-types {
> > >> +               bank_off: bank-off {
> > >> +                       samsung,reg-names =3D "func", "dat", "pu=
d",
> > >> +                                               "drv", "conpdn",
> > >> "pudpdn"; +                       samsung,reg-params =3D <0x00 4=
>,
> > >> <0x04 1>, <0x08 2>, +                                           =
  =20
> > >> <0x0C 2>, <0x10 2>, <0x14 2>; +               };
> > >=20
> > > This is starting to look like a firmware language, I have mixed
> > > feelings about this. Shall this be read:
> > >=20
> > > "Poke 4 into 0x00, poke 1 into 0x04, poke 2 into 0x08" etc?
> > >=20
> > > We really need to discuss this, Grant has already NACK:ed
> > > such approaches once.
> >=20
> > Well, I don't think he NACK'd Tony Lindgren's generic pinctrl drive=
r,
> > which is doing this exact same thing. I did raise the same point ab=
out
> > Tony's driver when he posted it, but nobody seemed inclined to NACK=
 it
> > based on that at the time, IIRC...
>=20
> To summarize, using reg value pairs in DT makes sense if the amount
> of data is huge. Otherwise we'll be describing indidual hardware bits
> as properties in DT, or have to have huge amounts of static data in
> the kernel.
>=20
> Where it does not make sense is if there's a sequence of reads
> and writes with test loops in between.. But that's does not look
> to be the case here.
>=20
> The reg value pairs will be readable when the DT preprocessing is
> available, and that allows the values to be orred together while
> DT properties don't. The alternative is to describe hardware register
> bits as DT properties, which is very bloated.
>=20
> But considering all this.. Are the samsung,reg-names really needed
> by the kernel?

They are used to specify which registers are defined in reg-params prop=
erty=20
and in which order. Most of the registers are not mandatory and this is=
=20
needed to be able to specify only those that are present. At least I=20
couldn't think of a better solution for this. Do you have some suggesti=
ons?
=20
Best regards,
Tomasz Figa
