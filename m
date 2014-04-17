From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/5] mfd: tps65090: Stop caching most registers
Date: Thu, 17 Apr 2014 12:00:28 +0100
Message-ID: <20140417110028.GO28725@lee--X1>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
 <1397689950-1568-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:53997 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbaDQLAe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 07:00:34 -0400
Received: by mail-wi0-f174.google.com with SMTP id d1so2729279wiv.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Apr 2014 04:00:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397689950-1568-4-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

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

I'll not force the issue, but if you wanted to do this more succinctly
you could also do:

  case TPS65090_REG_INTR_MASK ... TPS65090_REG_INTR_MASK:
  case TPS65090_REG_CG_CTRL0  ... TPS65090_REG_CG_CTRL5:

or

  if (reg >=3D TPS65090_REG_INTR_MASK && reg <=3D TPS65090_REG_CG_CTRL5=
)

Ect.

Otherwise patch looks fine:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
