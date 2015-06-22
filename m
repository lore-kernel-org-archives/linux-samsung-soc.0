From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v7 05/15] drm/exynos: add Exynos5433 decon driver
Date: Mon, 22 Jun 2015 17:11:51 +0530
Message-ID: <5587F47F.5050405@gmail.com>
References: <1434113958-15877-6-git-send-email-human.hwang@samsung.com> <1434971779-5342-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:34046 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754252AbbFVLmV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jun 2015 07:42:21 -0400
Received: by pdbki1 with SMTP id ki1so137357461pdb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2015 04:42:21 -0700 (PDT)
In-Reply-To: <1434971779-5342-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

Hi,

On 06/22/2015 04:46 PM, Inki Dae wrote:

> From: Joonyoung Shim <jy0922.shim@samsung.com>
>
> DECON(Display and Enhancement Controller) is new IP replacing FIMD in
> Exynos5433. This patch adds Exynos5433 decon driver.
>
> Changelog v7:
> - Rebased on top of exynos-drm-next.
> - Added runtime pm support.
>
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>   

(...)

> +static int exynos5433_decon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct decon_context *ctx;
> +	struct resource *res;
> +	int ret;
> +	int i;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->default_win = 0;
> +	ctx->suspended = true;
> +	ctx->dev = dev;
> +	if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
> +		ctx->i80_if = true;
> +
> +	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
> +		struct clk *clk;
> +
> +		clk = devm_clk_get(ctx->dev, decon_clks_name[i]);
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
> +
> +		ctx->clks[i] = clk;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "cannot find IO resource\n");
> +		return -ENXIO;
> +	}
> +

You people promised me to remove this check  :-)

http://lists.freedesktop.org/archives/dri-devel/2015-April/081077.html

> +	ctx->addr = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(ctx->addr)) {
> +		dev_err(dev, "ioremap failed\n");
> +		return PTR_ERR(ctx->addr);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
> +			ctx->i80_if ? "lcd_sys" : "vsync");
> +	if (!res) {
> +		dev_err(dev, "cannot find IRQ resource\n");
> +		return -ENXIO;
> +	}
> +
> +	ret = devm_request_irq(dev, res->start, ctx->i80_if ?
> +			decon_lcd_sys_irq_handler : decon_vsync_irq_handler, 0,
> +			"drm_decon", ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "lcd_sys irq request failed\n");
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, ctx);

You are setting the driver data as ctx..

But no where you are using it...?

Am i missing anything ?

-- 
Best regards,
Varka Bhadram.
