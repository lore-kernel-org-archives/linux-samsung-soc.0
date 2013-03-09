From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: s3c24xx pinctrl help
Date: Sat, 9 Mar 2013 13:56:25 +0100
Message-ID: <201303091356.25912.heiko@sntech.de>
References: <201303081538.04877.heiko@sntech.de> <2034100.l6yoVjE7uo@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38374 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755853Ab3CIM4c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 07:56:32 -0500
In-Reply-To: <2034100.l6yoVjE7uo@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org

Am Freitag, 8. M=E4rz 2013, 19:57:09 schrieb Tomasz Figa:
> Hi Heiko,
>=20
> On Friday 08 of March 2013 15:38:04 Heiko St=FCbner wrote:
> > Hi Thomas,
> >=20
> > taking you up on your offer of helping, I would be cool if you coul=
d
> > simply give me a push in the right direction :-) .
> >=20
> >=20
> > From what I've seen so far, the bank handling itself is very simila=
r
> > between exynos and s3c24xx as the underlying structures already han=
dle
> > multiple widths of the register contents. More interesting is the e=
int
> > handling around which I couldn't wrap my head yet.
> >=20
> > The basic structure is again similar with special eint registers, b=
ut
> > adds some quirks. EINT banks are gpf (8 eints) and gpg (8 or 16 ein=
ts
> > depending on the SoC).
> >=20
> > The current way on Exynos seems to be to mark the offset in the ein=
t
> > register and attach an irq_domain to the bank, which gets mapped to=
 the
> > eints starting at the offset. The eints seem to have a parent inter=
rupt
> > that is provided via the dt.
> >=20
> > On the S3C24xx the gpg bank is doing this similar but gpf is very
> > strange.
> >=20
> > The first half of the bank (gpf0 to gpf3) is not handled in eintpen=
d
> > registers but in the main interrupt controller (bits 0 to 3), while=
 the
> > second half of gpf is handled in eintpend. The new interrupt
> > declaration might show this better, which can be found at [0].
> >=20
> > An exception is the s3c2412 which adds still another quirk where ea=
ch
> > interrupt of gpf0 to gpf3 is represented in both the normal intc an=
d
> > eint registers, again for reference probably easier to see in [1].
> >=20
> >=20
> > So I'm still quite stumped on how this could fit into the current
> > framework and would be really glad for some small pointers :-)
>=20
> I wonder if some of my patches for pinctrl on S3C64xx might be helpfu=
l:
>=20
> https://github.com/tom3q/linux/commits/v3.8-s3c64xx-dt-pinctrl

Partially ... I got to know the (new to me) interrupt-map part of dt :-=
) .

But on the S3C64XX you also have the benefit of all eints being in dedi=
ctated=20
eint registers. I'm still thinking on the best way to integrate the ein=
ts that=20
live directly in the main interrupt controller.

One option I could think of, would be to add an optional to_irq callbac=
k to=20
the bank definition and then do something like the following to handle =
the=20
special case:

static int samsung_gpio_to_irq(struct gpio_chip *gc, unsigned offset)  =
                                                                       =
                         =20
{                                                                      =
                                                                       =
                         =20
	struct samsung_pin_bank *bank =3D gc_to_pin_bank(gc);                 =
                                                                       =
                    =20
	unsigned int virq;                                                    =
                                                                       =
                  =20

	if (bank->to_irq)
		return bank->to_irq(bank, offset);
                                                                       =
                                                                       =
                         =20
	if (!bank->irq_domain)                                                =
                                                                       =
                  =20
		return -ENXIO;                                                       =
                                                                       =
           =20
                                                                       =
                                                                       =
                         =20
	virq =3D irq_create_mapping(bank->irq_domain, offset);                =
                                                                       =
                    =20
                                                                       =
                                                                       =
                         =20
	return (virq) ? : -ENXIO;                                             =
                                                                       =
                  =20
}                                                                      =
                                                                       =
                         =20

The GPG bank could simply use the existing mechanisms, as it follows th=
e=20
generic paradigm, and for GPF the callback would handle the distinction=
=20
between eints handled in the eint regs or in the main interrupt control=
ler.


And as always, talking about stuff like this helps in hashing out ideas=
 ... my=20
thinking is now a bit clearer than yesterday ;-)


Thanks
Heiko
