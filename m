From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/7] DMA: PL330: Add support runtime PM for PL330 DMAC
Date: Tue, 5 Jul 2011 09:04:30 +0100
Message-ID: <20110705080430.GP8286@n2100.arm.linux.org.uk>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <1309781915-31549-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:35107 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754353Ab1GEIEr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 04:04:47 -0400
Content-Disposition: inline
In-Reply-To: <1309781915-31549-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Dan Williams <dan.j.williams@intel.com>, Liam Girdwood <lrg@ti.com>

On Mon, Jul 04, 2011 at 09:18:29PM +0900, Kukjin Kim wrote:
> @@ -666,6 +667,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  	struct dma_device *pd;
>  	struct resource *res;
>  	int i, ret, irq;
> +	struct clk* clk;

Please use checkpatch.  'struct clk *clk;'

> @@ -696,6 +698,28 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  		goto probe_err1;
>  	}
>  

Get the clock here and save its pointer.  put the clock in the remove function.

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
> +	clk = clk_get(&adev->dev, "dma");
> +
> +	if (IS_ERR(clk)) {
> +		dev_err(&adev->dev, "Cannot get operation clock.\n");
> +		ret = -EINVAL;
> +		goto probe_err1;
> +	}
> +	clk_enable(clk);
> +#endif
> +
>  	irq = adev->irq[0];
>  	ret = request_irq(irq, pl330_irq_handler, 0,
>  			dev_name(&adev->dev), pi);
> @@ -838,10 +862,47 @@ static struct amba_id pl330_ids[] = {
>  	{ 0, 0 },
>  };
>  
> +#ifdef CONFIG_PM_RUNTIME
> +static int pl330_runtime_suspend(struct device *dev)
> +{
> +	struct clk *dmaclk = clk_get(dev, "dma");
> +
> +	if (dmaclk == NULL) {
> +		dev_err(dev, "failed to find dma clock source\n");
> +		return -ENODEV;
> +	}

Obviously wrong.

Use the clock you got in the probe function here.

> +
> +	clk_disable(dmaclk);
> +	return 0;
> +}
> +
> +static int pl330_runtime_resume(struct device *dev)
> +{
> +	struct clk *dmaclk = clk_get(dev, "dma");
> +
> +	if (dmaclk == NULL) {
> +		dev_err(dev, "failed to find dma clock source\n");
> +		return -ENODEV;
> +	}

Obviously wrong as well.

Use the clock you got in the probe function here too.

> +
> +	clk_enable(dmaclk);
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
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
