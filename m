From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC 1/2] ARM: S3C24XX: add devicetree support for interrupts
Date: Mon, 26 Nov 2012 17:04:08 +0100
Message-ID: <201211261704.09273.heiko@sntech.de>
References: <201211250145.21226.heiko@sntech.de> <201211261313.28307.heiko@sntech.de> <CAJuYYwSi=5rbARhmrL5J-58LwraERHRmLs9B9X+110ZGBb9iBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:34341 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754027Ab2KZQES (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 11:04:18 -0500
In-Reply-To: <CAJuYYwSi=5rbARhmrL5J-58LwraERHRmLs9B9X+110ZGBb9iBA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Thomas,

Am Montag, 26. November 2012, 16:23:00 schrieb Thomas Abraham:
> On 26 November 2012 17:43, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Hi Thomas,
> >=20
> > Am Montag, 26. November 2012, 12:03:22 schrieb Thomas Abraham:
> >> Hi Heiko,
> >>=20
> >> On 25 November 2012 06:17, Heiko St=FCbner <heiko@sntech.de> wrote=
:
> >> > This adds devicetree parsing of the controller-data for the
> >> > interrupt controllers on S3C24XX architectures.
> >> >=20
> >> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> > ---
> >> >=20
> >> >  .../interrupt-controller/samsung,s3c24xx-irq.txt   |   57 +++++=
+
> >> >  arch/arm/mach-s3c24xx/common.h                     |    1 +
> >> >  arch/arm/plat-s3c24xx/irq.c                        |  197
> >> >  ++++++++++++++++++++ 3 files changed, 255 insertions(+), 0
> >> >  deletions(-) create mode 100644
> >> >  Documentation/devicetree/bindings/interrupt-controller/samsung,=
s3c24x
> >> >  x- irq.txt
> >> >=20
> >> > diff --git
> >> > a/Documentation/devicetree/bindings/interrupt-controller/samsung=
,s3c24
> >> > xx -irq.txt
> >> > b/Documentation/devicetree/bindings/interrupt-controller/samsung=
,s3c24
> >> > xx -irq.txt new file mode 100644
> >> > index 0000000..c637637
> >> > --- /dev/null
> >> > +++
> >> > b/Documentation/devicetree/bindings/interrupt-controller/samsung=
,s3c24
> >> > xx -irq.txt @@ -0,0 +1,57 @@
> >> > +Samsung S3C24XX Interrupt Controllers
> >> > +
> >> > +The S3C24XX SoCs contain custom set of interrupt controllers
> >> > providing a +varying number of interrupt sources.
> >> > +
> >> > +The set consists of a main- and a sub-controller as well as a
> >> > controller +for the external interrupts and on newer SoCs even a
> >> > second main controller. +
> >> > +The bit-to-interrupt and parent mapping of the controllers is n=
ot
> >> > fixed +over all SoCs and therefore must be defined in the contro=
ller
> >> > description. +
> >> > +Required properties:
> >> > +- compatible: Compatible property value should be
> >> > "samsung,s3c24xx-irq". +
> >> > +- reg: Physical base address of the controller and length of me=
mory
> >> > mapped +  region.
> >> > +
> >> > +- interrupt-controller : Identifies the node as an interrupt
> >> > controller +- #interrupt-cells : Specifies the number of cells n=
eeded
> >> > to encode an +  interrupt source. The value shall be 2.
> >> > +
> >> > +- s3c24xx,irqlist : List of irqtypes found on this controller a=
s
> >> > +  two-value pairs consisting of irqtype and parent-irq
> >> > +
> >> > +  parent-irq is always the list position of the irq in the irql=
ist
> >> > +  of the parent controller (0..31)
> >> > +
> >> > +  irqtypes are:
> >> > +  - 0 .. none
> >> > +  - 1 .. external interrupts in the main register (GPF0 .. GPF3=
)
> >> > +  - 2 .. edge irq in the main register
> >> > +  - 3 .. for parent-irqs, that have sub-irqs in child controlle=
rs
> >> > +  - 4 .. level irqs in the sub-register
> >> > +  - 5 .. edge irqs in the sub-register
> >> > +  - 6 .. external irqs in the external irq register (starting w=
ith
> >> > GPF4) +  - 7 .. irq in the second base irq controller of
> >> > S3C2416/S3C2450 SoCs
> >>=20
> >> Instead of defining the type of interrupt controller as above, is =
it
> >> possible to create multiple device nodes, with each node represent=
ing
> >> a type of interrupt controller with a unique compatible string and
> >> corresponding properties. There will be a init function for each t=
ype
> >> of interrupt controller. There should be a irq-domain for each of
> >> these different types of interrupt controller. And then, in the de=
vice
> >> tree source file, a proper tree like hierarchy of interrupt
> >> controllers can defined (using the interrupt-parent property for e=
ach
> >> controller node). The client nodes that generate the interrupt can
> >> specify the parent node and the interrupt number within the parent=
 to
> >> which they generate the interrupt.
> >=20
> > I'm not sure I understand yet :-). The list describes the types of
> > interrupts inside the individual controllers.
> >=20
> > On all the s3c24xx we have three register sets denoting the main (S=
RCPND,
> > INTPND, INTMSK), sub (SUBSRCPEND, INTSUBMASK) and extint (EINTPEND,
> > EINTMASK) controllers. The bits of these registers are used for qui=
te
> > different irqs.
>=20
> We could consider main, sub and extint as three separate interrupt
> controllers and thus three different nodes in device tree. So the
> interrupt nodes could be something like (referring to 2416 manual).
>=20
>      main@0x4a000000 {
>             compatible =3D "samsung,s3c2410-main";
>             reg =3D <0x4a000000 0x100>;
>             interrupt-controller;
>             #interrupt-cells =3D <2>;
>      };
>=20
>      sub@0x4a001000 {
>             compatible =3D "samsung,s3c2410-sub";
>             reg =3D <0x4a001000 0x100>;
>             interrupt-controller;
>             #interrupt-cells =3D <2>;
>             interrupt-parent =3D <&main>;
>             interrupts =3D <28 0>, <23 0>, <.....  /*uart0/uart1/..*/
>      };
>=20
>      eint@0x4a002000 {
>             compatible =3D "samsung,s3c2410-eint";
>             reg =3D <0x4a002000 0x100>;
>             interrupt-controller;
>             #interrupt-cells =3D <2>;
>             interrupt-parent =3D <&main>;
>             interrupts =3D <0 0>, <1 0>,
>                               <2 0>, <3 0>,
>                               <4 0>, <5 0>;
>      };
>=20
> There should be a corresponding irqchip driver code to handle each of
> these types of controllers. They should have their own irq-domain
> supported.
>=20
> Then the client nodes can specify the interrupt parent and interrupt
> number. For example, the uart node would be
>=20
>        uart@50000000 {
>             compatible =3D "samsung,s3c2410-uart";
>             reg =3D <0x50000000 0x100>;
>             interrupt-parent =3D <&sub>;
>             interrupts =3D <0 0>, <1 0>, <2 0>; /*tx/rx/err*/
>        };
>=20
> > For example is bit 17 of the main register set used as DMA0 on earl=
ier
> > socs while the dma interrupts moved to the subint registers for s3c=
2443
> > and later.
>=20
> Writing the nodes with the correct interrupt parent and the interrupt
> number should take care of this.
>=20
> > So the entries in the irqlist describe the needed handlers for the =
hwirq
> > bits of the indidual controllers. So in this scheme you set for
> > dt-devices the interrupt parent to the correct register set and the
> > interrupts field then matches the bit of the register, according to=
 the
> > datasheet.
> >=20
> > When I changed the basic interrupt handling in the previous set, th=
e
> > changed irq.c can for exmaple be found on [0], I created these list=
s in
> > the code and soc specific routines to init them for the still valid
> > non-dt case.
> >=20
> > But as dt is about describing the hardware, I found the current sol=
ution
> > nice, because will I only need exactly one dt-init-function for all
> > s3c24xx-socs, instead of representing all the slight variances in c=
ode.
> >=20
> > I'm definitly not sure if all the different types of individual irq
> > handlers are strictly necessary yet, but they represent all the var=
iants
> > that were in use in the original code.
>=20
> I have brought up this point just for discussion. You could choose th=
e
> implementation that you prefer. I understand that implementing with
> different interrupt controller nodes might require lot of code
> changes.

first of all, thanks for the feedback. Working on this is like moving i=
n a fog=20
where I don't really see where I'm going - so I don't claim to be right=
=2E


But somehow I have the feeling we're talking about similar things here =
:-)

If you look in the second patch, you'll see that there are already the =
three=20
(or 4 in the case of the s3c2416) interrupt controllers defined [intc,=20
subintc, extintc]. But as they contain the data of their individual int=
errupts=20
inside the devicetree definitions, they don't need individual init func=
tions=20
but only one which constructs the interrupt data out of the list provid=
ed.

The real list for a platform in the second patch might also help in sho=
wing=20
why this list was necessary.

The basic problem is, that each individual interrupt inside one of the=20
controllers might need a different handler and access a specific parent=
=20
interrupt. For example the uart0-rx,tx,err interrupts in the subintc mu=
st=20
ack/mask the uart0 interrupt in the main intc; similar for a lot of oth=
er=20
interrupts. And the s3c24xx,irqlist provides this mapping to handler an=
d=20
parent, so it does not need to be codified.

And of course the second problem this approach should solve is, that th=
e=20
interrupts in the controllers differ and also move between most of the =
s3c24xx=20
sub-architectures.


Thanks
Heiko
