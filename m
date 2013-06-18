From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 30/38] ARM: EXYNOS: Remove CONFIG_SOC_EXYNOS4412
Date: Tue, 18 Jun 2013 18:17:14 +0900
Message-ID: <1b9901ce6c04$9f4ff710$ddefe530$%kim@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
 <1371486863-12398-31-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16550 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754001Ab3FRJRR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 05:17:17 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOL00M0Y0GOUT10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 18:17:15 +0900 (KST)
In-reply-to: <1371486863-12398-31-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Tomasz Figa wrote:
> 
> Exynos4212 and Exynos4412 SoCs differ only in number of ARM cores and
> there is no need to have separate Kconfig options for them, since they
> use the same code.
> 
> This patch removes CONFIG_SOC_EXYNOS4412, leaving CONFIG_SOC_EXYNOS4212
> as the one supporting both SoCs from this series.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig             | 11 +----------
>  arch/arm/plat-samsung/include/plat/cpu.h |  6 +-----
>  2 files changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 65ca3ac..fcebdfb 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -46,7 +46,7 @@ config CPU_EXYNOS4210
>  	  Enable EXYNOS4210 CPU support
> 
>  config SOC_EXYNOS4212
> -	bool "SAMSUNG EXYNOS4212"
> +	bool "SAMSUNG EXYNOS4212/4412"
>  	default y
>  	depends on ARCH_EXYNOS4
>  	select PINCTRL_EXYNOS
> @@ -56,15 +56,6 @@ config SOC_EXYNOS4212
>  	help
>  	  Enable EXYNOS4212 SoC support
> 
> -config SOC_EXYNOS4412
> -	bool "SAMSUNG EXYNOS4412"
> -	default y
> -	depends on ARCH_EXYNOS4
> -	select PINCTRL_EXYNOS
> -	select SAMSUNG_DMADEV
> -	help
> -	  Enable EXYNOS4412 SoC support
> -

NAK, I'm still saying we need separation of exynos4212 and exynos4412
because there are differences, it is not implemented yet but will be
implemented in future. So would be helpful if we could keep them.

Thanks,
- Kukjin
