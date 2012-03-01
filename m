From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] [media] s5p-tv: Add initial DT-support for sii9234
Date: Thu, 1 Mar 2012 08:39:08 +0530
Message-ID: <CAJuYYwRSgHLyWSaAyxAWwdSzUHXRmGTirgi_Wvcsfd89kWDx0g@mail.gmail.com>
References: <1330527107-21222-1-git-send-email-k.lewandowsk@samsung.com>
	<1330527107-21222-2-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330527107-21222-2-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: t.stanislaws@samsung.com, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Karol,

On 29 February 2012 20:21, Karol Lewandowski <k.lewandowsk@samsung.com>=
 wrote:
> Make it possible to instantiate sii9234, HDMI's MHL, from regular
> device tree description.
>
> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0Documentation/devicetree/bindings/i2c/sii9234.txt | =A0 14 +++++++=
+++++++
> =A0drivers/media/video/s5p-tv/sii9234_drv.c =A0 =A0 =A0 =A0 =A0| =A0 =
20 +++++++++++++++++++-
> =A02 files changed, 33 insertions(+), 1 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/i2c/sii9234.t=
xt
>
> diff --git a/Documentation/devicetree/bindings/i2c/sii9234.txt b/Docu=
mentation/devicetree/bindings/i2c/sii9234.txt
> new file mode 100644
> index 0000000..7bb7636
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/sii9234.txt
> @@ -0,0 +1,14 @@
> +* SII 9234
> +

A minimal description about this device would be helpful here.

> +Required properties :
> + - compatible : "sii,9234"

To be more informative, can this be changed to "sil,mhl-9234".

> + - reg =A0 =A0 =A0 =A0: i2c device address
> + - gpio-reset : gpio line used to reset IC
> +
> +Example:
> +
> + =A0 =A0 =A0 mhl@39 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "sii,9234";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x39>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-reset =3D <&gpf3 4 0 0 0>;
> + =A0 =A0 =A0 };
> diff --git a/drivers/media/video/s5p-tv/sii9234_drv.c b/drivers/media=
/video/s5p-tv/sii9234_drv.c
> index 0f31ecc..0a1511a 100644
> --- a/drivers/media/video/s5p-tv/sii9234_drv.c
> +++ b/drivers/media/video/s5p-tv/sii9234_drv.c
> @@ -22,6 +22,8 @@
> =A0#include <linux/pm_runtime.h>
> =A0#include <linux/regulator/machine.h>
> =A0#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
>
> =A0#include <mach/gpio.h>
> =A0#include <plat/gpio-cfg.h>
> @@ -338,7 +340,15 @@ static int __devinit sii9234_probe(struct i2c_cl=
ient *client,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_ctx;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 ctx->gpio_n_reset =3D pdata->gpio_n_reset;
> + =A0 =A0 =A0 if (dev->of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx->gpio_n_reset =3D of_get_named_gpio=
(dev->of_node, "gpio-reset", 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ctx->gpio_n_reset < 0) {

if (gpio_is_valid(ctx->gpio_n_reset)) can be used here.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_power;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 } else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx->gpio_n_reset =3D pdata->gpio_n_res=
et;

linux coding style suggests to have braces for 'else' branch when
braces are used for the 'if' branch.

> +
> =A0 =A0 =A0 =A0ret =3D gpio_request(ctx->gpio_n_reset, "MHL_RST");
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "failed to acquire MHL_RS=
T gpio\n");
> @@ -401,6 +411,13 @@ static int __devexit sii9234_remove(struct i2c_c=
lient *client)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id sii9234_dt_match[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "sii,9234" },
> + =A0 =A0 =A0 { },
> +};
> +MODULE_DEVICE_TABLE(of, sii9234_dt_match);
> +#endif
>
> =A0static const struct i2c_device_id sii9234_id[] =3D {
> =A0 =A0 =A0 =A0{ "SII9234", 0 },
> @@ -413,6 +430,7 @@ static struct i2c_driver sii9234_driver =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "sii9234",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pm =3D &sii9234_pm_ops,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(sii923=
4_dt_match),
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D sii9234_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D __devexit_p(sii9234_remove=
),
> --
> 1.7.8.3
>

Thanks,
Thomas.
