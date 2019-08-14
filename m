From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/9] soc: samsung: Add Exynos Adaptive Supply Voltage driver
Date: Wed, 14 Aug 2019 14:58:44 +0200
Message-ID: <CAJKOXPfqeq4vB87Ehd4zyZtfqNVsn8vznq16GAwVsH01jOtvtg@mail.gmail.com>
References: <CGME20190813150853eucas1p20257455cc323a8b78b37977b0ed4937d@eucas1p2.samsung.com>
 <20190813150827.31972-1-s.nawrocki@samsung.com> <20190813150827.31972-4-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813150827.31972-4-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 13 Aug 2019 at 17:08, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> The Adaptive Supply Voltage (ASV) driver adjusts CPU cluster operating
> points depending on exact revision of an SoC retrieved from the CHIPID
> block or the OTP memory.  This allows for some power saving as for some
> CPU clock frequencies we can lower CPU cluster supply voltage comparing
> to safe values common to the all chip revisions.
>
> This patch adds support for Exynos5422/5800 SoC, it is partially based
> on code from https://github.com/hardkernel/linux repository,
> branch odroidxu4-4.14.y, files: arch/arm/mach-exynos/exynos5422-asv.[ch].
>
> Tested on Odroid XU3, XU4, XU3 Lite.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v2:
>  - Use devm_kzalloc() in probe() to avoid memory leak,
>  - removed leading spaces in exynos-chipid.h,
>  - removed unneeded <linux/init.h> header inclusion,
>  - dropped parentheses from exynos542_asv_parse_sg(),
>  - updated Kconfig entry,
>  - added const attribute to struct exynos_asv_susbsys::cpu_dt_compat.
>
> Changes since v1 (RFC):
>  - removed code for parsing the ASV OPP tables from DT, the ASV OPP tables
>    moved to the driver;
>  - converted to use the regmap API;
>  - converted to normal platform driver.
> ---
>  drivers/soc/samsung/Kconfig          |  10 +
>  drivers/soc/samsung/Makefile         |   3 +
>  drivers/soc/samsung/exynos-asv.c     | 184 ++++++++++
>  drivers/soc/samsung/exynos-asv.h     |  82 +++++
>  drivers/soc/samsung/exynos5422-asv.c | 498 +++++++++++++++++++++++++++
>  drivers/soc/samsung/exynos5422-asv.h |  25 ++
>  6 files changed, 802 insertions(+)
>  create mode 100644 drivers/soc/samsung/exynos-asv.c
>  create mode 100644 drivers/soc/samsung/exynos-asv.h
>  create mode 100644 drivers/soc/samsung/exynos5422-asv.c
>  create mode 100644 drivers/soc/samsung/exynos5422-asv.h
>
> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> index 2905f5262197..73ccf59676a1 100644
> --- a/drivers/soc/samsung/Kconfig
> +++ b/drivers/soc/samsung/Kconfig
> @@ -7,6 +7,16 @@ menuconfig SOC_SAMSUNG
>
>  if SOC_SAMSUNG
>
> +config EXYNOS_ASV
> +       bool "Exynos Adaptive Supply Voltage support" if COMPILE_TEST
> +       depends on (ARCH_EXYNOS && EXYNOS_CHIPID) || COMPILE_TEST
> +       select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
> +
> +# There is no need to enable these drivers for ARMv8
> +config EXYNOS_ASV_ARM
> +       bool "Exynos ASV ARMv7-specific driver extensions" if COMPILE_TEST
> +       depends on EXYNOS_ASV
> +
>  config EXYNOS_CHIPID
>         bool "Exynos Chipid controller driver" if COMPILE_TEST
>         depends on ARCH_EXYNOS || COMPILE_TEST
> diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
> index 3b6a8797416c..edd1d6ea064d 100644
> --- a/drivers/soc/samsung/Makefile
> +++ b/drivers/soc/samsung/Makefile
> @@ -1,5 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> +obj-$(CONFIG_EXYNOS_ASV)       += exynos-asv.o
> +obj-$(CONFIG_EXYNOS_ASV_ARM)   += exynos5422-asv.o
> +
>  obj-$(CONFIG_EXYNOS_CHIPID)    += exynos-chipid.o
>  obj-$(CONFIG_EXYNOS_PMU)       += exynos-pmu.o
>
> diff --git a/drivers/soc/samsung/exynos-asv.c b/drivers/soc/samsung/exynos-asv.c
> new file mode 100644
> index 000000000000..481deb600afc
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos-asv.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 Samsung Electronics Co., Ltd.
> + *           http://www.samsung.com/
> + * Author: Sylwester Nawrocki <s.nawrocki@samsung.com>
> + *
> + * Samsung Exynos SoC Adaptive Supply Voltage support
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/regmap.h>
> +#include <linux/soc/samsung/exynos-chipid.h>
> +
> +#include "exynos-asv.h"
> +#include "exynos5422-asv.h"
> +
> +#define MHZ 1000000U
> +
> +static int exynos_asv_update_cpu_opps(struct exynos_asv *asv,
> +                                     struct device *cpu)
> +{
> +       struct exynos_asv_subsys *subsys = NULL;
> +       struct dev_pm_opp *opp;
> +       unsigned int opp_freq;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(asv->subsys); i++) {
> +               if (of_device_is_compatible(cpu->of_node,
> +                                           asv->subsys[i].cpu_dt_compat)) {
> +                       subsys = &asv->subsys[i];
> +                       break;
> +               }
> +       }
> +       if (!subsys)
> +               return -EINVAL;
> +
> +       for (i = 0; i < subsys->table.num_rows; i++) {
> +               unsigned int new_voltage;
> +               unsigned int voltage;
> +               int timeout = 1000;
> +               int err;
> +
> +               opp_freq = exynos_asv_opp_get_frequency(subsys, i);
> +
> +               opp = dev_pm_opp_find_freq_exact(cpu, opp_freq * MHZ, true);
> +               if (IS_ERR(opp)) {
> +                       dev_info(asv->dev, "cpu%d opp%d, freq: %u missing\n",
> +                                cpu->id, i, opp_freq);
> +
> +                       continue;
> +               }
> +
> +               voltage = dev_pm_opp_get_voltage(opp);
> +               new_voltage = asv->opp_get_voltage(subsys, i, voltage);
> +               dev_pm_opp_put(opp);
> +
> +               opp_freq *= MHZ;
> +               dev_pm_opp_remove(cpu, opp_freq);
> +
> +               while (--timeout) {
> +                       opp = dev_pm_opp_find_freq_exact(cpu, opp_freq, true);
> +                       if (IS_ERR(opp))
> +                               break;
> +                       dev_pm_opp_put(opp);
> +                       msleep(1);
> +               }
> +
> +               err = dev_pm_opp_add(cpu, opp_freq, new_voltage);
> +               if (err < 0)
> +                       dev_err(asv->dev,
> +                               "Failed to add OPP %u Hz/%u uV for cpu%d\n",
> +                               opp_freq, new_voltage, cpu->id);
> +       }
> +
> +       return 0;
> +}
> +
> +static int exynos_asv_update_opps(struct exynos_asv *asv)
> +{
> +       struct opp_table *last_opp_table = NULL;
> +       struct device *cpu;
> +       int ret, cpuid;
> +
> +       for_each_possible_cpu(cpuid) {
> +               struct opp_table *opp_table;
> +
> +               cpu = get_cpu_device(cpuid);
> +               if (!cpu)
> +                       continue;
> +
> +               opp_table = dev_pm_opp_get_opp_table(cpu);
> +               if (IS_ERR(opp_table))
> +                       continue;
> +
> +               if (!last_opp_table || opp_table != last_opp_table) {
> +                       last_opp_table = opp_table;
> +
> +                       ret = exynos_asv_update_cpu_opps(asv, cpu);
> +                       if (ret < 0)
> +                               dev_err(asv->dev, "Couldn't udate OPPs for cpu%d\n",
> +                                       cpuid);
> +               }
> +
> +               dev_pm_opp_put_opp_table(opp_table);
> +       }
> +
> +       return  0;
> +}
> +
> +static int exynos_asv_probe(struct platform_device *pdev)
> +{
> +       int (*probe_func)(struct exynos_asv *asv);
> +       struct exynos_asv *asv;
> +       struct device *cpu_dev;
> +       u32 product_id = 0;
> +       int ret, i;
> +
> +       cpu_dev = get_cpu_device(0);
> +       ret = dev_pm_opp_get_opp_count(cpu_dev);
> +       if (ret < 0)
> +               return -EPROBE_DEFER;
> +
> +       asv = devm_kzalloc(&pdev->dev, sizeof(*asv), GFP_KERNEL);
> +       if (!asv)
> +               return -ENOMEM;
> +
> +       asv->chipid_regmap = syscon_node_to_regmap(pdev->dev.of_node);
> +       if (IS_ERR(asv->chipid_regmap)) {
> +               dev_err(&pdev->dev, "Could not find syscon regmap\n");
> +               return PTR_ERR(asv->chipid_regmap);
> +       }
> +
> +       regmap_read(asv->chipid_regmap, EXYNOS_CHIPID_REG_PRO_ID, &product_id);
> +
> +       switch (product_id & EXYNOS_MASK) {
> +       case 0xE5422000:
> +               probe_func = exynos5422_asv_init;
> +               break;
> +       default:
> +               dev_err(&pdev->dev, "Unsupported product ID: %#x", product_id);
> +               return -ENODEV;
> +       }
> +
> +       ret = of_property_read_u32(pdev->dev.of_node, "samsung,asv-bin",
> +                                  &asv->of_bin);
> +       if (ret < 0)
> +               asv->of_bin = -EINVAL;
> +
> +       asv->dev = &pdev->dev;
> +       dev_set_drvdata(&pdev->dev, asv);
> +
> +       for (i = 0; i < ARRAY_SIZE(asv->subsys); i++)
> +               asv->subsys[i].asv = asv;
> +
> +       ret = probe_func(asv);
> +       if (ret < 0)
> +               return ret;
> +
> +       return exynos_asv_update_opps(asv);
> +}
> +
> +static const struct of_device_id exynos_asv_of_device_ids[] = {
> +       { .compatible = "samsung,exynos4210-chipid" },
> +       {}
> +};
> +
> +static struct platform_driver exynos_asv_driver = {
> +       .driver = {
> +               .name = "exynos-asv",
> +               .of_match_table = exynos_asv_of_device_ids,
> +       },
> +       .probe  = exynos_asv_probe,
> +};
> +module_platform_driver(exynos_asv_driver);
> diff --git a/drivers/soc/samsung/exynos-asv.h b/drivers/soc/samsung/exynos-asv.h
> new file mode 100644
> index 000000000000..14b4fedf2ddd
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos-asv.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 Samsung Electronics Co., Ltd.
> + *           http://www.samsung.com/
> + * Author: Sylwester Nawrocki <s.nawrocki@samsung.com>
> + *
> + * Samsung Exynos SoC Adaptive Supply Voltage support
> + */
> +#ifndef __LINUX_SOC_EXYNOS_ASV_H
> +#define __LINUX_SOC_EXYNOS_ASV_H

Yikes, that was my mistake. The file is in drivers/soc, not include,
so this could stay as previous one. Or make more path dependend -
__DRIVERS_SOC... Now it is inconsistent with
drivers/soc/samsung/exynos5422-asv.h.

I can fixup these two files while applying but if there is going to be
a resend, then change both to __DRIVERS_SOC_..._H.

Best regards,
Krzysztof
