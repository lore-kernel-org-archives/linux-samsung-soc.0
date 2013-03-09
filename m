From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: s3c24xx pinctrl help
Date: Sat, 09 Mar 2013 14:31:53 +0100
Message-ID: <1825121.bbMz1G1oeT@flatron>
References: <201303081538.04877.heiko@sntech.de> <2034100.l6yoVjE7uo@flatron> <201303091356.25912.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:43989 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590Ab3CINb4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 08:31:56 -0500
Received: by mail-wg0-f42.google.com with SMTP id 12so636306wgh.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Mar 2013 05:31:55 -0800 (PST)
In-Reply-To: <201303091356.25912.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org

On Saturday 09 of March 2013 13:56:25 Heiko St=FCbner wrote:
> Am Freitag, 8. M=E4rz 2013, 19:57:09 schrieb Tomasz Figa:
> > Hi Heiko,
> >=20
> > On Friday 08 of March 2013 15:38:04 Heiko St=FCbner wrote:
> > > Hi Thomas,
> > >=20
> > > taking you up on your offer of helping, I would be cool if you co=
uld
> > > simply give me a push in the right direction :-) .
> > >=20
> > >=20
> > > From what I've seen so far, the bank handling itself is very simi=
lar
> > > between exynos and s3c24xx as the underlying structures already
> > > handle
> > > multiple widths of the register contents. More interesting is the
> > > eint
> > > handling around which I couldn't wrap my head yet.
> > >=20
> > > The basic structure is again similar with special eint registers,
> > > but
> > > adds some quirks. EINT banks are gpf (8 eints) and gpg (8 or 16
> > > eints
> > > depending on the SoC).
> > >=20
> > > The current way on Exynos seems to be to mark the offset in the e=
int
> > > register and attach an irq_domain to the bank, which gets mapped =
to
> > > the
> > > eints starting at the offset. The eints seem to have a parent
> > > interrupt
> > > that is provided via the dt.
> > >=20
> > > On the S3C24xx the gpg bank is doing this similar but gpf is very
> > > strange.
> > >=20
> > > The first half of the bank (gpf0 to gpf3) is not handled in eintp=
end
> > > registers but in the main interrupt controller (bits 0 to 3), whi=
le
> > > the
> > > second half of gpf is handled in eintpend. The new interrupt
> > > declaration might show this better, which can be found at [0].
> > >=20
> > > An exception is the s3c2412 which adds still another quirk where
> > > each
> > > interrupt of gpf0 to gpf3 is represented in both the normal intc =
and
> > > eint registers, again for reference probably easier to see in [1]=
=2E
> > >=20
> > >=20
> > > So I'm still quite stumped on how this could fit into the current
> > > framework and would be really glad for some small pointers :-)
> >=20
> > I wonder if some of my patches for pinctrl on S3C64xx might be
> > helpful:
> >=20
> > https://github.com/tom3q/linux/commits/v3.8-s3c64xx-dt-pinctrl
>=20
> Partially ... I got to know the (new to me) interrupt-map part of dt =
:-)
> .
>=20
> But on the S3C64XX you also have the benefit of all eints being in
> dedictated eint registers. I'm still thinking on the best way to
> integrate the eints that live directly in the main interrupt
> controller.
>=20
> One option I could think of, would be to add an optional to_irq callb=
ack
> to the bank definition and then do something like the following to
> handle the special case:
>=20
> static int samsung_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> {
> 	struct samsung_pin_bank *bank =3D gc_to_pin_bank(gc);
> 	unsigned int virq;
>=20
> 	if (bank->to_irq)
> 		return bank->to_irq(bank, offset);
>=20
> 	if (!bank->irq_domain)
> 		return -ENXIO;
>=20
> 	virq =3D irq_create_mapping(bank->irq_domain, offset);
>=20
> 	return (virq) ? : -ENXIO;
> }
>=20
> The GPG bank could simply use the existing mechanisms, as it follows =
the
> generic paradigm, and for GPF the callback would handle the distincti=
on
> between eints handled in the eint regs or in the main interrupt
> controller.

Right, I checked how EINTs work on S3C2440A in documentation and indeed=
 it=20
is a bit different than I initially thought.

However this is still similar to S3C64xx in some aspects. On S3C64xx th=
ere=20
is following hierarchy of interrupts in EINT0 group:

EINT0=20
=2E..     -------> VIC0 INT0
EINT3=20

EINT4
=2E..     -------> VIC0 INT1
EINT11

EINT12
=2E..     -------> VIC1 INT0
EINT19

EINT20
=2E..     -------> VIC1 INT1
EINT27

On S3C24xx it would look like this:

EINT0  -------> INT0

EINT1  -------> INT1

EINT2  -------> INT2

EINT3  -------> INT3

EINT4
=2E..    -------> INT4
EINT7

EINT8
=2E..    -------> INT5
EINT23

So you can look at all EINTs as being multiplexed, just with some group=
s=20
consisting only of single interrupt signal.

The only thing that differs here is that, at least on S3C2440, there ar=
e=20
no pending and mask bits for EINTs 0-3. Missing pending bits are not a=20
problem here, since receiving INT0 would mean receiving EINT0, but no m=
ask=20
bits means that masking would have to be handled on interrupt controlle=
r=20
level, probably by using enable_irq and disable_irq_nosync. This could =
be=20
solved by assigning different irq chip to EINTs 0-3 and EINTs 4-7 in=20
domain map callback.

Still, irq domain isn't really related with such low level things. As l=
ong=20
as you have a way to map domain hwirq to appropriate bitfields in contr=
ol=20
registers and received interrupts to proper domain and its hwirq, you c=
an=20
do whatever mapping you want.

Best regards,
Tomasz

P.S. Sorry for previous message, clicked Send accidentally...
