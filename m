From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Clear DMA flags on channel request
Date: Tue, 02 Apr 2013 18:39:14 +0900
Message-ID: <234801ce2f85$efe2d820$cfa88860$%kim@samsung.com>
References: <1364469746-5026-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30138 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760555Ab3DBJjX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 05:39:23 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM00IU9G4QNE30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 18:39:14 +0900 (KST)
In-reply-to: <1364469746-5026-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Charles Keepax' <ckeepax@opensource.wolfsonmicro.com>

Mark Brown wrote:
> 
> From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> This patch clears the DMA flags when a DMA channel is requested. This is
> necessary because otherwise the channel may inherit incompatible
> settings from its last usage.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/dma.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-s3c64xx/dma.c b/arch/arm/mach-s3c64xx/dma.c
> index 6af1aa1..759846c 100644
> --- a/arch/arm/mach-s3c64xx/dma.c
> +++ b/arch/arm/mach-s3c64xx/dma.c
> @@ -509,6 +509,7 @@ int s3c2410_dma_request(enum dma_ch channel,
>  	chan->client = client;
>  	chan->in_use = 1;
>  	chan->peripheral = channel;
> +	chan->flags = 0;
> 
>  	local_irq_restore(flags);
> 
> --
> 1.7.10.4

Applied, thanks.

- Kukjin
