From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: SAMSUNG: dma-ops.h needs mach/dma.h
Date: Sat, 24 Dec 2011 10:41:38 +0900
Message-ID: <088801ccc1dd$2df5d300$89e17900$%kim@samsung.com>
References: <1324657414-27991-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1324657414-27991-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10881 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753599Ab1LXBlk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 20:41:40 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWO00A83Q1FV790@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 10:41:39 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWO006TNQ1EW870@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 10:41:38 +0900 (KST)
In-reply-to: <1324657414-27991-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> dma-ops.h uses samsung_dma_is_dmadev so it needs to have mach/dma.h
> included.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/plat-samsung/include/plat/dma-ops.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/dma-ops.h b/arch/arm/plat-
> samsung/include/plat/dma-ops.h
> index 70b6325..71a6827 100644
> --- a/arch/arm/plat-samsung/include/plat/dma-ops.h
> +++ b/arch/arm/plat-samsung/include/plat/dma-ops.h
> @@ -14,6 +14,7 @@
>  #define __SAMSUNG_DMA_OPS_H_ __FILE__
> 
>  #include <linux/dmaengine.h>
> +#include <mach/dma.h>
> 
>  struct samsung_dma_prep_info {
>  	enum dma_transaction_type cap;
> --
> 1.7.7.3

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
