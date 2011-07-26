From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH V4 01/14] DMA: PL330: Add support runtime PM for PL330 DMAC
Date: Tue, 26 Jul 2011 15:03:27 +0900
Message-ID: <4E2E58AF.4000409@gmail.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
 <1311557312-26107-2-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31799 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208Ab1GZGC6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 02:02:58 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOX00B8VFGMMKI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 15:02:56 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOX008RKFGWLH@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 15:02:56 +0900 (KST)
In-reply-to: <1311557312-26107-2-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>

Boojin Kim wrote:
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> ---
>  drivers/dma/pl330.c |   75 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 6abe1ec..b7ecf47 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -17,6 +17,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/amba/bus.h>
>  #include <linux/amba/pl330.h>
> +#include <linux/pm_runtime.h>
>  
>  #define NR_DEFAULT_DESC	16
>  
> @@ -83,6 +84,8 @@ struct dma_pl330_dmac {
>  
>  	/* Peripheral channels connected to this DMAC */
>  	struct dma_pl330_chan peripherals[0]; /* keep at end */
> +
> +	struct clk *clk;
>  };
>  
>  struct dma_pl330_desc {
> @@ -696,6 +699,30 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  		goto probe_err1;
>  	}
>  
> +	pdmac->clk = clk_get(&adev->dev, "dma");
> +	if (IS_ERR(pdmac->clk)) {
> +		dev_err(&adev->dev, "Cannot get operation clock.\n");
> +		ret = -EINVAL;
> +		goto probe_err1;
> +	}
> +
> +	amba_set_drvdata(adev, pdmac);
> +
> +#ifdef CONFIG_PM_RUNTIME
> +	/* to use the runtime PM helper functions */
> +	pm_runtime_enable(&adev->dev);
> +
> +	/* enable the power domain */
> +	if (pm_runtime_get_sync(&adev->dev)) {
> +		dev_err(&adev->dev, "failed to get runtime pm\n");
> +		ret = -ENODEV;
> +		goto probe_err1;
> +	}
> +#else
> +	/* enable dma clk */
> +	clk_enable(pdmac->clk);
> +#endif
> +
>  	irq = adev->irq[0];
>  	ret = request_irq(irq, pl330_irq_handler, 0,
>  			dev_name(&adev->dev), pi);
> @@ -763,8 +790,6 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  		goto probe_err4;
>  	}
>  
> -	amba_set_drvdata(adev, pdmac);
> -
>  	dev_info(&adev->dev,
>  		"Loaded driver for PL330 DMAC-%d\n", adev->periphid);
>  	dev_info(&adev->dev,
> @@ -825,6 +850,13 @@ static int __devexit pl330_remove(struct amba_device *adev)
>  	res = &adev->res;
>  	release_mem_region(res->start, resource_size(res));
>  
> +#ifdef CONFIG_PM_RUNTIME
> +	pm_runtime_put(&adev->dev);
> +	pm_runtime_disable(&adev->dev);
> +#else
> +	clk_disable(pdmac->clk);
> +#endif
> +
>  	kfree(pdmac);
>  
>  	return 0;
> @@ -838,10 +870,49 @@ static struct amba_id pl330_ids[] = {
>  	{ 0, 0 },
>  };
>  
> +#ifdef CONFIG_PM_RUNTIME
> +static int pl330_runtime_suspend(struct device *dev)
> +{
> +	struct dma_pl330_dmac *pdmac = dev_get_drvdata(dev);
> +
> +	if (!pdmac) {
> +		dev_err(dev, "failed to get dmac\n");
> +		return -ENODEV;
> +	}
> +
> +	clk_disable(pdmac->clk);
> +
> +	return 0;
> +}
> +
> +static int pl330_runtime_resume(struct device *dev)
> +{
> +	struct dma_pl330_dmac *pdmac = dev_get_drvdata(dev);
> +
> +	if (!pdmac) {
> +		dev_err(dev, "failed to get dmac\n");
> +		return -ENODEV;
> +	}
> +
> +	clk_enable(pdmac->clk);
> +
> +	return 0;
> +}
> +#else
> +#define pl330_runtime_suspend	NULL
> +#define pl330_runtime_resume	NULL
> +#endif /* CONFIG_PM_RUNTIME */
> +
> +static const struct dev_pm_ops pl330_pm_ops = {
> +	.runtime_suspend = pl330_runtime_suspend,
> +	.runtime_resume = pl330_runtime_resume,
> +};
> +
>  static struct amba_driver pl330_driver = {
>  	.drv = {
>  		.owner = THIS_MODULE,
>  		.name = "dma-pl330",
> +		.pm = &pl330_pm_ops,
>  	},
>  	.id_table = pl330_ids,
>  	.probe = pl330_probe,

I have a question for runtime PM of PL330 DMAC

This patch support runtime PM for PL330 DMAC, but the clock of "dma" is always on.
If the clock of "dma" is always on, additional power(10mA) is consumed. I tested it.

I think that the PL330 DMAC only turn on the clock of "dma" when using DMA.


Thanks,
Chanwoo Choi
