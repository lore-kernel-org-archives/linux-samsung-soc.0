From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESPIN 4/6] ARM: EXYNOS: Remove SROM related register settings
 from mach-exynos
Date: Fri, 26 Feb 2016 16:28:11 +0900
Message-ID: <56CFFE8B.80002@samsung.com>
References: <1456389222-12738-1-git-send-email-pankaj.dubey@samsung.com>
 <1456389222-12738-5-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:50810 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753506AbcBZH2T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Feb 2016 02:28:19 -0500
In-reply-to: <1456389222-12738-5-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, olof@lixom.net, p.fedin@samsung.com, Kukjin Kim <kgene@kernel.org>

On 25.02.2016 17:33, Pankaj Dubey wrote:
> As now we have dedicated driver for SROM controller, it will take care
> of saving register banks during S2R so we can safely remove these
> settings from mach-exynos.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kukjin Kim <kgene@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig                 |  2 ++
>  arch/arm/mach-exynos/exynos.c                | 17 ---------
>  arch/arm/mach-exynos/include/mach/map.h      |  3 --
>  arch/arm/mach-exynos/regs-srom.h             | 53 ----------------------------
>  arch/arm/mach-exynos/suspend.c               | 20 ++---------
>  arch/arm/plat-samsung/include/plat/map-s5p.h |  1 -
>  6 files changed, 4 insertions(+), 92 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/regs-srom.h
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index c4989c2..8da01d1 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -18,6 +18,7 @@ menuconfig ARCH_EXYNOS
>  	select COMMON_CLK_SAMSUNG
>  	select EXYNOS_THERMAL
>  	select EXYNOS_PMU
> +	select EXYNOS_SROM if PM
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_S3C2410_I2C if I2C
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> @@ -30,6 +31,7 @@ menuconfig ARCH_EXYNOS
>  	select SRAM
>  	select THERMAL
>  	select MFD_SYSCON
> +	select MEMORY

select SAMSUNG_MC because otherwise the directory won't be build
(memory/Kconfig).

Rest looks good. No need to respin (I can fix this when applying),
unless other people will have some comments.

BR,
Krzysztof
