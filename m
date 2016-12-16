From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 2/8] ARM: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
Date: Fri, 16 Dec 2016 20:04:01 +0200
Message-ID: <20161216180401.GA6459@kozik-lap>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33025 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758278AbcLPSEK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Dec 2016 13:04:10 -0500
Received: by mail-wm0-f66.google.com with SMTP id u144so6925023wmu.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Dec 2016 10:04:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481375323-29724-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, arnd@arndb.de, geert+renesas@glider.be, m.szyprowski@samsung.com, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com

On Sat, Dec 10, 2016 at 06:38:37PM +0530, Pankaj Dubey wrote:
> As now we have chipid driver to initialize SoC related information
> lets include it in build by default.
s/lets/let's/

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 0bb63b8..29065c5 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -16,6 +16,7 @@ menuconfig ARCH_EXYNOS
>  	select ARM_AMBA
>  	select ARM_GIC
>  	select COMMON_CLK_SAMSUNG
> +	select EXYNOS_CHIPID
>  	select EXYNOS_THERMAL
>  	select EXYNOS_PMU
>  	select EXYNOS_SROM
> -- 
> 2.7.4
> 
