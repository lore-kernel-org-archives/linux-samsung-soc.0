From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 4/7] ARM: EXYNOS: Remove SROM related register settings
 from mach-exynos
Date: Tue, 25 Aug 2015 10:53:08 +0900
Message-ID: <55DBCA84.2070506@samsung.com>
References: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
 <1440403348-8974-5-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57845 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752387AbbHYBxQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 21:53:16 -0400
In-reply-to: <1440403348-8974-5-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene@kernel.org, heiko@sntech.de, thomas.ab@samsung.com

On 24.08.2015 17:02, Pankaj Dubey wrote:
> As now we have dedicated driver for SROM controller, it will take care
> of saving register banks during S2R so we can safely remove these
> settings from mach-exynos.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig                 |  2 ++
>  arch/arm/mach-exynos/common.h                |  2 --
>  arch/arm/mach-exynos/exynos.c                | 17 ---------
>  arch/arm/mach-exynos/include/mach/map.h      |  3 --
>  arch/arm/mach-exynos/regs-srom.h             | 53 ----------------------------
>  arch/arm/mach-exynos/suspend.c               | 20 ++---------
>  arch/arm/plat-samsung/include/plat/map-s5p.h |  1 -
>  7 files changed, 4 insertions(+), 94 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/regs-srom.h

The order of patches looks wrong. Is this fully bisectable? You are
removing here support for SROM but DTS bindings are not added yet.

> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 3a10f1a..7c917ef 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -27,6 +27,8 @@ menuconfig ARCH_EXYNOS
>  	select SRAM
>  	select THERMAL
>  	select MFD_SYSCON
> +	select SOC_SAMSUNG
> +	select EXYNOS_SROM
>  	help
>  	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
>  
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index 1534925..1c04741 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -108,8 +108,6 @@ IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EXYNOS5_SOC_MASK)
>  
>  #define soc_is_exynos4() (soc_is_exynos4210() || soc_is_exynos4212() || \
>  			  soc_is_exynos4412())
> -#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5410() || \
> -			  soc_is_exynos5420() || soc_is_exynos5800())

That wasn't here in v1. I see that it is not used any more and
of_machine_is_compatible is preferred but I would prefer to leave it. In
certain cases you cannot use of_machine_is_compatible (e.g. in
platform_do_lowpower).

Rest looks good.

Best regards,
Krzysztof
