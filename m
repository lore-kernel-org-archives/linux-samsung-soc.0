From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: Add pinctrl-s3c24xx driver
Date: Wed, 10 Apr 2013 14:31:29 +0200
Message-ID: <136562781.D2dqZAGJoQ@flatron>
References: <201304100135.12471.heiko@sntech.de> <1376906.qvoN3qK2gl@flatron> <201304101420.23106.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:49360 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759623Ab3DJMbe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 08:31:34 -0400
Received: by mail-ee0-f42.google.com with SMTP id d4so208818eek.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Apr 2013 05:31:32 -0700 (PDT)
In-Reply-To: <201304101420.23106.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

On Wednesday 10 of April 2013 14:20:22 Heiko St=FCbner wrote:
> Hi Tomasz,
>=20
> thanks for your comments, more inline.
>=20
> Am Mittwoch, 10. April 2013, 12:36:39 schrieb Tomasz Figa:
> > Hi Heiko,
> >=20
> > Basically looks good to me, but please see my inline comments about
> > handling of EINT0-3.
> >=20
> > On Wednesday 10 of April 2013 01:35:12 Heiko St=FCbner wrote:
> > > The s3c24xx pins follow a similar pattern as the other Samsung So=
Cs
> > > and
> > > can therefore reuse the already introduced infrastructure.
>=20
> [...]
>=20
> > > +struct s3c24xx_eint_data {
> > > +	struct samsung_pinctrl_drv_data *drvdata;
> > > +	struct irq_domain *domains[NUM_EINT];
> > > +	int parents[NUM_EINT_IRQ];
> > > +};
> > > +
> > > +struct s3c24xx_eint_domain_data {
> > > +	struct samsung_pin_bank *bank;
> > > +	struct s3c24xx_eint_data *eint_data;
> >=20
> > What about:
> >=20
> > +	bool eint0_3_parent_only;
> >=20
> > (or whatever name would be more appropriate), which would store the
> > information about the s3c24xx-specific quirk in 24xx-specific data
> > structure, without the need to add another field to the generic
> > samsung_pinctrl_drv_data structure?
> >=20
> > See my further comments on how I would see using this field in
> > interrupt handling code.
>=20
> ok, sounds good, especially gathering the type from the wakeup-int
> property
> > > +};
>=20
> [...]
>=20
> > Now I would split the following 3 functions into two sets of 3
> > functions, one set for s3c2412 and other for remaining SoCs and mak=
e
> > separate EINT0-3 IRQ chips for both cases.
>=20
> Not doing the decision every time, might bring some very slight speed
> improvements, so is probably the right way to go.
>=20
> > > +
> > > +static void s3c24xx_eint0_3_ack(struct irq_data *data)
> > > +{
> > > +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(da=
ta);
> > > +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> > > +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_domain-
> > >
> > >host_data;
> > >
> > > +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_data;
> > > +	int parent_irq =3D eint_data->parents[data->hwirq];
> > > +	struct irq_chip *parent_chip =3D irq_get_chip(parent_irq);
> > > +
> > > +	if (d->ctrl->type =3D=3D S3C2412) {
> > > +		unsigned long bitval =3D 1UL << data->hwirq;
> > > +		writel(bitval, d->virt_base + EINTPEND_REG);
> > > +	}
> > > +
> > > +	if (parent_chip->irq_ack)
> > > +		parent_chip->irq_ack(irq_get_irq_data(parent_irq));
> >=20
> > Btw. Is this parent level acking really needed here?
>=20
> Depends. If using chained_irq_* of course not, but if the irq-handler
> should stay in charge of when to ack it might be better this way.
>=20
> Generic s3c24xx SoCs need acking in the main controller only, while
> s3c2412 needs acking in both the main controller and eintpend.
>=20
> > > +}
>=20
> [...]
>=20
> > > +static void s3c24xx_demux_eint0_3(unsigned int irq, struct irq_d=
esc
> > > *desc) +{
> > > +	struct irq_data *data =3D irq_desc_get_irq_data(desc);
> > > +	struct s3c24xx_eint_data *eint_data =3D irq_get_handler_data(ir=
q);
> > > +	unsigned int virq;
> > > +
> >=20
> > Instead of acking the interrupt at parent chip from ack callback of
> > EINT0_3 chip, I would rather use chained_irq_enter() here...
> >=20
> > > +	/* the first 4 eints have a simple 1 to 1 mapping */
> > > +	virq =3D irq_linear_revmap(eint_data->domains[data->hwirq],
> > > data->hwirq); +	/* Something must be really wrong if an unmapped
> >=20
> > EINT
> >=20
> > > +	 * was unmasked...
> > > +	 */
> > > +	BUG_ON(!virq);
> > > +
> > > +	generic_handle_irq(virq);
> >=20
> > ...and chained_irq_exit() here.
>=20
> If I understand it correctly, the way chained_irq_* works it would li=
mit
> the eints to a level style handling. With the way it's currently the
> whole determination of when to ack,mask and unmask is completely for
> the real handler (edge or level) to decide, as the original interrupt
> gets completely forwarded into the irq-domain without further
> constraints.
>=20
> So, after the change on regular s3c24xx SoCs when the real irq handle=
r
> wants to ack the irq, it would be a no-op, as it would already have
> been acked by chained_irq_enter.
>=20
> Masking might be even more interesting. Currently control is transfer=
ed
> completely to the pinctrl irq-domain, which then controls the masking=
 of
> the interrupt thru the parent-calls - on regular s3c24xx the masking =
of
> these is also only done in the main controller.
>=20
> When using chained_irq_* it also wants to mask the interrupt which mi=
ght
> conflict with regular enable_irq/disable_irq calls being done for
> example in driver code.
>=20
>=20
> So in short I agree with the earlier split of the irqchip, but would
> keep the irq operations themself centralized in the pinctrl driver,
> instead of using chained_irq_* functions.
>=20

Right, my solution wouldn't work properly in case of regular s3c24xx an=
d=20
edge triggered interrupts.=20

However I'm still wondering if it's OK to manually call parent chip=20
operations in case of s3c2416. This would imply the same operation call=
ing=20
order as imposed by flow handler of the chained EINT (which can be=20
handle_edge_irq), while the parent chip is probably level triggered, is=
n't=20
it?

Best regards,
Tomasz

>=20
> Heiko
>=20
> > > +}
> > > +
> > > +static inline void s3c24xx_demux_eint(unsigned int irq, struct
> > > irq_desc *desc, +				      u32 offset, u32=20
range)
> > > +{
> > > +	struct irq_chip *chip =3D irq_get_chip(irq);
> > > +	struct s3c24xx_eint_data *data =3D irq_get_handler_data(irq);
> > > +	struct samsung_pinctrl_drv_data *d =3D data->drvdata;
> > > +	unsigned int pend, mask;
> > > +
> > > +	chained_irq_enter(chip, desc);
> > > +
> > > +	pend =3D readl(d->virt_base + EINTPEND_REG);
> > > +	mask =3D readl(d->virt_base + EINTMASK_REG);
> > > +
> > > +	pend &=3D ~mask;
> > > +	pend &=3D range;
> > > +
> > > +	while (pend) {
> > > +		unsigned int virq;
> > > +
> > > +		irq =3D __ffs(pend);
> > > +		pend &=3D ~(1 << irq);
> > > +		virq =3D irq_linear_revmap(data->domains[irq], irq -
> >=20
> > offset);
> >=20
> > > +		/* Something must be really wrong if an unmapped EINT
> > > +		 * was unmasked...
> > > +		 */
> > > +		BUG_ON(!virq);
> > > +
> > > +		generic_handle_irq(virq);
> > > +	}
> > > +
> > > +	chained_irq_exit(chip, desc);
> > > +}
> > > +
> > > +static void s3c24xx_demux_eint4_7(unsigned int irq, struct irq_d=
esc
> > > *desc) +{
> > > +	s3c24xx_demux_eint(irq, desc, 0, 0xf0);
> > > +}
> > > +
> > > +static void s3c24xx_demux_eint8_23(unsigned int irq, struct
> > > irq_desc
> > > *desc) +{
> > > +	s3c24xx_demux_eint(irq, desc, 8, 0xffff00);
> > > +}
> > > +
> > > +static irq_flow_handler_t s3c24xx_eint_handlers[NUM_EINT_IRQ] =3D=
 {
> > > +	s3c24xx_demux_eint0_3,
> > > +	s3c24xx_demux_eint0_3,
> > > +	s3c24xx_demux_eint0_3,
> > > +	s3c24xx_demux_eint0_3,
> > > +	s3c24xx_demux_eint4_7,
> > > +	s3c24xx_demux_eint8_23,
> > > +};
> > > +
> > > +static int s3c24xx_gpf_irq_map(struct irq_domain *h, unsigned in=
t
> > > virq, +					irq_hw_number_t hw)
> > > +{
> > > +	struct s3c24xx_eint_domain_data *ddata =3D h->host_data;
> > > +	struct samsung_pin_bank *bank =3D ddata->bank;
> > > +
> > > +	if (!(bank->eint_mask & (1 << (bank->eint_offset + hw))))
> > > +		return -EINVAL;
> > > +
> > > +	if (hw <=3D 3) {
> >=20
> > Now here I would check ddata->eint0_3_parent_only and set the chip
> > conditionally, either to s3c24xx or s3c2412 variant.
> >=20
> > > +		irq_set_chip_and_handler(virq, &s3c24xx_eint0_3_chip,
> > > +					 handle_edge_irq);
> > > +		irq_set_chip_data(virq, bank);
> > > +	} else {
> > > +		irq_set_chip_and_handler(virq, &s3c24xx_eint_chip,
> > > +					 handle_edge_irq);
> > > +		irq_set_chip_data(virq, bank);
> > > +	}
> > > +	set_irq_flags(virq, IRQF_VALID);
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct irq_domain_ops s3c24xx_gpf_irq_ops =3D {
> > > +	.map	=3D s3c24xx_gpf_irq_map,
> > > +	.xlate	=3D irq_domain_xlate_twocell,
> > > +};
> > > +
> > > +static int s3c24xx_gpg_irq_map(struct irq_domain *h, unsigned in=
t
> > > virq, +					irq_hw_number_t hw)
> > > +{
> > > +	struct s3c24xx_eint_domain_data *ddata =3D h->host_data;
> > > +	struct samsung_pin_bank *bank =3D ddata->bank;
> > > +
> > > +	if (!(bank->eint_mask & (1 << (bank->eint_offset + hw))))
> > > +		return -EINVAL;
> > > +
> > > +	irq_set_chip_and_handler(virq, &s3c24xx_eint_chip,
> >=20
> > handle_edge_irq);
> >=20
> > > +	irq_set_chip_data(virq, bank);
> > > +	set_irq_flags(virq, IRQF_VALID);
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct irq_domain_ops s3c24xx_gpg_irq_ops =3D {
> > > +	.map	=3D s3c24xx_gpg_irq_map,
> > > +	.xlate	=3D irq_domain_xlate_twocell,
> > > +};
> > > +
> > > +static const struct of_device_id s3c24xx_eint_irq_ids[] =3D {
> > > +	{ .compatible =3D "samsung,s3c24xx-wakeup-eint", },
> > > +	{ }
> > > +};
> > > +
> > > +static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
> > > +{
> > > +	struct device *dev =3D d->dev;
> > > +	struct device_node *eint_np =3D NULL;
> > > +	struct device_node *np;
> > > +	struct samsung_pin_bank *bank;
> > > +	struct s3c24xx_eint_data *eint_data;
> > > +	const struct irq_domain_ops *ops;
> > > +	unsigned int i;
> > > +
> > > +	for_each_child_of_node(dev->of_node, np) {
> > > +		if (of_match_node(s3c24xx_eint_irq_ids, np)) {
> > > +			eint_np =3D np;
> > > +			break;
> > > +		}
> > > +	}
> > > +	if (!eint_np)
> > > +		return -ENODEV;
> > > +
> > > +	eint_data =3D devm_kzalloc(dev, sizeof(*eint_data), GFP_KERNEL)=
;
> > > +	if (!eint_data) {
> > > +		dev_err(dev, "could not allocate memory for wkup eint
> >=20
> > data\n");
> >=20
> > > +		return -ENOMEM;
> > > +	}
> > > +	eint_data->drvdata =3D d;
> > > +
> > > +	for (i =3D 0; i < NUM_EINT_IRQ; ++i) {
> > > +		unsigned int irq;
> > > +
> > > +		irq =3D irq_of_parse_and_map(eint_np, i);
> > > +		if (!irq) {
> > > +			dev_err(dev, "failed to get wakeup EINT IRQ %d\n",
> >=20
> > i);
> >=20
> > > +			return -ENXIO;
> > > +		}
> > > +
> > > +		eint_data->parents[i] =3D irq;
> > > +		irq_set_chained_handler(irq, s3c24xx_eint_handlers[i]);
> > > +		irq_set_handler_data(irq, eint_data);
> > > +	}
> > > +
> > > +	bank =3D d->ctrl->pin_banks;
> > > +	for (i =3D 0; i < d->ctrl->nr_banks; ++i, ++bank) {
> > > +		struct s3c24xx_eint_domain_data *ddata;
> > > +		unsigned int mask;
> > > +		unsigned int irq;
> > > +		unsigned int pin;
> > > +
> > > +		if (bank->eint_type !=3D EINT_TYPE_WKUP)
> > > +			continue;
> > > +
> > > +		ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > > +		if (!ddata) {
> > > +			dev_err(dev, "failed to allocate domain data\n");
> > > +			return -ENOMEM;
> > > +		}
> > > +		ddata->bank =3D bank;
> > > +		ddata->eint_data =3D eint_data;
> >=20
> > Here the eint0_3_parent_only field can be set based on compatible
> > string of the EINT controller.
> >=20
> > > +
> > > +		ops =3D (bank->eint_offset =3D=3D 0) ? &s3c24xx_gpf_irq_ops
> > > +					       : &s3c24xx_gpg_irq_ops;
> > > +
> > > +		bank->irq_domain =3D irq_domain_add_linear(bank->of_node,
> > > +				bank->nr_pins, ops, ddata);
> > > +		if (!bank->irq_domain) {
> > > +			dev_err(dev, "wkup irq domain add failed\n");
> > > +			return -ENXIO;
> > > +		}
> > > +
> > > +		irq =3D bank->eint_offset;
> > > +		mask =3D bank->eint_mask;
> > > +		for (pin =3D 0; mask; ++pin, mask >>=3D 1) {
> > > +			if (irq > NUM_EINT)
> > > +				break;
> > > +			if (!(mask & 1))
> > > +				continue;
> > > +			eint_data->domains[irq] =3D bank->irq_domain;
> > > +			++irq;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct samsung_pin_bank s3c2413_pin_banks[] =3D {
> > > +	PIN_BANK_A(23, 0x000, "gpa"),
> > > +	PIN_BANK_2BIT(11, 0x010, "gpb"),
> > > +	PIN_BANK_2BIT(16, 0x020, "gpc"),
> > > +	PIN_BANK_2BIT(16, 0x030, "gpd"),
> > > +	PIN_BANK_2BIT(16, 0x040, "gpe"),
> > > +	PIN_BANK_2BIT_EINTW(8, 0x050, "gpf", 0, 0xff),
> > > +	PIN_BANK_2BIT_EINTW(16, 0x060, "gpg", 8, 0xffff00),
> > > +	PIN_BANK_2BIT(11, 0x070, "gph"),
> > > +	PIN_BANK_2BIT(13, 0x080, "gpj"),
> > > +};
> > > +
> > > +struct samsung_pin_ctrl s3c2413_pin_ctrl[] =3D {
> > > +	{
> > > +		.pin_banks	=3D s3c2413_pin_banks,
> > > +		.nr_banks	=3D ARRAY_SIZE(s3c2413_pin_banks),
> > > +		.eint_wkup_init =3D s3c24xx_eint_init,
> > > +		.label		=3D "S3C2413-GPIO",
> > > +		.type		=3D S3C2412,
> >=20
> > And then finally you shouldn't need this type field anymore.
