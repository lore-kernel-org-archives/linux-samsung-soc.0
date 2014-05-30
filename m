From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: SWRESET is needed to boot secondary CPU on
 Exynos3250
Date: Fri, 30 May 2014 13:29:38 +0200
Message-ID: <1401449378.20793.1.camel@AMDC1943>
References: <1400152691-29705-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:47794 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932140AbaE3L3g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 07:29:36 -0400
In-reply-to: <1400152691-29705-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On czw, 2014-05-15 at 13:18 +0200, Krzysztof Kozlowski wrote:
> Without software reset the secondary CPU does not power up and
> exynos_boot_secondary() ends with pen_release equal to 1. This can be
> observed in dmesg:
> 	CPU1: failed to come online
> 	Brought up 1 CPUs
> 	SMP: Total of 1 processors activated.
> 	CPU: All CPU(s) started in SVC mode.
> 
> When booting the secondary CPU on Exynos3250 execute also software
> reset for core 1.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I am humbly reminding myself - any comments on this patch?

Best regards,
Krzysztof


> ---
>  arch/arm/mach-exynos/platsmp.c  | 22 ++++++++++++++++++++++
>  arch/arm/mach-exynos/regs-pmu.h |  3 +++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 8b88eb2f077b..64ec5ca18f60 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -76,6 +76,25 @@ static inline void __iomem *cpu_boot_reg(int cpu)
>  }
>  
>  /*
> + * Set wake up by local power mode and execute software reset for given core.
> + *
> + * Currently this is needed only when booting secondary CPU on Exynos3250.
> + */
> +static inline void exynos_core_restart(u32 core_id)
> +{
> +	if (of_machine_is_compatible("samsung,exynos3250")) {
> +		u32 val;
> +
> +		val = __raw_readl(S5P_ARM_CORE_STATUS(core_id));
> +		val |= S5P_CORE_WAKEUP_FROM_LOCAL_CFG;
> +		__raw_writel(val, S5P_ARM_CORE_STATUS(core_id));
> +
> +		pr_info("CPU%u: Software reset\n", core_id);
> +		__raw_writel(EXYNOS_CORE_PO_RESET(core_id), EXYNOS_SWRESET);
> +	}
> +}
> +
> +/*
>   * Write pen_release in a way that is guaranteed to be visible to all
>   * observers, irrespective of whether they're taking part in coherency
>   * or not.  This is necessary for the hotplug code to work reliably.
> @@ -155,6 +174,9 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  			return -ETIMEDOUT;
>  		}
>  	}
> +
> +	exynos_core_restart(core_id);
> +
>  	/*
>  	 * Send the secondary CPU a soft interrupt, thereby causing
>  	 * the boot monitor to read the system wide flags register,
> diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
> index d94bbc85d7e0..3ecbb4fe227b 100644
> --- a/arch/arm/mach-exynos/regs-pmu.h
> +++ b/arch/arm/mach-exynos/regs-pmu.h
> @@ -26,6 +26,8 @@
>  #define S5P_USE_STANDBY_WFI0			(1 << 16)
>  #define S5P_USE_STANDBY_WFE0			(1 << 24)
>  
> +#define EXYNOS_CORE_PO_RESET(n)			((1 << 4) << n)
> +
>  #define EXYNOS_SWRESET				S5P_PMUREG(0x0400)
>  #define EXYNOS5440_SWRESET			S5P_PMUREG(0x00C4)
>  
> @@ -117,6 +119,7 @@
>  #define S5P_PAD_RET_EBIB_OPTION			S5P_PMUREG(0x31A8)
>  
>  #define S5P_CORE_LOCAL_PWR_EN			0x3
> +#define S5P_CORE_WAKEUP_FROM_LOCAL_CFG		(0x3 << 8)
>  #define S5P_INT_LOCAL_PWR_EN			0x7
>  
>  #define S5P_CHECK_SLEEP				0x00000BAD
