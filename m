From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/1] mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd
Date: Tue, 31 Dec 2013 15:47:03 +0900
Message-ID: <001801cf05f4$1d573f90$5805beb0$%han@samsung.com>
References: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60161 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099Ab3LaGrF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 01:47:05 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYN005YYS6GY350@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Dec 2013 15:47:04 +0900 (KST)
In-reply-to: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Brian Norris' <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, December 31, 2013 2:12 PM, Sachin Kamat wrote:
> 
> plat/regs-nand.h is used only by s3c2410 nand driver.
> Move this file to the drivers folder to remove platform
> dependency.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

However, how about consolidating this header into 's3c2410.c'?
This comment also applies to the patch "ata: pata_samsung_cf: Move
plat/regs-ata.h to drivers/ata".

Best regards,
Jingoo Han

> ---
>  drivers/mtd/nand/s3c2410.c                         |    2 +-
>  .../plat/regs-nand.h => drivers/mtd/nand/s3c2410.h |   11 ++++-------
>  2 files changed, 5 insertions(+), 8 deletions(-)
>  rename arch/arm/plat-samsung/include/plat/regs-nand.h => drivers/mtd/nand/s3c2410.h (96%)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index d65cbe903d40..83fb4feb7556 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -46,8 +46,8 @@
>  #include <linux/mtd/nand_ecc.h>
>  #include <linux/mtd/partitions.h>
> 
> -#include <plat/regs-nand.h>
>  #include <linux/platform_data/mtd-nand-s3c2410.h>
> +#include "s3c2410.h"
> 
>  /* new oob placement block for use with hardware ecc generation
>   */
> diff --git a/arch/arm/plat-samsung/include/plat/regs-nand.h b/drivers/mtd/nand/s3c2410.h
> similarity index 96%
> rename from arch/arm/plat-samsung/include/plat/regs-nand.h
> rename to drivers/mtd/nand/s3c2410.h
> index 238efea7b9e4..f3b82d7053a0 100644
> --- a/arch/arm/plat-samsung/include/plat/regs-nand.h
> +++ b/drivers/mtd/nand/s3c2410.h
> @@ -1,5 +1,4 @@
> -/* arch/arm/mach-s3c2410/include/mach/regs-nand.h
> - *
> +/*
>   * Copyright (c) 2004-2005 Simtec Electronics <linux@simtec.co.uk>
>   *	http://www.simtec.co.uk/products/SWLINUX/
>   *
> @@ -10,8 +9,8 @@
>   * S3C2410 NAND register definitions
>  */
> 
> -#ifndef __ASM_ARM_REGS_NAND
> -#define __ASM_ARM_REGS_NAND
> +#ifndef __S3C2410_NAND_H
> +#define __S3C2410_NAND_H
> 
> 
>  #define S3C2410_NFREG(x) (x)
> @@ -117,7 +116,5 @@
>  #define S3C2412_NFECCERR_MULTIBIT	(2)
>  #define S3C2412_NFECCERR_ECCAREA	(3)
> 
> -
> -
> -#endif /* __ASM_ARM_REGS_NAND */
> +#endif /* __S3C2410_NAND_H */
> 
> --
> 1.7.9.5
> 
> --
