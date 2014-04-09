From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 12/17] ARM: exynos: cpuidle: Move S5P_CHECK_AFTR in a
 header
Date: Wed, 09 Apr 2014 14:21:34 +0200
Message-ID: <53453B4E.8000203@samsung.com>
References: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org>
 <1396959579-18268-13-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22165 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932592AbaDIMVk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 08:21:40 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3R005KTJO1MCB0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Apr 2014 13:21:37 +0100 (BST)
In-reply-to: <1396959579-18268-13-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

Hi Daniel,

On 08.04.2014 14:19, Daniel Lezcano wrote:
> Move the S5P_CHECK_AFTR definition to the header it belongs to.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>   arch/arm/mach-exynos/cpuidle.c  |    2 --
>   arch/arm/mach-exynos/regs-pmu.h |    1 +
>   2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index 81d7197..cd27dbf 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -37,8 +37,6 @@
>   			S5P_INFORM6 : (samsung_rev() == EXYNOS4210_REV_1_0 ? \
>   			(S5P_VA_SYSRAM + 0x20) : S5P_INFORM1))
>
> -#define S5P_CHECK_AFTR		0xFCBA0D10
> -
>   #define EXYNOS5_PWR_CTRL1			(S5P_VA_CMU + 0x01020)
>   #define EXYNOS5_PWR_CTRL2			(S5P_VA_CMU + 0x01024)
>
> diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
> index 4f6a256..09c43c3 100644
> --- a/arch/arm/mach-exynos/regs-pmu.h
> +++ b/arch/arm/mach-exynos/regs-pmu.h
> @@ -120,6 +120,7 @@
>   #define S5P_INT_LOCAL_PWR_EN			0x7
>
>   #define S5P_CHECK_SLEEP				0x00000BAD
> +#define S5P_CHECK_AFTR				0xFCBA0D10

This is not really a PMU-specific value. It is not a part of the 
hardware programming interface, but rather a part of the 
kernel-bootloader ABI used to handle wake-up from low power states. Same 
applies to S5P_CHECK_SLEEP.

I believe the proper place for such definitions would be the source file 
using it, which after patch 14/17 would be pm.c.

Best regards,
Tomasz
