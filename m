From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: EXYNOS: remove unnecessary header inclusions from
 exynos4/5 dt machine file
Date: Thu, 26 Sep 2013 13:45:27 +0900
Message-ID: <02c301ceba73$38f44120$aadcc360$@org>
References: <000001ceb2b9$e1936430$a4ba2c90$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45672 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891Ab3IZEp3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 00:45:29 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTP002YLUJDAU90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Sep 2013 13:45:28 +0900 (KST)
In-reply-to: <000001ceb2b9$e1936430$a4ba2c90$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Jingoo Han wrote:
> 
> mach-exynos{4,5}-dt.c include several header files that are not
> really used.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos4-dt.c |    4 ----
>  arch/arm/mach-exynos/mach-exynos5-dt.c |    4 ----
>  2 files changed, 8 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-
> exynos/mach-exynos4-dt.c
> index 0099c6c..3fc338f 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -11,12 +11,8 @@
>   * published by the Free Software Foundation.
>  */
> 
> -#include <linux/kernel.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_fdt.h>
> -#include <linux/serial_core.h>
> -#include <linux/memblock.h>
> -#include <linux/clocksource.h>
> 
>  #include <asm/mach/arch.h>
>  #include <plat/mfc.h>
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-
> exynos/mach-exynos5-dt.c
> index f874b77..217e84f 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -11,14 +11,10 @@
> 
>  #include <linux/of_platform.h>
>  #include <linux/of_fdt.h>
> -#include <linux/memblock.h>
>  #include <linux/io.h>
> -#include <linux/clocksource.h>
> 
>  #include <asm/mach/arch.h>
>  #include <mach/regs-pmu.h>
> -
> -#include <plat/cpu.h>
>  #include <plat/mfc.h>
> 
>  #include "common.h"
> --
> 1.7.10.4

Looks good to me, applied.

Thanks,
Kukjin
