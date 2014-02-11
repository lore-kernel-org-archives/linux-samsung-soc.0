From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/7] mfd: 88pm860x: Fix possible NULL pointer dereference
 on i2c_new_dummy error
Date: Tue, 11 Feb 2014 12:21:46 +0000
Message-ID: <20140211122146.GP32042@lee--X1>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 11 Feb 2014, Krzysztof Kozlowski wrote:

> During probe the driver allocates dummy I2C device for companion chip
> with i2c_new_dummy() but it does not check the return value of this c=
all.
>=20
> In case of error (i2c_new_device(): memory allocation failure or I2C
> address cannot be used) this function returns NULL which is later use=
d
> by regmap_init_i2c().
>=20
> If i2c_new_dummy() fails for companion device, fail also the probe fo=
r
> main MFD driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mfd/88pm860x-core.c |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.=
c
> index c9b1f6422941..e456be9a7c67 100644
> --- a/drivers/mfd/88pm860x-core.c
> +++ b/drivers/mfd/88pm860x-core.c
> @@ -1179,6 +1179,11 @@ static int pm860x_probe(struct i2c_client *cli=
ent,
>  		chip->companion_addr =3D pdata->companion_addr;
>  		chip->companion =3D i2c_new_dummy(chip->client->adapter,
>  						chip->companion_addr);
> +		if (!chip->companion) {
> +			dev_err(&client->dev,
> +				"Failed to allocate I2C companion device\n");
> +			return -ENODEV;
> +		}
>  		chip->regmap_companion =3D regmap_init_i2c(chip->companion,
>  							&pm860x_regmap_config);
>  		if (IS_ERR(chip->regmap_companion)) {

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
