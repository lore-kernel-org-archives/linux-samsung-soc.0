From: Bryan Wu <bryan.wu@canonical.com>
Subject: Re: [PATCH 2/2] leds: Convert S3C24XX LED driver to gpiolib API
Date: Mon, 2 Jul 2012 11:35:38 +0800
Message-ID: <CAK5ve-JRmb93+KVFVfeDbP7i_7n3dN22WcsyLurgAbvkU5e=mA@mail.gmail.com>
References: <1341059426-22693-1-git-send-email-sylvester.nawrocki@gmail.com> <1341059426-22693-2-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f42.google.com ([209.85.213.42]:44719 "EHLO
	mail-yw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751032Ab2GBDf7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Jul 2012 23:35:59 -0400
In-Reply-To: <1341059426-22693-2-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Sat, Jun 30, 2012 at 8:30 PM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> The s3c2410_gpio* calls are obsolete and have been scheduled for
> removal since several kernel releases. Remove them and use common
> gpiolib API instead.
> This patch also adds gpio_request/gpio_free call for API corectness.
>
> It is a prerequisite for removal of the S3C24XX SoC specific
> arch/arm/plat-samsung/include/gpio-fns.h header.
>
> Tested on Micro2440-SDK.
>

Overall, these 2 patches are good. I'm just curious why not we just
use generic led-gpio driver to replace this one.

-Bryan

> Cc: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> ---
>  drivers/leds/leds-s3c24xx.c |   34 ++++++++++++++++++++--------------
>  1 files changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
> index b816ccb..e120640 100644
> --- a/drivers/leds/leds-s3c24xx.c
> +++ b/drivers/leds/leds-s3c24xx.c
> @@ -45,17 +45,19 @@ static void s3c24xx_led_set(struct led_classdev *led_cdev,
>  {
>         struct s3c24xx_gpio_led *led = to_gpio(led_cdev);
>         struct s3c24xx_led_platdata *pd = led->pdata;
> +       int state = (value ? 1 : 0) ^ (pd->flags & S3C24XX_LEDF_ACTLOW);
>
>         /* there will be a short delay between setting the output and
>          * going from output to input when using tristate. */
>
> -       s3c2410_gpio_setpin(pd->gpio, (value ? 1 : 0) ^
> -                           (pd->flags & S3C24XX_LEDF_ACTLOW));
> -
> -       if (pd->flags & S3C24XX_LEDF_TRISTATE)
> -               s3c2410_gpio_cfgpin(pd->gpio,
> -                       value ? S3C2410_GPIO_OUTPUT : S3C2410_GPIO_INPUT);
> +       gpio_set_value(pd->gpio, state);
>
> +       if (pd->flags & S3C24XX_LEDF_TRISTATE) {
> +               if (value)
> +                       gpio_direction_output(pd->gpio, state);
> +               else
> +                       gpio_direction_input(pd->gpio);
> +       }
>  }
>
>  static int s3c24xx_led_remove(struct platform_device *dev)
> @@ -63,6 +65,7 @@ static int s3c24xx_led_remove(struct platform_device *dev)
>         struct s3c24xx_gpio_led *led = pdev_to_gpio(dev);
>
>         led_classdev_unregister(&led->cdev);
> +       gpio_free(led->pdata->gpio);
>
>         return 0;
>  }
> @@ -89,16 +92,19 @@ static int s3c24xx_led_probe(struct platform_device *dev)
>
>         led->pdata = pdata;
>
> +       ret = gpio_request(pdata->gpio, "S3C24XX_LED");
> +       if (ret < 0)
> +               return ret;
> +
>         /* no point in having a pull-up if we are always driving */
>
> -       if (pdata->flags & S3C24XX_LEDF_TRISTATE) {
> -               s3c2410_gpio_setpin(pdata->gpio, 0);
> -               s3c2410_gpio_cfgpin(pdata->gpio, S3C2410_GPIO_INPUT);
> -       } else {
> -               s3c2410_gpio_pullup(pdata->gpio, 0);
> -               s3c2410_gpio_setpin(pdata->gpio, 0);
> -               s3c2410_gpio_cfgpin(pdata->gpio, S3C2410_GPIO_OUTPUT);
> -       }
> +       s3c_gpio_setpull(pdata->gpio, S3C_GPIO_PULL_NONE);
> +
> +       if (pdata->flags & S3C24XX_LEDF_TRISTATE)
> +               gpio_direction_input(pdata->gpio);
> +       else
> +               gpio_direction_output(pdata->gpio,
> +                       pdata->flags & S3C24XX_LEDF_ACTLOW ? 1 : 0);
>
>         /* register our new led device */
>
> --
> 1.7.4.1
>



-- 
Bryan Wu <bryan.wu@canonical.com>
Kernel Developer    +86.186-168-78255 Mobile
Canonical Ltd.      www.canonical.com
Ubuntu - Linux for human beings | www.ubuntu.com
