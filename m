From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add header file protection macros
Date: Wed, 21 Sep 2011 20:51:59 +0900
Message-ID: <004501cc7854$df075f10$9d161d30$%kim@samsung.com>
References: <1316493961-7650-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52549 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752992Ab1IULwB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 07:52:01 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRV000CHFM2WYI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 20:52:00 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRV000ERFMON4@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 20:52:00 +0900 (KST)
In-reply-to: <1316493961-7650-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> This patch adds header file protection macros to prevent duplication.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/include/mach/pm-core.h |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/include/mach/pm-core.h b/arch/arm/mach-
> exynos4/include/mach/pm-core.h
> index 1df3b81..4c3406b 100644
> --- a/arch/arm/mach-exynos4/include/mach/pm-core.h
> +++ b/arch/arm/mach-exynos4/include/mach/pm-core.h
> @@ -14,6 +14,10 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>  */
> +
> +#ifndef __ASM_ARCH_PM_CORE_H
> +#define __ASM_ARCH_PM_CORE_H __FILE__
> +
>  #include <mach/regs-pmu.h>
> 
>  static inline void s3c_pm_debug_init_uart(void)
> @@ -57,3 +61,5 @@ static inline void s3c_pm_saved_gpios(void)
>  {
>  	/* nothing here yet */
>  }
> +
> +#endif /* __ASM_ARCH_PM_CORE_H */
> --
> 1.7.4.1

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
