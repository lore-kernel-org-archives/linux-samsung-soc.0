From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC 1/2] ARM: S3C24XX: add devicetree support for interrupts
Date: Tue, 27 Nov 2012 17:24:55 +0100
Message-ID: <201211271724.55938.heiko@sntech.de>
References: <201211250145.21226.heiko@sntech.de> <201211261704.09273.heiko@sntech.de> <CAJuYYwTre+cU0mgJExON2-+1fREyL3LgdqJ4NbC8zG+03yxptA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44660 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754512Ab2K0QZG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 11:25:06 -0500
In-Reply-To: <CAJuYYwTre+cU0mgJExON2-+1fREyL3LgdqJ4NbC8zG+03yxptA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Dienstag, 27. November 2012, 07:12:52 schrieb Thomas Abraham:
> On 26 November 2012 21:34, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Hi Thomas,
> >=20
> > Am Montag, 26. November 2012, 16:23:00 schrieb Thomas Abraham:
> >> On 26 November 2012 17:43, Heiko St=FCbner <heiko@sntech.de> wrote=
:
> >> > Hi Thomas,
> >> >=20
> >> > Am Montag, 26. November 2012, 12:03:22 schrieb Thomas Abraham:
> >> >> Hi Heiko,
> >> >>=20
> >> >> On 25 November 2012 06:17, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> >> >> > This adds devicetree parsing of the controller-data for the
> >> >> > interrupt controllers on S3C24XX architectures.
> >> >> >=20
> >> >> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> >> > ---
> >> >> >=20
> >> >> >  .../interrupt-controller/samsung,s3c24xx-irq.txt   |   57 ++=
++++
> >> >> >  arch/arm/mach-s3c24xx/common.h                     |    1 +
> >> >> >  arch/arm/plat-s3c24xx/irq.c                        |  197
> >> >> >  ++++++++++++++++++++ 3 files changed, 255 insertions(+), 0
> >> >> >  deletions(-) create mode 100644
> >> >> >  Documentation/devicetree/bindings/interrupt-controller/samsu=
ng,s3c
> >> >> >  24x x- irq.txt
> >> >> >=20
> >> >> > diff --git
> >> >> > a/Documentation/devicetree/bindings/interrupt-controller/sams=
ung,s3
> >> >> > c24 xx -irq.txt
> >> >> > b/Documentation/devicetree/bindings/interrupt-controller/sams=
ung,s3
> >> >> > c24 xx -irq.txt new file mode 100644
> >> >> > index 0000000..c637637
> >> >> > --- /dev/null
> >> >> > +++
> >> >> > b/Documentation/devicetree/bindings/interrupt-controller/sams=
ung,s3
> >> >> > c24 xx -irq.txt @@ -0,0 +1,57 @@
> >> >> > +Samsung S3C24XX Interrupt Controllers
> >> >> > +
> >> >> > +The S3C24XX SoCs contain custom set of interrupt controllers
> >> >> > providing a +varying number of interrupt sources.
> >> >> > +
> >> >> > +The set consists of a main- and a sub-controller as well as =
a
> >> >> > controller +for the external interrupts and on newer SoCs eve=
n a
> >> >> > second main controller. +
> >> >> > +The bit-to-interrupt and parent mapping of the controllers i=
s not
> >> >> > fixed +over all SoCs and therefore must be defined in the
> >> >> > controller description. +
> >> >> > +Required properties:
> >> >> > +- compatible: Compatible property value should be
> >> >> > "samsung,s3c24xx-irq". +
> >> >> > +- reg: Physical base address of the controller and length of
> >> >> > memory mapped +  region.
> >> >> > +
> >> >> > +- interrupt-controller : Identifies the node as an interrupt
> >> >> > controller +- #interrupt-cells : Specifies the number of cell=
s
> >> >> > needed to encode an +  interrupt source. The value shall be 2=
=2E
> >> >> > +
> >> >> > +- s3c24xx,irqlist : List of irqtypes found on this controlle=
r as
> >> >> > +  two-value pairs consisting of irqtype and parent-irq
> >> >> > +
> >> >> > +  parent-irq is always the list position of the irq in the i=
rqlist
> >> >> > +  of the parent controller (0..31)
> >> >> > +
> >> >> > +  irqtypes are:
> >> >> > +  - 0 .. none
> >> >> > +  - 1 .. external interrupts in the main register (GPF0 .. G=
PF3)
> >> >> > +  - 2 .. edge irq in the main register
> >> >> > +  - 3 .. for parent-irqs, that have sub-irqs in child contro=
llers
> >> >> > +  - 4 .. level irqs in the sub-register
> >> >> > +  - 5 .. edge irqs in the sub-register
> >> >> > +  - 6 .. external irqs in the external irq register (startin=
g with
> >> >> > GPF4) +  - 7 .. irq in the second base irq controller of
> >> >> > S3C2416/S3C2450 SoCs
> >> >>=20
> >> >> Instead of defining the type of interrupt controller as above, =
is it
> >> >> possible to create multiple device nodes, with each node repres=
enting
> >> >> a type of interrupt controller with a unique compatible string =
and
> >> >> corresponding properties. There will be a init function for eac=
h type
> >> >> of interrupt controller. There should be a irq-domain for each =
of
> >> >> these different types of interrupt controller. And then, in the
> >> >> device tree source file, a proper tree like hierarchy of interr=
upt
> >> >> controllers can defined (using the interrupt-parent property fo=
r each
> >> >> controller node). The client nodes that generate the interrupt =
can
> >> >> specify the parent node and the interrupt number within the par=
ent to
> >> >> which they generate the interrupt.
> >> >=20
> >> > I'm not sure I understand yet :-). The list describes the types =
of
> >> > interrupts inside the individual controllers.
> >> >=20
> >> > On all the s3c24xx we have three register sets denoting the main
> >> > (SRCPND, INTPND, INTMSK), sub (SUBSRCPEND, INTSUBMASK) and extin=
t
> >> > (EINTPEND, EINTMASK) controllers. The bits of these registers ar=
e
> >> > used for quite different irqs.
> >>=20
> >> We could consider main, sub and extint as three separate interrupt
> >> controllers and thus three different nodes in device tree. So the
> >> interrupt nodes could be something like (referring to 2416 manual)=
=2E
> >>=20
> >>      main@0x4a000000 {
> >>     =20
> >>             compatible =3D "samsung,s3c2410-main";
> >>             reg =3D <0x4a000000 0x100>;
> >>             interrupt-controller;
> >>             #interrupt-cells =3D <2>;
> >>     =20
> >>      };
> >>     =20
> >>      sub@0x4a001000 {
> >>     =20
> >>             compatible =3D "samsung,s3c2410-sub";
> >>             reg =3D <0x4a001000 0x100>;
> >>             interrupt-controller;
> >>             #interrupt-cells =3D <2>;
> >>             interrupt-parent =3D <&main>;
> >>             interrupts =3D <28 0>, <23 0>, <.....  /*uart0/uart1/.=
=2E*/
> >>     =20
> >>      };
> >>     =20
> >>      eint@0x4a002000 {
> >>     =20
> >>             compatible =3D "samsung,s3c2410-eint";
> >>             reg =3D <0x4a002000 0x100>;
> >>             interrupt-controller;
> >>             #interrupt-cells =3D <2>;
> >>             interrupt-parent =3D <&main>;
> >>             interrupts =3D <0 0>, <1 0>,
> >>            =20
> >>                               <2 0>, <3 0>,
> >>                               <4 0>, <5 0>;
> >>     =20
> >>      };
> >>=20
> >> There should be a corresponding irqchip driver code to handle each=
 of
> >> these types of controllers. They should have their own irq-domain
> >> supported.
> >>=20
> >> Then the client nodes can specify the interrupt parent and interru=
pt
> >> number. For example, the uart node would be
> >>=20
> >>        uart@50000000 {
> >>       =20
> >>             compatible =3D "samsung,s3c2410-uart";
> >>             reg =3D <0x50000000 0x100>;
> >>             interrupt-parent =3D <&sub>;
> >>             interrupts =3D <0 0>, <1 0>, <2 0>; /*tx/rx/err*/
> >>       =20
> >>        };
> >> >=20
> >> > For example is bit 17 of the main register set used as DMA0 on e=
arlier
> >> > socs while the dma interrupts moved to the subint registers for
> >> > s3c2443 and later.
> >>=20
> >> Writing the nodes with the correct interrupt parent and the interr=
upt
> >> number should take care of this.
> >>=20
> >> > So the entries in the irqlist describe the needed handlers for t=
he
> >> > hwirq bits of the indidual controllers. So in this scheme you se=
t for
> >> > dt-devices the interrupt parent to the correct register set and =
the
> >> > interrupts field then matches the bit of the register, according=
 to
> >> > the datasheet.
> >> >=20
> >> > When I changed the basic interrupt handling in the previous set,=
 the
> >> > changed irq.c can for exmaple be found on [0], I created these l=
ists
> >> > in the code and soc specific routines to init them for the still
> >> > valid non-dt case.
> >> >=20
> >> > But as dt is about describing the hardware, I found the current
> >> > solution nice, because will I only need exactly one dt-init-func=
tion
> >> > for all s3c24xx-socs, instead of representing all the slight
> >> > variances in code.
> >> >=20
> >> > I'm definitly not sure if all the different types of individual =
irq
> >> > handlers are strictly necessary yet, but they represent all the
> >> > variants that were in use in the original code.
> >>=20
> >> I have brought up this point just for discussion. You could choose=
 the
> >> implementation that you prefer. I understand that implementing wit=
h
> >> different interrupt controller nodes might require lot of code
> >> changes.
> >=20
> > first of all, thanks for the feedback. Working on this is like movi=
ng in
> > a fog where I don't really see where I'm going - so I don't claim t=
o be
> > right.
> >=20
> >=20
> >=20
> > But somehow I have the feeling we're talking about similar things h=
ere
> > :-)
> >=20
> > If you look in the second patch, you'll see that there are already =
the
> > three (or 4 in the case of the s3c2416) interrupt controllers defin=
ed
> > [intc, subintc, extintc]. But as they contain the data of their
> > individual interrupts inside the devicetree definitions, they don't=
 need
> > individual init functions but only one which constructs the interru=
pt
> > data out of the list provided.
> >=20
> > The real list for a platform in the second patch might also help in
> > showing why this list was necessary.
>=20
> Ok, I had not looked at the second patch carefully enough. There are
> four interrupt controller nodes but I am still not sure if the
> bindings for those nodes are correct. The question here is, did we
> design the binding to suit a specific linux implementation of the
> interrupt controller. Ideally, the bindings should just be enough to
> explain the interconnection between the interrupt controller and the
> client devices. And should be OS agnostic as much as possible. The
> seven irqtypes in the binding definition seems to suggest that we are
> encoding a software defined abstraction into the binding, which does
> not seem right.


Because of the mails from yesterday I took another look at my code, aft=
er=20
letting it sit for the previous days and I found more optimization=20
possiblities.

It should be possible to trim the irqtypes down to level,edge and eint =
types=20
and do the gathering of the other informations in the code. This would =
make=20
the list more os-agnostic.
The list itself does describe the interconnections between the controll=
ers, so=20
I think it's not false per se, just the multitude of probably redundant=
 types=20
used should probably go down.


The other option could be to really change to individual initializers f=
or the=20
different implementations and have all the data in the code instead of =
the dt.=20
=46or this I've compared all the different implementations and it seems=
 this=20
would lead to at least handlers for s3c2410, s3c2440, s3c2442, s3c2412 =
and=20
s3c2443. For the time being they will be in the code in any case, becau=
se of=20
all the non-dt boards=20

If anyone is interested, the comparison can be found on [0].


Btw. do you know if it would have bad effects to register (but not use)=
 for=20
example the cam interrupt-handler on a machine that does not have it. (=
The=20
additional cam, cf and spi1 interrupts are the only things differing be=
tween=20
the s3c2443 and s3c2416 SoCs).


> > The basic problem is, that each individual interrupt inside one of =
the
> > controllers might need a different handler and access a specific pa=
rent
> > interrupt. For example the uart0-rx,tx,err interrupts in the subint=
c must
> > ack/mask the uart0 interrupt in the main intc; similar for a lot of=
 other
> > interrupts. And the s3c24xx,irqlist provides this mapping to handle=
r and
> > parent, so it does not need to be codified.
>=20
> I believe the three node example that I listed above should be able t=
o
> handle this, but yes, it might require additional code to support it.
> For example, the uart device node has listed three interrupts. The
> uart controller drivers can register three separate interrupt handler=
s
> for these interrupts. As far as the interrupt handling for 'main'
> controller, I see that this is very similar to the way interrupt
> combiner module has been coded for exynos soc's. So the combiner
> interrupt controller code in mach-exynos/common.c file can be used a
> reference on how this can be handled.

I'v seen the combiner code as well, but from the code itself I've not m=
anaged=20
to understand the combiner this well yet. And Exynos datasheets, to get=
 a=20
textual description of the combiner, are not this easy to come by ;-) .


> > And of course the second problem this approach should solve is, tha=
t the
> > interrupts in the controllers differ and also move between most of =
the
> > s3c24xx sub-architectures.
>=20
> Yes, I understand how difficult it can get while writing a generalize=
d
> code for all soc's in s3c24xx family.

again, thanks for taking the time to read and answer all these mails :-=
)


Thanks
Heiko


[0]=20
https://docs.google.com/spreadsheet/pub?key=3D0Am5FJAmTa7wydENkdkwwRVA5=
eEVTb09fb0RtcGhnTlE&output=3Dhtml
