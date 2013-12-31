From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 03/12] clk: samsung: add clock driver for external clock outputs
Date: Tue, 31 Dec 2013 11:46:04 -0800
Message-ID: <20131231194604.12054.83161@quantum>
References: <201312131356.40755.heiko@sntech.de> <201312131359.36576.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f171.google.com ([209.85.161.171]:49763 "EHLO
	mail-gg0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756427Ab3LaTqJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 14:46:09 -0500
Received: by mail-gg0-f171.google.com with SMTP id j1so2531578ggn.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2013 11:46:08 -0800 (PST)
In-Reply-To: <201312131359.36576.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Quoting Heiko St=C3=BCbner (2013-12-13 04:59:36)
> This adds a driver for controlling the external clock outputs of
> s3c24xx architectures including the dclk muxes and dividers.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/clk/samsung/Makefile                     |    1 +
>  drivers/clk/samsung/clk-s3c2410-dclk.c           |  517 ++++++++++++=
++++++++++
>  include/dt-bindings/clock/samsung,s3c2410-dclk.h |   28 ++
>  3 files changed, 546 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-s3c2410-dclk.c
>  create mode 100644 include/dt-bindings/clock/samsung,s3c2410-dclk.h
>=20
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makef=
ile
> index 4c892c6..568683c 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -8,5 +8,6 @@ obj-$(CONFIG_SOC_EXYNOS5250)    +=3D clk-exynos5250.o
>  obj-$(CONFIG_SOC_EXYNOS5420)   +=3D clk-exynos5420.o
>  obj-$(CONFIG_SOC_EXYNOS5440)   +=3D clk-exynos5440.o
>  obj-$(CONFIG_ARCH_EXYNOS)      +=3D clk-exynos-audss.o
> +obj-$(CONFIG_S3C2410_COMMON_DCLK)+=3D clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2443_COMMON_CLK)+=3D clk-s3c2443.o
>  obj-$(CONFIG_ARCH_S3C64XX)     +=3D clk-s3c64xx.o
> diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/sam=
sung/clk-s3c2410-dclk.c
> new file mode 100644
> index 0000000..de10e5c
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
> @@ -0,0 +1,517 @@
> +/*
> + * Copyright (c) 2013 Heiko Stuebner <heiko@sntech.de>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Common Clock Framework support for s3c24xx external clock output.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/of.h>
> +#include <dt-bindings/clock/samsung,s3c2410-dclk.h>
> +#include "clk.h"
> +
> +/* legacy access to misccr, until dt conversion is finished */
> +#include <mach/hardware.h>
> +#include <mach/regs-gpio.h>
> +
> +enum supported_socs {
> +       S3C2410,
> +       S3C2412,
> +       S3C2440,
> +       S3C2443,
> +};
> +
> +struct s3c24xx_dclk_drv_data {
> +       int cpu_type;
> +};
> +
> +/*
> + * Clock for output-parent selection in misccr
> + */
> +
> +struct s3c24xx_clkout {
> +       struct clk_hw           hw;
> +       struct regmap           *misccr;
> +       u32                     mask;
> +       u8                      shift;
> +};
> +
> +#define to_s3c24xx_clkout(_hw) container_of(_hw, struct s3c24xx_clko=
ut, hw)
> +
> +static u8 s3c24xx_clkout_get_parent(struct clk_hw *hw)
> +{
> +       struct s3c24xx_clkout *clkout =3D to_s3c24xx_clkout(hw);
> +       int num_parents =3D __clk_get_num_parents(hw->clk);
> +       u32 val;
> +       int ret =3D 0;
> +
> +       if (clkout->misccr)
> +               ret =3D regmap_read(clkout->misccr, 0, &val);
> +       else
> +               val =3D readl_relaxed(S3C24XX_MISCCR) >> clkout->shif=
t;
> +
> +       if (ret)
> +               return ret;
> +
> +       val >>=3D clkout->shift;
> +       val &=3D clkout->mask;
> +
> +       if (val >=3D num_parents)
> +               return -EINVAL;
> +
> +       return val;
> +}
> +
> +static int s3c24xx_clkout_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct s3c24xx_clkout *clkout =3D to_s3c24xx_clkout(hw);
> +       int ret =3D 0;
> +
> +       if (clkout->misccr)
> +               ret =3D regmap_update_bits(clkout->misccr, 0,
> +                                        (clkout->mask << clkout->shi=
ft),
> +                                        (index << clkout->shift));
> +       else
> +               s3c2410_modify_misccr((clkout->mask << clkout->shift)=
,
> +                                     (index << clkout->shift));
> +
> +       return ret;
> +}
> +
> +const struct clk_ops s3c24xx_clkout_ops =3D {
> +       .get_parent =3D s3c24xx_clkout_get_parent,
> +       .set_parent =3D s3c24xx_clkout_set_parent,
> +       .determine_rate =3D __clk_mux_determine_rate,
> +};
> +
> +struct clk *s3c24xx_register_clkout(struct device *dev, const char *=
name,
> +               const char **parent_names, u8 num_parents,
> +               struct regmap *misccr, u8 shift, u32 mask)
> +{
> +       struct s3c24xx_clkout *clkout;
> +       struct clk *clk;
> +       struct clk_init_data init;
> +
> +       /* allocate the clkout */
> +       clkout =3D kzalloc(sizeof(*clkout), GFP_KERNEL);
> +       if (!clkout)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name =3D name;
> +       init.ops =3D &s3c24xx_clkout_ops;
> +       init.flags =3D CLK_IS_BASIC;
> +       init.parent_names =3D parent_names;
> +       init.num_parents =3D num_parents;
> +
> +       clkout->misccr =3D misccr;
> +       clkout->shift =3D shift;
> +       clkout->mask =3D mask;
> +       clkout->hw.init =3D &init;
> +
> +       clk =3D clk_register(dev, &clkout->hw);
> +
> +       return clk;
> +}
> +
> +/*
> + * dclk and clkout init
> + */
> +
> +struct s3c24xx_dclk {
> +       struct device *dev;
> +       void __iomem *base;
> +       struct clk_onecell_data clk_data;
> +       struct notifier_block dclk0_div_change_nb;
> +       struct notifier_block dclk1_div_change_nb;
> +       spinlock_t dclk_lock;
> +       unsigned long reg_save;
> +};
> +
> +#define to_s3c24xx_dclk0(x) \
> +               container_of(x, struct s3c24xx_dclk, dclk0_div_change=
_nb)
> +
> +#define to_s3c24xx_dclk1(x) \
> +               container_of(x, struct s3c24xx_dclk, dclk1_div_change=
_nb)
> +
> +static const char dummy_nm[] __initconst =3D "dummy_name";
> +
> +PNAME(dclk_s3c2410_p) =3D { "pclk", "uclk" };
> +PNAME(clkout0_s3c2410_p) =3D { "mpll", "upll", "fclk", "hclk", "pclk=
",
> +                            "gate_dclk0" };
> +PNAME(clkout1_s3c2410_p) =3D { "mpll", "upll", "fclk", "hclk", "pclk=
",
> +                            "gate_dclk1" };
> +
> +PNAME(clkout0_s3c2412_p) =3D { "mpll", "upll", dummy_nm /* rtc clock=
 output */,
> +                            "hclk", "pclk", "gate_dclk0" };
> +PNAME(clkout1_s3c2412_p) =3D { "xti", "upll", "fclk", "hclk", "pclk"=
,
> +                            "gate_dclk1" };
> +
> +PNAME(clkout0_s3c2440_p) =3D { "xti", "upll", "fclk", "hclk", "pclk"=
,
> +                            "gate_dclk0" };
> +PNAME(clkout1_s3c2440_p) =3D { "mpll", "upll", dummy_nm /* rtc clock=
 output */,
> +                            "hclk", "pclk", "gate_dclk1" };
> +
> +PNAME(dclk_s3c2443_p) =3D { "pclk", "epll" };
> +PNAME(clkout0_s3c2443_p) =3D { "xti", "epll", "armclk", "hclk", "pcl=
k",
> +                            "gate_dclk0" };
> +PNAME(clkout1_s3c2443_p) =3D { dummy_nm, "epll", dummy_nm /* rtc clo=
ck output */,
> +                            "hclk", "pclk", "gate_dclk1" };
> +
> +#define DCLKCON_DCLK_DIV_MASK          0xf
> +#define DCLKCON_DCLK0_DIV_SHIFT                4
> +#define DCLKCON_DCLK0_CMP_SHIFT                8
> +#define DCLKCON_DCLK1_DIV_SHIFT                20
> +#define DCLKCON_DCLK1_CMP_SHIFT                24
> +
> +static void s3c24xx_dclk_update_cmp(struct s3c24xx_dclk *s3c24xx_dcl=
k,
> +                                   int div_shift, int cmp_shift)
> +{
> +       unsigned long flags =3D 0;
> +       u32 dclk_con, div, cmp;
> +
> +       spin_lock_irqsave(&s3c24xx_dclk->dclk_lock, flags);
> +
> +       dclk_con =3D readl_relaxed(s3c24xx_dclk->base);
> +
> +       div =3D ((dclk_con >> div_shift) & DCLKCON_DCLK_DIV_MASK) + 1=
;
> +       cmp =3D ((div + 1) / 2) - 1;
> +
> +       dclk_con &=3D ~(DCLKCON_DCLK_DIV_MASK << cmp_shift);
> +       dclk_con |=3D (cmp << cmp_shift);
> +
> +       writel_relaxed(dclk_con, s3c24xx_dclk->base);
> +
> +       spin_unlock_irqrestore(&s3c24xx_dclk->dclk_lock, flags);
> +}
> +
> +static int s3c24xx_dclk0_div_notify(struct notifier_block *nb,
> +                              unsigned long event, void *data)
> +{
> +       struct s3c24xx_dclk *s3c24xx_dclk =3D to_s3c24xx_dclk0(nb);
> +
> +       if (event =3D=3D POST_RATE_CHANGE) {
> +               s3c24xx_dclk_update_cmp(s3c24xx_dclk,
> +                       DCLKCON_DCLK0_DIV_SHIFT, DCLKCON_DCLK0_CMP_SH=
IFT);
> +       }
> +
> +       return NOTIFY_DONE;
> +}
> +
> +static int s3c24xx_dclk1_div_notify(struct notifier_block *nb,
> +                              unsigned long event, void *data)
> +{
> +       struct s3c24xx_dclk *s3c24xx_dclk =3D to_s3c24xx_dclk1(nb);
> +
> +       if (event =3D=3D POST_RATE_CHANGE) {
> +               s3c24xx_dclk_update_cmp(s3c24xx_dclk,
> +                       DCLKCON_DCLK1_DIV_SHIFT, DCLKCON_DCLK1_CMP_SH=
IFT);
> +       }
> +
> +       return NOTIFY_DONE;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int s3c24xx_dclk_suspend(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct s3c24xx_dclk *s3c24xx_dclk =3D platform_get_drvdata(pd=
ev);
> +
> +       s3c24xx_dclk->reg_save =3D readl_relaxed(s3c24xx_dclk->base);
> +       return 0;
> +}
> +
> +static int s3c24xx_dclk_resume(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct s3c24xx_dclk *s3c24xx_dclk =3D platform_get_drvdata(pd=
ev);
> +
> +       writel_relaxed(s3c24xx_dclk->reg_save, s3c24xx_dclk->base);
> +       return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(s3c24xx_dclk_pm_ops,
> +                        s3c24xx_dclk_suspend, s3c24xx_dclk_resume);
> +
> +static const struct of_device_id s3c24xx_dclk_dt_match[];
> +
> +static inline int s3c24xx_dclk_get_driver_data(struct platform_devic=
e *pdev)
> +{
> +       struct s3c24xx_dclk_drv_data *data;
> +       if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
> +               const struct of_device_id *match;
> +               match =3D of_match_node(s3c24xx_dclk_dt_match, pdev->=
dev.of_node);
> +               data =3D (struct s3c24xx_dclk_drv_data *) match->data=
;
> +               return data->cpu_type;
> +       }
> +
> +       return platform_get_device_id(pdev)->driver_data;
> +}
> +
> +static int s3c24xx_dclk_probe(struct platform_device *pdev)
> +{
> +       struct s3c24xx_dclk *s3c24xx_dclk;
> +       struct device_node *np =3D pdev->dev.of_node;
> +       struct regmap *misccr =3D NULL;
> +       struct resource *mem;
> +       struct clk **clk_table;
> +       const char **clkout0_parent_names, **clkout1_parent_names;
> +       u8 clkout0_num_parents, clkout1_num_parents;
> +       int current_soc, ret, i;
> +
> +       s3c24xx_dclk =3D devm_kzalloc(&pdev->dev, sizeof(*s3c24xx_dcl=
k),
> +                                   GFP_KERNEL);
> +       if (!s3c24xx_dclk)
> +               return -ENOMEM;
> +
> +       s3c24xx_dclk->dev =3D &pdev->dev;
> +       platform_set_drvdata(pdev, s3c24xx_dclk);
> +       spin_lock_init(&s3c24xx_dclk->dclk_lock);
> +
> +       clk_table =3D devm_kzalloc(&pdev->dev,
> +                                sizeof(struct clk *) * DCLK_MAX_CLKS=
,
> +                                GFP_KERNEL);
> +       if (!clk_table)
> +               return -ENOMEM;
> +
> +       s3c24xx_dclk->clk_data.clks =3D clk_table;
> +       s3c24xx_dclk->clk_data.clk_num =3D DCLK_MAX_CLKS;
> +
> +       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       s3c24xx_dclk->base =3D devm_ioremap_resource(&pdev->dev, mem)=
;
> +       if (IS_ERR(s3c24xx_dclk->base))
> +               return PTR_ERR(s3c24xx_dclk->base);
> +
> +       /* when run from devicetree, get the misccr through a syscon-=
regmap */
> +       if (np) {
> +               misccr =3D syscon_regmap_lookup_by_phandle(np, "samsu=
ng,misccr");
> +               if (IS_ERR(misccr)) {
> +                       dev_err(&pdev->dev, "could not get misccr sys=
con, %ld\n",
> +                               PTR_ERR(misccr));
> +                       return PTR_ERR(misccr);
> +               }
> +       }
> +
> +       current_soc =3D s3c24xx_dclk_get_driver_data(pdev);
> +
> +       if (current_soc =3D=3D S3C2443) {
> +               clk_table[MUX_DCLK0] =3D clk_register_mux(&pdev->dev,
> +                                       "mux_dclk0", dclk_s3c2443_p,
> +                                       ARRAY_SIZE(dclk_s3c2443_p), 0=
,
> +                                       s3c24xx_dclk->base, 1, 1, 0,
> +                                       &s3c24xx_dclk->dclk_lock);
> +               clk_table[MUX_DCLK1] =3D clk_register_mux(&pdev->dev,
> +                                       "mux_dclk1", dclk_s3c2443_p,
> +                                       ARRAY_SIZE(dclk_s3c2443_p), 0=
,
> +                                       s3c24xx_dclk->base, 17, 1, 0,
> +                                       &s3c24xx_dclk->dclk_lock);
> +       } else {
> +               clk_table[MUX_DCLK0] =3D clk_register_mux(&pdev->dev,
> +                                       "mux_dclk0", dclk_s3c2410_p,
> +                                       ARRAY_SIZE(dclk_s3c2410_p), 0=
,
> +                                       s3c24xx_dclk->base, 1, 1, 0,
> +                                       &s3c24xx_dclk->dclk_lock);
> +               clk_table[MUX_DCLK1] =3D clk_register_mux(&pdev->dev,
> +                                       "mux_dclk1", dclk_s3c2410_p,
> +                                       ARRAY_SIZE(dclk_s3c2410_p), 0=
,
> +                                       s3c24xx_dclk->base, 17, 1, 0,
> +                                       &s3c24xx_dclk->dclk_lock);
> +       }
> +
> +       clk_table[DIV_DCLK0] =3D clk_register_divider(&pdev->dev, "di=
v_dclk0",
> +                                       "mux_dclk0", 0, s3c24xx_dclk-=
>base,
> +                                       4, 4, 0, &s3c24xx_dclk->dclk_=
lock);
> +       clk_table[DIV_DCLK1] =3D clk_register_divider(&pdev->dev, "di=
v_dclk1",
> +                                       "mux_dclk1", 0, s3c24xx_dclk-=
>base,
> +                                       20, 4, 0, &s3c24xx_dclk->dclk=
_lock);
> +
> +       clk_table[GATE_DCLK0] =3D clk_register_gate(&pdev->dev, "gate=
_dclk0",
> +                                       "div_dclk0", CLK_SET_RATE_PAR=
ENT,
> +                                       s3c24xx_dclk->base, 0, 0,
> +                                       &s3c24xx_dclk->dclk_lock);
> +       clk_table[GATE_DCLK1] =3D clk_register_gate(&pdev->dev, "gate=
_dclk1",
> +                                       "div_dclk1", CLK_SET_RATE_PAR=
ENT,
> +                                       s3c24xx_dclk->base, 16, 0,
> +                                       &s3c24xx_dclk->dclk_lock);
> +
> +       switch (current_soc) {
> +       case S3C2410:
> +               clkout0_parent_names =3D clkout0_s3c2410_p;
> +               clkout0_num_parents =3D ARRAY_SIZE(clkout0_s3c2410_p)=
;
> +               clkout1_parent_names =3D clkout1_s3c2410_p;
> +               clkout1_num_parents =3D ARRAY_SIZE(clkout1_s3c2410_p)=
;
> +               break;
> +       case S3C2412:
> +               clkout0_parent_names =3D clkout0_s3c2412_p;
> +               clkout0_num_parents =3D ARRAY_SIZE(clkout0_s3c2412_p)=
;
> +               clkout1_parent_names =3D clkout1_s3c2412_p;
> +               clkout1_num_parents =3D ARRAY_SIZE(clkout1_s3c2412_p)=
;
> +               break;
> +       case S3C2440:
> +               clkout0_parent_names =3D clkout0_s3c2440_p;
> +               clkout0_num_parents =3D ARRAY_SIZE(clkout0_s3c2440_p)=
;
> +               clkout1_parent_names =3D clkout1_s3c2440_p;
> +               clkout1_num_parents =3D ARRAY_SIZE(clkout1_s3c2440_p)=
;
> +               break;
> +       case S3C2443:
> +               clkout0_parent_names =3D clkout0_s3c2443_p;
> +               clkout0_num_parents =3D ARRAY_SIZE(clkout0_s3c2443_p)=
;
> +               clkout1_parent_names =3D clkout1_s3c2443_p;
> +               clkout1_num_parents =3D ARRAY_SIZE(clkout1_s3c2443_p)=
;
> +               break;
> +       default:
> +               dev_err(&pdev->dev, "unsupported soc %d\n", current_s=
oc);
> +               ret =3D -EINVAL;
> +               goto err_clk_register;
> +       }
> +
> +       clk_table[MUX_CLKOUT0] =3D s3c24xx_register_clkout(&pdev->dev=
,
> +                               "clkout0", clkout0_parent_names,
> +                               clkout0_num_parents, misccr, 4, 7);
> +       clk_table[MUX_CLKOUT1] =3D s3c24xx_register_clkout(&pdev->dev=
, "clkout1",
> +                               clkout1_parent_names,
> +                               clkout1_num_parents, misccr, 8, 7);
> +
> +       for (i =3D 0; i < DCLK_MAX_CLKS; i++)
> +               if (IS_ERR(clk_table[i])) {
> +                       dev_err(&pdev->dev, "clock %d failed to regis=
ter\n", i);
> +                       ret =3D PTR_ERR(clk_table[i]);
> +                       goto err_clk_register;
> +               }
> +
> +       ret =3D clk_register_clkdev(clk_table[MUX_DCLK0], "dclk0", NU=
LL);
> +       ret |=3D clk_register_clkdev(clk_table[MUX_DCLK1], "dclk1", N=
ULL);
> +       ret |=3D clk_register_clkdev(clk_table[MUX_CLKOUT0], "clkout0=
", NULL);
> +       ret |=3D clk_register_clkdev(clk_table[MUX_CLKOUT1], "clkout1=
", NULL);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to register aliases\n");
> +               goto err_clk_register;
> +       }
> +
> +       s3c24xx_dclk->dclk0_div_change_nb.notifier_call =3D
> +                                               s3c24xx_dclk0_div_not=
ify;
> +       s3c24xx_dclk->dclk0_div_change_nb.next =3D NULL;
> +
> +       s3c24xx_dclk->dclk1_div_change_nb.notifier_call =3D
> +                                               s3c24xx_dclk1_div_not=
ify;
> +       s3c24xx_dclk->dclk1_div_change_nb.next =3D NULL;
> +
> +       ret =3D clk_notifier_register(clk_table[DIV_DCLK0],
> +                                   &s3c24xx_dclk->dclk0_div_change_n=
b);
> +       if (ret)
> +               goto err_clk_register;
> +
> +       ret =3D clk_notifier_register(clk_table[DIV_DCLK1],
> +                                   &s3c24xx_dclk->dclk1_div_change_n=
b);
> +       if (ret)
> +               goto err_dclk_notify;
> +
> +       if (np) {
> +               ret =3D of_clk_add_provider(np,
> +                             of_clk_src_onecell_get, &s3c24xx_dclk->=
clk_data);
> +               if (ret)
> +                       goto err_of_clk_provider;
> +       }
> +
> +       return 0;
> +
> +err_of_clk_provider:
> +       clk_notifier_unregister(clk_table[DIV_DCLK1],
> +                               &s3c24xx_dclk->dclk1_div_change_nb);
> +err_dclk_notify:
> +       clk_notifier_unregister(clk_table[DIV_DCLK0],
> +                               &s3c24xx_dclk->dclk0_div_change_nb);
> +err_clk_register:
> +       for (i =3D 0; i < DCLK_MAX_CLKS; i++)
> +               if (clk_table[i] && !IS_ERR(clk_table[i]))
> +                       clk_unregister(clk_table[i]);
> +
> +       return ret;
> +}
> +
> +static int s3c24xx_dclk_remove(struct platform_device *pdev)
> +{
> +       struct s3c24xx_dclk *s3c24xx_dclk =3D platform_get_drvdata(pd=
ev);
> +       struct clk **clk_table =3D s3c24xx_dclk->clk_data.clks;
> +       int i;
> +
> +       of_clk_del_provider(pdev->dev.of_node);
> +
> +       clk_notifier_unregister(clk_table[DIV_DCLK1],
> +                               &s3c24xx_dclk->dclk1_div_change_nb);
> +       clk_notifier_unregister(clk_table[DIV_DCLK0],
> +                               &s3c24xx_dclk->dclk0_div_change_nb);
> +
> +       for (i =3D 0; i < DCLK_MAX_CLKS; i++)
> +               clk_unregister(clk_table[i]);
> +
> +       return 0;
> +}
> +
> +static struct s3c24xx_dclk_drv_data s3c24xx_dclk_drv_data_array[] =3D=
 {
> +       [S3C2410] =3D { S3C2410 },
> +       [S3C2412] =3D { S3C2412 },
> +       [S3C2440] =3D { S3C2440 },
> +       [S3C2443] =3D { S3C2443 },
> +};
> +
> +static const struct of_device_id s3c24xx_dclk_dt_match[] =3D {
> +       {
> +               .compatible =3D "samsung,s3c2410-dclk",
> +               .data =3D &s3c24xx_dclk_drv_data_array[S3C2410],
> +       }, {
> +               .compatible =3D "samsung,s3c2412-dclk",
> +               .data =3D &s3c24xx_dclk_drv_data_array[S3C2412],
> +       }, {
> +               .compatible =3D "samsung,s3c2440-dclk",
> +               .data =3D &s3c24xx_dclk_drv_data_array[S3C2440],
> +       }, {
> +               .compatible =3D "samsung,s3c2443-dclk",
> +               .data =3D &s3c24xx_dclk_drv_data_array[S3C2443],
> +       },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, s3c24xx_dclk_dt_match);
> +
> +static struct platform_device_id s3c24xx_dclk_driver_ids[] =3D {
> +       {
> +               .name           =3D "s3c2410-dclk",
> +               .driver_data    =3D S3C2410,
> +       }, {
> +               .name           =3D "s3c2412-dclk",
> +               .driver_data    =3D S3C2412,
> +       }, {
> +               .name           =3D "s3c2440-dclk",
> +               .driver_data    =3D S3C2440,
> +       }, {
> +               .name           =3D "s3c2443-dclk",
> +               .driver_data    =3D S3C2443,
> +       },
> +       { }
> +};
> +
> +MODULE_DEVICE_TABLE(platform, s3c24xx_dclk_driver_ids);
> +
> +static struct platform_driver s3c24xx_dclk_driver =3D {
> +       .driver =3D {
> +               .name           =3D "s3c24xx-dclk",
> +               .owner          =3D THIS_MODULE,
> +               .pm             =3D &s3c24xx_dclk_pm_ops,
> +               .of_match_table =3D of_match_ptr(s3c24xx_dclk_dt_matc=
h),
> +       },
> +       .probe =3D s3c24xx_dclk_probe,
> +       .remove =3D s3c24xx_dclk_remove,
> +       .id_table =3D s3c24xx_dclk_driver_ids,
> +};
> +module_platform_driver(s3c24xx_dclk_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
> +MODULE_DESCRIPTION("Driver for the S3C24XX external clock outputs");
> diff --git a/include/dt-bindings/clock/samsung,s3c2410-dclk.h b/inclu=
de/dt-bindings/clock/samsung,s3c2410-dclk.h
> new file mode 100644
> index 0000000..7394d46
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,s3c2410-dclk.h
> @@ -0,0 +1,28 @@
> +/*
> + * Copyright (c) 2013 Heiko Stuebner <heiko@sntech.de>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Device Tree binding constants clock controllers of Samsung S3C241=
0 and later.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_S3C2410_CLOCK_H
> +#define _DT_BINDINGS_CLOCK_SAMSUNG_S3C2410_CLOCK_H
> +
> +#define MUX_DCLK0      0
> +#define MUX_DCLK1      1
> +
> +#define DIV_DCLK0      2
> +#define DIV_DCLK1      3
> +
> +#define GATE_DCLK0     4
> +#define GATE_DCLK1     5
> +
> +#define MUX_CLKOUT0    6
> +#define MUX_CLKOUT1    7
> +
> +#define DCLK_MAX_CLKS  (MUX_CLKOUT1 + 1)
> +
> +#endif
> --=20
> 1.7.10.4
>=20
