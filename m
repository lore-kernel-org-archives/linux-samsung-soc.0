From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 5/5] irqchip: s3c24xx: add devicetree support
Date: Fri, 22 Mar 2013 20:55:57 +0000
Message-ID: <201303222055.57400.arnd@arndb.de>
References: <201303221843.37668.heiko@sntech.de> <201303221846.46473.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:57482 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423027Ab3CVU4S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Mar 2013 16:56:18 -0400
In-Reply-To: <201303221846.46473.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Friday 22 March 2013, Heiko St=C3=BCbner wrote:
> +	interrupt-controller@4a000000 {
> +		compatible =3D "samsung,s3c24xx-irq";
> +		reg =3D <0x4a000000 0x100>;
> +		interrupt-controller;
> +
> +		intc:intc {
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +		};
> +
> +		subintc:subintc {
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +		};
> +	};

I think this is not a comformant binding because the parent node
is marked "interrupt-controller" but does not itself have a
#interrupt-cells property.

One way to resolve this would probably be to fold the sub-nodes into
the parent and always use #interrupt-cells =3D <3> or maybe <4>
so you can identify which sub-node the interrupt is meant for.

Also, I think you are missing a description of what the two or
three cells represent.

> +static int s3c_irq_xlate_subintc(struct irq_domain *d, struct device=
_node *n,
> +			const u32 *intspec, unsigned int intsize,
> +			irq_hw_number_t *out_hwirq, unsigned int *out_type)
> +{
> +	struct s3c_irq_intc *intc =3D d->host_data;
> +	struct s3c_irq_intc *parent_intc =3D intc->parent;
> +	struct s3c_irq_data *irq_data =3D &intc->irqs[intspec[0]];
> +	struct s3c_irq_data *parent_irq_data;
> +
> +	int irqno;
> +
> +	if (WARN_ON(intsize < 3))
> +		return -EINVAL;
> +
> +	*out_hwirq =3D intspec[0];
> +	*out_type =3D intspec[1] & IRQ_TYPE_SENSE_MASK;
> +
> +	irqno =3D irq_create_mapping(parent_intc->domain, intspec[2]);
> +	if (irqno < 0) {
> +		pr_err("irq: could not map parent interrupt\n");
> +		return irqno;
> +	}

So the third cell in this is the interrupt number of the main controlle=
r
that the irq cascades into, while the first cell is the number of the
cascaded controller, correct?

If you want to fold everything into one node, it's probably best to
put the irq number of the main controller into the first cell all the
time, and use the second cell to describe the number in the second cell=
=2E

The alternative would be to have three completely separate nodes,
and then you can describe the parent-child relationship like

intc: interrupt-controller@4a000000 {
	compatible =3D "samsung,s3c2416-intc";
	reg =3D <0x4a000000 0x18>;
	interrupt-controller;
	#interrupt-cells =3D <2>;
};

subintc: interrupt-controller@4a000018 {
	compatible =3D "samsung,s3c2416-subintc";
	reg =3D <0x4a000018 0x28>;
	interrupt-controller;
	#interrupt-cells =3D <3>;
	interrupt-parent =3D <&intc>;
	interrupts  =3D <28 0>, <23 0>, <15 0>, <31 0>, <16 0>, <17 0>, <18 0>=
, <9 0>;
};

       serial@50000000 {
               compatible =3D "samsung,s3c2410-uart";
               reg =3D <0x50000000 0x4000>;
               interrupt-parent =3D <&subintc>;
               interrupts =3D <0 0 4>, /* first interrupt, first parent=
, level */
			    <1 0 4>; /* second interrupt, first parent, level */
       };

       serial@51000000 {
               compatible =3D "samsung,s3c2410-uart";
               reg =3D <0x51000000 0x4000>;
               interrupt-parent =3D <&subintc>;
               interrupts =3D <0 1 4>, /* first interrupt, second paren=
t, level */
			    <1 1 4>; /* second interrupt, second parent, level */
       };




	Arnd
