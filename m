From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] mfd: max77686: Add max77802 to I2C device ID table
Date: Tue, 8 Mar 2016 11:24:48 +0700
Message-ID: <20160308042448.GF13692@x1>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455251419-8919-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 12 Feb 2016, Javier Martinez Canillas wrote:

> The max77686 MFD driver supports both the Maxim 77686 and Maxim 77802
> PMICs but only the OF device table contains entries for both devices.
>=20
> The max77802 entry is missing in the I2C device ID table which isn't
> a problem currently since the driver only supports DT but it will be
> needed if the driver is changed to be built as a module since the I2C
> core always reports a I2C modalias uevent so auto-load will not work.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>=20
>  drivers/mfd/max77686.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index d959ebbb2194..1f30c97d6d4e 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -345,6 +345,7 @@ static int max77686_i2c_remove(struct i2c_client =
*i2c)
> =20
>  static const struct i2c_device_id max77686_i2c_id[] =3D {
>  	{ "max77686", TYPE_MAX77686 },
> +	{ "max77802", TYPE_MAX77802 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, max77686_i2c_id);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
