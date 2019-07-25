From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v4 2/5] devfreq: exynos-bus: convert to use dev_pm_opp_set_rate()
Date: Fri, 26 Jul 2019 00:08:49 +0900
Message-ID: <CAGTfZH2K8QjTH3W+aiurUqpx1EENx-3R_=RWMwbQLTPX5qtszQ@mail.gmail.com>
References: <CGME20190725144325eucas1p204f9ffe8988a3604fdf21f77d242c7b8@eucas1p2.samsung.com>
 <20190725144300.25014-1-k.konieczny@partner.samsung.com> <20190725144300.25014-3-k.konieczny@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725144300.25014-3-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patch has the same problem as I mentioned on v3.
We need to discuss it on v3[1]. Please check my reply.
[1] [PATCH v3 3/5] devfreq: exynos-bus: convert to use dev_pm_opp_set_rate(=
)

2019=EB=85=84 7=EC=9B=94 25=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 11:46, =
<k.konieczny@partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Reuse opp core code for setting bus clock and voltage. As a side
> effect this allow usage of coupled regulators feature (required
> for boards using Exynos5422/5800 SoCs) because dev_pm_opp_set_rate()
> uses regulator_set_voltage_triplet() for setting regulator voltage
> while the old code used regulator_set_voltage_tol() with fixed
> tolerance. This patch also removes no longer needed parsing of DT
> property "exynos,voltage-tolerance" (no Exynos devfreq DT node uses
> it).
>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
> Changes:
> v4:
> - remove unrelated changes, add newline before comment
>
> ---
>  drivers/devfreq/exynos-bus.c | 108 +++++++++--------------------------
>  1 file changed, 28 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index f34fa26f00d0..ebb8f46312b6 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -25,7 +25,6 @@
>  #include <linux/slab.h>
>
>  #define DEFAULT_SATURATION_RATIO       40
> -#define DEFAULT_VOLTAGE_TOLERANCE      2
>
>  struct exynos_bus {
>         struct device *dev;
> @@ -37,9 +36,8 @@ struct exynos_bus {
>
>         unsigned long curr_freq;
>
> -       struct regulator *regulator;
> +       struct opp_table *opp_table;
>         struct clk *clk;
> -       unsigned int voltage_tolerance;
>         unsigned int ratio;
>  };
>
> @@ -99,56 +97,23 @@ static int exynos_bus_target(struct device *dev, unsi=
gned long *freq, u32 flags)
>  {
>         struct exynos_bus *bus =3D dev_get_drvdata(dev);
>         struct dev_pm_opp *new_opp;
> -       unsigned long old_freq, new_freq, new_volt, tol;
>         int ret =3D 0;
>
> -       /* Get new opp-bus instance according to new bus clock */
> +       /* Get correct frequency for bus. */
>         new_opp =3D devfreq_recommended_opp(dev, freq, flags);
>         if (IS_ERR(new_opp)) {
>                 dev_err(dev, "failed to get recommended opp instance\n");
>                 return PTR_ERR(new_opp);
>         }
>
> -       new_freq =3D dev_pm_opp_get_freq(new_opp);
> -       new_volt =3D dev_pm_opp_get_voltage(new_opp);
>         dev_pm_opp_put(new_opp);
>
> -       old_freq =3D bus->curr_freq;
> -
> -       if (old_freq =3D=3D new_freq)
> -               return 0;
> -       tol =3D new_volt * bus->voltage_tolerance / 100;
> -
>         /* Change voltage and frequency according to new OPP level */
>         mutex_lock(&bus->lock);
> +       ret =3D dev_pm_opp_set_rate(dev, *freq);
> +       if (!ret)
> +               bus->curr_freq =3D *freq;
>
> -       if (old_freq < new_freq) {
> -               ret =3D regulator_set_voltage_tol(bus->regulator, new_vol=
t, tol);
> -               if (ret < 0) {
> -                       dev_err(bus->dev, "failed to set voltage\n");
> -                       goto out;
> -               }
> -       }
> -
> -       ret =3D clk_set_rate(bus->clk, new_freq);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to change clock of bus\n");
> -               clk_set_rate(bus->clk, old_freq);
> -               goto out;
> -       }
> -
> -       if (old_freq > new_freq) {
> -               ret =3D regulator_set_voltage_tol(bus->regulator, new_vol=
t, tol);
> -               if (ret < 0) {
> -                       dev_err(bus->dev, "failed to set voltage\n");
> -                       goto out;
> -               }
> -       }
> -       bus->curr_freq =3D new_freq;
> -
> -       dev_dbg(dev, "Set the frequency of bus (%luHz -> %luHz, %luHz)\n"=
,
> -                       old_freq, new_freq, clk_get_rate(bus->clk));
> -out:
>         mutex_unlock(&bus->lock);
>
>         return ret;
> @@ -196,8 +161,10 @@ static void exynos_bus_exit(struct device *dev)
>
>         dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
> -       if (bus->regulator)
> -               regulator_disable(bus->regulator);
> +       if (bus->opp_table) {
> +               dev_pm_opp_put_regulators(bus->opp_table);
> +               bus->opp_table =3D NULL;
> +       }
>  }
>
>  /*
> @@ -208,39 +175,23 @@ static int exynos_bus_passive_target(struct device =
*dev, unsigned long *freq,
>  {
>         struct exynos_bus *bus =3D dev_get_drvdata(dev);
>         struct dev_pm_opp *new_opp;
> -       unsigned long old_freq, new_freq;
> -       int ret =3D 0;
> +       int ret;
>
> -       /* Get new opp-bus instance according to new bus clock */
> +       /* Get correct frequency for bus. */
>         new_opp =3D devfreq_recommended_opp(dev, freq, flags);
>         if (IS_ERR(new_opp)) {
>                 dev_err(dev, "failed to get recommended opp instance\n");
>                 return PTR_ERR(new_opp);
>         }
>
> -       new_freq =3D dev_pm_opp_get_freq(new_opp);
>         dev_pm_opp_put(new_opp);
>
> -       old_freq =3D bus->curr_freq;
> -
> -       if (old_freq =3D=3D new_freq)
> -               return 0;
> -
>         /* Change the frequency according to new OPP level */
>         mutex_lock(&bus->lock);
> +       ret =3D dev_pm_opp_set_rate(dev, *freq);
> +       if (!ret)
> +               bus->curr_freq =3D *freq;
>
> -       ret =3D clk_set_rate(bus->clk, new_freq);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to set the clock of bus\n");
> -               goto out;
> -       }
> -
> -       *freq =3D new_freq;
> -       bus->curr_freq =3D new_freq;
> -
> -       dev_dbg(dev, "Set the frequency of bus (%luHz -> %luHz, %luHz)\n"=
,
> -                       old_freq, new_freq, clk_get_rate(bus->clk));
> -out:
>         mutex_unlock(&bus->lock);
>
>         return ret;
> @@ -258,21 +209,19 @@ static int exynos_bus_parent_parse_of(struct device=
_node *np,
>                                         struct exynos_bus *bus)
>  {
>         struct device *dev =3D bus->dev;
> +       struct opp_table *opp_table;
> +       const char *vdd =3D "vdd";
>         int i, ret, count, size;
>
> -       /* Get the regulator to provide each bus with the power */
> -       bus->regulator =3D devm_regulator_get(dev, "vdd");
> -       if (IS_ERR(bus->regulator)) {
> -               dev_err(dev, "failed to get VDD regulator\n");
> -               return PTR_ERR(bus->regulator);
> -       }
> -
> -       ret =3D regulator_enable(bus->regulator);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to enable VDD regulator\n");
> +       opp_table =3D dev_pm_opp_set_regulators(dev, &vdd, 1);
> +       if (IS_ERR(opp_table)) {
> +               ret =3D PTR_ERR(opp_table);
> +               dev_err(dev, "failed to set regulators %d\n", ret);
>                 return ret;
>         }
>
> +       bus->opp_table =3D opp_table;
> +
>         /*
>          * Get the devfreq-event devices to get the current utilization o=
f
>          * buses. This raw data will be used in devfreq ondemand governor=
.
> @@ -313,14 +262,11 @@ static int exynos_bus_parent_parse_of(struct device=
_node *np,
>         if (of_property_read_u32(np, "exynos,saturation-ratio", &bus->rat=
io))
>                 bus->ratio =3D DEFAULT_SATURATION_RATIO;
>
> -       if (of_property_read_u32(np, "exynos,voltage-tolerance",
> -                                       &bus->voltage_tolerance))
> -               bus->voltage_tolerance =3D DEFAULT_VOLTAGE_TOLERANCE;
> -
>         return 0;
>
>  err_regulator:
> -       regulator_disable(bus->regulator);
> +       dev_pm_opp_put_regulators(bus->opp_table);
> +       bus->opp_table =3D NULL;
>
>         return ret;
>  }
> @@ -511,8 +457,10 @@ static int exynos_bus_probe(struct platform_device *=
pdev)
>         dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
>  err_reg:
> -       if (!passive)
> -               regulator_disable(bus->regulator);
> +       if (!passive) {
> +               dev_pm_opp_put_regulators(bus->opp_table);
> +               bus->opp_table =3D NULL;
> +       }
>
>         return ret;
>  }
> --
> 2.22.0
>


--=20
Best Regards,
Chanwoo Choi
