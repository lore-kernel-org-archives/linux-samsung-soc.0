From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/7] mfd: max77693: Fix possible NULL pointer dereference
 on i2c_new_dummy error
Date: Tue, 11 Feb 2014 12:22:49 +0000
Message-ID: <20140211122249.GS32042@lee--X1>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
 <1392113015-11180-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392113015-11180-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 11 Feb 2014, Krzysztof Kozlowski wrote:

> During probe the driver allocates dummy I2C devices for MUIC and hapt=
ic
> with i2c_new_dummy() but it does not check the return value of this
> calls.
>=20
> In case of error (i2c_new_device(): memory allocation failure or I2C
> address cannot be used) this function returns NULL which is later use=
d
> by devm_regmap_init_i2c() and i2c_unregister_device().
>=20
> If i2c_new_dummy() fails for MUIC or haptic devices, fail also the pr=
obe
> for main MFD driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mfd/max77693.c |   12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index e0859987ab6b..c5535f018466 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -148,9 +148,18 @@ static int max77693_i2c_probe(struct i2c_client =
*i2c,
>  		dev_info(max77693->dev, "device ID: 0x%x\n", reg_data);
> =20
>  	max77693->muic =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_MUIC);
> +	if (!max77693->muic) {
> +		dev_err(max77693->dev, "Failed to allocate I2C device for MUIC\n")=
;
> +		return -ENODEV;
> +	}
>  	i2c_set_clientdata(max77693->muic, max77693);
> =20
>  	max77693->haptic =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_HAPTIC);
> +	if (!max77693->haptic) {
> +		dev_err(max77693->dev, "Failed to allocate I2C device for Haptic\n=
");
> +		ret =3D -ENODEV;
> +		goto err_i2c_haptic;
> +	}
>  	i2c_set_clientdata(max77693->haptic, max77693);
> =20
>  	/*
> @@ -184,8 +193,9 @@ err_mfd:
>  	max77693_irq_exit(max77693);
>  err_irq:
>  err_regmap_muic:
> -	i2c_unregister_device(max77693->muic);
>  	i2c_unregister_device(max77693->haptic);
> +err_i2c_haptic:
> +	i2c_unregister_device(max77693->muic);
>  	return ret;
>  }
> =20

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
