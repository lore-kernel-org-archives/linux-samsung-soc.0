From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix Kconfig dependencies for device tree
 enabled machine files
Date: Sat, 14 Apr 2012 08:46:40 -0700
Message-ID: <4F899BE0.9040504@samsung.com>
References: <1334144964-3282-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:59439 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751922Ab2DNPqn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Apr 2012 11:46:43 -0400
Received: by obbta14 with SMTP id ta14so1810867obb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Apr 2012 08:46:43 -0700 (PDT)
In-Reply-To: <1334144964-3282-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 04/11/12 04:49, Sachin Kamat wrote:
> Add config dependency for Exynos4 and Exynos5 device tree enabled machine
> files on config options ARCH_EXYNOS4 and ARCH_EXYNOS5 respectively.
> Enabling machine support without proper ARCH support enabled is incorrect.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/mach-exynos/Kconfig |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 801c738..2c35fd4 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -370,6 +370,7 @@ comment "Flattened Device Tree based board for EXYNOS SoCs"
>
>   config MACH_EXYNOS4_DT
>   	bool "Samsung Exynos4 Machine using device tree"
> +	depends on ARCH_EXYNOS4
>   	select CPU_EXYNOS4210
>   	select USE_OF
>   	select ARM_AMBA
> @@ -382,6 +383,7 @@ config MACH_EXYNOS4_DT
>
>   config MACH_EXYNOS5_DT
>   	bool "SAMSUNG EXYNOS5 Machine using device tree"
> +	depends on ARCH_EXYNOS5
>   	select SOC_EXYNOS5250
>   	select USE_OF
>   	select ARM_AMBA

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
