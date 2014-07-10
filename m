From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 08/24] mfd: max77686: Add Dynamic Voltage Scaling (DVS) support
Date: Thu, 10 Jul 2014 11:46:20 +0200
Message-ID: <CACRpkdYs93snBFYZMKN6kd==b9jZehnp1eHV5bHaBNsNRt62pQ@mail.gmail.com>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
	<1404505467-26526-9-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404505467-26526-9-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Jones <rob.jones-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 4, 2014 at 10:24 PM, Javier Martinez Canillas
<javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:

> Some regulators on the MAX77686 PMIC have Dynamic Voltage Scaling
> (DVS) support that allows output voltage to change dynamically.
>
> For MAX77686, these regulators are Buck regulators 2, 3 and 4.
>
> Each Buck output voltage is selected using a set of external
> inputs: DVS1-3 and SELB2-4.
>
> DVS registers can be used to configure the output voltages for each
> Buck regulator and which one is active is controled by DVSx lines.
>
> SELBx lines are used to control if individual Buck lines are ON or OFF.
>
> This patch adds support to configure the DVSx and SELBx lines
> from DT and to setup and read the GPIO lines connected to them.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

(...)
> +#include <linux/gpio/consumer.h>

THANKS for using modern interfaces!

> +static void max77686_dt_parse_dvs_gpio(struct device *dev)
> +{
> +       struct max77686_platform_data *pd = dev_get_platdata(dev);
> +       int i;
> +
> +       /*
> +        * NOTE: we don't consider GPIO errors fatal; board may have some lines
> +        * directly pulled high or low and thus doesn't specify them.
> +        */
> +       for (i = 0; i < ARRAY_SIZE(pd->buck_gpio_dvs); i++)
> +               pd->buck_gpio_dvs[i] =
> +                       devm_gpiod_get_index(dev, "max77686,pmic-buck-dvs", i);
> +
> +       for (i = 0; i < ARRAY_SIZE(pd->buck_gpio_selb); i++)
> +               pd->buck_gpio_selb[i] =
> +                       devm_gpiod_get_index(dev, "max77686,pmic-buck-selb", i);
> +}

Rob Jones has a patch cooking that adds gpio_get_array() so this thing
merits also adding devm_gpiod_get_array() I think?

> +/**
> + * max77686_setup_gpios() - init DVS-related GPIOs
> + * @dev: device whose platform data contains the dvs GPIOs information
> + *
> + * This function claims / initalizations GPIOs related to DVS if they are
> + * defined. This may have the effect of switching voltages if the
> + * pdata->buck_default_idx does not match the boot time state of pins.
> + */
> +int max77686_setup_gpios(struct device *dev)
> +{
> +       struct max77686_platform_data *pd = dev_get_platdata(dev);
> +       int buck_default_idx = pd->buck_default_idx;
> +       int ret;
> +       int i;
> +
> +       /* Set all SELB high to avoid glitching while DVS is changing */
> +       for (i = 0; i < ARRAY_SIZE(pd->buck_gpio_selb); i++) {
> +               struct gpio_desc *gpio = pd->buck_gpio_selb[i];
> +
> +               /* OK if some GPIOs aren't defined */
> +               if (IS_ERR(gpio))
> +                       continue;
> +
> +               ret = gpiod_direction_output_raw(gpio, 1);

Why does this have to be raw? Usually that is not to be used.

Apart from this it looks OK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
