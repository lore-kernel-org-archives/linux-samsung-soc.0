From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] i2c: s3c24xx: allow device core to setup default pin configuration
Date: Mon, 4 Mar 2013 15:03:43 +0100
Message-ID: <201303041503.44459.heiko@sntech.de>
References: <1362404573-30406-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:53778 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757090Ab3CDODu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 09:03:50 -0500
In-Reply-To: <1362404573-30406-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com, ben-linux@fluff.org, t.figa@samsung.com, wsa@the-dreams.de

Hi Thomas,

Am Montag, 4. M=E4rz 2013, 14:42:53 schrieb Thomas Abraham:
> With device core now able to setup the default pin configuration,
> the call to devm_pinctrl_get_select_default can be removed. And
> the pin configuration code based on the deprecated Samsung specific
> gpio bindings is also removed.
>=20
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>=20
> Hi Heiko, Tomasz,
>=20
> We have to make a choice on the path forward for pinctrl support
> on Samsung platforms. We have three cases to deal with.
>=20
> A. Samsung platforms without DT support.
> B. Samsung platforms with DT support using old Samsung specific
>    gpio bindings for pin-configuration (s3c24xx and s3x64xx).
> C. Samsung platforms with DT support using using pinctrl based
>    pin-configurations (Exynos4 and Exynos5).
>=20
> For [A], we just let the platform specific callbacks handle the
> pin setup. For [B] and [C], based on Linus Walleij's pin grab
> by device core patch and subsequent discussions with him on the
> mailing list, would it be acceptable that we discontinue support
> for [B] in Samsung SoC device drivers. This will impact your
> current DT work on s3c24xx and s3c64xx platforms. Pinctrl is
> inevitable and we have to migrate to it. Instead of workarounds
> to maintain support for [B], it might be better that we migrate
> s3c24xx and s3c64xx platforms to pinctrl.
>=20
> Please do let us know your opinion on this.

As discusses in the other thread, I'm in favor of going forward this wa=
y and=20
not to invest unnecessary energy in keeping the non-pinctrl stuff alive=
=2E

Pinctrl for at least the s3c2416 [0] is already on my playground-wishli=
st, but=20
I'm still in the process of getting to know it.

So for this patch:
Acked-by: Heiko Stuebner <heiko@sntech.de>


Heiko


[0] in contrast to what the gpio-samsung driver implies, the s3c24xx pi=
n banks=20
are not uniform between SoCs, making this more difficult still :-)


>  drivers/i2c/busses/i2c-s3c2410.c |   67
> +------------------------------------- 1 files changed, 1 insertions(=
+),
> 66 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c
> b/drivers/i2c/busses/i2c-s3c2410.c index f6b880b..703272c 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -37,8 +37,6 @@
>  #include <linux/slab.h>
>  #include <linux/io.h>
>  #include <linux/of_i2c.h>
> -#include <linux/of_gpio.h>
> -#include <linux/pinctrl/consumer.h>
>=20
>  #include <asm/irq.h>
>=20
> @@ -84,8 +82,6 @@ struct s3c24xx_i2c {
>  	struct i2c_adapter	adap;
>=20
>  	struct s3c2410_platform_i2c	*pdata;
> -	int			gpios[2];
> -	struct pinctrl          *pctrl;
>  #ifdef CONFIG_CPU_FREQ
>  	struct notifier_block	freq_transition;
>  #endif
> @@ -856,57 +852,6 @@ static inline void
> s3c24xx_i2c_deregister_cpufreq(struct s3c24xx_i2c *i2c) }
>  #endif
>=20
> -#ifdef CONFIG_OF
> -static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
> -{
> -	int idx, gpio, ret;
> -
> -	if (i2c->quirks & QUIRK_NO_GPIO)
> -		return 0;
> -
> -	for (idx =3D 0; idx < 2; idx++) {
> -		gpio =3D of_get_gpio(i2c->dev->of_node, idx);
> -		if (!gpio_is_valid(gpio)) {
> -			dev_err(i2c->dev, "invalid gpio[%d]: %d\n", idx, gpio);
> -			goto free_gpio;
> -		}
> -		i2c->gpios[idx] =3D gpio;
> -
> -		ret =3D gpio_request(gpio, "i2c-bus");
> -		if (ret) {
> -			dev_err(i2c->dev, "gpio [%d] request failed\n", gpio);
> -			goto free_gpio;
> -		}
> -	}
> -	return 0;
> -
> -free_gpio:
> -	while (--idx >=3D 0)
> -		gpio_free(i2c->gpios[idx]);
> -	return -EINVAL;
> -}
> -
> -static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
> -{
> -	unsigned int idx;
> -
> -	if (i2c->quirks & QUIRK_NO_GPIO)
> -		return;
> -
> -	for (idx =3D 0; idx < 2; idx++)
> -		gpio_free(i2c->gpios[idx]);
> -}
> -#else
> -static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
> -{
> -	return 0;
> -}
> -
> -static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
> -{
> -}
> -#endif
> -
>  /* s3c24xx_i2c_init
>   *
>   * initialise the controller, set the IO lines and frequency
> @@ -1054,15 +999,9 @@ static int s3c24xx_i2c_probe(struct platform_de=
vice
> *pdev) i2c->adap.algo_data =3D i2c;
>  	i2c->adap.dev.parent =3D &pdev->dev;
>=20
> -	i2c->pctrl =3D devm_pinctrl_get_select_default(i2c->dev);
> -
>  	/* inititalise the i2c gpio lines */
> -
> -	if (i2c->pdata->cfg_gpio) {
> +	if (i2c->pdata->cfg_gpio)
>  		i2c->pdata->cfg_gpio(to_platform_device(i2c->dev));
> -	} else if (IS_ERR(i2c->pctrl) && s3c24xx_i2c_parse_dt_gpio(i2c)) {
> -		return -EINVAL;
> -	}
>=20
>  	/* initialise the i2c controller */
>=20
> @@ -1140,10 +1079,6 @@ static int s3c24xx_i2c_remove(struct platform_=
device
> *pdev) i2c_del_adapter(&i2c->adap);
>=20
>  	clk_disable_unprepare(i2c->clk);
> -
> -	if (pdev->dev.of_node && IS_ERR(i2c->pctrl))
> -		s3c24xx_i2c_dt_gpio_free(i2c);
> -
>  	return 0;
>  }
