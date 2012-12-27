From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add support for rtc wakeup
Date: Thu, 27 Dec 2012 10:40:47 -0800
Message-ID: <01a901cde461$b14a9c70$13dfd550$@samsung.com>
References: <1356580840-22960-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38700 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751913Ab2L0Skz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 13:40:55 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFP00DEWD84K600@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:40:54 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFP00M41D84HC20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:40:54 +0900 (KST)
In-reply-to: <1356580840-22960-1-git-send-email-inderpal.singh@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Inderpal Singh' <inderpal.singh@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Inderpal Singh wrote:
> 
> Set the gic arch extension callback to support rtc wakeup.
> 
> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
> ---
>  arch/arm/mach-exynos/common.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-
> exynos/common.c
> index 578a610..bf2ee1d 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -747,6 +747,8 @@ void __init exynos4_init_irq(void)
>  	 * uses GIC instead of VIC.
>  	 */
>  	s5p_init_irq(NULL, 0);
> +
> +	gic_arch_extn.irq_set_wake = s3c_irq_wake;
>  }
> 
>  void __init exynos5_init_irq(void)
> --
> 1.7.9.5

Applied, thanks

- Kukjin
