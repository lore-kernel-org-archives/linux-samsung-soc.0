From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Should check for IS_ERR(clk) instead of
 NULL
Date: Wed, 18 Apr 2012 17:12:28 -0700
Message-ID: <4F8F586C.3020401@samsung.com>
References: <1334722134-14545-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41772 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751605Ab2DSAM2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 20:12:28 -0400
Received: by mail-pb0-f46.google.com with SMTP id un15so9554209pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Apr 2012 17:12:28 -0700 (PDT)
In-Reply-To: <1334722134-14545-1-git-send-email-jhbird.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jhbird.choi@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>

jhbird.choi@gmail.com wrote:
> From: Jonghwan Choi<jhbird.choi@samsung.com>
> 
> On the error condition clk_get() returns ERR_PTR().
> 
> Signed-off-by: Jonghwan Choi<jhbird.choi@samsung.com>
> ---
>   .../arm/plat-samsung/include/plat/watchdog-reset.h |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> index f19aff1..bc4db9b 100644
> --- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> +++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> @@ -25,7 +25,7 @@ static inline void arch_wdt_reset(void)
> 
>   	__raw_writel(0, S3C2410_WTCON);	  /* disable watchdog, to be safe  */
> 
> -	if (s3c2410_wdtclk)
> +	if (!IS_ERR(s3c2410_wdtclk))

Yeah, right. BTW don't we need to check NULL here?

>   		clk_enable(s3c2410_wdtclk);
> 
>   	/* put initial values into count and data */

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
