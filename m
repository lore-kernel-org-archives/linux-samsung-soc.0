From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 6/6] irqchip: s3c24xx: add s3c2450 interrupt definitions
Date: Mon, 18 Mar 2013 17:53:15 +0100
Message-ID: <201303181753.16547.heiko@sntech.de>
References: <201303171404.06146.heiko@sntech.de> <201303171409.07774.heiko@sntech.de> <5147389B.5060105@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:57484 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752399Ab3CRQxX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 12:53:23 -0400
In-Reply-To: <5147389B.5060105@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org

Hi Rob,

Am Montag, 18. M=E4rz 2013, 16:54:03 schrieb Rob Herring:
> On 03/17/2013 08:09 AM, Heiko St=FCbner wrote:
> > The s3c2450 is special in that it shares the cpu identification wit=
h the
> > s3c2416 but provides more interrupts for its additional components.
> >=20
> > It also shares the layout of the main interrupt register with the s=
3c2443
> > and therefore reuses this definition.
> >=20
> > As no non-dt boards are present, the s3c2450 irqs will only be
> > accessible thru devicetree.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  drivers/irqchip/irq-s3c24xx.c |   62
> >  +++++++++++++++++++++++++++++++++++++++- 1 files changed, 60
> >  insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/irqchip/irq-s3c24xx.c
> > b/drivers/irqchip/irq-s3c24xx.c index 55cb363..7ddf8e8 100644
> > --- a/drivers/irqchip/irq-s3c24xx.c
> > +++ b/drivers/irqchip/irq-s3c24xx.c
> > @@ -852,6 +852,51 @@ static struct s3c_irq_data init_s3c2416_second=
[32] =3D
> > {
> >=20
> >  	{ .type =3D S3C_IRQTYPE_EDGE }, /* I2S0 */
> > =20
> >  };
> >=20
> > +static struct s3c_irq_data init_s3c2450subint[32] =3D {
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-RX =
*/
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-TX =
*/
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-ERR=
 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 23 }, /* UART1-RX =
*/
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 23 }, /* UART1-TX =
*/
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 23 }, /* UART1-ERR=
 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 15 }, /* UART2-RX =
*/
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 15 }, /* UART2-TX =
*/
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 15 }, /* UART2-ERR=
 */
> > +	{ .type =3D S3C_IRQTYPE_EDGE, .parent_irq =3D 31 }, /* TC */
> > +	{ .type =3D S3C_IRQTYPE_EDGE, .parent_irq =3D 31 }, /* ADC */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 6 }, /* CAM_C */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 6 }, /* CAM_P */
> > +	{ .type =3D S3C_IRQTYPE_NONE }, /* reserved */
> > +	{ .type =3D S3C_IRQTYPE_NONE }, /* reserved */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 16 }, /* LCD2 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 16 }, /* LCD3 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 16 }, /* LCD4 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA0 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA1 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA2 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA3 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA4 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA5 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-RX =
*/
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-TX =
*/
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-ERR=
 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 9 }, /* WDT */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 9 }, /* AC97 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA6 */
> > +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA7 */
>=20
> This all seems like information that should come from DT.

In the first iterations [0] of theis series it was done this way, but w=
as=20
suggested that these informations _might_ be implementation specific an=
d not=20
describing the hardware.

As I didn't get any "final" feedback on the matter, I tried it this way=
 this=20
time. Personally I also did like the previous variant better, as the dr=
iver=20
could loose all the declaration stuff when platforms move to dt.

I would be glad for a hint if the first approach was the correct one.


[0] "irqchip: irq-s3c24xx: add devicetree support" from 2013-02-18, als=
o with=20
you in the recipient list

>=20
> > +};
> > +
> > +static struct s3c_irq_data init_s3c2450second[32] =3D {
> > +	{ .type =3D S3C_IRQTYPE_EDGE }, /* 2D */
> > +	{ .type =3D S3C_IRQTYPE_EDGE }, /* IIC1 */
> > +	{ .type =3D S3C_IRQTYPE_NONE }, /* reserved */
> > +	{ .type =3D S3C_IRQTYPE_NONE }, /* reserved */
> > +	{ .type =3D S3C_IRQTYPE_EDGE }, /* PCM0 */
> > +	{ .type =3D S3C_IRQTYPE_EDGE }, /* PCM1 */
> > +	{ .type =3D S3C_IRQTYPE_EDGE }, /* I2S0 */
> > +	{ .type =3D S3C_IRQTYPE_EDGE }, /* I2S1 */
> > +};
> > +
> >=20
> >  void __init s3c2416_init_irq(void)
> >  {
> > =20
> >  	struct s3c_irq_intc *main_intc;
> >=20
> > @@ -1024,7 +1069,7 @@ void __init s3c2442_init_irq(void)
> >=20
> >  }
> >  #endif
> >=20
> > -#ifdef CONFIG_CPU_S3C2443
> > +#if defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
> >=20
> >  static struct s3c_irq_data init_s3c2443base[32] =3D {
> > =20
> >  	{ .type =3D S3C_IRQTYPE_EINT, }, /* EINT0 */
> >  	{ .type =3D S3C_IRQTYPE_EINT, }, /* EINT1 */
> >=20
> > @@ -1059,8 +1104,9 @@ static struct s3c_irq_data init_s3c2443base[3=
2] =3D {
> >=20
> >  	{ .type =3D S3C_IRQTYPE_EDGE, }, /* RTC */
> >  	{ .type =3D S3C_IRQTYPE_LEVEL, }, /* ADCPARENT */
> > =20
> >  };
> >=20
> > +#endif
> >=20
> > -
> > +#ifdef CONFIG_CPU_S3C2443
> >=20
> >  static struct s3c_irq_data init_s3c2443subint[32] =3D {
> > =20
> >  	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-RX =
*/
> >  	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-TX =
*/
> >=20
> > @@ -1172,6 +1218,17 @@ struct s3c24xx_irq_of_data s3c2416_irq_data =
=3D {
> >=20
> >  	.irq_ctrl =3D s3c2416_ctrl,
> >  	.num_ctrl =3D ARRAY_SIZE(s3c2416_ctrl),
> > =20
> >  };
> >=20
> > +
> > +static struct s3c24xx_irq_of_ctrl s3c2450_ctrl[] =3D {
> > +	S3C24XX_IRQCTRL("intc", 0, init_s3c2443base, &main_intc, NULL),
> > +	S3C24XX_IRQCTRL("subintc", 0x18, init_s3c2450subint, NULL,=20
&main_intc),
> > +	S3C24XX_IRQCTRL("intc2", 0x40, init_s3c2450second, &main_intc2,=20
NULL),
> > +};
> > +
> > +static struct s3c24xx_irq_of_data s3c2450_irq_data =3D {
> > +	.irq_ctrl =3D s3c2450_ctrl,
> > +	.num_ctrl =3D ARRAY_SIZE(s3c2450_ctrl),
> > +};
> >=20
> >  #endif
> > =20
> >  #ifdef CONFIG_CPU_S3C2440
> >=20
> > @@ -1219,6 +1276,7 @@ static const struct of_device_id intc_list[] =
=3D {
> >=20
> >  #endif
> >  #ifdef CONFIG_CPU_S3C2416
> > =20
> >  	{ .compatible =3D "samsung,s3c2416-irq", .data =3D &s3c2416_irq_d=
ata },
> >=20
> > +	{ .compatible =3D "samsung,s3c2450-irq", .data =3D &s3c2450_irq_d=
ata },
>=20
> Why are you not using IRQCHIP_OF_DECLARE?

As you can see in patch 5/6 the driver itself is using irqchip_declare,=
 which=20
I seem to have forgotten here. This matching table is simply meant to h=
elp the=20
common init function to select the correct mapping table.

All this stuff can of course go away if the correct way is to gather th=
is=20
information from dt.


Thanks
Heiko
