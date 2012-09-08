From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 4/5] ARM: EXYNOS: Increase maximum possible memory bank
 size to 512MiB
Date: Sat, 08 Sep 2012 11:41:31 +0900
Message-ID: <24dc01cd8d6b$7426cf50$5c746df0$%kim@samsung.com>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
 <1346748609-11115-5-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36350 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103Ab2IHCld (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 22:41:33 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MA000M08FH1M3B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:41:32 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MA000FOBFH7WU70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:41:32 +0900 (KST)
In-reply-to: <1346748609-11115-5-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org

Tomasz Figa wrote:
> 
> Some boards have larger memory banks than 256MiB. This patch increses
> maximum bank size for Exynos-based boards to 512MiB.
> 
Well...the meaning of SECTION_SIZE_BITS is a little bit different you know.

Please refer to following thread.
http://lists.infradead.org/pipermail/linux-arm-kernel/2010-July/020184.html


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/memory.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/include/mach/memory.h b/arch/arm/mach-
> exynos/include/mach/memory.h
> index 374ef2c..d4db508 100644
> --- a/arch/arm/mach-exynos/include/mach/memory.h
> +++ b/arch/arm/mach-exynos/include/mach/memory.h
> @@ -15,8 +15,8 @@
> 
>  #define PLAT_PHYS_OFFSET		UL(0x40000000)
> 
> -/* Maximum of 256MiB in one bank */
> +/* Maximum of 512MiB in one bank */
>  #define MAX_PHYSMEM_BITS	32
> -#define SECTION_SIZE_BITS	28
> +#define SECTION_SIZE_BITS	29
> 
>  #endif /* __ASM_ARCH_MEMORY_H */
> --
> 1.7.12
