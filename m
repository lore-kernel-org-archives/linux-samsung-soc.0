From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [RFC PATCH 01/11] devfreq: exynos-bus: Extract exynos_bus_profile_init()
Date: Thu, 25 Jul 2019 21:43:31 +0900
Message-ID: <CAGTfZH0JE0PmiCHaT3vMrDaP0-8eZ3afyHy_zT9aFmMOGNTR8g@mail.gmail.com>
References: <CGME20190723122022eucas1p1266d90873d564894bd852c20140f8474@eucas1p1.samsung.com>
 <20190723122016.30279-1-a.swigon@partner.samsung.com> <20190723122016.30279-2-a.swigon@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723122016.30279-2-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, inki.dae@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>, georgi.djakov@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2019=EB=85=84 7=EC=9B=94 24=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 8:09, A=
rtur =C5=9Awigo=C5=84 <a.swigon@partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> This patch adds a new static function, exynos_bus_profile_init(), extract=
ed
> from exynos_bus_probe().
>
> Signed-off-by: Artur =C5=9Awigo=C5=84 <a.swigon@partner.samsung.com>
> ---
>  drivers/devfreq/exynos-bus.c | 106 ++++++++++++++++++++---------------
>  1 file changed, 60 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index d9f377912c10..d8f1efaf2d49 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -372,12 +372,69 @@ static int exynos_bus_parse_of(struct device_node *=
np,
>         return ret;
>  }
>
> +static int exynos_bus_profile_init(struct exynos_bus *bus,
> +                                  struct devfreq_dev_profile *profile)
> +{
> +       struct device *dev =3D bus->dev;
> +       struct devfreq_simple_ondemand_data *ondemand_data;
> +       int ret;
> +
> +       /* Initialize the struct profile and governor data for parent dev=
ice */
> +       profile->polling_ms =3D 50;
> +       profile->target =3D exynos_bus_target;
> +       profile->get_dev_status =3D exynos_bus_get_dev_status;
> +       profile->exit =3D exynos_bus_exit;
> +
> +       ondemand_data =3D devm_kzalloc(dev, sizeof(*ondemand_data), GFP_K=
ERNEL);
> +       if (!ondemand_data) {
> +               ret =3D -ENOMEM;
> +               goto err;
> +       }
> +       ondemand_data->upthreshold =3D 40;
> +       ondemand_data->downdifferential =3D 5;
> +
> +       /* Add devfreq device to monitor and handle the exynos bus */
> +       bus->devfreq =3D devm_devfreq_add_device(dev, profile,
> +                                               DEVFREQ_GOV_SIMPLE_ONDEMA=
ND,
> +                                               ondemand_data);
> +       if (IS_ERR(bus->devfreq)) {
> +               dev_err(dev, "failed to add devfreq device\n");
> +               ret =3D PTR_ERR(bus->devfreq);
> +               goto err;
> +       }
> +
> +       /* Register opp_notifier to catch the change of OPP  */
> +       ret =3D devm_devfreq_register_opp_notifier(dev, bus->devfreq);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to register opp notifier\n");
> +               goto err;
> +       }
> +
> +       /*
> +        * Enable devfreq-event to get raw data which is used to determin=
e
> +        * current bus load.
> +        */
> +       ret =3D exynos_bus_enable_edev(bus);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to enable devfreq-event devices\n");
> +               goto err;
> +       }
> +
> +       ret =3D exynos_bus_set_event(bus);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to set event to devfreq-event device=
s\n");
> +               goto err;
> +       }
> +
> +err:
> +       return ret;
> +}
> +
>  static int exynos_bus_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct device_node *np =3D dev->of_node, *node;
>         struct devfreq_dev_profile *profile;
> -       struct devfreq_simple_ondemand_data *ondemand_data;
>         struct devfreq_passive_data *passive_data;
>         struct devfreq *parent_devfreq;
>         struct exynos_bus *bus;
> @@ -418,52 +475,9 @@ static int exynos_bus_probe(struct platform_device *=
pdev)
>         if (ret < 0)
>                 goto err;
>
> -       /* Initialize the struct profile and governor data for parent dev=
ice */
> -       profile->polling_ms =3D 50;
> -       profile->target =3D exynos_bus_target;
> -       profile->get_dev_status =3D exynos_bus_get_dev_status;
> -       profile->exit =3D exynos_bus_exit;
> -
> -       ondemand_data =3D devm_kzalloc(dev, sizeof(*ondemand_data), GFP_K=
ERNEL);
> -       if (!ondemand_data) {
> -               ret =3D -ENOMEM;
> +       ret =3D exynos_bus_profile_init(bus, profile);
> +       if (ret < 0)
>                 goto err;
> -       }
> -       ondemand_data->upthreshold =3D 40;
> -       ondemand_data->downdifferential =3D 5;
> -
> -       /* Add devfreq device to monitor and handle the exynos bus */
> -       bus->devfreq =3D devm_devfreq_add_device(dev, profile,
> -                                               DEVFREQ_GOV_SIMPLE_ONDEMA=
ND,
> -                                               ondemand_data);
> -       if (IS_ERR(bus->devfreq)) {
> -               dev_err(dev, "failed to add devfreq device\n");
> -               ret =3D PTR_ERR(bus->devfreq);
> -               goto err;
> -       }
> -
> -       /* Register opp_notifier to catch the change of OPP  */
> -       ret =3D devm_devfreq_register_opp_notifier(dev, bus->devfreq);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to register opp notifier\n");
> -               goto err;
> -       }
> -
> -       /*
> -        * Enable devfreq-event to get raw data which is used to determin=
e
> -        * current bus load.
> -        */
> -       ret =3D exynos_bus_enable_edev(bus);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to enable devfreq-event devices\n");
> -               goto err;
> -       }
> -
> -       ret =3D exynos_bus_set_event(bus);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to set event to devfreq-event device=
s\n");
> -               goto err;
> -       }
>
>         goto out;
>  passive:
> --
> 2.17.1
>

NACK.

It has not any benefit and I don't understand reason why it is necessary.
I don't agree. Please drop it.

--=20
Best Regards,
Chanwoo Choi
