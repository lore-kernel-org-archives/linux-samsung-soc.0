From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos: change the PHYSMEM_BITS and SECTION_SIZE
Date: Tue, 16 Jul 2013 12:38:43 +0900
Message-ID: <027601ce81d5$f87bc080$e9734180$%kim@samsung.com>
References: <1370956861-18710-1-git-send-email-subash.rp@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32623 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755541Ab3GPDiw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 23:38:52 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQ000GQCFG529I0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Jul 2013 12:38:45 +0900 (KST)
In-reply-to: <1370956861-18710-1-git-send-email-subash.rp@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Subash Patel' <subash.rp@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: catalin.marinas@arm.com

Subash Patel wrote:
> 
> On exynos5440 there is DRAM on the 36-bit address range. Hence
> this patch converts the MAX_PHYSMEM_BITS macro to 36 if LPAE is
> enabled for the ARM architecture.
> 
> The conventional section size on exynos is 256M due to sparsemem.
> Since exynos5440 has memory in multiples of 1G in 32-bit and 36-bit
> range, this has now been modified to 31.
> 
> Signed-off-by: Subash Patel <subash.rp@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/memory.h |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/include/mach/memory.h
b/arch/arm/mach-exynos/include/mach/memory.h
> index 374ef2c..2a4cdb7 100644
> --- a/arch/arm/mach-exynos/include/mach/memory.h
> +++ b/arch/arm/mach-exynos/include/mach/memory.h
> @@ -15,8 +15,13 @@
> 
>  #define PLAT_PHYS_OFFSET		UL(0x40000000)
> 
> +#ifndef CONFIG_ARM_LPAE
>  /* Maximum of 256MiB in one bank */
>  #define MAX_PHYSMEM_BITS	32
>  #define SECTION_SIZE_BITS	28
> +#else
> +#define MAX_PHYSMEM_BITS	36
> +#define SECTION_SIZE_BITS	31
> +#endif
> 
>  #endif /* __ASM_ARCH_MEMORY_H */
> --
> 1.7.10.4

OK, current EXYNOS5440(SSDK5440 and SD5v1) cannot boot without this because
of enabling LPAE and bootargs for over 4GiB memory. So let me sort this out
for v3.11-rc.

Thanks,
- Kukjin
