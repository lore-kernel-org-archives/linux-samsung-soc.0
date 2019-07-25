From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [RFC PATCH 02/11] devfreq: exynos-bus: Extract exynos_bus_profile_init_passive()
Date: Thu, 25 Jul 2019 21:45:19 +0900
Message-ID: <CAGTfZH3GXCuYY-xmKtGd-M47WKp2c8PseytKw-oUOwp+TtGsvQ@mail.gmail.com>
References: <CGME20190723122023eucas1p2ff56c00b60a676ed85d9fe159a1839f2@eucas1p2.samsung.com>
 <20190723122016.30279-1-a.swigon@partner.samsung.com> <20190723122016.30279-3-a.swigon@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723122016.30279-3-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, inki.dae@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>, georgi.djakov@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2019=EB=85=84 7=EC=9B=94 24=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 8:07, A=
rtur =C5=9Awigo=C5=84 <a.swigon@partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> This patch adds a new static function, exynos_bus_profile_init_passive(),
> extracted from exynos_bus_probe().
>
> Signed-off-by: Artur =C5=9Awigo=C5=84 <a.swigon@partner.samsung.com>
> ---
>  drivers/devfreq/exynos-bus.c | 70 +++++++++++++++++++++---------------
>  1 file changed, 42 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index d8f1efaf2d49..cf6f6cbd0f55 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -430,13 +430,51 @@ static int exynos_bus_profile_init(struct exynos_bu=
s *bus,
>         return ret;
>  }
>
> +static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
> +                                          struct devfreq_dev_profile *pr=
ofile)
> +{
> +       struct device *dev =3D bus->dev;
> +       struct devfreq *parent_devfreq;
> +       struct devfreq_passive_data *passive_data;
> +       int ret =3D 0;
> +
> +       /* Initialize the struct profile and governor data for passive de=
vice */
> +       profile->target =3D exynos_bus_passive_target;
> +       profile->exit =3D exynos_bus_passive_exit;
> +
> +       /* Get the instance of parent devfreq device */
> +       parent_devfreq =3D devfreq_get_devfreq_by_phandle(dev, 0);
> +       if (IS_ERR(parent_devfreq)) {
> +               ret =3D -EPROBE_DEFER;
> +               goto err;
> +       }
> +
> +       passive_data =3D devm_kzalloc(dev, sizeof(*passive_data), GFP_KER=
NEL);
> +       if (!passive_data) {
> +               ret =3D -ENOMEM;
> +               goto err;
> +       }
> +       passive_data->parent =3D parent_devfreq;
> +
> +       /* Add devfreq device for exynos bus with passive governor */
> +       bus->devfreq =3D devm_devfreq_add_device(dev, profile, DEVFREQ_GO=
V_PASSIVE,
> +                                               passive_data);
> +       if (IS_ERR(bus->devfreq)) {
> +               dev_err(dev,
> +                       "failed to add devfreq dev with passive governor\=
n");
> +               ret =3D PTR_ERR(bus->devfreq);
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
> -       struct devfreq_passive_data *passive_data;
> -       struct devfreq *parent_devfreq;
>         struct exynos_bus *bus;
>         int ret, max_state;
>         unsigned long min_freq, max_freq;
> @@ -481,33 +519,9 @@ static int exynos_bus_probe(struct platform_device *=
pdev)
>
>         goto out;
>  passive:
> -       /* Initialize the struct profile and governor data for passive de=
vice */
> -       profile->target =3D exynos_bus_passive_target;
> -       profile->exit =3D exynos_bus_passive_exit;
> -
> -       /* Get the instance of parent devfreq device */
> -       parent_devfreq =3D devfreq_get_devfreq_by_phandle(dev, 0);
> -       if (IS_ERR(parent_devfreq)) {
> -               ret =3D -EPROBE_DEFER;
> +       ret =3D exynos_bus_profile_init_passive(bus, profile);
> +       if (ret < 0)
>                 goto err;
> -       }
> -
> -       passive_data =3D devm_kzalloc(dev, sizeof(*passive_data), GFP_KER=
NEL);
> -       if (!passive_data) {
> -               ret =3D -ENOMEM;
> -               goto err;
> -       }
> -       passive_data->parent =3D parent_devfreq;
> -
> -       /* Add devfreq device for exynos bus with passive governor */
> -       bus->devfreq =3D devm_devfreq_add_device(dev, profile, DEVFREQ_GO=
V_PASSIVE,
> -                                               passive_data);
> -       if (IS_ERR(bus->devfreq)) {
> -               dev_err(dev,
> -                       "failed to add devfreq dev with passive governor\=
n");
> -               ret =3D PTR_ERR(bus->devfreq);
> -               goto err;
> -       }
>
>  out:
>         max_state =3D bus->devfreq->profile->max_state;
> --
> 2.17.1
>

Actually, it is not necessary. It has no any benefit.
Please drop it as I commented on patch1.


--
Best Regards,
Chanwoo Choi
