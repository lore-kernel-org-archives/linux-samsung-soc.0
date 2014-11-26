From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: use u8 for val[] in struct exynos_pmu_conf
Date: Wed, 26 Nov 2014 13:22:53 +0530
Message-ID: <547586D5.2040902@samsung.com>
References: <2379473.Yu7PYOQ3m0@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13964 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751764AbaKZHwv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 02:52:51 -0500
In-reply-to: <2379473.Yu7PYOQ3m0@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hi Bartilomiej,


On Tuesday 08 July 2014 05:33 PM, Bartlomiej Zolnierkiewicz wrote:
> Values stored in val[] are never bigger than a byte.
>
>     text    data     bss     dec     hex filename
>     5264       4       4    5272    1498 arch/arm/mach-exynos/pmu.o.before
>     2992       4       4    3000     bb8 arch/arm/mach-exynos/pmu.o.after
>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

I tested this patch and it's really helpful to reduce size.
How about resubmitting this change? As this will not get applied on 
current tree.

Thanks,
Pankaj Dubey

> ---
>   arch/arm/mach-exynos/common.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index b850db4..55ff019 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -101,7 +101,7 @@ enum sys_powerdown {
>
>   struct exynos_pmu_conf {
>   	void __iomem *reg;
> -	unsigned int val[NUM_SYS_POWERDOWN];
> +	u8 val[NUM_SYS_POWERDOWN];
>   };
>
>   extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
>
