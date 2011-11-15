From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] pinctrl: add a gpio and pinctrl driver for samsung io-pad
 controllers
Date: Wed, 16 Nov 2011 01:36:40 +0530
Message-ID: <1321387600-21033-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37629 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932184Ab1KOUFI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 15:05:08 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUP006X8X4IGJJ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2011 05:05:06 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUP004P9X49WQ40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2011 05:05:06 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linaro-kernel@lists.linaro.org, linux-samsung-soc@vger.kernel.org
Cc: linus.walleij@linaro.org, kgene.kim@samsung.com

Add a combined gpio and pinctrl io-pad driver for Samsung platforms.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
This driver supports gpio, pinctrl and pinmux functionality. At present, all the
possible pin groups and pin functions have not been added. This driver is
designed to be reusable across all Samsung SoC's and when this implemtation is
complete, the gpio driver in driver/gpio for samsung platforms can be phased out.
Features like GPIO interrupt support and pin-config support are yet to be added.

 drivers/pinctrl/Kconfig           |    6 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/pinctrl-samsung.c |  688 +++++++++++++++++++++++++++++++++++++
 3 files changed, 695 insertions(+), 0 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-samsung.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index e17e2f8..55739d2 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -30,6 +30,12 @@ config PINMUX_U300
 	depends on ARCH_U300
 	select PINMUX
 
+config PINCTRL_SAMSUNG
+	bool "Samsung pinctrl driver"
+	default y
+	depends on PLAT_SAMSUNG
+	select PINMUX
+
 endmenu
 
 endif
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index bdc548a..463b934 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_PINCTRL)		+= core.o
 obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINMUX_SIRF)	+= pinmux-sirf.o
 obj-$(CONFIG_PINMUX_U300)	+= pinmux-u300.o
+obj-$(CONFIG_PINCTRL_SAMSUNG)	+= pinctrl-samsung.o
diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
new file mode 100644
index 0000000..0705a8d
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -0,0 +1,688 @@
+/*
+ * pin-controller/pin-mux/pin-config/gpio-driver for Samsung's SoC's.
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2011 Linaro Ltd
+ *		http://www.linaro.org
+ *
+ * Author: Thomas Abraham <thomas.abraham@linaro.org>
+ *
+ * This driver is divided into two main components, gpiolib subsystem interface
+ * and the pin-controller subsystem interface. This model help to better
+ * abstract the details of pad controller for all the Samsung SoC's. The driver
+ * is reusuable on all the Samsung SoC's, though the data that could get
+ * accumulated in this file could be daunting.
+ *
+ * The driver functions are kept as generic as possible such that they are
+ * usable across multiple Samsung SoC's. The driver data differentiates the
+ * operation of the driver for each SoC by describing the complete
+ * pad-controller structure to the driver and the generic driver code operates
+ * on the SoC specific driver data. The driver data also includes runtime data
+ * required for the operation of the driver.
+ *
+ * List of ToDo's:
+ * 1. Add GPIO Interrupt support.
+ * 2. Add external interrupt (wakeup) support.
+ * 3  Add power management support.
+ * 4  Add pin-config (pull up/down, driver strength) support.
+ * 5. Find a better way to populate data about pins and functions.
+ * 6. Add driver data, pins, groups, functions for all Samsung SoC's and test.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/gpio.h>
+
+#include <plat/map-base.h>
+#include <plat/map-s5p.h>
+
+#define DAT_REG		0x4
+
+/**
+ * struct samsung_pin_bank: represent a controller pin-bank.
+ * @reg_offset: starting offset of the pin-bank registers.
+ * @pin_base: starting pin number of the bank.
+ * @nr_pins: number of pins included in this bank.
+ * @func_width: width of the function selector bit field.
+ * @irq_base: starting eint number of the bank.
+ */
+struct samsung_pin_bank {
+	unsigned int		reg_offset;
+	unsigned int		pin_base;
+	unsigned int		nr_pins;
+	unsigned int		func_width;
+	unsigned int		irq_base;
+};
+
+/**
+ * struct samsung_pin_ctrl: represent a pin controller.
+ * @pin_banks: list of pin banks included in this controller.
+ * @nr_banks: number of pin banks.
+ * @base: starting system wide pin number.
+ * @nr_pins: number of pins supported by the controller.
+ * @label: for debug information.
+ */
+struct samsung_pin_ctrl {
+	struct samsung_pin_bank *pin_banks;
+	unsigned int		nr_banks;
+	unsigned int		base;
+	unsigned int		nr_pins;
+	char			*label;
+};
+
+/**
+ * struct samsung_pinctrl_drv_data: wrapper for holding driver data together.
+ * @virt_base: register base address of the controller.
+ * @ctrl: pin controller instance managed by the driver.
+ * @pctl: pin controller descriptor registered with the pinctrl subsystem.
+ * @pctl_dev: cookie representing pinctrl device instance.
+ * @pin_groups: list of pin groups available to the driver.
+ * @nr_groups: number of such pin groups.
+ * @pmx_functions: list of pin functions available to the driver.
+ * @nr_function: number of such pin functions.
+ * @gc: gpio_chip instance registered with gpiolib.
+ */
+struct samsung_pinctrl_drv_data {
+	void __iomem			*virt_base;
+	struct samsung_pin_ctrl		*ctrl;
+	struct pinctrl_desc		*pctl;
+	struct pinctrl_dev		*pctl_dev;
+	const struct samsung_pin_group	*pin_groups;
+	unsigned int			nr_groups;
+	const struct samsung_pmx_func	*pmx_functions;
+	unsigned int			nr_functions;
+	struct gpio_chip		*gc;
+};
+
+/**
+ * struct samsung_pin_group: represent group of pins of a pinmux function.
+ * @name: name of the pin group, used to lookup the group.
+ * @pins: the pins included in this group.
+ * @num_pins: number of pins included in this group.
+ * @func: the function number to be programmed when selected.
+ */
+struct samsung_pin_group {
+	const char		*name;
+	const unsigned int	*pins;
+	const unsigned int	num_pins;
+	unsigned int		func;
+};
+
+/**
+ * struct samsung_pmx_func: represent a pin function.
+ * @name: name of the pin function, used to lookup the function.
+ * @groups: one or more names of pin groups that provide this function.
+ * @num_groups: number of groups included in @groups.
+ */
+struct samsung_pmx_func {
+	const char		*name;
+	const char * const	*groups;
+	const unsigned		num_groups;
+};
+
+/* Note: The pin group list needs to be further populated */
+static unsigned int exynos4210_spi0_pins[] = {
+	EXYNOS4_GPB(0),	EXYNOS4_GPB(1),	EXYNOS4_GPB(2),	EXYNOS4_GPB(3),
+};
+
+static unsigned int exynos4210_i2c0_pins[] = {
+	EXYNOS4_GPD1(0), EXYNOS4_GPD1(1),
+};
+
+static unsigned int exynos4210_sdhci0_pins[] = {
+	EXYNOS4_GPK0(0), EXYNOS4_GPK0(1), EXYNOS4_GPK0(2), EXYNOS4_GPK0(3),
+	EXYNOS4_GPK0(4), EXYNOS4_GPK0(5), EXYNOS4_GPK0(6), EXYNOS4_GPK0(7)
+};
+
+static unsigned int exynos4210_sdhci2_pins[] = {
+	EXYNOS4_GPK2(0), EXYNOS4_GPK2(1), EXYNOS4_GPK2(2), EXYNOS4_GPK2(3),
+	EXYNOS4_GPK2(4), EXYNOS4_GPK2(5), EXYNOS4_GPK2(6), EXYNOS4_GPK2(7)
+};
+
+static unsigned int exynos4210_i2s0_pins[] = {
+	EXYNOS4_GPZ(0), EXYNOS4_GPZ(1), EXYNOS4_GPZ(2), EXYNOS4_GPZ(3),
+	EXYNOS4_GPZ(4), EXYNOS4_GPZ(5), EXYNOS4_GPZ(6), EXYNOS4_GPZ(7)
+};
+
+static unsigned int exynos4210_pcm0_pins[] = {
+	EXYNOS4_GPZ(0), EXYNOS4_GPZ(1), EXYNOS4_GPZ(2), EXYNOS4_GPZ(3),
+	EXYNOS4_GPZ(4), EXYNOS4_GPZ(5),
+};
+
+#define PIN_GROUP(n, p, f)				\
+	{						\
+		.name		= n,			\
+		.pins		= p,			\
+		.num_pins	= ARRAY_SIZE(p),	\
+		.func		= f			\
+	}
+
+/*
+ * list of pin groups available for pin-controller[0] of Exynos4210.
+ * Note: This listed needs to be populated.
+ */
+static const struct samsung_pin_group exynos4210_pin_groups0[] = {
+	PIN_GROUP("spi0_grp", exynos4210_spi0_pins, 2),
+	PIN_GROUP("i2c0_grp", exynos4210_i2c0_pins, 2),
+};
+
+/*
+ * list of pin groups available for pin-controller[1] of Exynos4210.
+ * Note: This listed needs to be populated.
+ */
+static const struct samsung_pin_group exynos4210_pin_groups1[] = {
+	PIN_GROUP("sdhci0_grp", exynos4210_sdhci0_pins, 2),
+	PIN_GROUP("sdhci2_grp", exynos4210_sdhci2_pins, 2),
+};
+
+/*
+ * list of pin groups available for pin-controller[2] of Exynos4210.
+ * Note: This listed needs to be populated.
+ */
+static const struct samsung_pin_group exynos4210_pin_groups2[] = {
+	PIN_GROUP("i2s0_grp", exynos4210_i2s0_pins, 2),
+	PIN_GROUP("pcm0_grp", exynos4210_pcm0_pins, 2),
+};
+
+/* check if the selector is a valid pin group selector */
+static int samsung_list_groups(struct pinctrl_dev *pctldev, unsigned selector)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+
+	drvdata = pinctrl_dev_get_drvdata(pctldev);
+	if (selector >= drvdata->nr_groups)
+		return -EINVAL;
+	return 0;
+}
+
+/* return the name of the group selected by the group selector */
+static const char *samsung_get_group_name(struct pinctrl_dev *pctldev,
+						unsigned selector)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+
+	drvdata = pinctrl_dev_get_drvdata(pctldev);
+	return drvdata->pin_groups[selector].name;
+}
+
+/* return the pin numbers associated with the specified group */
+static int samsung_get_group_pins(struct pinctrl_dev *pctldev,
+		unsigned selector, const unsigned **pins, unsigned *num_pins)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+
+	drvdata = pinctrl_dev_get_drvdata(pctldev);
+	*pins = drvdata->pin_groups[selector].pins;
+	*num_pins = drvdata->pin_groups[selector].num_pins;
+	return 0;
+}
+
+/* list of pinctrl callbacks for the pinctrl core */
+static struct pinctrl_ops samsung_pctrl_ops = {
+	.list_groups	= samsung_list_groups,
+	.get_group_name	= samsung_get_group_name,
+	.get_group_pins	= samsung_get_group_pins,
+};
+
+static const char * const i2c0_grp[] = { "i2c0_grp" };
+static const char * const spi0_grp[] = { "spi0_grp" };
+static const char * const sdhci0_grp[] = { "sdhci0_grp" };
+static const char * const sdhci2_grp[] = { "sdhci2_grp" };
+static const char * const i2s0_grp[] = { "i2s0_grp" };
+static const char * const pcm0_grp[] = { "pcm0_grp" };
+
+#define PMX_FUNC(n, g)					\
+	{						\
+		.name		= n,			\
+		.groups		= g,			\
+		.num_groups	= ARRAY_SIZE(g),	\
+	}
+
+/*
+ * list of function names supported by the pinmux vertical.
+ * Note: All functions to be populated here.
+ */
+static const struct samsung_pmx_func exynos4210_pmx_functions0[] = {
+	PMX_FUNC("spi0", spi0_grp),
+	PMX_FUNC("i2c0", i2c0_grp),
+};
+
+/*
+ * list of function names supported by the pinmux vertical.
+ * Note: All functions to be populated here.
+ */
+static const struct samsung_pmx_func exynos4210_pmx_functions1[] = {
+	PMX_FUNC("sdhci0", sdhci0_grp),
+	PMX_FUNC("sdhci2", sdhci2_grp),
+};
+
+/*
+ * list of function names supported by the pinmux vertical.
+ * Note: All functions to be populated here.
+ */
+static const struct samsung_pmx_func exynos4210_pmx_functions2[] = {
+	PMX_FUNC("i2s0", i2s0_grp),
+	PMX_FUNC("pcm0", pcm0_grp),
+};
+
+/* check if the selector is a valid pin function selector */
+static int samsung_pinmux_list_funcs(struct pinctrl_dev *pctldev,
+					unsigned selector)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+
+	drvdata = pinctrl_dev_get_drvdata(pctldev);
+	if (selector >= drvdata->nr_groups)
+		return -EINVAL;
+	return 0;
+}
+
+/* return the name of the pin function specified */
+static const char *samsung_pinmux_get_fname(struct pinctrl_dev *pctldev,
+						unsigned selector)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+
+	drvdata = pinctrl_dev_get_drvdata(pctldev);
+	return drvdata->pmx_functions[selector].name;
+}
+
+/* return the groups associated for the specified function selector */
+static int samsung_pinmux_get_groups(struct pinctrl_dev *pctldev,
+		unsigned selector, const char * const **groups,
+		unsigned * const num_groups)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+
+	drvdata = pinctrl_dev_get_drvdata(pctldev);
+	*groups = drvdata->pmx_functions[selector].groups;
+	*num_groups = drvdata->pmx_functions[selector].num_groups;
+	return 0;
+}
+
+/*
+ * given a pin number that is local to a pin controller, find out the pin bank
+ * and the register base of the pin bank.
+ */
+static void pin_to_reg_bank(struct gpio_chip *gc, unsigned pin,
+			void __iomem **reg, unsigned long *offset,
+			struct samsung_pin_bank **bank)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+	struct samsung_pin_bank *b;
+
+	drvdata = dev_get_drvdata(gc->dev);
+	b = drvdata->ctrl->pin_banks;
+
+	while (b->pin_base + b->nr_pins < pin)
+		b++;
+
+	*reg = drvdata->virt_base + b->reg_offset;
+	*offset = pin - b->pin_base;
+	if (bank)
+		*bank = b;
+
+	/* some banks have two config registers in a single bank */
+	if (*offset * b->func_width > BITS_PER_LONG)
+		*reg += 4;
+}
+
+/* enable or disable a pinmux function */
+static void samsung_pimux_setup(struct pinctrl_dev *pctldev, unsigned selector,
+					unsigned group, bool enable)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+	const unsigned int *pin;
+	unsigned long data, pin_offset, cnt;
+	struct samsung_pin_bank *bank;
+	void __iomem *reg;
+	unsigned int mask, shift;
+
+	drvdata = pinctrl_dev_get_drvdata(pctldev);
+	pin = drvdata->pin_groups[group].pins;
+
+	/*
+	 * for each pin in the pin group selected, program the correspoding pin
+	 * pin function number in the config register.
+	 */
+	for (cnt = 0; cnt < drvdata->pin_groups[group].num_pins; cnt++, pin++) {
+		pin_to_reg_bank(drvdata->gc, *pin - drvdata->ctrl->base,
+				&reg, &pin_offset, &bank);
+		mask = (1 << bank->func_width) - 1;
+		shift = pin_offset * bank->func_width;
+
+		data = readl(reg);
+		data &= ~(mask << shift);
+		if (enable)
+			data |= drvdata->pin_groups[group].func << shift;
+		writel(data, reg);
+	}
+}
+
+/* enable a specified pinmux by writing to registers */
+static int samsung_pinmux_enable(struct pinctrl_dev *pctldev, unsigned selector,
+					unsigned group)
+{
+	samsung_pimux_setup(pctldev, selector, group, true);
+	return 0;
+}
+
+/* disable a specified pinmux by writing to registers */
+static void samsung_pinmux_disable(struct pinctrl_dev *pctldev,
+					unsigned selector, unsigned group)
+{
+	samsung_pimux_setup(pctldev, selector, group, false);
+}
+
+/* list of pinmux callbacks for the pinmux vertical in pinctrl core */
+static struct pinmux_ops samsung_pinmux_ops = {
+	.list_functions		= samsung_pinmux_list_funcs,
+	.get_function_name	= samsung_pinmux_get_fname,
+	.get_function_groups	= samsung_pinmux_get_groups,
+	.enable			= samsung_pinmux_enable,
+	.disable		= samsung_pinmux_disable,
+};
+
+/* gpiolib gpio_set callback function */
+static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+{
+	void __iomem *reg;
+	unsigned long pin_offset, data;
+
+	pin_to_reg_bank(gc, offset, &reg, &pin_offset, NULL);
+	data = readl(reg + DAT_REG);
+	data &= ~(1 << pin_offset);
+	if (value)
+		data |= 1 << pin_offset;
+	__raw_writel(data, reg + DAT_REG);
+}
+
+/* gpiolib gpio_get callback function */
+static int samsung_gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	void __iomem *reg;
+	unsigned long pin_offset, data;
+
+	pin_to_reg_bank(gc, offset, &reg, &pin_offset, NULL);
+	data = readl(reg + DAT_REG);
+	data >>= pin_offset;
+	data &= 1;
+	return data;
+}
+
+/* register the pinctrl interface with the pinctrl subsystem */
+static int __init samsung_pinctrl_register(struct platform_device *pdev,
+				struct samsung_pinctrl_drv_data *drvdata)
+{
+	struct pinctrl_desc *ctrldesc = drvdata->pctl;
+	struct pinctrl_pin_desc *pindesc;
+	int pin;
+
+	pindesc = devm_kzalloc(&pdev->dev, sizeof(*pindesc) *
+			drvdata->ctrl->nr_pins, GFP_KERNEL);
+	if (!pindesc) {
+		dev_err(&pdev->dev, "mem alloc for pin descriptors failed\n");
+		return -ENOMEM;
+	}
+	ctrldesc->pins = pindesc;
+	ctrldesc->npins = drvdata->ctrl->nr_pins;
+	ctrldesc->maxpin = drvdata->ctrl->nr_pins;
+
+	/* dynamically create the pindesc, ignore the name for pindesc */
+	for (pin = 0; pin < ctrldesc->maxpin; pin++, pindesc++)
+		pindesc->number = pin + drvdata->ctrl->base;
+
+	drvdata->pctl_dev = pinctrl_register(ctrldesc, &pdev->dev, drvdata);
+	if (!drvdata->pctl_dev) {
+		dev_err(&pdev->dev, "could not register pinctrl driver\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* register the gpiolib interface with the gpiolib subsystem */
+static int __init samsung_gpiolib_register(struct platform_device *pdev,
+				struct samsung_pinctrl_drv_data *drvdata)
+{
+	struct gpio_chip *gc;
+	int ret;
+
+	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc) {
+		dev_err(&pdev->dev, "mem alloc for gpio_chip failed\n");
+		return -ENOMEM;
+	}
+
+	drvdata->gc = gc;
+	gc->base = drvdata->ctrl->base;
+	gc->ngpio = drvdata->ctrl->nr_pins;
+	gc->dev = &pdev->dev;
+	gc->set = samsung_gpio_set;
+	gc->get = samsung_gpio_get;
+	gc->label = drvdata->ctrl->label;
+	gc->owner = THIS_MODULE;
+	ret = gpiochip_add(gc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register gpio_chip %s, error "
+					"code: %d\n", gc->label, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __devinit samsung_pinctrl_probe(struct platform_device *pdev)
+{
+	struct samsung_pinctrl_drv_data *drvdata;
+	struct resource *res;
+	int ret;
+
+	drvdata = (struct samsung_pinctrl_drv_data *)
+			platform_get_device_id(pdev)->driver_data + (pdev->id);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "cannot find IO resource\n");
+		return -ENOENT;
+	}
+
+	res = request_mem_region(res->start, resource_size(res),
+					pdev->name);
+	if (!res) {
+		dev_err(&pdev->dev, "request for mem region failed\n");
+		return -EBUSY;
+	}
+
+	drvdata->virt_base = ioremap(res->start, resource_size(res));
+	if (!drvdata->virt_base) {
+		dev_err(&pdev->dev, "ioremap failed\n");
+		return -EINVAL;
+	}
+
+	ret = samsung_gpiolib_register(pdev, drvdata);
+	if (ret)
+		return ret;
+
+	ret = samsung_pinctrl_register(pdev, drvdata);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, drvdata);
+	return 0;
+}
+
+/* driver data for various samsung soc's */
+#ifdef CONFIG_CPU_EXYNOS4210
+
+#define EXYNOS4_PIN_BANK(offset, __gpio)		\
+	{						\
+		.reg_offset	= offset,		\
+		.pin_base	= (__gpio##_START),	\
+		.nr_pins	= (__gpio##_NR),	\
+		.func_width	= 4,			\
+	}
+
+/* pin banks of pin-controller 0 */
+static struct samsung_pin_bank exynos4210_pin_banks0[] = {
+	EXYNOS4_PIN_BANK(0x000, EXYNOS4_GPIO_A0),
+	EXYNOS4_PIN_BANK(0x020, EXYNOS4_GPIO_A1),
+	EXYNOS4_PIN_BANK(0x040, EXYNOS4_GPIO_B),
+	EXYNOS4_PIN_BANK(0x060, EXYNOS4_GPIO_C0),
+	EXYNOS4_PIN_BANK(0x080, EXYNOS4_GPIO_C1),
+	EXYNOS4_PIN_BANK(0x0A0, EXYNOS4_GPIO_D0),
+	EXYNOS4_PIN_BANK(0x0C0, EXYNOS4_GPIO_D1),
+	EXYNOS4_PIN_BANK(0x0E0, EXYNOS4_GPIO_E0),
+	EXYNOS4_PIN_BANK(0x100, EXYNOS4_GPIO_E1),
+	EXYNOS4_PIN_BANK(0x120, EXYNOS4_GPIO_E2),
+	EXYNOS4_PIN_BANK(0x140, EXYNOS4_GPIO_E3),
+	EXYNOS4_PIN_BANK(0x160, EXYNOS4_GPIO_E4),
+	EXYNOS4_PIN_BANK(0x180, EXYNOS4_GPIO_F0),
+	EXYNOS4_PIN_BANK(0x1A0, EXYNOS4_GPIO_F1),
+	EXYNOS4_PIN_BANK(0x1C0, EXYNOS4_GPIO_F2),
+	EXYNOS4_PIN_BANK(0x1E0, EXYNOS4_GPIO_F3),
+};
+
+#define EXYNOS4_PIN_BANK1(offset, __gpio)		\
+	{						\
+		.reg_offset	= offset,		\
+		.pin_base	= (__gpio##_START) - EXYNOS4_GPIO_J0_START,\
+		.nr_pins	= (__gpio##_NR),	\
+		.func_width	= 4,			\
+	}
+
+/* pin banks of pin-controller 1 */
+static struct samsung_pin_bank exynos4210_pin_banks1[] = {
+	EXYNOS4_PIN_BANK1(0x000, EXYNOS4_GPIO_J0),
+	EXYNOS4_PIN_BANK1(0x020, EXYNOS4_GPIO_J1),
+	EXYNOS4_PIN_BANK1(0x040, EXYNOS4_GPIO_K0),
+	EXYNOS4_PIN_BANK1(0x060, EXYNOS4_GPIO_K1),
+	EXYNOS4_PIN_BANK1(0x080, EXYNOS4_GPIO_K2),
+	EXYNOS4_PIN_BANK1(0x0A0, EXYNOS4_GPIO_K3),
+	EXYNOS4_PIN_BANK1(0x0C0, EXYNOS4_GPIO_L0),
+	EXYNOS4_PIN_BANK1(0x0E0, EXYNOS4_GPIO_L1),
+	EXYNOS4_PIN_BANK1(0x100, EXYNOS4_GPIO_L2),
+	EXYNOS4_PIN_BANK1(0x120, EXYNOS4_GPIO_Y0),
+	EXYNOS4_PIN_BANK1(0x140, EXYNOS4_GPIO_Y1),
+	EXYNOS4_PIN_BANK1(0x160, EXYNOS4_GPIO_Y2),
+	EXYNOS4_PIN_BANK1(0x180, EXYNOS4_GPIO_Y3),
+	EXYNOS4_PIN_BANK1(0x1A0, EXYNOS4_GPIO_Y4),
+	EXYNOS4_PIN_BANK1(0x1C0, EXYNOS4_GPIO_Y5),
+	EXYNOS4_PIN_BANK1(0x1E0, EXYNOS4_GPIO_Y6),
+	EXYNOS4_PIN_BANK1(0xC00, EXYNOS4_GPIO_X0),
+	EXYNOS4_PIN_BANK1(0xC20, EXYNOS4_GPIO_X1),
+	EXYNOS4_PIN_BANK1(0xC40, EXYNOS4_GPIO_X2),
+	EXYNOS4_PIN_BANK1(0xC60, EXYNOS4_GPIO_X3),
+};
+
+#define EXYNOS4_PIN_BANK2(offset, __gpio)		\
+	{						\
+		.reg_offset	= offset,		\
+		.pin_base	= (__gpio##_START) - EXYNOS4_GPIO_Z_START,\
+		.nr_pins	= (__gpio##_NR),	\
+		.func_width	= 4,			\
+	}
+
+/* pin banks of pin-controller 2 */
+static struct samsung_pin_bank exynos4210_pin_banks2[] = {
+	EXYNOS4_PIN_BANK2(0x000, EXYNOS4_GPIO_Z),
+};
+
+static struct samsung_pinctrl_drv_data exynos4210_pinctrl_drv_data[] = {
+	{
+		/* pin-controller instance 0 data */
+		.ctrl = &(struct samsung_pin_ctrl) {
+			.pin_banks	= exynos4210_pin_banks0,
+			.nr_banks	= ARRAY_SIZE(exynos4210_pin_banks0),
+			.base		= EXYNOS4_GPIO_A0_START,
+			.nr_pins	= EXYNOS4_GPIO_J0_START - 1,
+			.label		= "exynos4210-gpio-ctrl0",
+		},
+		.pctl = &(struct pinctrl_desc) {
+			.name		= "exynos4210_pinctrl",
+			.pctlops	= &samsung_pctrl_ops,
+			.pmxops		= &samsung_pinmux_ops,
+			.owner		= THIS_MODULE,
+		},
+		.pin_groups = exynos4210_pin_groups0,
+		.nr_groups = ARRAY_SIZE(exynos4210_pin_groups0),
+		.pmx_functions = exynos4210_pmx_functions0,
+		.nr_functions = ARRAY_SIZE(exynos4210_pmx_functions0),
+	}, {
+		/* pin-controller instance 1 data */
+		.ctrl = &(struct samsung_pin_ctrl) {
+			.pin_banks	= exynos4210_pin_banks1,
+			.nr_banks	= ARRAY_SIZE(exynos4210_pin_banks1),
+			.base		= EXYNOS4_GPIO_J0_START,
+			.nr_pins	= EXYNOS4_GPIO_Z_START -
+						EXYNOS4_GPIO_J0_START,
+			.label		= "exynos4210-gpio-ctrl1",
+		},
+		.pctl = &(struct pinctrl_desc) {
+			.name		= "exynos4210_pinctrl",
+			.pctlops	= &samsung_pctrl_ops,
+			.pmxops		= &samsung_pinmux_ops,
+			.owner		= THIS_MODULE,
+		},
+		.pin_groups = exynos4210_pin_groups1,
+		.nr_groups = ARRAY_SIZE(exynos4210_pin_groups1),
+		.pmx_functions = exynos4210_pmx_functions1,
+		.nr_functions = ARRAY_SIZE(exynos4210_pmx_functions1),
+	}, {
+		/* pin-controller instance 2 data */
+		.ctrl = &(struct samsung_pin_ctrl) {
+			.pin_banks	= exynos4210_pin_banks2,
+			.nr_banks	= ARRAY_SIZE(exynos4210_pin_banks2),
+			.base		= EXYNOS4_GPIO_Z_START,
+			.nr_pins	= EXYNOS4_GPIO_Z_NR,
+			.label		= "exynos4210-gpio-ctrl2",
+		},
+		.pctl = &(struct pinctrl_desc) {
+			.name		= "exynos4210_pinctrl",
+			.pctlops	= &samsung_pctrl_ops,
+			.pmxops		= &samsung_pinmux_ops,
+			.owner		= THIS_MODULE,
+		},
+		.pin_groups = exynos4210_pin_groups2,
+		.nr_groups = ARRAY_SIZE(exynos4210_pin_groups2),
+		.pmx_functions = exynos4210_pmx_functions2,
+		.nr_functions = ARRAY_SIZE(exynos4210_pmx_functions2),
+	},
+};
+#define EXYNOS4210_PCTRL_DRVDATA ((kernel_ulong_t)&exynos4210_pinctrl_drv_data)
+#else
+#define EXYNOS4210_PCTRL_DRVDATA (kernel_ulong_t)NULL
+#endif /* CONFIG_CPU_EXYNOS4210 */
+
+static struct platform_device_id samsung_pinctrl_driver_ids[] = {
+	{
+		.name		= "exynos4-pinctrl",
+		.driver_data	= EXYNOS4210_PCTRL_DRVDATA,
+	},
+};
+
+static struct platform_driver samsung_pinctrl_driver = {
+	.probe		= samsung_pinctrl_probe,
+	.id_table	= samsung_pinctrl_driver_ids,
+	.driver = {
+		.name	= "samsung-pinctrl",
+		.owner	= THIS_MODULE,
+	},
+};
+
+static int __init samsung_pinctrl_drv_register(void)
+{
+	return platform_driver_register(&samsung_pinctrl_driver);
+}
+postcore_initcall(samsung_pinctrl_drv_register);
-- 
1.6.6.rc2
