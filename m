From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V3] DMA: PL330: Add check if device tree compatible
Date: Tue, 2 Apr 2013 23:12:16 +0530
Message-ID: <20130402174216.GM10326@intel.com>
References: <1364901405-16541-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:30099 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759718Ab3DBSKA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 14:10:00 -0400
Content-Disposition: inline
In-Reply-To: <1364901405-16541-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, arnd@arndb.de, boojin.kim@samsung.com

On Tue, Apr 02, 2013 at 04:46:45PM +0530, Padmavathi Venna wrote:
> This patch register the dma controller with generic dma helpers only
> in DT case. This also adds some extra error handling in the driver.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> Reported-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> 
> Based on Vinod Koul next branch.
> 
> Changes since V2:
> 	- Removed pl330_free_chan_resources for error handling in probe. 
> 
> Changes since V1:
> 	- return silently when of_dma_controller_register fails, as
> 	  suggested by Arnd.
> 
>  drivers/dma/pl330.c |   33 ++++++++++++++++++++++-----------
>  1 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 345e2a1..fa388c1c 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2882,7 +2882,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	struct dma_pl330_platdata *pdat;
>  	struct dma_pl330_dmac *pdmac;
> -	struct dma_pl330_chan *pch;
> +	struct dma_pl330_chan *pch, *_p;
>  	struct pl330_info *pi;
>  	struct dma_device *pd;
>  	struct resource *res;
> @@ -2984,7 +2984,17 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  	ret = dma_async_device_register(pd);
>  	if (ret) {
>  		dev_err(&adev->dev, "unable to register DMAC\n");
> -		goto probe_err2;
> +		goto probe_err3;
> +	}
> +
> +	if (adev->dev.of_node) {
> +		ret = of_dma_controller_register(adev->dev.of_node,
> +					 of_dma_pl330_xlate, pdmac);
> +		if (ret) {
> +			dev_err(&adev->dev,
> +				"unable to register DMA to the generic"
> +				"DT DMA helpers\n");
This could have been in a single line

I have applied it to fixes.

--
~Vinod
> +		}
>  	}
>  
>  	dev_info(&adev->dev,
> @@ -2995,16 +3005,15 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  		pi->pcfg.data_bus_width / 8, pi->pcfg.num_chan,
>  		pi->pcfg.num_peri, pi->pcfg.num_events);
>  
> -	ret = of_dma_controller_register(adev->dev.of_node,
> -					 of_dma_pl330_xlate, pdmac);
> -	if (ret) {
> -		dev_err(&adev->dev,
> -		"unable to register DMA to the generic DT DMA helpers\n");
> -		goto probe_err2;
> -	}
> -
>  	return 0;
> +probe_err3:
> +	amba_set_drvdata(adev, NULL);
>  
> +	/* Idle the DMAC */
> +	list_for_each_entry_safe(pch, _p, &pdmac->ddma.channels,
> +			chan.device_node)
> +		/* Remove the channel */
> +		list_del(&pch->chan.device_node);
>  probe_err2:
>  	pl330_del(pi);
>  probe_err1:
> @@ -3023,8 +3032,10 @@ static int pl330_remove(struct amba_device *adev)
>  	if (!pdmac)
>  		return 0;
>  
> -	of_dma_controller_free(adev->dev.of_node);
> +	if (adev->dev.of_node)
> +		of_dma_controller_free(adev->dev.of_node);
>  
> +	dma_async_device_unregister(&pdmac->ddma);
>  	amba_set_drvdata(adev, NULL);
>  
>  	/* Idle the DMAC */
> -- 
> 1.7.4.4
> 
