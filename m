From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Declare struct platform_device in
 plat/s3c64xx-spi.h
Date: Thu, 29 Dec 2011 12:47:23 +0900
Message-ID: <029201ccc5dc$92c2aad0$b8480070$%kim@samsung.com>
References: <1325121208-32295-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18695 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472Ab1L2DrZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 22:47:25 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY002Q556Z8F60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:47:23 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00BWH56ZHU90@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:47:23 +0900 (KST)
In-reply-to: <1325121208-32295-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> The function declarations in plat/s3c64xx-spi.h rely on struct
> platform_device but it's not declared by the header causing compiler
> warnings if it is included prior to another header which does that.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
> b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
> index aea68b6..fa95e9a 100644
> --- a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
> +++ b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
> @@ -11,6 +11,8 @@
>  #ifndef __S3C64XX_PLAT_SPI_H
>  #define __S3C64XX_PLAT_SPI_H
> 
> +struct platform_device;
> +
>  /**
>   * struct s3c64xx_spi_csinfo - ChipSelect description
>   * @fb_delay: Slave specific feedback delay.
> --
> 1.7.7.3

Yes, right. Will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
