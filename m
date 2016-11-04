From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [1/4] ARM: EXYNOS: Remove smp_init_cpus hook from platsmp.c
Date: Fri, 04 Nov 2016 18:23:04 +0530
Message-ID: <581C84B0.8000305@samsung.com>
References: <1478230764-13748-2-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161104125452epcas3p42aff8168d48d859e0df0c36b8f3ffb92@epcas3p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38212 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934324AbcKDMy4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 08:54:56 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG401A9BBVH1L60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2016 21:54:53 +0900 (KST)
In-reply-to: <1478230764-13748-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com

Hi Pankaj,

On 11/04/2016 09:09 AM, Pankaj Dubey wrote:
> We can safely remove exynos_smp_init_cpus() hook from mach-exynos/platsmp.c,
> as all SMP platforms in mach-exynos can rely on DT for CPU core description
> instead of determining number of cores from the SCU.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
Looks good.
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>   arch/arm/mach-exynos/platsmp.c | 31 -------------------------------
>   1 file changed, 31 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 98ffe1e..a5d6841 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -385,36 +385,6 @@ fail:
>   	return pen_release != -1 ? ret : 0;
>   }
>
> -/*
> - * Initialise the CPU possible map early - this describes the CPUs
> - * which may be present or become present in the system.
> - */
> -
> -static void __init exynos_smp_init_cpus(void)
> -{
> -	void __iomem *scu_base = scu_base_addr();
> -	unsigned int i, ncores;
> -
> -	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
> -		ncores = scu_base ? scu_get_core_count(scu_base) : 1;
> -	else
> -		/*
> -		 * CPU Nodes are passed thru DT and set_cpu_possible
> -		 * is set by "arm_dt_init_cpu_maps".
> -		 */
> -		return;
> -
> -	/* sanity check */
> -	if (ncores > nr_cpu_ids) {
> -		pr_warn("SMP: %u cores greater than maximum (%u), clipping\n",
> -			ncores, nr_cpu_ids);
> -		ncores = nr_cpu_ids;
> -	}
> -
> -	for (i = 0; i < ncores; i++)
> -		set_cpu_possible(i, true);
> -}
> -
>   static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
>   {
>   	int i;
> @@ -479,7 +449,6 @@ static void exynos_cpu_die(unsigned int cpu)
>   #endif /* CONFIG_HOTPLUG_CPU */
>
>   const struct smp_operations exynos_smp_ops __initconst = {
> -	.smp_init_cpus		= exynos_smp_init_cpus,
>   	.smp_prepare_cpus	= exynos_smp_prepare_cpus,
>   	.smp_secondary_init	= exynos_secondary_init,
>   	.smp_boot_secondary	= exynos_boot_secondary,
>
