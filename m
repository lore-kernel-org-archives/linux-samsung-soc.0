From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 6/6] irqchip: s3c24xx: add s3c2450 interrupt definitions
Date: Mon, 18 Mar 2013 10:54:03 -0500
Message-ID: <5147389B.5060105@gmail.com>
References: <201303171404.06146.heiko@sntech.de> <201303171409.07774.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:51398 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752100Ab3CRPyH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 11:54:07 -0400
Received: by mail-oa0-f46.google.com with SMTP id k1so5750712oag.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Mar 2013 08:54:06 -0700 (PDT)
In-Reply-To: <201303171409.07774.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org

On 03/17/2013 08:09 AM, Heiko St=FCbner wrote:
> The s3c2450 is special in that it shares the cpu identification with =
the
> s3c2416 but provides more interrupts for its additional components.
>=20
> It also shares the layout of the main interrupt register with the s3c=
2443
> and therefore reuses this definition.
>=20
> As no non-dt boards are present, the s3c2450 irqs will only be
> accessible thru devicetree.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/irqchip/irq-s3c24xx.c |   62 +++++++++++++++++++++++++++++++=
++++++++-
>  1 files changed, 60 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c2=
4xx.c
> index 55cb363..7ddf8e8 100644
> --- a/drivers/irqchip/irq-s3c24xx.c
> +++ b/drivers/irqchip/irq-s3c24xx.c
> @@ -852,6 +852,51 @@ static struct s3c_irq_data init_s3c2416_second[3=
2] =3D {
>  	{ .type =3D S3C_IRQTYPE_EDGE }, /* I2S0 */
>  };
> =20
> +static struct s3c_irq_data init_s3c2450subint[32] =3D {
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-RX */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-TX */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-ERR *=
/
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 23 }, /* UART1-RX */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 23 }, /* UART1-TX */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 23 }, /* UART1-ERR *=
/
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 15 }, /* UART2-RX */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 15 }, /* UART2-TX */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 15 }, /* UART2-ERR *=
/
> +	{ .type =3D S3C_IRQTYPE_EDGE, .parent_irq =3D 31 }, /* TC */
> +	{ .type =3D S3C_IRQTYPE_EDGE, .parent_irq =3D 31 }, /* ADC */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 6 }, /* CAM_C */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 6 }, /* CAM_P */
> +	{ .type =3D S3C_IRQTYPE_NONE }, /* reserved */
> +	{ .type =3D S3C_IRQTYPE_NONE }, /* reserved */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 16 }, /* LCD2 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 16 }, /* LCD3 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 16 }, /* LCD4 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA0 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA1 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA2 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA3 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA4 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA5 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-RX */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-TX */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-ERR *=
/
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 9 }, /* WDT */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 9 }, /* AC97 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA6 */
> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA7 */

This all seems like information that should come from DT.

> +};
> +
> +static struct s3c_irq_data init_s3c2450second[32] =3D {
> +	{ .type =3D S3C_IRQTYPE_EDGE }, /* 2D */
> +	{ .type =3D S3C_IRQTYPE_EDGE }, /* IIC1 */
> +	{ .type =3D S3C_IRQTYPE_NONE }, /* reserved */
> +	{ .type =3D S3C_IRQTYPE_NONE }, /* reserved */
> +	{ .type =3D S3C_IRQTYPE_EDGE }, /* PCM0 */
> +	{ .type =3D S3C_IRQTYPE_EDGE }, /* PCM1 */
> +	{ .type =3D S3C_IRQTYPE_EDGE }, /* I2S0 */
> +	{ .type =3D S3C_IRQTYPE_EDGE }, /* I2S1 */
> +};
> +
>  void __init s3c2416_init_irq(void)
>  {
>  	struct s3c_irq_intc *main_intc;
> @@ -1024,7 +1069,7 @@ void __init s3c2442_init_irq(void)
>  }
>  #endif
> =20
> -#ifdef CONFIG_CPU_S3C2443
> +#if defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
>  static struct s3c_irq_data init_s3c2443base[32] =3D {
>  	{ .type =3D S3C_IRQTYPE_EINT, }, /* EINT0 */
>  	{ .type =3D S3C_IRQTYPE_EINT, }, /* EINT1 */
> @@ -1059,8 +1104,9 @@ static struct s3c_irq_data init_s3c2443base[32]=
 =3D {
>  	{ .type =3D S3C_IRQTYPE_EDGE, }, /* RTC */
>  	{ .type =3D S3C_IRQTYPE_LEVEL, }, /* ADCPARENT */
>  };
> +#endif
> =20
> -
> +#ifdef CONFIG_CPU_S3C2443
>  static struct s3c_irq_data init_s3c2443subint[32] =3D {
>  	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-RX */
>  	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 28 }, /* UART0-TX */
> @@ -1172,6 +1218,17 @@ struct s3c24xx_irq_of_data s3c2416_irq_data =3D=
 {
>  	.irq_ctrl =3D s3c2416_ctrl,
>  	.num_ctrl =3D ARRAY_SIZE(s3c2416_ctrl),
>  };
> +
> +static struct s3c24xx_irq_of_ctrl s3c2450_ctrl[] =3D {
> +	S3C24XX_IRQCTRL("intc", 0, init_s3c2443base, &main_intc, NULL),
> +	S3C24XX_IRQCTRL("subintc", 0x18, init_s3c2450subint, NULL, &main_in=
tc),
> +	S3C24XX_IRQCTRL("intc2", 0x40, init_s3c2450second, &main_intc2, NUL=
L),
> +};
> +
> +static struct s3c24xx_irq_of_data s3c2450_irq_data =3D {
> +	.irq_ctrl =3D s3c2450_ctrl,
> +	.num_ctrl =3D ARRAY_SIZE(s3c2450_ctrl),
> +};
>  #endif
> =20
>  #ifdef CONFIG_CPU_S3C2440
> @@ -1219,6 +1276,7 @@ static const struct of_device_id intc_list[] =3D=
 {
>  #endif
>  #ifdef CONFIG_CPU_S3C2416
>  	{ .compatible =3D "samsung,s3c2416-irq", .data =3D &s3c2416_irq_dat=
a },
> +	{ .compatible =3D "samsung,s3c2450-irq", .data =3D &s3c2450_irq_dat=
a },

Why are you not using IRQCHIP_OF_DECLARE?

Rob
