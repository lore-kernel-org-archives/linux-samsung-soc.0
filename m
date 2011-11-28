From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v2 2/3] ARM: Exynos4: Add ioremap interceptor for
 statically remapped regions
Date: Mon, 28 Nov 2011 12:07:29 +0100
Message-ID: <002901ccadbd$eb7f6280$c27e2780$%szyprowski@samsung.com>
References: <1320109289-2730-1-git-send-email-thomas.abraham@linaro.org>
 <1320109289-2730-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12198 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752527Ab1K1LIm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Nov 2011 06:08:42 -0500
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LVD00L4LAYHZM50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Nov 2011 11:08:41 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LVD00824AYG2E@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Nov 2011 11:08:40 +0000 (GMT)
In-reply-to: <1320109289-2730-3-git-send-email-thomas.abraham@linaro.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Hello,

On Tuesday, November 01, 2011 2:01 AM Thomas Abraham wrote:

> ioremap() request for statically remapped regions are intercepted and the
> statically assigned virtual address is returned. For requests for which
> there are no statically remapped regions, the requests are let through.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos4/cpu.c             |   16 ++++++++++++++++
>  arch/arm/mach-exynos4/include/mach/io.h |    5 +++++
>  2 files changed, 21 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
> index 5b1765b..358624d 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos4/cpu.c
> @@ -137,6 +137,22 @@ static struct map_desc exynos4_iodesc1[] __initdata = {
>  	},
>  };
> 
> +/*
> + * For all ioremap requests of statically mapped regions, intercept ioremap and
> + * return virtual address from the iodesc table.
> + */
> +void __iomem *exynos4_ioremap(unsigned long phy, size_t size, unsigned int type)
> +{
> +	struct map_desc *desc = exynos4_iodesc;
> +	unsigned int idx;
> +
> +	for (idx = 0; idx < ARRAY_SIZE(exynos4_iodesc); idx++, desc++)
> +		if (desc->pfn == __phys_to_pfn(phy) && desc->type == type)
> +			return (void __iomem *)desc->virtual;

I've just noticed that this function make access to exynos4_iodesc array which is
placed in initdata section. This might cause a lot of strange unpredictable issues,
so this patch should probably remove __initdata annotations in iodesc arrays.

> +
> +	return __arm_ioremap(phy, size, type);
> +}
> +
>  static void exynos4_idle(void)
>  {
>  	if (!need_resched())
> diff --git a/arch/arm/mach-exynos4/include/mach/io.h b/arch/arm/mach-exynos4/include/mach/io.h
> index d5478d2..c1b21d5 100644
> --- a/arch/arm/mach-exynos4/include/mach/io.h
> +++ b/arch/arm/mach-exynos4/include/mach/io.h
> @@ -22,5 +22,10 @@
>  #define __mem_pci(a)	(a)
> 
>  #define IO_SPACE_LIMIT (0xFFFFFFFF)
> +#define __arch_ioremap	exynos4_ioremap
> +#define __arch_iounmap	__iounmap
> +
> +void __iomem *exynos4_ioremap(unsigned long phy, size_t size,
> +					unsigned int type);
> 
>  #endif /* __ASM_ARM_ARCH_IO_H */
> --
> 1.7.4.4
> 

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
