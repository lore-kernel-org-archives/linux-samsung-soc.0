From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/5] mfd: tps65090: Stop caching most registers
Date: Wed, 23 Apr 2014 12:27:58 +0100
Message-ID: <20140423112758.GK21613@lee--X1>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
 <1397689950-1568-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:56053 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751171AbaDWL2G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 07:28:06 -0400
Received: by mail-we0-f180.google.com with SMTP id k48so723607wev.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 04:28:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397689950-1568-4-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

Anton,

> Nearly all of the registers in tps65090 combine control bits and
> status bits.  Turn off caching of all registers except the select few
> that can be cached.
>=20
> In order to avoid adding more duplicate #defines, we also move some
> register offset definitions to the mfd driver (and resolve
> inconsistent names).
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes in v3: None
> Changes in v2:
> - Leave cache on for the registers that can be cached.
> - Move register offsets to mfd header file.
>=20
>  drivers/mfd/tps65090.c           | 27 ++++++++++++++-------------
>  drivers/power/tps65090-charger.c | 11 -----------

This patch still requires your Ack.

>  include/linux/mfd/tps65090.h     | 14 ++++++++++++++
>  3 files changed, 28 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
> index c3cddb4..1c3e6e2 100644
> --- a/drivers/mfd/tps65090.c
> +++ b/drivers/mfd/tps65090.c
> @@ -32,14 +32,6 @@
>  #define NUM_INT_REG 2
>  #define TOTAL_NUM_REG 0x18
> =20
> -/* interrupt status registers */
> -#define TPS65090_INT_STS	0x0
> -#define TPS65090_INT_STS2	0x1
> -
> -/* interrupt mask registers */
> -#define TPS65090_INT_MSK	0x2
> -#define TPS65090_INT_MSK2	0x3
> -
>  #define TPS65090_INT1_MASK_VAC_STATUS_CHANGE		1
>  #define TPS65090_INT1_MASK_VSYS_STATUS_CHANGE		2
>  #define TPS65090_INT1_MASK_BAT_STATUS_CHANGE		3
> @@ -144,17 +136,26 @@ static struct regmap_irq_chip tps65090_irq_chip=
 =3D {
>  	.irqs =3D tps65090_irqs,
>  	.num_irqs =3D ARRAY_SIZE(tps65090_irqs),
>  	.num_regs =3D NUM_INT_REG,
> -	.status_base =3D TPS65090_INT_STS,
> -	.mask_base =3D TPS65090_INT_MSK,
> +	.status_base =3D TPS65090_REG_INTR_STS,
> +	.mask_base =3D TPS65090_REG_INTR_MASK,
>  	.mask_invert =3D true,
>  };
> =20
>  static bool is_volatile_reg(struct device *dev, unsigned int reg)
>  {
> -	if ((reg =3D=3D TPS65090_INT_STS) || (reg =3D=3D TPS65090_INT_STS2)=
)
> -		return true;
> -	else
> +	/* Nearly all registers have status bits mixed in, except a few */
> +	switch (reg) {
> +	case TPS65090_REG_INTR_MASK:
> +	case TPS65090_REG_INTR_MASK2:
> +	case TPS65090_REG_CG_CTRL0:
> +	case TPS65090_REG_CG_CTRL1:
> +	case TPS65090_REG_CG_CTRL2:
> +	case TPS65090_REG_CG_CTRL3:
> +	case TPS65090_REG_CG_CTRL4:
> +	case TPS65090_REG_CG_CTRL5:
>  		return false;
> +	}
> +	return true;
>  }
> =20
>  static const struct regmap_config tps65090_regmap_config =3D {
> diff --git a/drivers/power/tps65090-charger.c b/drivers/power/tps6509=
0-charger.c
> index cc26c12..31a3ba4 100644
> --- a/drivers/power/tps65090-charger.c
> +++ b/drivers/power/tps65090-charger.c
> @@ -30,17 +30,6 @@
> =20
>  #include <linux/mfd/tps65090.h>
> =20
> -#define TPS65090_REG_INTR_STS	0x00
> -#define TPS65090_REG_INTR_MASK	0x02
> -#define TPS65090_REG_CG_CTRL0	0x04
> -#define TPS65090_REG_CG_CTRL1	0x05
> -#define TPS65090_REG_CG_CTRL2	0x06
> -#define TPS65090_REG_CG_CTRL3	0x07
> -#define TPS65090_REG_CG_CTRL4	0x08
> -#define TPS65090_REG_CG_CTRL5	0x09
> -#define TPS65090_REG_CG_STATUS1	0x0a
> -#define TPS65090_REG_CG_STATUS2	0x0b
> -
>  #define TPS65090_CHARGER_ENABLE	BIT(0)
>  #define TPS65090_VACG		BIT(1)
>  #define TPS65090_NOITERM	BIT(5)
> diff --git a/include/linux/mfd/tps65090.h b/include/linux/mfd/tps6509=
0.h
> index 3f43069..45f0f9d 100644
> --- a/include/linux/mfd/tps65090.h
> +++ b/include/linux/mfd/tps65090.h
> @@ -64,6 +64,20 @@ enum {
>  	TPS65090_REGULATOR_MAX,
>  };
> =20
> +/* Register addresses */
> +#define TPS65090_REG_INTR_STS	0x00
> +#define TPS65090_REG_INTR_STS2	0x01
> +#define TPS65090_REG_INTR_MASK	0x02
> +#define TPS65090_REG_INTR_MASK2	0x03
> +#define TPS65090_REG_CG_CTRL0	0x04
> +#define TPS65090_REG_CG_CTRL1	0x05
> +#define TPS65090_REG_CG_CTRL2	0x06
> +#define TPS65090_REG_CG_CTRL3	0x07
> +#define TPS65090_REG_CG_CTRL4	0x08
> +#define TPS65090_REG_CG_CTRL5	0x09
> +#define TPS65090_REG_CG_STATUS1	0x0a
> +#define TPS65090_REG_CG_STATUS2	0x0b
> +
>  struct tps65090 {
>  	struct device		*dev;
>  	struct regmap		*rmap;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
