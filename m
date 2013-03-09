From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: s3c24xx pinctrl help
Date: Sat, 09 Mar 2013 14:44:29 +0100
Message-ID: <46997515.mkKLqFWbgE@flatron>
References: <201303081538.04877.heiko@sntech.de> <2034100.l6yoVjE7uo@flatron> <201303091356.25912.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:34180 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590Ab3CINob convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 08:44:31 -0500
Received: by mail-wi0-f180.google.com with SMTP id hi8so206316wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Mar 2013 05:44:30 -0800 (PST)
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

I forgot one more thing in my previous reply. Your solution would not=20
allow GPIO bank-based specification of EINTs 0-3 in device tree.

Consider following example:

device-0 {
	...
	interrupt-parent =3D <&gpf>;
	interrupts =3D <2 0>;
	...
};

This would explicitly go through irq_create_mapping() without calling=20
gpio_to_irq.

Of course you could say that this kind of specification is not valid fo=
r=20
EINTs0-3 and interrupt contoller has to be specified in interrupt-paren=
t=20
specifier, not gpf bank. I guess it's just a matter of preference, thou=
gh.

Best regards,
Tomasz
