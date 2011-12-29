From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Staticise s3c64xx_init_uarts()
Date: Thu, 29 Dec 2011 12:37:11 +0900
Message-ID: <028f01ccc5db$2658df50$730a9df0$%kim@samsung.com>
References: <1325121194-32240-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48157 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752173Ab1L2DhM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 22:37:12 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY007594PRIN50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:37:12 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00F704PZ2010@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:37:11 +0900 (KST)
In-reply-to: <1325121194-32240-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> Since the merge of everything into common.c s3c64xx_init_uarts() is now
> only used within the one source file and should therefore be declared
> static.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/common.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-
> s3c64xx/common.c
> index 8ae5b16..f8cc5a0 100644
> --- a/arch/arm/mach-s3c64xx/common.c
> +++ b/arch/arm/mach-s3c64xx/common.c
> @@ -49,7 +49,7 @@
> 
>  /* uart registration process */
> 
> -void __init s3c64xx_init_uarts(struct s3c2410_uartcfg *cfg, int no)
> +static void __init s3c64xx_init_uarts(struct s3c2410_uartcfg *cfg, int
no)
>  {
>  	s3c24xx_init_uartdevs("s3c6400-uart", s3c64xx_uart_resources, cfg,
> no);
>  }
> --
> 1.7.7.3

OK, let me send this to patch system.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
