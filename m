From: kgene@kernel.org
Subject: RE: [PATCH] ARM: EXYNOS: Remove unused header file from pm_domains.c
Date: Fri, 10 Jan 2014 17:12:21 +0900
Message-ID: <093701cf0ddb$b0099290$101cb7b0$@kernel.org>
References: <1388398539-23121-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53282 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524AbaAJIMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 03:12:24 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ600I6DESN6D00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 17:12:23 +0900 (KST)
In-reply-to: <1388398539-23121-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org

Tushar Behera wrote:
> 
> plat/devs.h is not required in this file.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> 
> Based on top of next-20131224.
> 
> 
>  arch/arm/mach-exynos/pm_domains.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-
> exynos/pm_domains.c
> index 8fd2488..fe6570e 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -22,8 +22,6 @@
>  #include <linux/of_platform.h>
>  #include <linux/sched.h>
> 
> -#include <plat/devs.h>
> -
>  #include "regs-pmu.h"
> 
>  /*
> --
> 1.7.9.5

OK, applied.

Thanks,
Kukjin
