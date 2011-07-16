From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add support Core1 Power On/Off with hotplug
 in/out
Date: Sat, 16 Jul 2011 13:49:25 +0900
Message-ID: <037201cc4373$bf958910$3ec09b30$%kim@samsung.com>
References: <1309494555-3001-1-git-send-email-junghi.min@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:26860 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733Ab1GPEtb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 00:49:31 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE00H8OTE6B910@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 13:49:30 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE00K8UTEIJV@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 13:49:30 +0900 (KST)
In-reply-to: <1309494555-3001-1-git-send-email-junghi.min@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'JungHi Min' <junghi.min@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

JungHi Min wrote:
> 
> To insert the code for power on/off with pmu control to support hotplug
in/out
> core1
> As for hotplug.c, the codes for core1 to be hotplug in/out is inserted.
> As for regs-pmu.h, S5P_CORE_LOCAL_PWR_EN is defined.
> As for platsmp.c, the codes for core1 to be powered on is inserted.
> 
> Signed-off-by: JungHi Min <junghi.min@samsung.com>
> ---
>  arch/arm/mach-exynos4/hotplug.c               |   13 ++++++----
>  arch/arm/mach-exynos4/include/mach/regs-pmu.h |    1 +
>  arch/arm/mach-exynos4/platsmp.c               |   33
> +++++++++++++++++++++++-
>  3 files changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/hotplug.c
b/arch/arm/mach-exynos4/hotplug.c
> index 2b5909e..7490789 100644
> --- a/arch/arm/mach-exynos4/hotplug.c
> +++ b/arch/arm/mach-exynos4/hotplug.c
> @@ -13,9 +13,12 @@
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
>  #include <linux/smp.h>
> +#include <linux/io.h>
> 
>  #include <asm/cacheflush.h>
> 
> +#include <mach/regs-pmu.h>
> +
>  extern volatile int pen_release;
> 
>  static inline void cpu_enter_lowpower(void)
> @@ -58,12 +61,12 @@ static inline void cpu_leave_lowpower(void)
> 
>  static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
>  {
> -	/*
> -	 * there is no power-control hardware on this platform, so all
> -	 * we can do is put the core into WFI; this is safe as the calling
> -	 * code will have already disabled interrupts
> -	 */
>  	for (;;) {
> +
> +		/* make cpu1 to be turned off at next WFI command */
> +		if (cpu == 1)
> +			__raw_writel(0, S5P_ARM_CORE1_CONFIGURATION);
> +
>  		/*
>  		 * here's the WFI
>  		 */
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
b/arch/arm/mach-
> exynos4/include/mach/regs-pmu.h
> index a964337..96de0e7 100644
> --- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> +++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> @@ -158,6 +158,7 @@
>  #define S5P_PMU_GPS_CONF			S5P_PMUREG(0x3CE0)
> 
>  #define S5P_PMU_SATA_PHY_CONTROL_EN		0x1
> +#define S5P_CORE_LOCAL_PWR_EN			0x3
>  #define S5P_INT_LOCAL_PWR_EN			0x7
> 
>  define S5P_CHECK_SLEEP				0x00000BAD
> diff --git a/arch/arm/mach-exynos4/platsmp.c
b/arch/arm/mach-exynos4/platsmp.c
> index c5e65a0..15aa2c0 100644
> --- a/arch/arm/mach-exynos4/platsmp.c
> +++ b/arch/arm/mach-exynos4/platsmp.c
> @@ -28,9 +28,12 @@
> 
>  #include <mach/hardware.h>
>  #include <mach/regs-clock.h>
> +#include <mach/regs-pmu.h>
> 
>  extern void exynos4_secondary_startup(void);
> 
> +#define CPU1_BOOT_REG S5P_VA_SYSRAM
> +
>  /*
>   * control for which core is the next to come out of the secondary
>   * boot "holding pen"
> @@ -100,16 +103,41 @@ int __cpuinit boot_secondary(unsigned int cpu,
struct
> task_struct *idle)
>  	 */
>  	write_pen_release(cpu);
> 
> +	if (!(__raw_readl(S5P_ARM_CORE1_STATUS) &
> S5P_CORE_LOCAL_PWR_EN)) {
> +		__raw_writel(S5P_CORE_LOCAL_PWR_EN,
> +			     S5P_ARM_CORE1_CONFIGURATION);
> +
> +		timeout = 10;
> +
> +		/* wait max 10 ms until cpu1 is on */
> +		while ((__raw_readl(S5P_ARM_CORE1_STATUS)
> +			& S5P_CORE_LOCAL_PWR_EN) !=
> S5P_CORE_LOCAL_PWR_EN) {
> +			if (timeout-- == 0)
> +				break;
> +
> +			mdelay(1);
> +		}
> +
> +		if (timeout == 0) {
> +			printk(KERN_ERR "cpu1 power enable failed");
> +			spin_unlock(&boot_lock);
> +			return -ETIMEDOUT;
> +		}
> +	}
>  	/*
>  	 * Send the secondary CPU a soft interrupt, thereby causing
>  	 * the boot monitor to read the system wide flags register,
>  	 * and branch to the address found there.
>  	 */
> -	gic_raise_softirq(cpumask_of(cpu), 1);
> 
>  	timeout = jiffies + (1 * HZ);
>  	while (time_before(jiffies, timeout)) {
>  		smp_rmb();
> +
> +		__raw_writel(BSYM(virt_to_phys(exynos4_secondary_startup)),
> +			CPU1_BOOT_REG);
> +		gic_raise_softirq(cpumask_of(cpu), 1);
> +
>  		if (pen_release == -1)
>  			break;
> 
> --
> 1.7.1

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
