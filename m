From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v6 08/23] mfd: max77686: Add Dynamic Voltage Scaling (DVS)
 support
Date: Fri, 04 Jul 2014 13:32:57 +0200
Message-ID: <53B690E9.4000003@collabora.co.uk>
References: <1404467722-26687-1-git-send-email-javier.martinez@collabora.co.uk> <1404467722-26687-9-git-send-email-javier.martinez@collabora.co.uk> <1404472510.14069.6.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404472510.14069.6.camel@AMDC1943>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

Again, thanks a lot for taking the time to review the series.

On 07/04/2014 01:15 PM, Krzysztof Kozlowski wrote:
> On pi=C4=85, 2014-07-04 at 11:55 +0200, Javier Martinez Canillas wrot=
e:
>> Some regulators on the MAX77686 PMIC have Dynamic Voltage Scaling
>> (DVS) support that allows output voltage to change dynamically.
>>=20
>> For MAX77686, these regulators are Buck regulators 2, 3 and 4.
>>=20
>> Each Buck output voltage is selected using a set of external
>> inputs: DVS1-3 and SELB2-4.
>>=20
>> DVS registers can be used to configure the output voltages for each
>> Buck regulator and which one is active is controled by DVSx lines.
>>=20
>> SELBx lines are used to control if individual Buck lines are ON or O=
=46F.
>>=20
>> This patch adds support to configure the DVSx and SELBx lines
>> from DT and to setup and read the GPIO lines connected to them.
>>=20
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.c=
o.uk>
>> ---
>>  drivers/mfd/max77686.c       | 115 ++++++++++++++++++++++++++++++++=
+++++++++++
>>  include/linux/mfd/max77686.h |  18 ++++---
>>  2 files changed, 125 insertions(+), 8 deletions(-)
>=20
> One minor comment below, but overall looks good to me:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>=20
>=20
>> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
>> index 8650832..648d564 100644
>> --- a/drivers/mfd/max77686.c
>> +++ b/drivers/mfd/max77686.c
>> @@ -32,8 +32,10 @@
>>  #include <linux/mfd/core.h>
>>  #include <linux/mfd/max77686.h>
>>  #include <linux/mfd/max77686-private.h>
>> +#include <linux/gpio/consumer.h>
>>  #include <linux/err.h>
>>  #include <linux/of.h>
>> +#include <linux/export.h>
>> =20
>>  #define I2C_ADDR_RTC	(0x0C >> 1)
>> =20
>> @@ -101,9 +103,115 @@ static const struct of_device_id max77686_pmic=
_dt_match[] =3D {
>>  	{},
>>  };
>> =20
>> +static void max77686_dt_parse_dvs_gpio(struct device *dev)
>> +{
>> +	struct max77686_platform_data *pd =3D dev_get_platdata(dev);
>> +	int i;
>> +
>> +	/*
>> +	 * NOTE: we don't consider GPIO errors fatal; board may have some =
lines
>> +	 * directly pulled high or low and thus doesn't specify them.
>> +	 */
>> +	for (i =3D 0; i < ARRAY_SIZE(pd->buck_gpio_dvs); i++)
>> +		pd->buck_gpio_dvs[i] =3D
>> +			devm_gpiod_get_index(dev, "max77686,pmic-buck-dvs", i);
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(pd->buck_gpio_selb); i++)
>> +		pd->buck_gpio_selb[i] =3D
>> +			devm_gpiod_get_index(dev, "max77686,pmic-buck-selb", i);
>> +}
>> +
>> +/**
>> + * max77686_setup_gpios - init DVS-related GPIOs
>> + *
>> + * This function claims / initalizations GPIOs related to DVS if th=
ey are
>> + * defined. This may have the effect of switching voltages if the
>> + * pdata->buck_default_idx does not match the boot time state of pi=
ns.
>> + */
>> +int max77686_setup_gpios(struct device *dev)
>> +{
>> +	struct max77686_platform_data *pd =3D dev_get_platdata(dev);
>> +	int buck_default_idx =3D pd->buck_default_idx;
>> +	int ret;
>> +	int i;
>> +
>> +	/* Set all SELB high to avoid glitching while DVS is changing */
>> +	for (i =3D 0; i < ARRAY_SIZE(pd->buck_gpio_selb); i++) {
>> +		struct gpio_desc *gpio =3D pd->buck_gpio_selb[i];
>> +
>> +		/* OK if some GPIOs aren't defined */
>> +		if (IS_ERR(gpio))
>> +			continue;
>> +
>> +		ret =3D gpiod_direction_output_raw(gpio, 1);
>> +		if (ret) {
>> +			dev_err(dev, "can't set gpio[%d] dir: %d\n", i, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/* Set our initial setting */
>> +	for (i =3D 0; i < ARRAY_SIZE(pd->buck_gpio_dvs); i++) {
>> +		struct gpio_desc *gpio =3D pd->buck_gpio_dvs[i];
>> +
>> +		/* OK if some GPIOs aren't defined */
>> +		if (IS_ERR(gpio))
>> +			continue;
>> +
>> +		/* If a GPIO is valid, set it */
>> +		gpiod_direction_output(gpio, (buck_default_idx >> i) & 1);
>> +		if (ret) {
>> +			dev_err(dev, "can't set gpio[%d]: dir %d\n", i, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/* Now set SELB low to take effect */
>> +	for (i =3D 0; i < ARRAY_SIZE(pd->buck_gpio_selb); i++) {
>> +		struct gpio_desc *gpio =3D pd->buck_gpio_selb[i];
>> +
>> +		if (!IS_ERR(gpio))
>> +			gpiod_set_value(gpio, 0);
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(max77686_setup_gpios);
>> +
>> +/**
>> + * max77686_read_gpios - read the current state of the dvs GPIOs
>> + *
>> + * We call this function at bootup to detect what slot the firmware=
 was
>> + * using for the DVS GPIOs.  That way we can properly preserve the =
firmware's
>> + * voltage settings
>> + */
>> +int max77686_read_gpios(struct max77686_platform_data *pdata)
>> +{
>=20
> Can you document that this function can sleep? It is quite obvious bu=
t
> the function is exported so maybe it is worth noting.
>=20

Sure, I'll add that to the comment.

> Best regards,
> Krzysztof
>=20

Best regards,
Javier

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
