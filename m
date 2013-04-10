From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] pinctrl: Add pinctrl-s3c24xx driver
Date: Wed, 10 Apr 2013 15:45:48 +0200
Message-ID: <201304101545.49264.heiko@sntech.de>
References: <201304100135.12471.heiko@sntech.de> <201304101420.23106.heiko@sntech.de> <136562781.D2dqZAGJoQ@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:43994 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752466Ab3DJNpz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 09:45:55 -0400
In-Reply-To: <136562781.D2dqZAGJoQ@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

Am Mittwoch, 10. April 2013, 14:31:29 schrieb Tomasz Figa:
> On Wednesday 10 of April 2013 14:20:22 Heiko St=FCbner wrote:
> > Hi Tomasz,
> >=20
> > thanks for your comments, more inline.
> >=20
> > Am Mittwoch, 10. April 2013, 12:36:39 schrieb Tomasz Figa:
> > > Hi Heiko,
> > >=20
> > > Basically looks good to me, but please see my inline comments abo=
ut
> > > handling of EINT0-3.
> > >=20
> > > On Wednesday 10 of April 2013 01:35:12 Heiko St=FCbner wrote:
> > > > The s3c24xx pins follow a similar pattern as the other Samsung =
SoCs
> > > > and
> > > > can therefore reuse the already introduced infrastructure.
> >=20
> > [...]
> >=20
> > > > +struct s3c24xx_eint_data {
> > > > +	struct samsung_pinctrl_drv_data *drvdata;
> > > > +	struct irq_domain *domains[NUM_EINT];
> > > > +	int parents[NUM_EINT_IRQ];
> > > > +};
> > > > +
> > > > +struct s3c24xx_eint_domain_data {
> > > > +	struct samsung_pin_bank *bank;
> > > > +	struct s3c24xx_eint_data *eint_data;
> > >=20
> > > What about:
> > >=20
> > > +	bool eint0_3_parent_only;
> > >=20
> > > (or whatever name would be more appropriate), which would store t=
he
> > > information about the s3c24xx-specific quirk in 24xx-specific dat=
a
> > > structure, without the need to add another field to the generic
> > > samsung_pinctrl_drv_data structure?
> > >=20
> > > See my further comments on how I would see using this field in
> > > interrupt handling code.
> >=20
> > ok, sounds good, especially gathering the type from the wakeup-int
> > property
> >=20
> > > > +};
> >=20
> > [...]
> >=20
> > > Now I would split the following 3 functions into two sets of 3
> > > functions, one set for s3c2412 and other for remaining SoCs and m=
ake
> > > separate EINT0-3 IRQ chips for both cases.
> >=20
> > Not doing the decision every time, might bring some very slight spe=
ed
> > improvements, so is probably the right way to go.
> >=20
> > > > +
> > > > +static void s3c24xx_eint0_3_ack(struct irq_data *data)
> > > > +{
> > > > +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(=
data);
> > > > +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> > > > +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_domain-
> > > >
> > > >host_data;
> > > >
> > > > +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_data;
> > > > +	int parent_irq =3D eint_data->parents[data->hwirq];
> > > > +	struct irq_chip *parent_chip =3D irq_get_chip(parent_irq);
> > > > +
> > > > +	if (d->ctrl->type =3D=3D S3C2412) {
> > > > +		unsigned long bitval =3D 1UL << data->hwirq;
> > > > +		writel(bitval, d->virt_base + EINTPEND_REG);
> > > > +	}
> > > > +
> > > > +	if (parent_chip->irq_ack)
> > > > +		parent_chip->irq_ack(irq_get_irq_data(parent_irq));
> > >=20
> > > Btw. Is this parent level acking really needed here?
> >=20
> > Depends. If using chained_irq_* of course not, but if the irq-handl=
er
> > should stay in charge of when to ack it might be better this way.
> >=20
> > Generic s3c24xx SoCs need acking in the main controller only, while
> > s3c2412 needs acking in both the main controller and eintpend.
> >=20
> > > > +}
> >=20
> > [...]
> >=20
> > > > +static void s3c24xx_demux_eint0_3(unsigned int irq, struct irq=
_desc
> > > > *desc) +{
> > > > +	struct irq_data *data =3D irq_desc_get_irq_data(desc);
> > > > +	struct s3c24xx_eint_data *eint_data =3D irq_get_handler_data(=
irq);
> > > > +	unsigned int virq;
> > > > +
> > >=20
> > > Instead of acking the interrupt at parent chip from ack callback =
of
> > > EINT0_3 chip, I would rather use chained_irq_enter() here...
> > >=20
> > > > +	/* the first 4 eints have a simple 1 to 1 mapping */
> > > > +	virq =3D irq_linear_revmap(eint_data->domains[data->hwirq],
> > > > data->hwirq); +	/* Something must be really wrong if an unmappe=
d
> > >=20
> > > EINT
> > >=20
> > > > +	 * was unmasked...
> > > > +	 */
> > > > +	BUG_ON(!virq);
> > > > +
> > > > +	generic_handle_irq(virq);
> > >=20
> > > ...and chained_irq_exit() here.
> >=20
> > If I understand it correctly, the way chained_irq_* works it would =
limit
> > the eints to a level style handling. With the way it's currently th=
e
> > whole determination of when to ack,mask and unmask is completely fo=
r
> > the real handler (edge or level) to decide, as the original interru=
pt
> > gets completely forwarded into the irq-domain without further
> > constraints.
> >=20
> > So, after the change on regular s3c24xx SoCs when the real irq hand=
ler
> > wants to ack the irq, it would be a no-op, as it would already have
> > been acked by chained_irq_enter.
> >=20
> > Masking might be even more interesting. Currently control is transf=
ered
> > completely to the pinctrl irq-domain, which then controls the maski=
ng of
> > the interrupt thru the parent-calls - on regular s3c24xx the maskin=
g of
> > these is also only done in the main controller.
> >=20
> > When using chained_irq_* it also wants to mask the interrupt which =
might
> > conflict with regular enable_irq/disable_irq calls being done for
> > example in driver code.
> >=20
> >=20
> > So in short I agree with the earlier split of the irqchip, but woul=
d
> > keep the irq operations themself centralized in the pinctrl driver,
> > instead of using chained_irq_* functions.
>=20
> Right, my solution wouldn't work properly in case of regular s3c24xx =
and
> edge triggered interrupts.
>=20
> However I'm still wondering if it's OK to manually call parent chip
> operations in case of s3c2416. This would imply the same operation ca=
lling
> order as imposed by flow handler of the chained EINT (which can be
> handle_edge_irq), while the parent chip is probably level triggered, =
isn't
> it?

I think imposing the same calling order is the right way to go :-) .

The eints can be set hardware-wise to either level or edge triggered, b=
ut=20
their flow handler is currently hard set to handle_edge_irq. I remember=
 seeing=20
a patch from the Openmoko guys somewhere indicating that this does not =
work at=20
all with level irqs.

Only the main interrupts of the real demuxed eints (3_to_7 and 8_to...)=
 are=20
always level triggered, and therefore already use chained_irq...

In the current pinctrl driver, the parent eints do not have a flow hand=
ler of=20
their own (as the chained handler replaces it). So all flow handling is=
 done=20
by the flowhandler of the irq in the pinctrl domain.

handle_IRQ(main_eint)
-> demux_eint0_3
-> generic_handle_irq(pinctrl_eint)
-> handle_edge_irq (or handle_level_irq)
-> call ack, mask or unmask of the pinctrl eint
-> call ack, mask or unmask of the underlying main eint


Heiko
