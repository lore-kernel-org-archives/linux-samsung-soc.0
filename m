From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix build of I2S driver
Date: Tue, 27 Nov 2012 09:33:43 +0900
Message-ID: <15c501cdcc36$db54cb00$91fe6100$%kim@samsung.com>
References: <1353944420-3972-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39910 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754364Ab2K0Adr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 19:33:47 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME40005OEWAMMB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:33:46 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME4008XJEW7KW00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:33:44 +0900 (KST)
In-reply-to: <1353944420-3972-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, 'Padmavathi Venna' <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> Commit 48a2050d36f0da5a7d22e3bd7dbf3bf8a5a538bc (ARM: SAMSUNG: Delete
> the unnecessary variable) removed the src_clk field from the platform
> data header for the I2S driver without a corresponding change having
> been made in the I2S driver to stop using the field, causing build
> breaks.
> 
> This change should not be being made independently of removal of the
> uses of the field since it will cause build failures in any tree where
> it has been merged but the removals have not been merged.  Currently
> the removal of the users in the ASoC driver has not been merged.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  include/linux/platform_data/asoc-s3c.h |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/platform_data/asoc-s3c.h
> b/include/linux/platform_data/asoc-s3c.h
> index 8827259..aa9875f 100644
> --- a/include/linux/platform_data/asoc-s3c.h
> +++ b/include/linux/platform_data/asoc-s3c.h
> @@ -38,6 +38,12 @@ struct samsung_i2s {
>  #define QUIRK_NEED_RSTCLR	(1 << 3)
>  	/* Quirks of the I2S controller */
>  	u32 quirks;
> +
> +	/*
> +	 * Array of clock names that can be used to generate I2S signals.
> +	 * Also corresponds to clocks of I2SMOD[10]
> +	 */
> +	const char **src_clk;
>  	dma_addr_t idma_addr;
>  };
> 
> --
> 1.7.10.4

I checked Samsung audio driver stuff just now. If you don't mind, I will
drop the patch 48a2050d ("ARM: SAMSUNG: Delete the unnecessary variable")
instead of applying this.

If any unprepared patches for Samsung audio in my tree, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
