From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 6/6] irqchip: s3c24xx: add s3c2450 interrupt definitions
Date: Tue, 19 Mar 2013 19:38:28 +0100
Message-ID: <201303191938.29099.heiko@sntech.de>
References: <201303171404.06146.heiko@sntech.de> <201303190034.49875.heiko@sntech.de> <5147CD6B.80107@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38856 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751447Ab3CSSif (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 14:38:35 -0400
In-Reply-To: <5147CD6B.80107@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>

Am Dienstag, 19. M=E4rz 2013, 03:28:59 schrieb Rob Herring:
> On 03/18/2013 06:34 PM, Heiko St=FCbner wrote:
> > Am Montag, 18. M=E4rz 2013, 23:14:52 schrieb Rob Herring:
> >> On 03/18/2013 11:53 AM, Heiko St=FCbner wrote:

[...]

> >> My first thought here is this information should not be centralize=
d in
> >> the controller node, but placed with each source node (2D, I2C1, e=
tc).
> >=20
> > I'm not sure I can follow currently :-)
> >=20
> > I'll try an example:
> >=20
> > The s3c serial driver expects the interrupts for uart tx and rx and=
 the
> > dt
> >=20
> > entry would look like:
> > 	serial@50000000 {
> > =09
> > 		compatible =3D "samsung,s3c2410-uart";
> > 		reg =3D <0x50000000 0x4000>;
> > 		interrupt-parent =3D <&subintc>;
> > 		interrupts =3D <0>, <1>;
>=20
> So what does 0 and 1 correspond to? These are the bits in the subintc=
?

Yep, the bits in the subintc register.


> > 	};
> >=20
> > the map for these in the subintc looks like
> >=20
> >                s3c24xx,irqlist =3D <3 28 /* UART0-RX */
> >               =20
> >                                   3 28 /* UART0-TX */
> >                                   3 28 /* UART0-ERR */
> >=20
> > marking them as using the level-handler and being children of the
> > interrupt in bit 28 of the intc handler.
> >=20
> > So the irq_entry would check the intc, see the waiting interrupt in=
 bit
> > 28, jump to the demux function which would then handle which ever o=
f
> > rx,tx or err would be waiting, which then get sent to the serial dr=
iver.
> >=20
> > These mappings between sub- and parent irqs also vary very much bet=
ween
> > the different s3c24xx variants, as can be seen by the multitude of =
lists
> > in [0] and the parent interrupts are only used for demuxing purpose=
s.
> >=20
> > -----
> > A notable speciality are the AC97 (sound) and watchdog interrupts (=
bits
> > 27 and 28 of the subregister), as they share a common parent interr=
upt
> > (bit 9 of the main interrupt register).
> >=20
> > So irq_entry checks the main register, sees bit 9 (ac97/watchdog),
> > demuxes it to either coming from the ac97 or watchdog and sends it =
to
> > the relevant driver.
> >=20
> > I don't think this should be exposed to the drivers at all :-) .
> > -------
> >=20
> > So I'm not sure, how this would be able to go in the driver nodes.
>=20
> The information in an interrupts property is transparent to the drive=
r,
> but can contain extra cells with whatever information you need. The G=
IC
> binding has SPI or PPI interrupt type information for example.

so you mean something like <bit flags parent-bit>, right?


> > The only thing I could think of, would be to make the handler adjus=
table
> > via the regular interrupts properties (i.e. as two_cell) which woul=
d
> > bring the list down to only list the parent relationships.
> >=20
> > Hmm ... and this parent list might be doable via the regular interr=
upts
> > property, so the subintc would look like:
> >=20
> > subintc: subintc =3D {
> >=20
> > 	interrupt-parent =3D <&intc>;
> > 	interrupts =3D <28 0>, <28 0>, <28 0>, <23 0>, <23 0>, .....
> > 	/*		     bit0    bit1    bit2    bit3    bit4   ..... */
> >=20
> > }
> >=20
> > i.e. naming the parent interrupt for each of the interrupt bits of =
the
> > sub- controller. Would this be the right direction?
>=20
> I think you may want to use an interrupt-map property. That should al=
low
> you to do arbitrary mappings from one interrupt controller's numberin=
g
> to another's numbering. The VExpress and several PPC platforms have
> examples.

Yep, I've read the examples and also a bit more in-depth on devicetree.=
org and=20
it seems, as you suggested, interrupt-maps are the right concept to des=
cribe=20
such mappings.


In general, what would be the preferred way to solve this?
Like described above, having the parent bit encoded in the interrupt pr=
operty=20
or doing it with a mapping of sorts like we discussed down here?

I don't have a preference for one or the other right now and both look =
like=20
interesting concepts.


Thanks
Heiko
