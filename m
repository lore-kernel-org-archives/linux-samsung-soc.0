From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S3C2416: Change S3C2416 NAND platform device name
Date: Mon, 18 Oct 2010 19:56:19 +0900
Message-ID: <048501cb6eb3$19f30770$4dd91650$%kim@samsung.com>
References: <1279495911-17346-1-git-send-email-sbkim73@samsung.com>
 <1279495911-17346-3-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11208 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754954Ab0JRK4A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Oct 2010 06:56:00 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAH00LITFPB2J60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Oct 2010 19:55:59 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAH0085TFPB49@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Oct 2010 19:55:59 +0900 (KST)
In-reply-to: <1279495911-17346-3-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Atul Dahiya' <atul.dahiya@samsung.com>

Sangbeom Kim wrote:
> 
> From: Atul Dahiya <atul.dahiya@samsung.com>
> 
> This patch changes the platform device name from 's3c2416-nand' to
> 's3c2412-nand' so that S3C2416 can reuse the nand functionality
> available on S3C2412.
> 
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s3c2416/s3c2416.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c2416/s3c2416.c b/arch/arm/mach-
> s3c2416/s3c2416.c
> index bfe674f..6468b6c 100644
> --- a/arch/arm/mach-s3c2416/s3c2416.c
> +++ b/arch/arm/mach-s3c2416/s3c2416.c
> @@ -100,7 +100,7 @@ void __init s3c2416_init_uarts(struct s3c2410_uartcfg
> *cfg, int no)
>  {
>  	s3c24xx_init_uartdevs("s3c2440-uart", s3c2410_uart_resources, cfg,
no);
> 
> -	s3c_nand_setname("s3c2416-nand");
> +	s3c_nand_setname("s3c2412-nand");
>  }
> 
>  /* s3c2416_map_io
> --
Ok...will apply.

Ben, if any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
