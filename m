From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: fix GIC using for EXYNOS5440
Date: Mon, 10 Dec 2012 11:16:08 +0900
Message-ID: <50C545E8.8050301@samsung.com>
References: <030c01cdd672$cb1b6b40$615241c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20369 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930Ab2LJCQF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Dec 2012 21:16:05 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MES00D2UMAQUXI0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 11:16:02 +0900 (KST)
Received: from [10.90.51.60] by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MES00M3PMAQVR80@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 11:16:02 +0900 (KST)
In-reply-to: <030c01cdd672$cb1b6b40$615241c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

On 12/10/2012 10:07 AM, Kukjin Kim wrote:
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>   arch/arm/mach-exynos/common.c |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 0eb3b9a..9ecda37 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -684,7 +684,8 @@ void __init exynos5_init_irq(void)
>   	 * Theses parameters should be NULL and 0 because EXYNOS4
>   	 * uses GIC instead of VIC.
>   	 */
> -	s5p_init_irq(NULL, 0);
> +	if (!of_machine_is_compatible("samsung,exynos5440"))
> +		s5p_init_irq(NULL, 0);

How about remove to call s5p_init_irq() here because All exynos SoCs use
GIC instead of VIC?

>   
>   	gic_arch_extn.irq_set_wake = s3c_irq_wake;
>   }
