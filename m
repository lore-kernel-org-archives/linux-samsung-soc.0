From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 14/17] ARM: exynos: cpuidle: Move the boot vector in pm.c
Date: Wed, 09 Apr 2014 14:27:25 +0200
Message-ID: <53453CAD.9050000@samsung.com>
References: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org>
 <1396959579-18268-15-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:15660 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932932AbaDIM1c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 08:27:32 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3R006T3JXRDMB0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Apr 2014 13:27:27 +0100 (BST)
In-reply-to: <1396959579-18268-15-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

Hi Daniel,

On 08.04.2014 14:19, Daniel Lezcano wrote:
> As usual, move the boot vector setting in the pm.c file and use the cpu_pm
> notifier to set it up.
>
> Remove the unused headers.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>   arch/arm/mach-exynos/cpuidle.c |   23 -----------------------
>   arch/arm/mach-exynos/pm.c      |   15 +++++++++++++++
>   2 files changed, 15 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index 44d169b..4b94181 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -8,46 +8,23 @@
>    * published by the Free Software Foundation.
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/init.h>
>   #include <linux/cpuidle.h>
>   #include <linux/cpu_pm.h>
> -#include <linux/io.h>
> -#include <linux/export.h>
> -#include <linux/time.h>
>   #include <linux/platform_device.h>
>
>   #include <asm/proc-fns.h>
>   #include <asm/suspend.h>
> -#include <asm/unified.h>
>   #include <asm/cpuidle.h>
>
>   #include <plat/cpu.h>
> -#include <plat/pm.h>
> -
> -#include <mach/map.h>
>
>   #include "common.h"
> -#include "regs-pmu.h"
> -
> -#define REG_DIRECTGO_ADDR	(samsung_rev() == EXYNOS4210_REV_1_1 ? \
> -			S5P_INFORM7 : (samsung_rev() == EXYNOS4210_REV_1_0 ? \
> -			(S5P_VA_SYSRAM + 0x24) : S5P_INFORM0))
> -#define REG_DIRECTGO_FLAG	(samsung_rev() == EXYNOS4210_REV_1_1 ? \
> -			S5P_INFORM6 : (samsung_rev() == EXYNOS4210_REV_1_0 ? \
> -			(S5P_VA_SYSRAM + 0x20) : S5P_INFORM1))
>
>   static int idle_finisher(unsigned long flags)
>   {
> -
> -	__raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
> -	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
> -
>   	/* Set value of power down register for aftr mode */
>   	exynos_sys_powerdown_conf(SYS_AFTR);
> -
>   	cpu_do_idle();
> -
>   	return 1;
>   }
>
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index 90fb692..e4ecd8c 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -172,6 +172,20 @@ static void __init exynos5_core_down_clk(void)
>   	__raw_writel(tmp, EXYNOS5_PWR_CTRL2);
>   }
>
> +#define EXYNOS_BOOT_VECTOR_ADDR (samsung_rev() == EXYNOS4210_REV_1_1 ? \
> +			S5P_INFORM7 : (samsung_rev() == EXYNOS4210_REV_1_0 ? \
> +			(S5P_VA_SYSRAM + 0x24) : S5P_INFORM0))
> +
> +#define EXYNOS_BOOT_VECTOR_FLAG (samsung_rev() == EXYNOS4210_REV_1_1 ? \
> +			S5P_INFORM6 : (samsung_rev() == EXYNOS4210_REV_1_0 ? \
> +			(S5P_VA_SYSRAM + 0x20) : S5P_INFORM1))
> +
> +static void exynos_cpu_set_boot_vector(void)
> +{
> +	__raw_writel(virt_to_phys(exynos_cpu_resume), EXYNOS_BOOT_VECTOR_ADDR);
> +	__raw_writel(S5P_CHECK_AFTR, EXYNOS_BOOT_VECTOR_FLAG);

S5P_CHECK_AFTR is a value specific for AFTR state. I wonder if it 
wouldn't be desired to let the cpuidle driver somehow affect the value 
written here.

> +}
> +
>   static int exynos_cpu_suspend(unsigned long arg)
>   {
>   #ifdef CONFIG_CACHE_L2X0
> @@ -387,6 +401,7 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
>   			exynos_cpu_save_register();
>   			exynos_set_wakeupmask();
>   		}
> +		exynos_cpu_set_boot_vector();

Why this is outside of the if above? Should this really be called for 
all CPUs?

Best regards,
Tomasz
