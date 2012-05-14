From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Fix soft reboot hang after suspend/resume
Date: Mon, 14 May 2012 17:15:50 +0900
Message-ID: <065f01cd31a9$c5f38f80$51daae80$%kim@samsung.com>
References: <1332929866-31489-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25340 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752402Ab2ENIPu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 04:15:50 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M40000TV6XM30N0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 May 2012 17:15:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4000A826YBGU00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 May 2012 17:15:48 +0900 (KST)
In-reply-to: <1332929866-31489-1-git-send-email-inderpal.singh@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Inderpal Singh' <inderpal.singh@linaro.org>, samsung@lists.linaro.org, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Inderpal Singh wrote:
> 
> Upon wake-up, clear the sleep mode set in INFORM1 register.
> 
Is this for wake-up or _really_ software reset? And is this available on all
of EXYNOS4 SoCs?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
> ---
>  arch/arm/mach-exynos/pm.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index f0bb467..16cba3f 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -381,6 +381,10 @@ static void exynos4_pm_resume(void)
>  #endif
> 
>  early_wakeup:
> +
> +	/* Clear SLEEP mode set in INFORM1 */
> +	__raw_writel(0x0, S5P_INFORM1);
> +
>  	return;
>  }
> 
