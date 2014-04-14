From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH v2 1/7] mmc: dw_mmc: fix the max_blk_count in IDMAC
Date: Mon, 14 Apr 2014 16:30:40 +0900
Message-ID: <534B8EA0.4000505@samsung.com>
References: <000101cf48e6$da954f90$8fbfeeb0$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37014 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbaDNHal (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 03:30:41 -0400
In-reply-to: <000101cf48e6$da954f90$8fbfeeb0$%jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>, linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: 'Chris Ball' <chris@printf.net>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Ulf Hansson' <ulf.hansson@linaro.org>, 'Alim Akhtar' <alim.akhtar@samsung.com>

Acked-by: Jaehoon Chung <jh80.chung@samsung.com>

On 03/26/2014 08:30 PM, Seungwon Jeon wrote:
> Even though 1MB is reserved for descriptor table in IDMAC,
> the dw_mmc host driver is allowed to receive only maximum
> 128KB block length in one request. This is caused by setting
> improper max_blk_count. It needs to be e adjusted so that
> descriptor table is used fully. It is found that the performance
> is improved with the increased the max_blk_count.
> 
> Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
> ---
>  drivers/mmc/host/dw_mmc.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 3a6721e..aeb38f9 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -2101,9 +2101,9 @@ static int dw_mci_init_slot(struct dw_mci *host, unsigned int id)
>  #ifdef CONFIG_MMC_DW_IDMAC
>  		mmc->max_segs = host->ring_size;
>  		mmc->max_blk_size = 65536;
> -		mmc->max_blk_count = host->ring_size;
>  		mmc->max_seg_size = 0x1000;
> -		mmc->max_req_size = mmc->max_seg_size * mmc->max_blk_count;
> +		mmc->max_req_size = mmc->max_seg_size * host->ring_size;
> +		mmc->max_blk_count = mmc->max_req_size / 512;
>  #else
>  		mmc->max_segs = 64;
>  		mmc->max_blk_size = 65536; /* BLKSIZ is 16 bits */
> 
