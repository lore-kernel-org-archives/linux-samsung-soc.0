From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] DMA: PL330: return ENOMEM instead of 0 from
 pl330_alloc_chan_resources
Date: Mon, 17 Sep 2012 20:01:01 +0900
Message-ID: <050c01cd94c3$b97aaa90$2c6fffb0$%kim@samsung.com>
References: <1347856065-14027-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47922 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755692Ab2IQLBD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 07:01:03 -0400
In-reply-to: <1347856065-14027-1-git-send-email-inderpal.singh@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Inderpal Singh' <inderpal.singh@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vinod.koul@intel.com, patches@linaro.org, boojin.kim@samsung.com, jassisinghbrar@gmail.com

Inderpal Singh wrote:
> 
> Since 0 is not considered as error at dmaengine level, return ENOMEM
> from pl330_alloc_chan_resources in case of failure.
> 
> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  drivers/dma/pl330.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index e4feba6..14d881c 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2393,7 +2393,7 @@ static int pl330_alloc_chan_resources(struct
> dma_chan *chan)
>  	pch->pl330_chid = pl330_request_channel(&pdmac->pif);
>  	if (!pch->pl330_chid) {
>  		spin_unlock_irqrestore(&pch->lock, flags);
> -		return 0;
> +		return -ENOMEM;
>  	}
> 
>  	tasklet_init(&pch->task, pl330_tasklet, (unsigned long) pch);
> --
> 1.7.9.5
