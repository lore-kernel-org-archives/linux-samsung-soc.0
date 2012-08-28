From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] gpio: samsung: add devicetree init for s3c24xx arches
Date: Tue, 28 Aug 2012 16:09:37 -0700
Message-ID: <503D4FB1.1020206@samsung.com>
References: <201208282355.44268.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <201208282355.44268.heiko@sntech.de>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@stericsson.com>, Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/28/12 14:55, Heiko St=C3=BCbner wrote:
> Until now the Exynos-SoC was the only Samsung-SoC supporting the GPIO=
s
> via the device tree. This patch implements dt-support for the
> s3c24xx arches.
>
> The controllers contain only 3 cells, as the underlying gpio controll=
er
> does not support controlling the drive strength on a gpio level.
>
> Tested with the gpio-keys driver on a s3c2416 based machine.
>
> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> Reviewed-by: Thomas Abraham<thomas.abraham@linaro.org>

Yeah, looks good to me...

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

BTW, I'm not sure when we can support device tree for S3C24XX :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
> changes since v1:
> update bindings documentation to address SoC specific issues
>
>   .../devicetree/bindings/gpio/gpio-samsung.txt      |   43 +++++++++=
++++
>   drivers/gpio/gpio-samsung.c                        |   63 +++++++++=
+++++++++++
>   2 files changed, 106 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-samsung.txt =
b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
> index 5375625..f1e5dfe 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
> @@ -39,3 +39,46 @@ Example:
>   		#gpio-cells =3D<4>;
>   		gpio-controller;
>   	};
> +
> +
> +Samsung S3C24XX GPIO Controller
> +
> +Required properties:
> +- compatible: Compatible property value should be "samsung,s3c24xx-g=
pio".
> +
> +- reg: Physical base address of the controller and length of memory =
mapped
> +  region.
> +
> +- #gpio-cells: Should be 3. The syntax of the gpio specifier used by=
 client nodes
> +  should be the following with values derived from the SoC user manu=
al.
> +<[phandle of the gpio controller node]
> +      [pin number within the gpio controller]
> +      [mux function]
> +      [flags and pull up/down]
> +
> +  Values for gpio specifier:
> +  - Pin number: depending on the controller a number from 0 up to 15=
=2E
> +  - Mux function: Depending on the SoC and the gpio bank the gpio ca=
n be set
> +                  as input, output or a special function
> +  - Flags and Pull Up/Down: the values to use differ for the individ=
ual SoCs
> +                    example S3C2416/S3C2450:
> +                            0 - Pull Up/Down Disabled.
> +                            1 - Pull Down Enabled.
> +                            2 - Pull Up Enabled.
> +          Bit 16 (0x00010000) - Input is active low.
> +  Consult the user manual for the correct values of Mux and Pull Up/=
Down.
> +
> +- gpio-controller: Specifies that the node is a gpio controller.
> +- #address-cells: should be 1.
> +- #size-cells: should be 1.
> +
> +Example:
> +
> +	gpa: gpio-controller@56000000 {
> +		#address-cells =3D<1>;
> +		#size-cells =3D<1>;
> +		compatible =3D "samsung,s3c24xx-gpio";
> +		reg =3D<0x56000000 0x10>;
> +		#gpio-cells =3D<3>;
> +		gpio-controller;
> +	};
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.=
c
> index ba126cc..54f6663 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -938,6 +938,67 @@ static void __init samsung_gpiolib_add(struct sa=
msung_gpio_chip *chip)
>   		s3c_gpiolib_track(chip);
>   }
>
> +#if defined(CONFIG_PLAT_S3C24XX)&&  defined(CONFIG_OF)
> +static int s3c24xx_gpio_xlate(struct gpio_chip *gc,
> +			const struct of_phandle_args *gpiospec, u32 *flags)
> +{
> +	unsigned int pin;
> +
> +	if (WARN_ON(gc->of_gpio_n_cells<  3))
> +		return -EINVAL;
> +
> +	if (WARN_ON(gpiospec->args_count<  gc->of_gpio_n_cells))
> +		return -EINVAL;
> +
> +	if (gpiospec->args[0]>  gc->ngpio)
> +		return -EINVAL;
> +
> +	pin =3D gc->base + gpiospec->args[0];
> +
> +	if (s3c_gpio_cfgpin(pin, S3C_GPIO_SFN(gpiospec->args[1])))
> +		pr_warn("gpio_xlate: failed to set pin function\n");
> +	if (s3c_gpio_setpull(pin, gpiospec->args[2]&  0xffff))
> +		pr_warn("gpio_xlate: failed to set pin pull up/down\n");
> +
> +	if (flags)
> +		*flags =3D gpiospec->args[2]>>  16;
> +
> +	return gpiospec->args[0];
> +}
> +
> +static const struct of_device_id s3c24xx_gpio_dt_match[] __initdata =
=3D {
> +	{ .compatible =3D "samsung,s3c24xx-gpio", },
> +	{}
> +};
> +
> +static __init void s3c24xx_gpiolib_attach_ofnode(struct samsung_gpio=
_chip *chip,
> +						 u64 base, u64 offset)
> +{
> +	struct gpio_chip *gc =3D&chip->chip;
> +	u64 address;
> +
> +	if (!of_have_populated_dt())
> +		return;
> +
> +	address =3D chip->base ? base + ((u32)chip->base&  0xfff) : base + =
offset;
> +	gc->of_node =3D of_find_matching_node_by_address(NULL,
> +			s3c24xx_gpio_dt_match, address);
> +	if (!gc->of_node) {
> +		pr_info("gpio: device tree node not found for gpio controller"
> +			" with base address %08llx\n", address);
> +		return;
> +	}
> +	gc->of_gpio_n_cells =3D 3;
> +	gc->of_xlate =3D s3c24xx_gpio_xlate;
> +}
> +#elif defined(CONFIG_PLAT_S3C24XX)
> +static __init void s3c24xx_gpiolib_attach_ofnode(struct samsung_gpio=
_chip *chip,
> +						 u64 base, u64 offset)
> +{
> +	return;
> +}
> +#endif /* defined(CONFIG_PLAT_S3C24XX)&&  defined(CONFIG_OF) */
> +
>   static void __init s3c24xx_gpiolib_add_chips(struct samsung_gpio_ch=
ip *chip,
>   					     int nr_chips, void __iomem *base)
>   {
> @@ -962,6 +1023,8 @@ static void __init s3c24xx_gpiolib_add_chips(str=
uct samsung_gpio_chip *chip,
>   			gc->direction_output =3D samsung_gpiolib_2bit_output;
>
>   		samsung_gpiolib_add(chip);
> +
> +		s3c24xx_gpiolib_attach_ofnode(chip, S3C24XX_PA_GPIO, i * 0x10);
>   	}
>   }
>
