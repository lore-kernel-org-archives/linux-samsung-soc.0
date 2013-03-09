From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: s3c24xx pinctrl help
Date: Sat, 9 Mar 2013 15:02:54 +0100
Message-ID: <201303091502.55079.heiko@sntech.de>
References: <201303081538.04877.heiko@sntech.de> <201303091356.25912.heiko@sntech.de> <1825121.bbMz1G1oeT@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38841 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758374Ab3CIODD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 09:03:03 -0500
In-Reply-To: <1825121.bbMz1G1oeT@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org

Am Samstag, 9. M=E4rz 2013, 14:31:53 schrieb Tomasz Figa:
> On Saturday 09 of March 2013 13:56:25 Heiko St=FCbner wrote:
> > Am Freitag, 8. M=E4rz 2013, 19:57:09 schrieb Tomasz Figa:
> > > Hi Heiko,
> > >=20
> > > On Friday 08 of March 2013 15:38:04 Heiko St=FCbner wrote:
> > > > Hi Thomas,
> > > >=20
> > > > taking you up on your offer of helping, I would be cool if you =
could
> > > > simply give me a push in the right direction :-) .
> > > >=20
> > > >=20
> > > > From what I've seen so far, the bank handling itself is very si=
milar
> > > > between exynos and s3c24xx as the underlying structures already
> > > > handle
> > > > multiple widths of the register contents. More interesting is t=
he
> > > > eint
> > > > handling around which I couldn't wrap my head yet.
> > > >=20
> > > > The basic structure is again similar with special eint register=
s,
> > > > but
> > > > adds some quirks. EINT banks are gpf (8 eints) and gpg (8 or 16
> > > > eints
> > > > depending on the SoC).
> > > >=20
> > > > The current way on Exynos seems to be to mark the offset in the=
 eint
> > > > register and attach an irq_domain to the bank, which gets mappe=
d to
> > > > the
> > > > eints starting at the offset. The eints seem to have a parent
> > > > interrupt
> > > > that is provided via the dt.
> > > >=20
> > > > On the S3C24xx the gpg bank is doing this similar but gpf is ve=
ry
> > > > strange.
> > > >=20
> > > > The first half of the bank (gpf0 to gpf3) is not handled in ein=
tpend
> > > > registers but in the main interrupt controller (bits 0 to 3), w=
hile
> > > > the
> > > > second half of gpf is handled in eintpend. The new interrupt
> > > > declaration might show this better, which can be found at [0].
> > > >=20
> > > > An exception is the s3c2412 which adds still another quirk wher=
e
> > > > each
> > > > interrupt of gpf0 to gpf3 is represented in both the normal int=
c and
> > > > eint registers, again for reference probably easier to see in [=
1].
> > > >=20
> > > >=20
> > > > So I'm still quite stumped on how this could fit into the curre=
nt
> > > > framework and would be really glad for some small pointers :-)
> > >=20
> > > I wonder if some of my patches for pinctrl on S3C64xx might be
> > > helpful:
> > >=20
> > > https://github.com/tom3q/linux/commits/v3.8-s3c64xx-dt-pinctrl
> >=20
> > Partially ... I got to know the (new to me) interrupt-map part of d=
t :-)
> > .
> >=20
> > But on the S3C64XX you also have the benefit of all eints being in
> > dedictated eint registers. I'm still thinking on the best way to
> > integrate the eints that live directly in the main interrupt
> > controller.
> >=20
> > One option I could think of, would be to add an optional to_irq cal=
lback
> > to the bank definition and then do something like the following to
> > handle the special case:
> >=20
> > static int samsung_gpio_to_irq(struct gpio_chip *gc, unsigned offse=
t)
> > {
> >=20
> > 	struct samsung_pin_bank *bank =3D gc_to_pin_bank(gc);
> > 	unsigned int virq;
> > =09
> > 	if (bank->to_irq)
> > =09
> > 		return bank->to_irq(bank, offset);
> > =09
> > 	if (!bank->irq_domain)
> > =09
> > 		return -ENXIO;
> > =09
> > 	virq =3D irq_create_mapping(bank->irq_domain, offset);
> > =09
> > 	return (virq) ? : -ENXIO;
> >=20
> > }
> >=20
> > The GPG bank could simply use the existing mechanisms, as it follow=
s the
> > generic paradigm, and for GPF the callback would handle the distinc=
tion
> > between eints handled in the eint regs or in the main interrupt
> > controller.
>=20
> Right, I checked how EINTs work on S3C2440A in documentation and inde=
ed it
> is a bit different than I initially thought.
>=20
> However this is still similar to S3C64xx in some aspects. On S3C64xx =
there
> is following hierarchy of interrupts in EINT0 group:
>=20
> EINT0
> ...     -------> VIC0 INT0
> EINT3
>=20
> EINT4
> ...     -------> VIC0 INT1
> EINT11
>=20
> EINT12
> ...     -------> VIC1 INT0
> EINT19
>=20
> EINT20
> ...     -------> VIC1 INT1
> EINT27
>=20
> On S3C24xx it would look like this:
>=20
> EINT0  -------> INT0
>=20
> EINT1  -------> INT1
>=20
> EINT2  -------> INT2
>=20
> EINT3  -------> INT3
>=20
> EINT4
> ...    -------> INT4
> EINT7
>=20
> EINT8
> ...    -------> INT5
> EINT23
>=20
> So you can look at all EINTs as being multiplexed, just with some gro=
ups
> consisting only of single interrupt signal.
>=20
> The only thing that differs here is that, at least on S3C2440, there =
are
> no pending and mask bits for EINTs 0-3.

Yep, that's the standard handling for all s3c24xx except the s3c2412 wh=
ich=20
does the eint0 ---> eint0, eint1 ---> eint1 mapping and contains the ne=
cessary=20
bits in eintpend.


> Missing pending bits are not a
> problem here, since receiving INT0 would mean receiving EINT0, but no=
 mask
> bits means that masking would have to be handled on interrupt control=
ler
> level, probably by using enable_irq and disable_irq_nosync. This coul=
d be
> solved by assigning different irq chip to EINTs 0-3 and EINTs 4-7 in
> domain map callback.

This thought is really intriguing, as it would solve a lot of problems.=
=20


[from the second mail]:
> I forgot one more thing in my previous reply. Your solution would not
> allow GPIO bank-based specification of EINTs 0-3 in device tree.
>=20
> Consider following example:
>=20
> device-0 {
> 	...
> 	interrupt-parent =3D <&gpf>;
> 	interrupts =3D <2 0>;
> 	...
> };
>=20
> This would explicitly go through irq_create_mapping() without calling
> gpio_to_irq.
>=20
> Of course you could say that this kind of specification is not valid =
for
> EINTs0-3 and interrupt contoller has to be specified in interrupt-par=
ent
> specifier, not gpf bank. I guess it's just a matter of preference, th=
ough.

Yep, that was also one of my concerns, especially, as the handling of t=
he=20
extint settings would then also need to be done in both the pinctrl and=
=20
interrupt controller for the respective parts, not to speak of the acce=
ss to=20
the eint setting-registers needed from the interrupt controller code.

Also, I like the idea above (having everything in the pinctrl driver) a=
 lot=20
better, which would solve all this quite cleanly :-) .


Heiko
