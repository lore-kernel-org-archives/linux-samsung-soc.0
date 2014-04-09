From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] arm: exynos: generalize power register address calculation
Date: Wed, 09 Apr 2014 13:49:58 +0200
Message-ID: <534533E6.10901@samsung.com>
References: <1396973737-18693-1-git-send-email-chander.kashyap@linaro.org>
 <1397041783-18531-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10135 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932482AbaDILuD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 07:50:03 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3R003VEI75WFA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Apr 2014 12:49:53 +0100 (BST)
In-reply-to: <1397041783-18531-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com

Hi Chander,

On 09.04.2014 13:09, Chander Kashyap wrote:
> Currently status/configuration power register values are hard-coded for cpu1.
>
> Make it generic so that it is useful for SoC's with more than two cpus.
>
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> ---
> changes in v2 : Used existing macros for clusterid and cpuid calculation
>
>   arch/arm/mach-exynos/hotplug.c  |   15 ++++++++++++---
>   arch/arm/mach-exynos/platsmp.c  |   20 +++++++++++++++-----
>   arch/arm/mach-exynos/regs-pmu.h |    9 +++++++--
>   3 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
> index 5eead53..eab6121 100644
> --- a/arch/arm/mach-exynos/hotplug.c
> +++ b/arch/arm/mach-exynos/hotplug.c
> @@ -17,6 +17,7 @@
>
>   #include <asm/cacheflush.h>
>   #include <asm/cp15.h>
> +#include <asm/cputype.h>
>   #include <asm/smp_plat.h>
>
>   #include <plat/cpu.h>
> @@ -92,11 +93,19 @@ static inline void cpu_leave_lowpower(void)
>
>   static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
>   {
> +	unsigned int mpidr, cpunr, cluster;
> +
> +	mpidr = cpu_logical_map(cpu);
> +	cpunr = MPIDR_AFFINITY_LEVEL(mpidr, 0);
> +	cluster = MPIDR_AFFINITY_LEVEL(mpidr, 1);
> +
> +	/* Maximum possible cpus in a cluster can be 4 */
> +	cpunr += cluster * 4;

I believe this is rather a weak assumption. First of all, the limit 
seems to be hardcoded only for the few existing SoCs. In addition, the 
value is not used as a maximum, but rather it is assumed that each 
cluster has always four cores.

Moreover, it is assumed here that the mapping between core ID 
(calculated by the equation below) and PMU core numbers is 1:1, which is 
not true. On Exynos4210, the cluster ID is always 0x09 and on Exynos4x12 
it is 0x0a, which will lead to completely wrong register offsets.

I believe the proper way to deal with this is to provide per-CPU 
property in DT called "samsung,pmu-offset" that could be used be code 
like this to calculate register addresses properly.

For now, I would recommend doing the above ignoring cluster ID 
completely to not break (and actually fix) single cluster systems and 
existing multi cluster ones on which only the first cluster is supported 
now.

After that, per-CPU PMU offset should be implemented to support 
multi-cluster SoCs with proper support of multiple clusters.

Best regards,
Tomasz
