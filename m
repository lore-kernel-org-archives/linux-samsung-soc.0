From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Should check for IS_ERR(clk) instead of NULL
Date: Thu, 21 Jun 2012 09:18:27 +0900
Message-ID: <037f01cd4f43$61796040$246c20c0$%kim@samsung.com>
References: <1334722134-14545-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55394 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932417Ab2FUAS3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 20:18:29 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5X00C4IY6JQP50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 09:18:28 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5X009P3Y6RPM50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 09:18:28 +0900 (KST)
In-reply-to: <1334722134-14545-1-git-send-email-jhbird.choi@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jhbird.choi@gmail.com, linux-samsung-soc@vger.kernel.org
Cc: 'Jonghwan Choi' <jhbird.choi@samsung.com>

jhbird.choi@gmail.com wrote:
> 
> From: Jonghwan Choi <jhbird.choi@samsung.com>
> 
> On the error condition clk_get() returns ERR_PTR().
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  .../arm/plat-samsung/include/plat/watchdog-reset.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> index f19aff1..bc4db9b 100644
> --- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> +++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> @@ -25,7 +25,7 @@ static inline void arch_wdt_reset(void)
> 
>  	__raw_writel(0, S3C2410_WTCON);	  /* disable watchdog, to be safe
> */
> 
> -	if (s3c2410_wdtclk)
> +	if (!IS_ERR(s3c2410_wdtclk))
>  		clk_enable(s3c2410_wdtclk);
> 
>  	/* put initial values into count and data */
> --
> 1.7.0.4

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
