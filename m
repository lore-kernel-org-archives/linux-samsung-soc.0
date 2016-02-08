From: Youngmin Nam <ym0914@gmail.com>
Subject: Re: [PATCH v3] pinctrl: samsung: Fixes
 samsung_gpio_direction_in/output releated with spinlock
Date: Tue, 9 Feb 2016 00:17:33 +0900
Message-ID: <56B8B18D.3000300@gmail.com>
References: <1454943259-5486-1-git-send-email-ym0914@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34437 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753801AbcBHPRi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Feb 2016 10:17:38 -0500
Received: by mail-pf0-f194.google.com with SMTP id 71so3709293pfv.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Feb 2016 07:17:38 -0800 (PST)
In-Reply-To: <1454943259-5486-1-git-send-email-ym0914@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tomasz.figa@gmail.com, linus.walleij@linaro.org
Cc: k.kozlowski@samsung.com, kgene@kernel.org, thomas.ab@samsung.com, linux-samsung-soc@vger.kernel.org

Hello tomasz and linus,

I got to know that below my v3 patch has build error now.

I will fix it and resend.

Thanks.

On 2016=EB=85=84 02=EC=9B=94 08=EC=9D=BC 23:54, Youngmin Nam wrote:
> Previously, samsung_gpio_drection_in/output function were not covered=
 with
> one spinlock.
>=20
> For example, samsung_gpio_direction_output function consists of two f=
unctions.
> 1. samsung_gpio_set
> 2. samsung_gpio_set_direction
>=20
> When 2 CPUs try to control the same gpio pin heavily,
> (situation like i2c control with gpio emulation)
> This situation can cause below problem.
>=20
> CPU 0                                   | CPU1
>                                         |
> samsung_gpio_direction_output           |
>    samsung_gpio_set(pin A as 1)         | samsung_gpio_direction_outp=
ut
>                                         |    samsung_gpio_set(pin A a=
s 0)
>    samsung_gpio_set_direction           |
>                                         |    samsung_gpio_set_directi=
on
>=20
> The initial value of pin A will be set as 0 while we wanted to set pi=
n A as 1.
>=20
> This patch modifies samsung_gpio_direction_in/output function
> to be done in one spinlock to fix race condition.
>=20
> Additionally, the new samsung_gpio_set_value was added to implement
> gpio set callback(samsung_gpio_set) with spinlock using this function=
=2E
>=20
> Signed-off-by: Youngmin Nam <ym0914@gmail.com>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 48 +++++++++++++++++++++=
+---------
>  1 file changed, 35 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinc=
trl/samsung/pinctrl-samsung.c
> index f67b1e9..38142c2 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -514,25 +514,35 @@ static const struct pinconf_ops samsung_pinconf=
_ops =3D {
>  	.pin_config_group_set	=3D samsung_pinconf_group_set,
>  };
> =20
> -/* gpiolib gpio_set callback function */
> -static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, =
int value)
> +/*
> + * The samsung_gpio_set_vlaue() should be called with "bank->slock" =
held
> + * to avoid race condition.
> + */
> +static void samsung_gpio_set_value(struct gpio_chip *gc,
> +					  unsigned offset, int value)
>  {
>  	struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
>  	const struct samsung_pin_bank_type *type =3D bank->type;
> -	unsigned long flags;
>  	void __iomem *reg;
>  	u32 data;
> =20
>  	reg =3D bank->drvdata->virt_base + bank->pctl_offset;
> =20
> -	spin_lock_irqsave(&bank->slock, flags);
> -
>  	data =3D readl(reg + type->reg_offset[PINCFG_TYPE_DAT]);
>  	data &=3D ~(1 << offset);
>  	if (value)
>  		data |=3D 1 << offset;
>  	writel(data, reg + type->reg_offset[PINCFG_TYPE_DAT]);
> +}
> =20
> +/* gpiolib gpio_set callback function */
> +static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, =
int value)
> +{
> +	struct samsung_pin_bank *bank =3D gc_to_pin_bank(gc);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&bank->slock, flags);
> +	samsung_gpio_set_value(gc, offset, value);
>  	spin_unlock_irqrestore(&bank->slock, flags);
>  }
> =20
> @@ -553,6 +563,8 @@ static int samsung_gpio_get(struct gpio_chip *gc,=
 unsigned offset)
>  }
> =20
>  /*
> + * The samsung_gpio_set_direction() should be called with "bank->slo=
ck" held
> + * to avoid race condition.
>   * The calls to gpio_direction_output() and gpio_direction_input()
>   * leads to this function call.
>   */
> @@ -564,7 +576,6 @@ static int samsung_gpio_set_direction(struct gpio=
_chip *gc,
>  	struct samsung_pinctrl_drv_data *drvdata;
>  	void __iomem *reg;
>  	u32 data, mask, shift;
> -	unsigned long flags;
> =20
>  	bank =3D gpiochip_get_data(gc);
>  	type =3D bank->type;
> @@ -581,31 +592,42 @@ static int samsung_gpio_set_direction(struct gp=
io_chip *gc,
>  		reg +=3D 4;
>  	}
> =20
> -	spin_lock_irqsave(&bank->slock, flags);
> -
>  	data =3D readl(reg);
>  	data &=3D ~(mask << shift);
>  	if (!input)
>  		data |=3D FUNC_OUTPUT << shift;
>  	writel(data, reg);
> =20
> -	spin_unlock_irqrestore(&bank->slock, flags);
> -
>  	return 0;
>  }
> =20
>  /* gpiolib gpio_direction_input callback function. */
>  static int samsung_gpio_direction_input(struct gpio_chip *gc, unsign=
ed offset)
>  {
> -	return samsung_gpio_set_direction(gc, offset, true);
> +	struct samsung_pin_bank *bank =3D gc_to_pin_bank(gc);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&bank->slock, flags);
> +	ret =3D samsung_gpio_set_direction(gc, offset, true);
> +	spin_unlock_irqrestore(&bank->slock, flags);
> +	return ret;
>  }
> =20
>  /* gpiolib gpio_direction_output callback function. */
>  static int samsung_gpio_direction_output(struct gpio_chip *gc, unsig=
ned offset,
>  							int value)
>  {
> -	samsung_gpio_set(gc, offset, value);
> -	return samsung_gpio_set_direction(gc, offset, false);
> +	struct samsung_pin_bank *bank =3D gc_to_pin_bank(gc);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&bank->slock, flags);
> +	samsung_gpio_set_value(gc, offset, value);
> +	ret =3D samsung_gpio_set_direction(gc, offset, false);
> +	spin_unlock_irqrestore(&bank->slock, flags);
> +
> +	return ret;
>  }
> =20
>  /*
>=20
