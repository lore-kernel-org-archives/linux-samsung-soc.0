From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/7] mfd: max77686: Fix possible NULL pointer dereference
 on i2c_new_dummy error
Date: Tue, 11 Feb 2014 12:22:32 +0000
Message-ID: <20140211122232.GR32042@lee--X1>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
 <1392113015-11180-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392113015-11180-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 11 Feb 2014, Krzysztof Kozlowski wrote:

> During probe the driver allocates dummy I2C device for RTC with
> i2c_new_dummy() but it does not check the return value of this call.
>=20
> In case of error (i2c_new_device(): memory allocation failure or I2C
> address cannot be used) this function returns NULL which is later use=
d
> by i2c_unregister_device().
>=20
> If i2c_new_dummy() fails for RTC device, fail also the probe for main
> MFD driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mfd/max77686.c |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index f53d5823a3f7..e5fce765accb 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -121,6 +121,10 @@ static int max77686_i2c_probe(struct i2c_client =
*i2c,
>  		dev_info(max77686->dev, "device found\n");
> =20
>  	max77686->rtc =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_RTC);
> +	if (!max77686->rtc) {
> +		dev_err(max77686->dev, "Failed to allocate I2C device for RTC\n");
> +		return -ENODEV;
> +	}
>  	i2c_set_clientdata(max77686->rtc, max77686);
> =20
>  	max77686_irq_init(max77686);

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
