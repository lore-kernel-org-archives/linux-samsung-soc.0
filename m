From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/2] mfd: Add Samsung Exynos Low Power Audio Subsystem
 driver
Date: Wed, 31 Aug 2016 12:31:37 +0100
Message-ID: <20160831113137.GM27357@dell>
References: <1470840500-2428-1-git-send-email-s.nawrocki@samsung.com>
 <1470840500-2428-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470840500-2428-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, robh@kernel.org, devicetree@vger.kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Inha Song <ideal.song@samsung.com>, Beomho Seo <beomho.seo@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 10 Aug 2016, Sylwester Nawrocki wrote:

> This patch adds common driver for the Top block of the Samsung Exynos
> SoC Low Power Audio Subsystem.  This is a minimal driver which prepares
> resources for IP blocks like I2S, audio DMA and UART and exposes
> a regmap for the Top block registers.  Also system power ops are added
> to ensure the Audio Subsystem is operational after system suspend/resume
> cycle.
> 
> Signed-off-by: Inha Song <ideal.song@samsung.com>
> Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> 
> Changes since v5:
>  - BIT() used for the register bit macro definitions,
>  - removed unneeded dev->of_node test,
>  - exynos_lpass_{suspend,resume} functions compiled-in conditionally,
>  - added comments for struct exynos_lpass fields.
> 
> Changes since v4:
>  - none.
> 
> Changes since v3:
>  - moved from sound/soc/samsung and rewritten as a MFD driver,
>  - PMU register definitions moved to include/linux/mfd/syscon/exynos5-pmu.h,
>  - added regmap for LPASS Top SFR region,
>  - cleaned up register bit field defintions.
> 
> Changes since v2:
>  - move misplaced SND_SAMSUNG_AUDSS Kconfig symbol addition
>    to this patch.
> ---
>  drivers/mfd/Kconfig                    |   8 ++
>  drivers/mfd/Makefile                   |   1 +
>  drivers/mfd/exynos-lpass.c             | 187 +++++++++++++++++++++++++++++++++
>  include/linux/mfd/syscon/exynos5-pmu.h |   4 +-
>  4 files changed, 199 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mfd/exynos-lpass.c

Applied, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 2d1fb64..a7ec890 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -281,6 +281,14 @@ config MFD_DLN2
>  	  etc. must be enabled in order to use the functionality of
>  	  the device.
>  
> +config MFD_EXYNOS_LPASS
> +	tristate "Samsung Exynos SoC Low Power Audio Subsystem"
> +	select MFD_CORE
> +	select REGMAP_MMIO
> +	help
> +	  Select this option to enable support for Samsung Exynos Low Power
> +	  Audio Subsystem.
> +
>  config MFD_MC13XXX
>  	tristate
>  	depends on (SPI_MASTER || I2C)
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2ba3ba3..41510bb 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
>  obj-$(CONFIG_MFD_CROS_EC)	+= cros_ec.o
>  obj-$(CONFIG_MFD_CROS_EC_I2C)	+= cros_ec_i2c.o
>  obj-$(CONFIG_MFD_CROS_EC_SPI)	+= cros_ec_spi.o
> +obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>  
>  rtsx_pci-objs			:= rtsx_pcr.o rts5209.o rts5229.o rtl8411.o rts5227.o rts5249.o
>  obj-$(CONFIG_MFD_RTSX_PCI)	+= rtsx_pci.o
> diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
> new file mode 100644
> index 0000000..578ac7b
> --- /dev/null
> +++ b/drivers/mfd/exynos-lpass.c
> @@ -0,0 +1,187 @@
> +/*
> + * Copyright (C) 2015 - 2016 Samsung Electronics Co., Ltd.
> + *
> + * Authors: Inha Song <ideal.song@samsung.com>
> + *          Sylwester Nawrocki <s.nawrocki@samsung.com>
> + *
> + * Samsung Exynos SoC series Low Power Audio Subsystem driver.
> + *
> + * This module provides regmap for the Top SFR region and instantiates
> + * devices for IP blocks like DMAC, I2S, UART.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mfd/syscon/exynos5-pmu.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +/* LPASS Top register definitions */
> +#define SFR_LPASS_CORE_SW_RESET		0x08
> +#define  LPASS_SB_SW_RESET		BIT(11)
> +#define  LPASS_UART_SW_RESET		BIT(10)
> +#define  LPASS_PCM_SW_RESET		BIT(9)
> +#define  LPASS_I2S_SW_RESET		BIT(8)
> +#define  LPASS_WDT1_SW_RESET		BIT(4)
> +#define  LPASS_WDT0_SW_RESET		BIT(3)
> +#define  LPASS_TIMER_SW_RESET		BIT(2)
> +#define  LPASS_MEM_SW_RESET		BIT(1)
> +#define  LPASS_DMA_SW_RESET		BIT(0)
> +
> +#define SFR_LPASS_INTR_CA5_MASK		0x48
> +#define SFR_LPASS_INTR_CPU_MASK		0x58
> +#define  LPASS_INTR_APM			BIT(9)
> +#define  LPASS_INTR_MIF			BIT(8)
> +#define  LPASS_INTR_TIMER		BIT(7)
> +#define  LPASS_INTR_DMA			BIT(6)
> +#define  LPASS_INTR_GPIO		BIT(5)
> +#define  LPASS_INTR_I2S			BIT(4)
> +#define  LPASS_INTR_PCM			BIT(3)
> +#define  LPASS_INTR_SLIMBUS		BIT(2)
> +#define  LPASS_INTR_UART		BIT(1)
> +#define  LPASS_INTR_SFR			BIT(0)
> +
> +struct exynos_lpass {
> +	/* pointer to the Power Management Unit regmap */
> +	struct regmap *pmu;
> +	/* pointer to the LPASS TOP regmap */
> +	struct regmap *top;
> +};
> +
> +static void exynos_lpass_core_sw_reset(struct exynos_lpass *lpass, int mask)
> +{
> +	unsigned int val = 0;
> +
> +	regmap_read(lpass->top, SFR_LPASS_CORE_SW_RESET, &val);
> +
> +	val &= ~mask;
> +	regmap_write(lpass->top, SFR_LPASS_CORE_SW_RESET, val);
> +
> +	usleep_range(100, 150);
> +
> +	val |= mask;
> +	regmap_write(lpass->top, SFR_LPASS_CORE_SW_RESET, val);
> +}
> +
> +static void exynos_lpass_enable(struct exynos_lpass *lpass)
> +{
> +	/* Unmask SFR, DMA and I2S interrupt */
> +	regmap_write(lpass->top, SFR_LPASS_INTR_CA5_MASK,
> +		     LPASS_INTR_SFR | LPASS_INTR_DMA | LPASS_INTR_I2S);
> +
> +	regmap_write(lpass->top, SFR_LPASS_INTR_CPU_MASK,
> +		     LPASS_INTR_SFR | LPASS_INTR_DMA | LPASS_INTR_I2S);
> +
> +	/* Activate related PADs from retention state */
> +	regmap_write(lpass->pmu, EXYNOS5433_PAD_RETENTION_AUD_OPTION,
> +		     EXYNOS5433_PAD_INITIATE_WAKEUP_FROM_LOWPWR);
> +
> +	exynos_lpass_core_sw_reset(lpass, LPASS_I2S_SW_RESET);
> +	exynos_lpass_core_sw_reset(lpass, LPASS_DMA_SW_RESET);
> +	exynos_lpass_core_sw_reset(lpass, LPASS_MEM_SW_RESET);
> +}
> +
> +static void exynos_lpass_disable(struct exynos_lpass *lpass)
> +{
> +	/* Mask any unmasked IP interrupt sources */
> +	regmap_write(lpass->top, SFR_LPASS_INTR_CPU_MASK, 0);
> +	regmap_write(lpass->top, SFR_LPASS_INTR_CA5_MASK, 0);
> +
> +	/* Deactivate related PADs from retention state */
> +	regmap_write(lpass->pmu, EXYNOS5433_PAD_RETENTION_AUD_OPTION, 0);
> +}
> +
> +static const struct regmap_config exynos_lpass_reg_conf = {
> +	.reg_bits	= 32,
> +	.reg_stride	= 4,
> +	.val_bits	= 32,
> +	.max_register	= 0xfc,
> +	.fast_io	= true,
> +};
> +
> +static int exynos_lpass_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct exynos_lpass *lpass;
> +	void __iomem *base_top;
> +	struct resource *res;
> +
> +	lpass = devm_kzalloc(dev, sizeof(*lpass), GFP_KERNEL);
> +	if (!lpass)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base_top = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base_top))
> +		return PTR_ERR(base_top);
> +
> +	lpass->top = regmap_init_mmio(dev, base_top,
> +					&exynos_lpass_reg_conf);
> +	if (IS_ERR(lpass->top)) {
> +		dev_err(dev, "LPASS top regmap initialization failed\n");
> +		return PTR_ERR(lpass->top);
> +	}
> +
> +	lpass->pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						"samsung,pmu-syscon");
> +	if (IS_ERR(lpass->pmu)) {
> +		dev_err(dev, "Failed to lookup PMU regmap\n");
> +		return PTR_ERR(lpass->pmu);
> +	}
> +
> +	platform_set_drvdata(pdev, lpass);
> +	exynos_lpass_enable(lpass);
> +
> +	return of_platform_populate(dev->of_node, NULL, NULL, dev);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int exynos_lpass_suspend(struct device *dev)
> +{
> +	struct exynos_lpass *lpass = dev_get_drvdata(dev);
> +
> +	exynos_lpass_disable(lpass);
> +
> +	return 0;
> +}
> +
> +static int exynos_lpass_resume(struct device *dev)
> +{
> +	struct exynos_lpass *lpass = dev_get_drvdata(dev);
> +
> +	exynos_lpass_enable(lpass);
> +
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(lpass_pm_ops, exynos_lpass_suspend,
> +					exynos_lpass_resume);
> +
> +static const struct of_device_id exynos_lpass_of_match[] = {
> +	{ .compatible = "samsung,exynos5433-lpass" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, exynos_lpass_of_match);
> +
> +static struct platform_driver exynos_lpass_driver = {
> +	.driver = {
> +		.name		= "exynos-lpass",
> +		.pm		= &lpass_pm_ops,
> +		.of_match_table	= exynos_lpass_of_match,
> +	},
> +	.probe	= exynos_lpass_probe,
> +};
> +module_platform_driver(exynos_lpass_driver);
> +
> +MODULE_DESCRIPTION("Samsung Low Power Audio Subsystem driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mfd/syscon/exynos5-pmu.h b/include/linux/mfd/syscon/exynos5-pmu.h
> index 76f30f9..c28ff21 100644
> --- a/include/linux/mfd/syscon/exynos5-pmu.h
> +++ b/include/linux/mfd/syscon/exynos5-pmu.h
> @@ -43,8 +43,10 @@
>  #define EXYNOS5433_MIPI_PHY2_CONTROL		(0x718)
>  
>  #define EXYNOS5_PHY_ENABLE			BIT(0)
> -
>  #define EXYNOS5_MIPI_PHY_S_RESETN		BIT(1)
>  #define EXYNOS5_MIPI_PHY_M_RESETN		BIT(2)
>  
> +#define EXYNOS5433_PAD_RETENTION_AUD_OPTION		(0x3028)
> +#define EXYNOS5433_PAD_INITIATE_WAKEUP_FROM_LOWPWR	BIT(28)
> +
>  #endif /* _LINUX_MFD_SYSCON_PMU_EXYNOS5_H_ */

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
