From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Use IN4 DC measurement mode on Tobermory
Date: Fri, 27 Jan 2012 10:33:49 +0900
Message-ID: <016601ccdc93$b8109720$2831c560$%kim@samsung.com>
References: <1327439964-28533-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49253 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301Ab2A0Bdu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 20:33:50 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYF00D6BOCBQN50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 10:33:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYF004FXOCDEJ10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 10:33:49 +0900 (KST)
In-reply-to: <1327439964-28533-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> The WM8962 on Tobermory has one of the IN4 inputs connected for DC
> measurement. Tell the driver it can optimise for this mode.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> 
> This feature is going to be merged via ASoC in 3.4 - is it OK if I apply
> this patch to the ASoC tree too?  It's a one liner, I'd be astonished if
> it were to generate any conflicts.
> 
Yes, would be better. If required, please go ahead with my ack:
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-
> s3c64xx/mach-crag6410-module.c
> index 509307d..317f866 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -128,6 +128,7 @@ static struct wm8962_pdata wm8962_pdata __initdata = {
>  		0x8000 | WM8962_GPIO_FN_DMICDAT,
>  		WM8962_GPIO_FN_IRQ,    /* Open drain mode */
>  	},
> +	.in4_dc_measure = true,
>  };
> 
>  static struct wm9081_pdata wm9081_pdata __initdata = {
> --
> 1.7.9.rc1
