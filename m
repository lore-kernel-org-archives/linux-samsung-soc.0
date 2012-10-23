From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/4] ARM: EXYNOS: Kconfig: Remove dependencies on
 particular SoCs from DT machines
Date: Tue, 23 Oct 2012 22:27:41 +0900
Message-ID: <020a01cdb122$2d888ae0$8899a0a0$%kim@samsung.com>
References: <1349701345-2681-1-git-send-email-t.figa@samsung.com>
 <1349701345-2681-5-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30495 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932301Ab2JWN1n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 09:27:43 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00LH3LE3LE90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 22:27:41 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC00761LE5Y530@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 22:27:41 +0900 (KST)
In-reply-to: <1349701345-2681-5-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

Tomasz Figa wrote:
> 
> MACH_EXYNOS{4,5}_DT are used for whole SoC lines, so they should depend
> on ARCH_EXYNOS{4,5} rather than on particular SoCs.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 6ea95f0..2e82ce7 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -404,7 +404,6 @@ comment "Flattened Device Tree based board for EXYNOS
> SoCs"
>  config MACH_EXYNOS4_DT
>  	bool "Samsung Exynos4 Machine using device tree"
>  	depends on ARCH_EXYNOS4
> -	select SOC_EXYNOS4210
>  	select USE_OF
>  	select ARM_AMBA
>  	select HAVE_SAMSUNG_KEYPAD if INPUT_KEYBOARD
> @@ -419,7 +418,6 @@ config MACH_EXYNOS4_DT
>  config MACH_EXYNOS5_DT
>  	bool "SAMSUNG EXYNOS5 Machine using device tree"
>  	depends on ARCH_EXYNOS5
> -	select SOC_EXYNOS5250
>  	select USE_OF
>  	select ARM_AMBA
>  	help
> --
> 1.7.12

Hmm...your comment is correct, but we need to think again its selecting
order, between ARCH name, SoC and board. In addition, in case of MACH_XXX_DT
depending on SoC is rather to be supposed...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
