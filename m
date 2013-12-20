From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Consolidate selection of PM_GENERIC_DOMAINS
 for Exynos4
Date: Sat, 21 Dec 2013 06:34:54 +0900
Message-ID: <52B4B7FE.8010003@samsung.com>
References: <1387574696-26366-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:51223 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004Ab3LTVe7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 16:34:59 -0500
Received: by mail-pb0-f47.google.com with SMTP id um1so3088432pbc.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 13:34:59 -0800 (PST)
In-Reply-To: <1387574696-26366-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

On 12/21/13 06:24, Sylwester Nawrocki wrote:
> Instead of repeating "select PM_GENERIC_DOMAINS" for all Exynos4
> variants add relevant entry in the Kconfig section common to the
> SoC series.
>
> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
> ---
>   arch/arm/mach-exynos/Kconfig |    4 +---
>   1 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 1414bc6..35c335d 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -24,6 +24,7 @@ config ARCH_EXYNOS4
>   	select HAVE_SMP
>   	select MIGHT_HAVE_CACHE_L2X0
>   	select PINCTRL
> +	select PM_GENERIC_DOMAINS if PM
>   	select S5P_DEV_MFC
>   	help
>   	  Samsung EXYNOS4 SoCs based systems
> @@ -48,7 +49,6 @@ config CPU_EXYNOS4210
>   	select ARCH_HAS_BANDGAP
>   	select ARM_CPU_SUSPEND if PM
>   	select PINCTRL_EXYNOS
> -	select PM_GENERIC_DOMAINS if PM
>   	select S5P_PM if PM
>   	select S5P_SLEEP if PM
>   	select SAMSUNG_DMADEV
> @@ -61,7 +61,6 @@ config SOC_EXYNOS4212
>   	depends on ARCH_EXYNOS4
>   	select ARCH_HAS_BANDGAP
>   	select PINCTRL_EXYNOS
> -	select PM_GENERIC_DOMAINS if PM
>   	select S5P_PM if PM
>   	select S5P_SLEEP if PM
>   	select SAMSUNG_DMADEV
> @@ -74,7 +73,6 @@ config SOC_EXYNOS4412
>   	depends on ARCH_EXYNOS4
>   	select ARCH_HAS_BANDGAP
>   	select PINCTRL_EXYNOS
> -	select PM_GENERIC_DOMAINS if PM
>   	select SAMSUNG_DMADEV
>   	help
>   	  Enable EXYNOS4412 SoC support

Applied, thanks.
- Kukjin
