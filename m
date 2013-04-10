From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] pinctrl: Add pinctrl-s3c24xx driver
Date: Wed, 10 Apr 2013 22:42:52 +0200
Message-ID: <201304102242.52958.heiko@sntech.de>
References: <201304100135.12471.heiko@sntech.de> <201304102211.03870.heiko@sntech.de> <1454321.I0NHk7e3H9@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:48767 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754605Ab3DJUm6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 16:42:58 -0400
In-Reply-To: <1454321.I0NHk7e3H9@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

Am Mittwoch, 10. April 2013, 22:17:43 schrieb Tomasz Figa:
> On Wednesday 10 of April 2013 22:11:03 Heiko St=FCbner wrote:
> > Am Mittwoch, 10. April 2013, 21:51:11 schrieb Tomasz Figa:
> > > On Wednesday 10 of April 2013 15:45:48 Heiko St=FCbner wrote:
> > > > Am Mittwoch, 10. April 2013, 14:31:29 schrieb Tomasz Figa:
> > > > > On Wednesday 10 of April 2013 14:20:22 Heiko St=FCbner wrote:
> > > > > > Hi Tomasz,
> > > > > >=20
> > > > > > thanks for your comments, more inline.
> > > > > >=20
> > > > > > Am Mittwoch, 10. April 2013, 12:36:39 schrieb Tomasz Figa:
> > > > > > > Hi Heiko,
> > > > > > >=20
> > > > > > > Basically looks good to me, but please see my inline comm=
ents
> > > > > > > about
> > > > > > > handling of EINT0-3.
> > > > > > >=20
> > > > > > > On Wednesday 10 of April 2013 01:35:12 Heiko St=FCbner wr=
ote:
> > > > > > > > The s3c24xx pins follow a similar pattern as the other
> > > > > > > > Samsung
> > > > > > > > SoCs
> > > > > > > > and
> > > > > > > > can therefore reuse the already introduced infrastructu=
re.
> > > > > >=20
> > > > > > [...]
> > > > > >=20
> > > > > > > > +struct s3c24xx_eint_data {
> > > > > > > > +	struct samsung_pinctrl_drv_data *drvdata;
> > > > > > > > +	struct irq_domain *domains[NUM_EINT];
> > > > > > > > +	int parents[NUM_EINT_IRQ];
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct s3c24xx_eint_domain_data {
> > > > > > > > +	struct samsung_pin_bank *bank;
> > > > > > > > +	struct s3c24xx_eint_data *eint_data;
> > > > > > >=20
> > > > > > > What about:
> > > > > > >=20
> > > > > > > +	bool eint0_3_parent_only;
> > > > > > >=20
> > > > > > > (or whatever name would be more appropriate), which would
> > > > > > > store
> > > > > > > the
> > > > > > > information about the s3c24xx-specific quirk in 24xx-spec=
ific
> > > > > > > data
> > > > > > > structure, without the need to add another field to the
> > > > > > > generic
> > > > > > > samsung_pinctrl_drv_data structure?
> > > > > > >=20
> > > > > > > See my further comments on how I would see using this fie=
ld in
> > > > > > > interrupt handling code.
> > > > > >=20
> > > > > > ok, sounds good, especially gathering the type from the
> > > > > > wakeup-int
> > > > > > property
> > > > > >=20
> > > > > > > > +};
> > > > > >=20
> > > > > > [...]
> > > > > >=20
> > > > > > > Now I would split the following 3 functions into two sets=
 of 3
> > > > > > > functions, one set for s3c2412 and other for remaining So=
Cs
> > > > > > > and
> > > > > > > make
> > > > > > > separate EINT0-3 IRQ chips for both cases.
> > > > > >=20
> > > > > > Not doing the decision every time, might bring some very sl=
ight
> > > > > > speed
> > > > > > improvements, so is probably the right way to go.
> > > > > >=20
> > > > > > > > +
> > > > > > > > +static void s3c24xx_eint0_3_ack(struct irq_data *data)
> > > > > > > > +{
> > > > > > > > +	struct samsung_pin_bank *bank =3D
> > > > > > > > irq_data_get_irq_chip_data(data);
> > > > > > > > +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> > > > > > > > +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_=
domain-
> > > > > > > >
> > > > > > > >host_data;
> > > > > > > >
> > > > > > > > +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_d=
ata;
> > > > > > > > +	int parent_irq =3D eint_data->parents[data->hwirq];
> > > > > > > > +	struct irq_chip *parent_chip =3D irq_get_chip(parent_=
irq);
> > > > > > > > +
> > > > > > > > +	if (d->ctrl->type =3D=3D S3C2412) {
> > > > > > > > +		unsigned long bitval =3D 1UL << data->hwirq;
> > > > > > > > +		writel(bitval, d->virt_base + EINTPEND_REG);
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	if (parent_chip->irq_ack)
> > > > > > > > +		parent_chip-
> > > >
> > > >irq_ack(irq_get_irq_data(parent_irq));
> > > >
> > > > > > > Btw. Is this parent level acking really needed here?
> > > > > >=20
> > > > > > Depends. If using chained_irq_* of course not, but if the
> > > > > > irq-handler
> > > > > > should stay in charge of when to ack it might be better thi=
s
> > > > > > way.
> > > > > >=20
> > > > > > Generic s3c24xx SoCs need acking in the main controller onl=
y,
> > > > > > while
> > > > > > s3c2412 needs acking in both the main controller and eintpe=
nd.
> > > > > >=20
> > > > > > > > +}
> > > > > >=20
> > > > > > [...]
> > > > > >=20
> > > > > > > > +static void s3c24xx_demux_eint0_3(unsigned int irq, st=
ruct
> > > > > > > > irq_desc
> > > > > > > > *desc) +{
> > > > > > > > +	struct irq_data *data =3D irq_desc_get_irq_data(desc)=
;
> > > > > > > > +	struct s3c24xx_eint_data *eint_data =3D
> > > > > > > > irq_get_handler_data(irq);
> > > > > > > > +	unsigned int virq;
> > > > > > > > +
> > > > > > >=20
> > > > > > > Instead of acking the interrupt at parent chip from ack
> > > > > > > callback
> > > > > > > of
> > > > > > > EINT0_3 chip, I would rather use chained_irq_enter() here=
=2E..
> > > > > > >=20
> > > > > > > > +	/* the first 4 eints have a simple 1 to 1 mapping */
> > > > > > > > +	virq =3D irq_linear_revmap(eint_data->domains[data->h=
wirq],
> > > > > > > > data->hwirq); +	/* Something must be really wrong if an
> > >=20
> > > unmapped
> > >=20
> > > > > > > EINT
> > > > > > >=20
> > > > > > > > +	 * was unmasked...
> > > > > > > > +	 */
> > > > > > > > +	BUG_ON(!virq);
> > > > > > > > +
> > > > > > > > +	generic_handle_irq(virq);
> > > > > > >=20
> > > > > > > ...and chained_irq_exit() here.
> > > > > >=20
> > > > > > If I understand it correctly, the way chained_irq_* works i=
t
> > > > > > would
> > > > > > limit the eints to a level style handling. With the way it'=
s
> > > > > > currently the whole determination of when to ack,mask and u=
nmask
> > > > > > is
> > > > > > completely for the real handler (edge or level) to decide, =
as
> > > > > > the
> > > > > > original interrupt gets completely forwarded into the irq-d=
omain
> > > > > > without further
> > > > > > constraints.
> > > > > >=20
> > > > > > So, after the change on regular s3c24xx SoCs when the real =
irq
> > > > > > handler
> > > > > > wants to ack the irq, it would be a no-op, as it would alre=
ady
> > > > > > have
> > > > > > been acked by chained_irq_enter.
> > > > > >=20
> > > > > > Masking might be even more interesting. Currently control i=
s
> > > > > > transfered
> > > > > > completely to the pinctrl irq-domain, which then controls t=
he
> > > > > > masking of the interrupt thru the parent-calls - on regular
> > > > > > s3c24xx
> > > > > > the masking of these is also only done in the main controll=
er.
> > > > > >=20
> > > > > > When using chained_irq_* it also wants to mask the interrup=
t
> > > > > > which
> > > > > > might conflict with regular enable_irq/disable_irq calls be=
ing
> > > > > > done
> > > > > > for example in driver code.
> > > > > >=20
> > > > > >=20
> > > > > > So in short I agree with the earlier split of the irqchip, =
but
> > > > > > would
> > > > > > keep the irq operations themself centralized in the pinctrl
> > > > > > driver,
> > > > > > instead of using chained_irq_* functions.
> > > > >=20
> > > > > Right, my solution wouldn't work properly in case of regular
> > > > > s3c24xx
> > > > > and edge triggered interrupts.
> > > > >=20
> > > > > However I'm still wondering if it's OK to manually call paren=
t
> > > > > chip
> > > > > operations in case of s3c2416. This would imply the same oper=
ation
> > > > > calling order as imposed by flow handler of the chained EINT
> > > > > (which
> > > > > can be handle_edge_irq), while the parent chip is probably le=
vel
> > > > > triggered, isn't it?
> > > >=20
> > > > I think imposing the same calling order is the right way to go =
:-) .
> > > >=20
> > > > The eints can be set hardware-wise to either level or edge
> > > > triggered,
> > > > but their flow handler is currently hard set to handle_edge_irq=
=2E I
> > > > remember seeing a patch from the Openmoko guys somewhere indica=
ting
> > > > that this does not work at all with level irqs.
> > >=20
> > > Sounds like something broken to me. Level-triggered interrupts ne=
ed
> > > different handling than edge-triggered handling and so different =
flow
> > > handlers exist for them.
> > >=20
> > > To make my doubts clear, this is how I'm seeing the hardware on 2=
412:
> > >   edge or level triggered     level triggered
> > >  =20
> > >        |   ___________________   |   ________________
> > >=20
> > > EINT0 --> | EINT0   EINT0PEND | --> | IRQ0   ARM_INT | --> to the=
 ARM
> > > core
> > >=20
> > > EINT1 --> | EINT1   EINT1PEND | --> | IRQ1           |
> > >=20
> > > EINT2 --> | EINT2   EINT2PEND | --> | IRQ2           |
> > >=20
> > > EINT3 --> | EINT3   EINT3PEND | --> | IRQ3           |
> > >=20
> > >           |___________________|     |________________|
> > >           |
> > >              GPIO controller       Interrupt controller
> > >=20
> > > Now EINT0-EINT3 signals of the GPIO controller are directly drive=
n
> > > with
> > > external interrupt signals, either edge or level triggered, but t=
he
> > > interrupt status is latched in EINT0PEND-EINT3PEND bits inside th=
e
> > > GPIO
> > > controller and state of those bits is exported through
> > > EINT0PEND-EINT3PEND signals to the interrupt controller's IRQ0-IR=
Q3
> > > signals, which are now level-triggered, since the interrupt is ac=
tive
> > > only when EINTxPEND bit is high.
> > >=20
> > > Now, if my vision is wrong, and the hardware has simply EINT0-EIN=
T3
> > > pins routed to IRQ0-IRQ3 signals of the interrupt controller, the=
n
> > > what you're saying is completely right. In this case just ignore =
my
> > > moaning. ;)
> >=20
> > I know the s3c2412 only in theory myself and am just going with the=
 old
> > code
> >=20
> > :-) . So all the irq rework stuff I did was only done on a theoreti=
cal
> > :level
> >=20
> > for s3c2412, so I don't really know if the current irq code runs fo=
r
> > sure there.
> >=20
> > But when looking at the real old code that must have run sucessfull=
y at
> > some point in the past [0], the comment says
> >=20
> > "the s3c2412 changes the behaviour of IRQ_EINT0 through IRQ_EINT3 b=
y
> >=20
> >  having them turn up in both the INT* and the EINT* registers. Whil=
st
> >  both show the status, they both now need to be acked when the IRQs
> >  go off."
> >=20
> > And then simply doing a
> >=20
> > 	__raw_writel(bitval, S3C2412_EINTPEND);
> > 	__raw_writel(bitval, S3C2410_SRCPND);
> > 	__raw_writel(bitval, S3C2410_INTPND);
> >=20
> > there - which is essentially the same that happens in the current
> > pinctrl ack code.
> >=20
> > So if we assume the really old code worked at some point, I'm relat=
ivly
> > sure the new one will too :-). I'll just exchange the mask ordering=
 in
> > s3c2412_eint0_3_mask, to match the ordering in the original functio=
n.
>=20
> Still, the old code seems to support only edge-triggered interrupts a=
nd
> this might be why it's working. I guess we won't know that without te=
sting
> it on a S3C2412, though.
>=20
> OK, it should be fine to keep the old behavior for now, but I think t=
his
> is something that should be investigated in future and, if needed, fi=
xed
> with another patch.

Ok, I'll prepare another patch with the other proposed changes.


> Btw. I wonder if I can get somewhere a board with S3C2412. Such board
> would be really useful for testing any of my patches touching plat-sa=
msung
> and mach-s3c* on s3c24xx, as currently I can only test on s3c6410.

Personally I found the S3C2412-based Logitech Squeezebox Controller [0]=
 quite=20
intriguing some time ago. And if only s3c24xx instead of s3c2412 is man=
datory,=20
there should also still be quite a lot of s3c2416/2450 based ebook-read=
ers=20
around [1] :-) .


Heiko

[0] http://wiki.slimdevices.com/index.php/Squeezebox_Controller
[1] http://www.youtube.com/mmind81


> > Heiko
> >=20
> >=20
> > [0]
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tre=
e/arc
> > h/arm/mach- s3c24xx/irq-s3c2412.c
