From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 3/6] ARM: EXYNOS: Fix compilation error in cpuidle.c
Date: Fri, 21 Mar 2014 03:01:12 +0900
Message-ID: <532B2CE8.9090206@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com> <1395162964-5916-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:63686 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755533AbaCTSBQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 14:01:16 -0400
Received: by mail-pa0-f41.google.com with SMTP id fa1so1283995pad.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 11:01:16 -0700 (PDT)
In-Reply-To: <1395162964-5916-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On 03/19/14 02:16, Tomasz Figa wrote:
> The big series refactoring Exynos suspend to RAM handling missed the
> cpuidle driver that is disabled in exynos_defconfig, leaving it
> including old mach/pm_core.h header and using old s3c_cpu_resume symbol
> instead of new exynos_cpu_resume, resulting in compilation failures with
> CONFIG_ARCH_EXYNOS and CONFIG_CPU_IDLE enabled.
>
> This patch fixes that silly mistake and performs necessary modification
> to arhc/arm/exynos/cpuidle.c to make it compile again.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> ---
>   arch/arm/mach-exynos/cpuidle.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index f57cb91..b530231 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -26,7 +26,6 @@
>   #include<plat/cpu.h>
>   #include<plat/pm.h>
>
> -#include<mach/pm-core.h>
>   #include<mach/map.h>
>
>   #include "common.h"
> @@ -127,7 +126,7 @@ static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
>   	/* Set value of power down register for aftr mode */
>   	exynos_sys_powerdown_conf(SYS_AFTR);
>
> -	__raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
> +	__raw_writel(virt_to_phys(exynos_cpu_resume), REG_DIRECTGO_ADDR);
>   	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
>
>   	save_cpu_arch_register();

OK, applied into s2r-pm-samsung-2 branch, thanks.

- Kukjin
