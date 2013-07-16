From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Enable 64-bit DMA for EXYNOS5440 if LPAE is
 enabled
Date: Tue, 16 Jul 2013 12:39:42 +0900
Message-ID: <027701ce81d6$1b857a80$52906f80$%kim@samsung.com>
References: <109701ce667b$179822e0$46c868a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44202 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755098Ab3GPDjp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 23:39:45 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQ000APTFHWAUD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Jul 2013 12:39:43 +0900 (KST)
In-reply-to: <109701ce667b$179822e0$46c868a0$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.ab@samsung.com>

Kukjin Kim wrote:
> 
> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> Allow 64-bit DMA addresses if LPAE is enabled on EXYNOS5440.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index e101b14..0f7d308 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -81,6 +81,7 @@ config SOC_EXYNOS5440
>  	bool "SAMSUNG EXYNOS5440"
>  	default y
>  	depends on ARCH_EXYNOS5
> +	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
>  	select ARCH_HAS_OPP
>  	select ARM_ARCH_TIMER
>  	select AUTO_ZRELADDR
> --
> 1.7.10.4

OK, applied into -fixes for 3.11-rc because current SSDK5440 cannot boot
without this.

Thanks,
- Kukjin
