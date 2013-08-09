From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: always enable PM domains support for
 EXYNOS4x12
Date: Fri, 09 Aug 2013 16:53:02 +0200
Message-ID: <1427702.Wy3A0eELLT@amdc1227>
References: <2897494.fSQeGUd9YR@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50128 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757646Ab3HIOxI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 10:53:08 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MR900E89QOFUQ00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Aug 2013 15:53:05 +0100 (BST)
In-reply-to: <2897494.fSQeGUd9YR@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Bart,

On Friday 09 of August 2013 13:56:05 Bartlomiej Zolnierkiewicz wrote:
> Currently PM domains support will be enabled for EXYNOS4x12 SoCs
> only if EXYNOS4210 SoC or EXYNOS5250 SoC support is also enabled.
> 
> Fix it by explicitly selecting PM domains support (if PM support
> is enabled) by SOC_EXYNOS4212 and SOC_EXYNOS4412 config options.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: b/arch/arm/mach-exynos/Kconfig
> ===================================================================
> --- a/arch/arm/mach-exynos/Kconfig	2013-08-08 14:36:02.000000000 +0200
> +++ b/arch/arm/mach-exynos/Kconfig	2013-08-08 14:38:48.967486318 +0200
> @@ -52,6 +52,7 @@ config SOC_EXYNOS4212
>  	depends on ARCH_EXYNOS4
>  	select ARCH_HAS_BANDGAP
>  	select PINCTRL_EXYNOS
> +	select PM_GENERIC_DOMAINS if PM
>  	select S5P_PM if PM
>  	select S5P_SLEEP if PM
>  	select SAMSUNG_DMADEV
> @@ -64,6 +65,7 @@ config SOC_EXYNOS4412
>  	depends on ARCH_EXYNOS4
>  	select ARCH_HAS_BANDGAP
>  	select PINCTRL_EXYNOS
> +	select PM_GENERIC_DOMAINS if PM
>  	select SAMSUNG_DMADEV
>  	help
>  	  Enable EXYNOS4412 SoC support

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
