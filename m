From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Add IRQ mapping for wm0010 on Cragganmore
Date: Tue, 19 Jun 2012 17:50:01 +0900
Message-ID: <019601cd4df8$83b33380$8b199a80$%kim@samsung.com>
References: <1339775065-13211-1-git-send-email-dp@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8373 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751568Ab2FSIuD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:50:03 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U004DNWELQO60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:02 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00GCRWJD4380@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:02 +0900 (KST)
In-reply-to: <1339775065-13211-1-git-send-email-dp@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Dimitris Papastamos' <dp@opensource.wolfsonmicro.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Dimitris Papastamos wrote:
> 
> Signed-off-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-
> s3c64xx/mach-crag6410-module.c
> index f347336..7c8ea3c 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -47,6 +47,7 @@ static struct spi_board_info wm1253_devs[] = {
>  		.bus_num	= 0,
>  		.chip_select	= 0,
>  		.mode		= SPI_MODE_0,
> +		.irq            = S3C_EINT(5),
>  		.controller_data = &wm0010_spi_csinfo,
>  		.platform_data = &wm0010_crag_pdata,
>  	},
> --
> 1.7.10.4

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
