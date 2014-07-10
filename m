From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v7 1/4] ARM: EXYNOS: Add support for mapping PMU base
 address via DT
Date: Thu, 10 Jul 2014 22:49:44 +0900
Message-ID: <02d701cf9c45$ce481260$6ad83720$@samsung.com>
References: <1404878455-31518-1-git-send-email-pankaj.dubey@samsung.com>
 <1404878455-31518-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:28668 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753235AbaGJNtq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jul 2014 09:49:46 -0400
In-reply-to: <1404878455-31518-2-git-send-email-pankaj.dubey@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, t.figa@samsung.com, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

Pankaj Dubey wrote:
> 
> Add support for mapping Samsung Power Management Unit (PMU)
> base address from device tree.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h |    1 +
>  arch/arm/mach-exynos/exynos.c |   37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index 152b464..f8daa9c 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -113,6 +113,7 @@ IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EXYNOS5_SOC_MASK)
> 
>  extern void __iomem *sysram_ns_base_addr;
>  extern void __iomem *sysram_base_addr;
> +extern void __iomem *pmu_base_addr;
>  void exynos_sysram_init(void);
> 
>  void exynos_firmware_init(void);
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index 186f35d..173aac8 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -19,6 +19,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/irqchip.h>
> 
>  #include <asm/cacheflush.h>
>  #include <asm/hardware/cache-l2x0.h>
> @@ -31,6 +32,8 @@
>  #include "regs-pmu.h"
>  #include "regs-sys.h"
> 
> +void __iomem *pmu_base_addr;
> +
>  static struct map_desc exynos4_iodesc[] __initdata = {
>  	{
>  		.virtual	= (unsigned long)S3C_VA_SYS,
> @@ -253,6 +256,39 @@ static void __init exynos_init_io(void)
>  	exynos_map_io();
>  }
> 
> +static const struct of_device_id exynos_dt_pmu_match[] = {
> +	{ .compatible = "samsung,exynos3250-pmu" },
> +	{ .compatible = "samsung,exynos4210-pmu" },
> +	{ .compatible = "samsung,exynos4212-pmu" },
> +	{ .compatible = "samsung,exynos4412-pmu" },
> +	{ .compatible = "samsung,exynos5250-pmu" },
> +	{ .compatible = "samsung,exynos5420-pmu" },
> +	{ /*sentinel*/ },
> +};
> +
> +static void exynos_map_pmu(void)
> +{
> +	struct device_node *np;
> +
> +	np = of_find_matching_node(NULL, exynos_dt_pmu_match);
> +	if (np)
> +		pmu_base_addr = of_iomap(np, 0);
> +
> +	if (!pmu_base_addr)
> +		panic("failed to find exynos pmu register\n");
> +}
> +
> +static void __init exynos_init_irq(void)
> +{
> +	irqchip_init();
> +	/*
> +	 * Since platsmp.c needs pmu base address by the time
> +	 * DT is not unflatten so we can't use DT APIs before
> +	 * init_irq
> +	 */
> +	exynos_map_pmu();
> +}
> +
>  static void __init exynos_dt_machine_init(void)
>  {
>  	struct device_node *i2c_np;
> @@ -336,6 +372,7 @@ DT_MACHINE_START(EXYNOS_DT, "SAMSUNG EXYNOS (Flattened Device Tree)")
>  	.smp		= smp_ops(exynos_smp_ops),
>  	.map_io		= exynos_init_io,
>  	.init_early	= exynos_firmware_init,
> +	.init_irq	= exynos_init_irq,
>  	.init_machine	= exynos_dt_machine_init,
>  	.init_late	= exynos_init_late,
>  	.dt_compat	= exynos_dt_compat,
> --
> 1.7.9.5

Looks good to me, will apply.

Thanks,
Kukjin
