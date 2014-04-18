From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] arm: exynos: generalize power register address calculation
Date: Fri, 18 Apr 2014 16:12:28 +0200
Message-ID: <535132CC.8000206@samsung.com>
References: <CANuQgHEbepUZO279+Bsx7Ynep6ZPQQJj+zCW3S2k50Cw5SLOdA@mail.gmail.com>
 <1397547498-21729-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18890 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbaDROMd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Apr 2014 10:12:33 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N48008A6CSVPB60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Apr 2014 15:12:31 +0100 (BST)
In-reply-to: <1397547498-21729-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com

Hi Chander,

On 15.04.2014 09:38, Chander Kashyap wrote:
> Currently status/configuration power register values are hard-coded for cpu1.
>
> Make it generic so that it is useful for SoC's with more than two cpus.
>
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> ---
> changes in v3:
> 	1. Move cpunr calculation to a macro
> 	2. Changed printk format specifier from unsigned hex to unsigned decimal
> Changes in v2:
> 	1. Used existing macros for clusterid and cpuid calculation
>
>   arch/arm/mach-exynos/hotplug.c  |    7 ++++---
>   arch/arm/mach-exynos/platsmp.c  |   13 +++++++------
>   arch/arm/mach-exynos/regs-pmu.h |   15 +++++++++++++--
>   3 files changed, 24 insertions(+), 11 deletions(-)
>

Now as I think of it, the code that is touched by this patch is not 
supposed to be used on multi-cluster systems. Instead a separate MCPM 
driver should. As far as I know, somebody is said to be already working 
on this.

This means that we don't need to consider multi-cluster support in this 
patch and simplify any calculations to just account for core ID. This 
would also eliminate any need to handle non-zero cluster ID on 
single-cluster SoCs.

Please correct me if I'm wrong.

> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
> index 5eead53..9f74be2 100644
> --- a/arch/arm/mach-exynos/hotplug.c
> +++ b/arch/arm/mach-exynos/hotplug.c
> @@ -92,11 +92,12 @@ static inline void cpu_leave_lowpower(void)
>
>   static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
>   {
> +	unsigned int cpunr = ENYNOS_PMU_CPUNR(cpu_logical_map(cpu));
>   	for (;;) {
>
> -		/* make cpu1 to be turned off at next WFI command */
> -		if (cpu == 1)
> -			__raw_writel(0, S5P_ARM_CORE1_CONFIGURATION);
> +		/* make cpu to be turned off at next WFI command */
> +		if (cpu)

As I mentioned in my previous reply, I don't see what could go wrong if 
this check is omitted. What happens if CPU0 is being hot-unplugged?

If hardware doesn't support this (but I don't see any mention about this 
in the documentation), such hotplug attempt should either simply fail on 
.cpu_kill() operation for CPU0 or even have CPU0 marked as non-hotpluggable.

> +			__raw_writel(0, S5P_ARM_CORE_CONFIGURATION(cpunr));
>
>   		/*
>   		 * here's the WFI
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 03e5e9f..d9c182f 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -90,7 +90,7 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>   {
>   	unsigned long timeout;
>   	unsigned long phys_cpu = cpu_logical_map(cpu);
> -
> +	unsigned int cpunr = ENYNOS_PMU_CPUNR(cpu_logical_map(cpu));
>   	/*
>   	 * Set synchronisation state between this boot processor
>   	 * and the secondary one
> @@ -107,14 +107,15 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>   	 */
>   	write_pen_release(phys_cpu);
>
> -	if (!(__raw_readl(S5P_ARM_CORE1_STATUS) & S5P_CORE_LOCAL_PWR_EN)) {
> +	if (!(__raw_readl(S5P_ARM_CORE_STATUS(cpunr))
> +		& S5P_CORE_LOCAL_PWR_EN)) {
>   		__raw_writel(S5P_CORE_LOCAL_PWR_EN,
> -			     S5P_ARM_CORE1_CONFIGURATION);
> +			     S5P_ARM_CORE_CONFIGURATION(cpunr));
>
>   		timeout = 10;
>
> -		/* wait max 10 ms until cpu1 is on */
> -		while ((__raw_readl(S5P_ARM_CORE1_STATUS)
> +		/* wait max 10 ms until secondary cpu is on */
> +		while ((__raw_readl(S5P_ARM_CORE_STATUS(cpunr))
>   			& S5P_CORE_LOCAL_PWR_EN) != S5P_CORE_LOCAL_PWR_EN) {
>   			if (timeout-- == 0)
>   				break;
> @@ -123,7 +124,7 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>   		}
>
>   		if (timeout == 0) {
> -			printk(KERN_ERR "cpu1 power enable failed");
> +			pr_err("cpu%u power enable failed", cpu);
>   			spin_unlock(&boot_lock);
>   			return -ETIMEDOUT;
>   		}
> diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
> index 4f6a256..0de6df4 100644
> --- a/arch/arm/mach-exynos/regs-pmu.h
> +++ b/arch/arm/mach-exynos/regs-pmu.h
> @@ -105,8 +105,13 @@
>   #define S5P_GPS_LOWPWR				S5P_PMUREG(0x139C)
>   #define S5P_GPS_ALIVE_LOWPWR			S5P_PMUREG(0x13A0)
>
> -#define S5P_ARM_CORE1_CONFIGURATION		S5P_PMUREG(0x2080)
> -#define S5P_ARM_CORE1_STATUS			S5P_PMUREG(0x2084)
> +#define S5P_ARM_CORE0_CONFIGURATION		S5P_PMUREG(0x2000)
> +#define S5P_ARM_CORE0_STATUS			S5P_PMUREG(0x2004)
> +
> +#define S5P_ARM_CORE_CONFIGURATION(_cpunr)	\
> +		(S5P_ARM_CORE0_CONFIGURATION + 0x80 * (_cpunr))
> +#define S5P_ARM_CORE_STATUS(_cpunr)		\
> +		(S5P_ARM_CORE0_STATUS + 0x80 * (_cpunr))
>
>   #define S5P_PAD_RET_MAUDIO_OPTION		S5P_PMUREG(0x3028)
>   #define S5P_PAD_RET_GPIO_OPTION			S5P_PMUREG(0x3108)
> @@ -313,4 +318,10 @@
>
>   #define EXYNOS5_OPTION_USE_RETENTION				(1 << 4)
>
> +#include <asm/cputype.h>
> +#define MAX_CPUS_IN_CLUSTER	4
> +#define ENYNOS_PMU_CPUNR(mpidr) \
> +		((MPIDR_AFFINITY_LEVEL(mpidr, 1) * MAX_CPUS_IN_CLUSTER) \
> +		  + MPIDR_AFFINITY_LEVEL(mpidr, 0));

Static inline would be preferred and then name in lowercase.

Best regards,
Tomasz
