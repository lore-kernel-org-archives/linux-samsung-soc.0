From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: SAMSUNG: Guard against multiple inclusion of
 plat/dma.h
Date: Sat, 24 Dec 2011 10:40:31 +0900
Message-ID: <088701ccc1dd$059b9fc0$10d2df40$%kim@samsung.com>
References: <1324657414-27991-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46765 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753599Ab1LXBke (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 20:40:34 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWO00N7NPZL1U30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 10:40:33 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWO001VTPZJ3PA0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 10:40:32 +0900 (KST)
In-reply-to: <1324657414-27991-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> Otherwise it'll generate errors if included twice.
> 
Yes, right. Will apply.

Merry Christmas :)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/plat-samsung/include/plat/dma.h |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/plat-
> samsung/include/plat/dma.h
> index b906112..baa05ed 100644
> --- a/arch/arm/plat-samsung/include/plat/dma.h
> +++ b/arch/arm/plat-samsung/include/plat/dma.h
> @@ -10,6 +10,9 @@
>   * published by the Free Software Foundation.
>  */
> 
> +#ifndef __PLAT_DMA_H
> +#define __PLAT_DMA_H
> +
>  #include <linux/dma-mapping.h>
> 
>  enum s3c2410_dma_buffresult {
> @@ -124,3 +127,5 @@ extern int s3c2410_dma_set_buffdone_fn(enum dma_ch,
> s3c2410_dma_cbfn_t rtn);
> 
> 
>  #include <plat/dma-ops.h>
> +
> +#endif
> --
> 1.7.7.3
