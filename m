From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 6/7] mfd: max8997: Fix possible NULL pointer dereference
 on i2c_new_dummy error
Date: Tue, 11 Feb 2014 12:23:31 +0000
Message-ID: <20140211122331.GU32042@lee--X1>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
 <1392113015-11180-6-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:39484 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbaBKMXh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 07:23:37 -0500
Received: by mail-wi0-f177.google.com with SMTP id e4so4128491wiv.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2014 04:23:36 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392113015-11180-6-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org

On Tue, 11 Feb 2014, Krzysztof Kozlowski wrote:

> During probe the driver allocates dummy I2C devices for RTC, haptic a=
nd
> MUIC with i2c_new_dummy() but it does not check the return value of t=
his
> calls.
>=20
> In case of error (i2c_new_device(): memory allocation failure or I2C
> address cannot be used) this function returns NULL which is later use=
d
> by i2c_unregister_device().
>=20
> If i2c_new_dummy() fails for RTC, haptic or MUIC devices, fail also t=
he
> probe for main MFD driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mfd/max8997.c |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
> index be88a3bf7b85..3ffc11dfc3b6 100644
> --- a/drivers/mfd/max8997.c
> +++ b/drivers/mfd/max8997.c
> @@ -208,10 +208,26 @@ static int max8997_i2c_probe(struct i2c_client =
*i2c,
>  	mutex_init(&max8997->iolock);
> =20
>  	max8997->rtc =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_RTC);
> +	if (!max8997->rtc) {
> +		dev_err(max8997->dev, "Failed to allocate I2C device for RTC\n");
> +		return -ENODEV;
> +	}
>  	i2c_set_clientdata(max8997->rtc, max8997);
> +
>  	max8997->haptic =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_HAPTIC);
> +	if (!max8997->haptic) {
> +		dev_err(max8997->dev, "Failed to allocate I2C device for Haptic\n"=
);
> +		ret =3D -ENODEV;
> +		goto err_i2c_haptic;
> +	}
>  	i2c_set_clientdata(max8997->haptic, max8997);
> +
>  	max8997->muic =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_MUIC);
> +	if (!max8997->muic) {
> +		dev_err(max8997->dev, "Failed to allocate I2C device for MUIC\n");
> +		ret =3D -ENODEV;
> +		goto err_i2c_muic;
> +	}
>  	i2c_set_clientdata(max8997->muic, max8997);
> =20
>  	pm_runtime_set_active(max8997->dev);
> @@ -239,7 +255,9 @@ static int max8997_i2c_probe(struct i2c_client *i=
2c,
>  err_mfd:
>  	mfd_remove_devices(max8997->dev);
>  	i2c_unregister_device(max8997->muic);
> +err_i2c_muic:
>  	i2c_unregister_device(max8997->haptic);
> +err_i2c_haptic:
>  	i2c_unregister_device(max8997->rtc);
>  	return ret;
>  }

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
