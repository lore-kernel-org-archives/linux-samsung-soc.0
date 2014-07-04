From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v6 06/23] mfd: max77686: Make error checking consistent
Date: Fri, 04 Jul 2014 12:54:05 +0200
Message-ID: <1404471245.14069.1.camel@AMDC1943>
References: <1404467722-26687-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404467722-26687-7-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17067 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752990AbaGDKyH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 06:54:07 -0400
In-reply-to: <1404467722-26687-7-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On pi=C4=85, 2014-07-04 at 11:55 +0200, Javier Martinez Canillas wrote:
> Error checking across the driver is mostly consistent besides
> a few exceptions, so change these exceptions for consistency.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>  drivers/mfd/max77686.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index ada4976..87fe52e 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -134,7 +134,7 @@ static int max77686_i2c_probe(struct i2c_client *=
i2c,
> =20
>  	max77686 =3D devm_kzalloc(&i2c->dev,
>  				sizeof(struct max77686_dev), GFP_KERNEL);
> -	if (max77686 =3D=3D NULL)
> +	if (!max77686)
>  		return -ENOMEM;
> =20
>  	i2c_set_clientdata(i2c, max77686);
> @@ -153,8 +153,8 @@ static int max77686_i2c_probe(struct i2c_client *=
i2c,
>  		return ret;
>  	}
> =20
> -	if (regmap_read(max77686->regmap,
> -			 MAX77686_REG_DEVICE_ID, &data) < 0) {
> +	ret =3D regmap_read(max77686->regmap, MAX77686_REG_DEVICE_ID, &data=
);
> +	if (ret < 0) {
>  		dev_err(max77686->dev,
>  			"device not found on this channel (this is not an error)\n");
>  		return -ENODEV;
> @@ -180,7 +180,7 @@ static int max77686_i2c_probe(struct i2c_client *=
i2c,
>  				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
>  				  IRQF_SHARED, 0, &max77686_irq_chip,
>  				  &max77686->irq_data);
> -	if (ret !=3D 0) {
> +	if (ret) {
>  		dev_err(&i2c->dev, "failed to add PMIC irq chip: %d\n", ret);
>  		goto err_unregister_i2c;
>  	}
> @@ -188,7 +188,7 @@ static int max77686_i2c_probe(struct i2c_client *=
i2c,
>  				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
>  				  IRQF_SHARED, 0, &max77686_rtc_irq_chip,
>  				  &max77686->rtc_irq_data);
> -	if (ret !=3D 0) {
> +	if (ret) {
>  		dev_err(&i2c->dev, "failed to add RTC irq chip: %d\n", ret);
>  		goto err_del_irqc;
>  	}
