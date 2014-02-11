From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/7] mfd: 88pm860x: Fix I2C device resource leak on
 regmap init fail
Date: Tue, 11 Feb 2014 12:22:05 +0000
Message-ID: <20140211122205.GQ32042@lee--X1>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
 <1392113015-11180-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392113015-11180-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 11 Feb 2014, Krzysztof Kozlowski wrote:

> During probe the driver allocates dummy I2C device for companion chip
> and then allocates a regmap for it. If regmap_init_i2c() fails then t=
he
> I2C driver (allocated with i2c_new_dummy()) is not freed and this
> resource leaks.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mfd/88pm860x-core.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.=
c
> index e456be9a7c67..bcfc9e85b4a0 100644
> --- a/drivers/mfd/88pm860x-core.c
> +++ b/drivers/mfd/88pm860x-core.c
> @@ -1190,6 +1190,7 @@ static int pm860x_probe(struct i2c_client *clie=
nt,
>  			ret =3D PTR_ERR(chip->regmap_companion);
>  			dev_err(&chip->companion->dev,
>  				"Failed to allocate register map: %d\n", ret);
> +			i2c_unregister_device(chip->companion);
>  			return ret;
>  		}
>  		i2c_set_clientdata(chip->companion, chip);

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
