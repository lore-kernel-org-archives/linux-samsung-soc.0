From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/2] DMA: PL330: Remove pm_runtime_xxx calls from pl330
 probe/remove
Date: Thu, 08 Dec 2011 13:05:02 +0530
Message-ID: <1323329702.1641.26.camel@vkoul-udesk3>
References: <1323168355-2764-1-git-send-email-tushar.behera@linaro.org>
	 <1323168355-2764-2-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:64895 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751578Ab1LHHga (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 02:36:30 -0500
In-Reply-To: <1323168355-2764-2-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

On Tue, 2011-12-06 at 16:15 +0530, Tushar Behera wrote:
> amba_probe() now calls pm_runtime_get_noresume() and pm_runtime_enable()
> for the devices before the device probe is called. Hence we don't need
> to call pm_runtime_get_xxx and pm_runtime_enable() in device probe again.
> In the same way, since amba_remove() calls the respective pm_runtime
> functions, those functions need not be called from device remove.
> 
> This patch fixes following run time error with pl330 driver.
> 
> dma-pl330 dma-pl330.0: Unbalanced pm_runtime_enable!
> dma-pl330 dma-pl330.0: failed to get runtime pm
> 
> Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Looks fine to me. Do you want these to go thru slave-dma or samsung
tree.
For latter:
Acked-by: Vinod Koul <vinod.koul@linux.intel.com>

> ---
>  drivers/dma/pl330.c |   17 ++---------------
>  1 files changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index a626e15..cd07121 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -834,17 +834,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	amba_set_drvdata(adev, pdmac);
>  
> -#ifdef CONFIG_PM_RUNTIME
> -	/* to use the runtime PM helper functions */
> -	pm_runtime_enable(&adev->dev);
> -
> -	/* enable the power domain */
> -	if (pm_runtime_get_sync(&adev->dev)) {
> -		dev_err(&adev->dev, "failed to get runtime pm\n");
> -		ret = -ENODEV;
> -		goto probe_err1;
> -	}
> -#else
> +#ifndef CONFIG_PM_RUNTIME
>  	/* enable dma clk */
>  	clk_enable(pdmac->clk);
>  #endif
> @@ -977,10 +967,7 @@ static int __devexit pl330_remove(struct amba_device *adev)
>  	res = &adev->res;
>  	release_mem_region(res->start, resource_size(res));
>  
> -#ifdef CONFIG_PM_RUNTIME
> -	pm_runtime_put(&adev->dev);
> -	pm_runtime_disable(&adev->dev);
> -#else
> +#ifndef CONFIG_PM_RUNTIME
>  	clk_disable(pdmac->clk);
>  #endif
>  


-- 
~Vinod
