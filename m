From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: add samsung pinctrl and gpiolib driver
Date: Fri, 1 Jun 2012 09:36:17 +0800
Message-ID: <CACRpkdZDnFW4-bDsHN5BOr2e5NLGzouSBY7ngf-VsoPn-SyxAA@mail.gmail.com>
References: <1337816857-14694-1-git-send-email-thomas.abraham@linaro.org>
	<1337816857-14694-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1337816857-14694-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org, ext Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 24, 2012 at 7:47 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt

It would be nice if some DT person could review the bindings, but if
nothing happens
I will accept them as-is.

This driver is special since it seems to keep all pin, group and
function information
in the device tree, but not like Tony is doing it in pinctrl-simple,
if I understand
correctly?

> diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinc=
trl-samsung.c
> new file mode 100644
> index 0000000..480e2f0
(...)
> +/* reading pin pull up/down and driver strength settings not impleme=
nted */
> +static int samsung_pinconf_get(struct pinctrl_dev *pctldev, unsigned=
 int pin,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 unsigned long *config)
> +{
> + =A0 =A0 =A0 return -ENOTSUPP;
> +}
> +
> +/* reading pin pull up/down and driver strength settings not impleme=
nted */
> +static int samsung_pinconf_group_get(struct pinctrl_dev *pctldev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigne=
d int group, unsigned long *config)
> +{
> + =A0 =A0 =A0 return -ENOTSUPP;
> +}

I think we made these optional now, so you can just leave them undefine=
d
in the pinconf_ops.

> +static inline struct samsung_pinctrl_drv_data *samsung_pinctrl_get_d=
river_data(
> +                               struct platform_device *pdev)
> +{
> +#ifdef CONFIG_OF
> +       if (pdev->dev.of_node) {
> +               int id;
> +               const struct of_device_id *match;
> +               const struct device_node *node =3D pdev->dev.of_node;
> +
> +               id =3D of_alias_get_id(pdev->dev.of_node, "pinctrl");
> +               if (id < 0) {
> +                       dev_err(&pdev->dev, "failed to get alias id\n=
");
> +                       return NULL;
> +               }
> +               match =3D of_match_node(samsung_pinctrl_dt_match, nod=
e);
> +               return (struct samsung_pinctrl_drv_data *)match->data=
 + id;
> +       }
> +#endif

You don't need this #ifdef because in Kconfig the driver already depend=
s on
OF so this is always available.

> +/* driver data for various samsung soc's */
> +#ifdef CONFIG_CPU_EXYNOS4210
> +#define EXYNOS4210_PCTRL_DRVDATA (&exynos4210_pinctrl_drv_data)
> +#else
> +#define EXYNOS4210_PCTRL_DRVDATA (NULL)
> +#endif /* CONFIG_CPU_EXYNOS4210 */

Can you do this in some .h file instead?

> +#ifdef CONFIG_OF

You don't need this because in Kconfig the driver depends on OF
already.

> +static const struct of_device_id samsung_pinctrl_dt_match[] =3D {
> +#ifdef CONFIG_CPU_EXYNOS4210
> + =A0 =A0 =A0 { .compatible =3D "samsung,pinctrl-exynos4210",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =3D (void *)exynos4210_pinctrl_dr=
v_data },
> +#endif /* CONFIG_CPU_EXYNOS4210 */
> + =A0 =A0 =A0 {},
> +};
> +MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
> +#endif /* CONFIG_OF */

So delete the closing #endif too.

Yours,
Linus Walleij
