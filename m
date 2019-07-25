From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v4 1/5] devfreq: exynos-bus: correct clock enable sequence
Date: Thu, 25 Jul 2019 23:59:21 +0900
Message-ID: <CAGTfZH0=skWJ3Dny7voeRzDp5oRkbNO=Pf6j+PM03=epmX-86g@mail.gmail.com>
References: <CGME20190725144325eucas1p1463ecde90f9c93cb73d3c54c7cf3f1ff@eucas1p1.samsung.com>
 <20190725144300.25014-1-k.konieczny@partner.samsung.com> <20190725144300.25014-2-k.konieczny@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725144300.25014-2-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

You are missing my Acked tag.

2019=EB=85=84 7=EC=9B=94 25=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 11:44, =
<k.konieczny@partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Regulators should be enabled before clocks to avoid h/w hang. This
> require change in exynos_bus_probe() to move exynos_bus_parse_of()
> after exynos_bus_parent_parse_of() and change in error handling.
> Similar change is needed in exynos_bus_exit() where clock should be
> disabled before regulators.
>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
> Changes:
> v4:
> - move regulator disable after clock disable
> - remove unrelated changes
> - add disabling regulators in error path in exynos_bus_probe()
>
> ---
>  drivers/devfreq/exynos-bus.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index 486cc5b422f1..f34fa26f00d0 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -194,11 +194,10 @@ static void exynos_bus_exit(struct device *dev)
>         if (ret < 0)
>                 dev_warn(dev, "failed to disable the devfreq-event device=
s\n");
>
> -       if (bus->regulator)
> -               regulator_disable(bus->regulator);
> -
>         dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
> +       if (bus->regulator)
> +               regulator_disable(bus->regulator);
>  }
>
>  /*
> @@ -386,6 +385,7 @@ static int exynos_bus_probe(struct platform_device *p=
dev)
>         struct exynos_bus *bus;
>         int ret, max_state;
>         unsigned long min_freq, max_freq;
> +       bool passive =3D false;
>
>         if (!np) {
>                 dev_err(dev, "failed to find devicetree node\n");
> @@ -399,27 +399,27 @@ static int exynos_bus_probe(struct platform_device =
*pdev)
>         bus->dev =3D &pdev->dev;
>         platform_set_drvdata(pdev, bus);
>
> -       /* Parse the device-tree to get the resource information */
> -       ret =3D exynos_bus_parse_of(np, bus);
> -       if (ret < 0)
> -               return ret;
> -
>         profile =3D devm_kzalloc(dev, sizeof(*profile), GFP_KERNEL);
> -       if (!profile) {
> -               ret =3D -ENOMEM;
> -               goto err;
> -       }
> +       if (!profile)
> +               return -ENOMEM;
>
>         node =3D of_parse_phandle(dev->of_node, "devfreq", 0);
>         if (node) {
>                 of_node_put(node);
> -               goto passive;
> +               passive =3D true;
>         } else {
>                 ret =3D exynos_bus_parent_parse_of(np, bus);
> +               if (ret < 0)
> +                       return ret;
>         }
>
> +       /* Parse the device-tree to get the resource information */
> +       ret =3D exynos_bus_parse_of(np, bus);
>         if (ret < 0)
> -               goto err;
> +               goto err_reg;
> +
> +       if (passive)
> +               goto passive;
>
>         /* Initialize the struct profile and governor data for parent dev=
ice */
>         profile->polling_ms =3D 50;
> @@ -510,6 +510,9 @@ static int exynos_bus_probe(struct platform_device *p=
dev)
>  err:
>         dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
> +err_reg:
> +       if (!passive)
> +               regulator_disable(bus->regulator);
>
>         return ret;
>  }
> --
> 2.22.0
>


--=20
Best Regards,
Chanwoo Choi
