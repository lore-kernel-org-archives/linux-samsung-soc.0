From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: EXYNOS: Configure ARM_NR_BANKS for EXYNOS SoC
Date: Wed, 8 Feb 2012 08:47:16 +0000
Message-ID: <20120208084716.GG889@n2100.arm.linux.org.uk>
References: <003201cce600$81c8f100$855ad300$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:50869 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756556Ab2BHIr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Feb 2012 03:47:26 -0500
Content-Disposition: inline
In-Reply-To: <003201cce600$81c8f100$855ad300$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene.kim@samsung.com>

On Wed, Feb 08, 2012 at 10:25:13AM +0900, Boojin Kim wrote:
> This patch increases the number of bank for EXYNOS4 and EXYNOS5
> to support bigger than 2GB memory on it.
> 
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> ---
>  arch/arm/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f9d7c47..d646810 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1134,7 +1134,7 @@ source arch/arm/mm/Kconfig
> 
>  config ARM_NR_BANKS
>  	int
> -	default 16 if ARCH_EP93XX
> +	default 16 if ARCH_EP93XX || ARCH_EXYNOS4 || ARCH_EXYNOS5

ARCH_EXYNOS ?
