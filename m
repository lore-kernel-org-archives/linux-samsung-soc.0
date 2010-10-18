From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: Fix nand partition table for s3c24XX
Date: Mon, 18 Oct 2010 19:50:23 +0900
Message-ID: <048301cb6eb2$45e264d0$d1a72e70$%kim@samsung.com>
References: <1279495515-17265-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38657 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753507Ab0JRKuO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Oct 2010 06:50:14 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAH0018KFFFN240@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Oct 2010 19:50:03 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAH008OZFFFC3@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Oct 2010 19:50:03 +0900 (KST)
In-reply-to: <1279495515-17265-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Atul Dahiya' <atul.dahiya@samsung.com>

Sangbeom Kim wrote:
> 
> From: Atul Dahiya <atul.dahiya@samsung.com>
> 
> This patch fixes the partition table as existing partition table have last
> partition size fixed and can't utilize available memory proprly if size is
> more than 64M.
> 
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/plat-s3c24xx/common-smdk.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-s3c24xx/common-smdk.c b/arch/arm/plat-
> s3c24xx/common-smdk.c
> index 7b44d0c..bcc43f3 100644
> --- a/arch/arm/plat-s3c24xx/common-smdk.c
> +++ b/arch/arm/plat-s3c24xx/common-smdk.c
> @@ -147,7 +147,7 @@ static struct mtd_partition smdk_default_nand_part[] =
{
>  	[7] = {
>  		.name	= "S3C2410 flash partition 7",
>  		.offset = SZ_1M * 48,
> -		.size	= SZ_16M,
> +		.size	= MTDPART_SIZ_FULL,
>  	}
>  };
> 
> --

Maybe missed this...will apply.

Ben, if any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
