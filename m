From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: EXYNOS: Add support for secondary CPU bring-up on
 Exynos4412
Date: Tue, 23 Oct 2012 20:57:33 +0900
Message-ID: <01d101cdb115$965b0730$c3111590$%kim@samsung.com>
References: <1393767.3tjq8gL245@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46129 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752560Ab2JWL5f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 07:57:35 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00F8HH7YD880@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 20:57:34 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC0024YH7XHEA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 20:57:33 +0900 (KST)
In-reply-to: <1393767.3tjq8gL245@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
Cc: 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Tomasz Figa wrote:
> 
> Exynos4412 uses different information register for each core. This patch
> adjusts the bring-up code to take that into account.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-
> exynos/platsmp.c
> index 36c3984..816a27d 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -34,8 +34,19 @@
> 
>  extern void exynos4_secondary_startup(void);
> 
> -#define CPU1_BOOT_REG		(samsung_rev() == EXYNOS4210_REV_1_1
? \
> -				S5P_INFORM5 : S5P_VA_SYSRAM)
> +static inline void __iomem *cpu_boot_reg_base(void)
> +{
> +	if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_1_1)
> +		return S5P_INFORM5;
> +	return S5P_VA_SYSRAM;
> +}
> +
> +static inline void __iomem *cpu_boot_reg(int cpu)
> +{
> +	if (soc_is_exynos4412())
> +		return cpu_boot_reg_base() + 4*cpu;
> +	return cpu_boot_reg_base();
> +}
> 
>  /*
>   * control for which core is the next to come out of the secondary
> @@ -89,6 +100,7 @@ void __cpuinit platform_secondary_init(unsigned int
cpu)
>  int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *idle)
>  {
>  	unsigned long timeout;
> +	unsigned long phys_cpu = cpu_logical_map(cpu);
> 
>  	/*
>  	 * Set synchronisation state between this boot processor
> @@ -104,7 +116,7 @@ int __cpuinit boot_secondary(unsigned int cpu, struct
> task_struct *idle)
>  	 * Note that "pen_release" is the hardware CPU ID, whereas
>  	 * "cpu" is Linux's internal ID.
>  	 */
> -	write_pen_release(cpu_logical_map(cpu));
> +	write_pen_release(phys_cpu);
> 
>  	if (!(__raw_readl(S5P_ARM_CORE1_STATUS) & S5P_CORE_LOCAL_PWR_EN)) {
>  		__raw_writel(S5P_CORE_LOCAL_PWR_EN,
> @@ -138,7 +150,7 @@ int __cpuinit boot_secondary(unsigned int cpu, struct
> task_struct *idle)
>  		smp_rmb();
> 
>  		__raw_writel(virt_to_phys(exynos4_secondary_startup),
> -			CPU1_BOOT_REG);
> +
cpu_boot_reg(phys_cpu));
>  		gic_raise_softirq(cpumask_of(cpu), 1);
> 
>  		if (pen_release == -1)
> @@ -186,6 +198,8 @@ void __init smp_init_cpus(void)
> 
>  void __init platform_smp_prepare_cpus(unsigned int max_cpus)
>  {
> +	int i;
> +
>  	if (!soc_is_exynos5250())
>  		scu_enable(scu_base_addr());
> 
> @@ -195,6 +209,7 @@ void __init platform_smp_prepare_cpus(unsigned int
> max_cpus)
>  	 * until it receives a soft interrupt, and then the
>  	 * secondary CPU branches to this address.
>  	 */
> -	__raw_writel(virt_to_phys(exynos4_secondary_startup),
> -			CPU1_BOOT_REG);
> +	for (i = 1; i < max_cpus; ++i)
> +		__raw_writel(virt_to_phys(exynos4_secondary_startup),
> +					cpu_boot_reg(cpu_logical_map(i)));
>  }
> --
> 1.7.12

Looks ok to me, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
