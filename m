From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v2] ARM: Exynos: JPEG board definition and device register
Date: Wed, 01 Feb 2012 14:45:44 +0530
Message-ID: <4F2902C0.5020805@linaro.org>
References: <1328005243-6072-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:58916 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754276Ab2BAJPt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 04:15:49 -0500
Received: by iacb35 with SMTP id b35so1239293iac.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Feb 2012 01:15:49 -0800 (PST)
In-Reply-To: <1328005243-6072-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 01/31/2012 03:50 PM, Andrzej Pietrasiewicz wrote:
> Add JPEG board definition and device register
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> Dear All,
> 
> This patch adds board definition code and device registration code
> for JPEG IP found in Exynos4 SoC.
> 
> It is exactly the same as the previous patch but with better coding style
> compliance.
> 
>  arch/arm/mach-exynos/Kconfig               |    2 ++
>  arch/arm/mach-exynos/clock.c               |    5 +++++
>  arch/arm/mach-exynos/include/mach/map.h    |    3 +++
>  arch/arm/mach-exynos/mach-nuri.c           |    2 ++
>  arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
>  arch/arm/plat-s5p/Kconfig                  |    5 +++++
>  arch/arm/plat-samsung/devs.c               |   26 ++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h  |    1 +
>  8 files changed, 46 insertions(+), 0 deletions(-)
> 
[snip]
>  
> +#ifdef CONFIG_S5P_DEV_JPEG
> +static struct resource s5p_jpeg_resource[] = {
> +	[0] = {
> +		.start	= S5P_PA_JPEG,
> +		.end	= S5P_PA_JPEG + SZ_4K - 1,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +	[1] = {
> +		.start	= IRQ_JPEG,
> +		.end	= IRQ_JPEG,
> +		.flags	= IORESOURCE_IRQ,
> +	},
> +};

Should be using DEFINE_RES_MEM and DEFINE_RES_IRQ.

Also, wouldn't be a good idea to split this patch into 2 different
patches for platform-specific and board-specific changes?

-- 
Tushar Behera
