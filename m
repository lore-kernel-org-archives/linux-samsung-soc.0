From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RESEND][PATCH] ARM: EXYNOS: Fixed undefined symbol compilation
 error.
Date: Thu, 01 Dec 2011 19:29:24 +0900
Message-ID: <047101ccb014$18766ab0$49634010$%kim@samsung.com>
References: <1321352102-10021-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46564 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751226Ab1LAK32 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 05:29:28 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVI00MXGT53WXM0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Dec 2011 19:29:27 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVI005KVT51UO20@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Dec 2011 19:29:26 +0900 (KST)
In-reply-to: <1321352102-10021-1-git-send-email-pankaj.dubey@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Pankaj Dubey wrote:
> 
> Many drivers will fail to compile if compiled as module due to
> undefined symbol exynos4_ioremap.
> Fix has been added by exporting the same in cpu.c file.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/cpu.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
> index 8e09f34..027f65471 100644
> --- a/arch/arm/mach-exynos/cpu.c
> +++ b/arch/arm/mach-exynos/cpu.c
> @@ -8,6 +8,7 @@
>   * published by the Free Software Foundation.
>  */
> 
> +#include <linux/module.h>
>  #include <linux/sched.h>
>  #include <linux/sysdev.h>
>  #include <linux/of.h>
> @@ -164,6 +165,7 @@ void __iomem *exynos4_ioremap(unsigned long phy,
> size_t size, unsigned int type)
> 
>  	return __arm_ioremap(phy, size, type);
>  }
> +EXPORT_SYMBOL(exynos4_ioremap);
> 
>  static void exynos_idle(void)
>  {
> --
> 1.7.4.1

Hi Pankaj,

As we discussed internally, since Nicolas Pitre's vmalloc patch series this
can be dropped.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
