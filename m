From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 02/24] mfd: max77686: Add power management support
Date: Fri, 18 Jul 2014 09:17:24 +0100
Message-ID: <20140718081724.GL30888@lee--X1>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404505467-26526-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1404505467-26526-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 04 Jul 2014, Javier Martinez Canillas wrote:

> The driver doesn't have PM operations defined so add a suspend
> and resume function handlers to allow the PMIC IRQ to wakeup
> the system when it is put into a sleep state.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/max77686.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Applied now, thanks.

> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index 3cb41d0..a38e9ee 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -240,10 +240,50 @@ static const struct i2c_device_id max77686_i2c_=
id[] =3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, max77686_i2c_id);
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static int max77686_suspend(struct device *dev)
> +{
> +	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct max77686_dev *max77686 =3D i2c_get_clientdata(i2c);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(max77686->irq);
> +
> +	/*
> +	 * IRQ must be disabled during suspend because if it happens
> +	 * while suspended it will be handled before resuming I2C.
> +	 *
> +	 * When device is woken up from suspend (e.g. by RTC wake alarm),
> +	 * an interrupt occurs before resuming I2C bus controller.
> +	 * Interrupt handler tries to read registers but this read
> +	 * will fail because I2C is still suspended.
> +	 */
> +	disable_irq(max77686->irq);
> +
> +	return 0;
> +}
> +
> +static int max77686_resume(struct device *dev)
> +{
> +	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct max77686_dev *max77686 =3D i2c_get_clientdata(i2c);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(max77686->irq);
> +
> +	enable_irq(max77686->irq);
> +
> +	return 0;
> +}
> +#endif /* CONFIG_PM_SLEEP */
> +
> +static SIMPLE_DEV_PM_OPS(max77686_pm, max77686_suspend, max77686_res=
ume);
> +
>  static struct i2c_driver max77686_i2c_driver =3D {
>  	.driver =3D {
>  		   .name =3D "max77686",
>  		   .owner =3D THIS_MODULE,
> +		   .pm =3D &max77686_pm,
>  		   .of_match_table =3D of_match_ptr(max77686_pmic_dt_match),
>  	},
>  	.probe =3D max77686_i2c_probe,

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
