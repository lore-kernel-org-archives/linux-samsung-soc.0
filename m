From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 5/5] irqchip: s3c24xx: add devicetree support
Date: Fri, 22 Mar 2013 22:42:05 +0000
Message-ID: <201303222242.05269.arnd@arndb.de>
References: <201303221843.37668.heiko@sntech.de> <201303222055.57400.arnd@arndb.de> <201303222315.44882.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:53661 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423414Ab3CVWmM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Mar 2013 18:42:12 -0400
In-Reply-To: <201303222315.44882.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Friday 22 March 2013, Heiko St=C3=BCbner wrote:
> Not all main interrupts are parent interrupts, so it would be difficu=
lt to=20
> distinguish between main interrupts that are a parent and the ones th=
at are=20
> not - is a "-1" a valid cell-value for interrupts?

I'm actually not sure if negative numbers are valid syntax in dtc, but
you could certainly define some value to mean "none", or you add anothe=
r
flag in the trigger type cell.

>         <main_irq -1 trigger_type> /* directly used main interrupt */
>         <main_irq child_irq trigger_type> /* sub-interrupt */
>=20
> Or are you thinking of something like:
>         <main_irq is_a_parent child_irq trigger_type>

The first one would work, the second one with four cells seems a bit
strange if the second cell is just a bit. My first idea was to use=20
a bit mask for the child irq, in which only one bit is set, so
it would be <3 0x40000 4> instead of <3 18 4>, and a zero bitmask
would indicate no sub-interrupt. This is probably harder to read
though and not a good representation.

> I looked a bit more thru the other irqchips and it seems the bcm2835 =
is doing=20
> something similar but without having a parent relationship:
>         <controller-num irq-num>
>=20
> so this could be adapted to:
>         <controller-num irq-num parent-num trigger_type>
>=20
> controller-num being 0 for intc, 1 for subintc, 2 intc2 . The control=
ler=20
> itself knows if it's a sub- or main controller - when it should handl=
e the=20
> parent-number or simply ignore it.

Yes, that looks more logical.

You could in theory also compact collapse multiple cells into one, so
instead of using <1 3 18 4> it could be <0x10031204> or <0x10030012 4>
to save a little space while making it a little less readable.
=20
> > The alternative would be to have three completely separate nodes,
> > and then you can describe the parent-child relationship like
> >=20
> > intc: interrupt-controller@4a000000 {
> >       compatible =3D "samsung,s3c2416-intc";
> >       reg =3D <0x4a000000 0x18>;
> >       interrupt-controller;
> >       #interrupt-cells =3D <2>;
> > };
> >=20
> > subintc: interrupt-controller@4a000018 {
> >       compatible =3D "samsung,s3c2416-subintc";
> >       reg =3D <0x4a000018 0x28>;
> >       interrupt-controller;
> >       #interrupt-cells =3D <3>;
> >       interrupt-parent =3D <&intc>;
> >       interrupts  =3D <28 0>, <23 0>, <15 0>, <31 0>, <16 0>, <17 0=
>, <18 0>, <9
> > 0>; };
>=20
>=20
> The first two iterations had separate nodes, but the interrupt contro=
ller=20
> posseses more interesting registers that are shared between all of th=
e=20
> controllers, so it did sound better to have them together.

Yes, makes sense.

> Also the interrupts property is most likely not able to accurately de=
scribe=20
> the parent relationship, as the interrupts are very much different in=
 all=20
> s3c24xx SoCs - I would need to tell every sub-interrupt where it casc=
asdes=20
> from, because most of them do different things on different s3c24xx S=
oCs.
>
> I did start with this approach, using the interrupt index as mapping =
for the=20
> hwirq - interrupts[0] for hwirq 0 and so on. But it looked ugly. Usin=
g only=20
> one interrupts element per sub-group would require per-SoC mapping da=
ta to be=20
> present in the driver, indicating that interrupts[0] is responsible f=
or bits=20
> 0,1,2 and so on.
>=20
> Therefore the idea of handling the parent relationship in the device-=
nodes=20
> interrupt property sounds much nicer :-)

Ok.

	Arnd
