From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] DMA: PL330: Fix build warning
Date: Thu, 10 Nov 2011 15:14:43 +0530
Message-ID: <1320918283.32205.1206.camel@vkoul-udesk3>
References: <1320302929-4731-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:50502 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757540Ab1KJJtP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 04:49:15 -0500
In-Reply-To: <1320302929-4731-1-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Dan Williams <dan.j.williams@intel.com>

On Thu, 2011-11-03 at 15:48 +0900, Boojin Kim wrote:
> This patch adds to fix the build warning as following.
> 
> drivers/dma/pl330.c: In function 'pl330_probe':
> drivers/dma/pl330.c:859: warning: comparison of distinct pointer types lacks a cast
> 
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> ---
>  drivers/dma/pl330.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 621134f..379d928 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -856,7 +856,8 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  	INIT_LIST_HEAD(&pd->channels);
>  
>  	/* Initialize channel parameters */
> -	num_chan = max(pdat ? pdat->nr_valid_peri : 0, (u8)pi->pcfg.num_chan);
> +	num_chan = max(pdat ? (int)pdat->nr_valid_peri : 0,
> +					(int)pi->pcfg.num_chan);
>  	pdmac->peripherals = kzalloc(num_chan * sizeof(*pch), GFP_KERNEL);
>  
>  	for (i = 0; i < num_chan; i++) {

Applied Thanks

-- 
~Vinod
