From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add missing .reserve field to SMDKC210
Date: Thu, 19 Jul 2012 15:44:37 +0900
Message-ID: <184401cd6579$f75e8f30$e61bad90$%kim@samsung.com>
References: <1341219791-17202-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50618 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752087Ab2GSGok (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 02:44:40 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7E001YLAQ6EDR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:44:39 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7E00N5HAQE0T10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:44:38 +0900 (KST)
In-reply-to: <1341219791-17202-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Adds missing .reserve field to SMDKC210 board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-smdkv310.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-
> exynos/mach-smdkv310.c
> index 95ce9f6..2d34ec7 100644
> --- a/arch/arm/mach-exynos/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
> @@ -422,5 +422,6 @@ MACHINE_START(SMDKC210, "SMDKC210")
>  	.init_machine	= smdkv310_machine_init,
>  	.init_late	= exynos_init_late,
>  	.timer		= &exynos4_timer,
> +	.reserve	= &smdkv310_reserve,
>  	.restart	= exynos4_restart,
>  MACHINE_END
> --
> 1.7.4.1

OK, applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
