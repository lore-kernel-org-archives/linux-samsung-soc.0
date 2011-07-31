From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] arm: exynos4: Add support for dt irq specifier to linux
 virq conversion
Date: Sat, 30 Jul 2011 21:46:53 -0600
Message-ID: <20110731034653.GF24334@ponder.secretlab.ca>
References: <1311791068-29933-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:43838 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752162Ab1GaQCm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jul 2011 12:02:42 -0400
Received: by wwe5 with SMTP id 5so4901362wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Jul 2011 09:02:41 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1311791068-29933-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, nala.la@samsung.com, kgene.kim@samsung.com, chaos.youn@samsung.com

On Wed, Jul 27, 2011 at 11:54:28PM +0530, Thomas Abraham wrote:
> Exynos4 includes two interrupt controllers - External GIC and External
> Interrupt Combiner. External GIC can handle 16 software generated
> interrupts (SGI), 16 Private Peripheral Interrupts (PPI) and 128
> Shared Peripheral Interrupts (SPI). External Interrupt Combiner manages
> 32 groups of 8 interrupts each and feeds 32 interrupts as SPI interrupts
> to the External GIC controller.
> 
> This patch supports conversion of device tree interrupt specifier to
> linux virq domain for both the interrupt controllers. The concept of
> this patch is derived from Grant's 'simple' irq converter.
> 
> This patch is based on Grant's following patchset
> [PATCH v3 0/2] Simple irq_domain implementation
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung.txt |   72 +++++++++++++
>  arch/arm/mach-exynos4/Makefile                    |    1 +
>  arch/arm/mach-exynos4/include/mach/irqs.h         |    3 +
>  arch/arm/mach-exynos4/irqdomain.c                 |  117 +++++++++++++++++++++
>  arch/arm/mach-exynos4/mach-exynos4-dt.c           |    8 +-
>  5 files changed, 196 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/irqdomain.c
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung.txt b/Documentation/devicetree/bindings/arm/samsung.txt
> index 5676bca..878aa01 100644
> --- a/Documentation/devicetree/bindings/arm/samsung.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung.txt
> @@ -6,3 +6,75 @@ Required root node properties:
>    - compatible = "samsung,smdkv310", "samsung,exynos4210'.
>        (a) "samsung,smdkv310" - for Samsung's SMDKV310 eval board.
>        (b) "samsung,exynos4210" - for boards based on Exynos4210 processor.
> +
> +
> +Exynos4 Interrupt Controllers
> +-----------------------------
> +
> +Samsung's Exynos4 architecture includes two interrupt controllers.
> +  - External GIC
> +  - External Interrupt Combiner.
> +
> +The external GIC can manage
> +  - 16 Software Generated Interrupts (SGI).
> +  - 16 Private Peripheral Interrupts (PPI).
> +  - 128 Shared Peripheral Interrupts (SPI).
> +
> +Out of the 128 Shared Peripheral Interrupts (SPI's), 32 interrupts
> +are sourced from a interrupt combiner. The interrupt combiner provides
> +32 groups of interrupts with a maximum of 8 interrupts combined per
> +group.
> +
> +External GIC properties:
> +  - compatible: should be "samsung,exynos4-ext-gic".
> +  - interrupt-cells: should be <2>. The meaning of the cells are
> +      * First Cell: Interrupt Number.
> +      * Second Cell: Type of Interrupt (0-SPI, 1-SGI, 2-PPI).

Type should probably be the first cell.  That's how this has been
handled in the past for other hardware.  Also, the gic binding is
going to be shared for a bunch of ARM hardware, not just Exynos.  Can
you split this patch into two parts; one for gic and one for the
exynos combiner?

> +  - reg: The GIC includes a Distributor Interface and CPU Interface and
> +    hence requires two base addresses. The property format is
> +    <Distributor-Base Distributor-Size>, <CPU-Base CPU Size>
> +
> +  Example:
> +
> +	EXT_GIC:interrupt-controller@10490000 {
> +		compatible = "samsung,exynos4-ext-gic";
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		reg = <0x10490000 0x1000>, <0x10480000 0x100>;
> +	};
> +
> +  Devices using External GIC as the interrupt parent should specify two
> +  cells for the interrupts property as shown below.
> +
> +	watchdog@10060000 {
> +		compatible = "samsung,s3c2410-wdt";
> +		reg = <0x10060000 0x400>;
> +		interrupt-parent = <&EXT_GIC>;
> +		interrupts = <43 0>;
> +	};
> +
> +External Interrupt Combiner properties:
> +  - compatible: should be "samsung,exynos4-ext-combiner".
> +  - interrupt-cells: should be <2>. The meaning of the cells are
> +      * First Cell: Combiner Group Number.
> +      * Second Cell: Interrupt within the group.

I was under the impression that the irq groupings are programmable,
and that the combiner irq inputs are a flat numbering layout.  Is that
correct?  If so, then #interrupt-cells should probably be 1, and the
grouping should probably be configuration properties on the combiner
node.

> +  - reg: Base address and size of interrupt combiner registers.
> +
> +  Example:
> +
> +	EXT_COMBINER:interrupt-controller@10440000 {
> +		compatible = "samsung,exynos4-ext-combiner";
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		reg = <0x10440000 0x200>;
> +	};
> +
> +  Devices using External Interrupt Combiner as the interrupt parent should
> +  specify two cells for the interrupts property as shown below.
> +
> +	watchdog@10060000 {
> +		compatible = "samsung,s3c2410-wdt";
> +		reg = <0x10060000 0x400>;
> +		interrupt-parent = <&EXT_COMBINER>;
> +		interrupts = <4 2>;
> +	};
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
> index ac91f4f..fd532c7 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_MACH_ARMLEX4210)		+= mach-armlex4210.o
>  obj-$(CONFIG_MACH_UNIVERSAL_C210)	+= mach-universal_c210.o
>  obj-$(CONFIG_MACH_NURI)			+= mach-nuri.o
>  obj-$(CONFIG_MACH_EXYNOS4_DT)		+= mach-exynos4-dt.o
> +obj-$(CONFIG_OF_IRQ)			+= irqdomain.o
>  
>  # device support
>  
> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
> index 934d2a4..c120aad 100644
> --- a/arch/arm/mach-exynos4/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
> @@ -15,6 +15,9 @@
>  
>  #include <plat/irqs.h>
>  
> +/* SGI: Software Generated Interrupt */
> +#define IRQ_SGI(x)		S5P_IRQ(x)
> +
>  /* PPI: Private Peripheral Interrupt */
>  
>  #define IRQ_PPI(x)		S5P_IRQ(x+16)
> diff --git a/arch/arm/mach-exynos4/irqdomain.c b/arch/arm/mach-exynos4/irqdomain.c
> new file mode 100644
> index 0000000..f50fa20
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/irqdomain.c
> @@ -0,0 +1,117 @@
> +/*
> + * Exynos4 irq domain conversion from dt irq specifier to linux virq domain
> + *
> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * Exynos4 includes two interrupt controllers - External GIC and External
> + * Interrupt Combiner. This file provides support for converting interrupt
> + * specified in device tree to linux virq domain for both the controllers.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +
> +#include <mach/irqs.h>
> +
> +/*
> + * The interrupt specifier for External GIC controller uses to two cells in
> + * the device tree source file. The second cell denotes the type of the
> + * interrupt (SPI/SGI/PPI). The following macros are used to represent
> + * these different types of interrupt.
> + */
> +#define	EXT_GIC_SPI	0
> +#define	EXT_GIC_SGI	1
> +#define	EXT_GIC_PPI	2

Nit: I prefer enums over preprocessor macros, but not a big deal.

> +
> +/* Translate dt irq specifier to linux virq for external GIC controller */
> +static int exynos4_irq_domain_ext_gic_dt_translate(struct irq_domain *d,
> +			    struct device_node *controller,
> +			    const u32 *intspec, unsigned int intsize,
> +			    unsigned long *out_hwirq, unsigned int *out_type)
> +{
> +	if (d->of_node != controller)
> +		return -EINVAL;
> +	if (intsize < 2)
> +		return -EINVAL;
> +
> +	switch (intspec[1]) {
> +	case EXT_GIC_SPI:
> +		*out_hwirq = IRQ_SPI(intspec[0]);
> +		break;
> +	case EXT_GIC_SGI:
> +		*out_hwirq = IRQ_SGI(intspec[0]);
> +		break;
> +	case EXT_GIC_PPI:
> +		*out_hwirq = IRQ_PPI(intspec[0]);
> +		break;
> +	default:
> +		pr_info("irq_domain register: invalid ext gic intr type\n");
> +		return -EINVAL;
> +	}
> +
> +	*out_type = IRQ_TYPE_NONE;
> +	return 0;
> +}
> +
> +/* Translate dt irq specifier to linux virq for external combiner controller */
> +static int exynos4_irq_domain_ext_combiner_dt_translate(struct irq_domain *d,
> +			    struct device_node *controller,
> +			    const u32 *intspec, unsigned int intsize,
> +			    unsigned long *out_hwirq, unsigned int *out_type)
> +{
> +	if (d->of_node != controller)
> +		return -EINVAL;
> +	if (intsize < 2)
> +		return -EINVAL;
> +
> +	*out_hwirq = COMBINER_IRQ(intspec[0], intspec[1]);
> +	*out_type = IRQ_TYPE_NONE;
> +	return 0;
> +}
> +
> +static struct irq_domain_ops exynos4_irq_domain_ext_gic_ops = {
> +	.dt_translate = exynos4_irq_domain_ext_gic_dt_translate,
> +};
> +
> +static struct irq_domain_ops exynos4_irq_domain_ext_combiner_ops = {
> +	.dt_translate = exynos4_irq_domain_ext_combiner_dt_translate,
> +};
> +
> +static struct of_device_id exynos4_irq_ctrl_of_match[] = {
> +	{ .compatible = "samsung,exynos4-ext-gic",
> +		.data = &exynos4_irq_domain_ext_gic_ops, },
> +	{ .compatible = "samsung,exynos4-ext-combiner",
> +		.data = &exynos4_irq_domain_ext_combiner_ops, },
> +	{},
> +};
> +
> +void exynos4_register_irq_domain_dt(void)
> +{
> +	struct device_node *controller;
> +	struct irq_domain *domain;
> +	const struct of_device_id *match;
> +
> +	for_each_matching_node(controller, exynos4_irq_ctrl_of_match) {
> +		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
> +		if (!domain) {
> +			WARN_ON(1);
> +			return;
> +		}
> +
> +		match = of_match_node(exynos4_irq_ctrl_of_match, controller);
> +		domain->of_node = of_node_get(controller);
> +		domain->ops = match->data;
> +		irq_domain_add(domain);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(exynos4_register_irq_domain_dt);
> diff --git a/arch/arm/mach-exynos4/mach-exynos4-dt.c b/arch/arm/mach-exynos4/mach-exynos4-dt.c
> index 120665a..450a9ed 100644
> --- a/arch/arm/mach-exynos4/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos4/mach-exynos4-dt.c
> @@ -16,6 +16,7 @@
>  #include <linux/io.h>
>  #include <linux/of_platform.h>
>  #include <linux/irq.h>
> +#include <linux/irqdomain.h>
>  
>  #include <asm/mach/arch.h>
>  #include <asm/mach-types.h>
> @@ -85,14 +86,11 @@ static void __init exynos4_dt_map_io(void)
>  	s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uartcfgs));
>  }
>  
> -static const struct of_device_id intc_of_match[] __initconst = {
> -	{ .compatible = "samsung,exynos4-gic", },
> -	{}
> -};
> +extern void exynos4_register_irq_domain_dt(void);
>  
>  static void __init exynos4_dt_machine_init(void)
>  {
> -	irq_domain_generate_simple(intc_of_match, EXYNOS4_PA_GIC_DIST, 0);
> +	exynos4_register_irq_domain_dt();
>  	of_platform_populate(NULL, of_default_bus_match_table,
>  				exynos4_auxdata_lookup, NULL);
>  }
> -- 
> 1.6.6.rc2
> 
