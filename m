From: Eunchul Kim <chulspro.kim@samsung.com>
Subject: Re: [PATCH v2 2/3] drm/exynos: Rework fimc clocks handling
Date: Fri, 19 Apr 2013 20:26:53 +0900
Message-ID: <517129FD.5040603@samsung.com>
References: <1366192384-18829-1-git-send-email-s.nawrocki@samsung.com>
 <1366192384-18829-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55162 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968046Ab3DSL0z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Apr 2013 07:26:55 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MLI00HP52GT5ZS0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Apr 2013 20:26:54 +0900 (KST)
In-reply-to: <1366192384-18829-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: inki.dae@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, chulspro.kim@samsung.com, jaejoon.seo@samsung.com, jmock.shin@samsung.com, jy0.jeon@samsung.com, th908.kim@samsung.com, lsmin.lee@samsung.com

Dear Sylwester Nawrocki

Thank you for your update. I have some question of your patch.
please give your information to me.

Thank's
BR
Eunchul Kim.

On 04/17/2013 06:53 PM, Sylwester Nawrocki wrote:
> The clocks handling is refactored and a "mux" clock handling is
> added to account for changes in the clocks driver. After switching
> to the common clock framework the sclk_fimc clock is now split
> into two clocks: a gate and a mux clock. In order to retain the
> exisiting functionality two additional consumer clocks are passed
> to the driver from device tree: "mux" and "parent". Then the driver
> sets "parent" clock as a parent clock of the "mux" clock. These two
> additional clocks are optional, and should go away when there is a
> standard way of setting up parent clocks on DT platforms.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>   drivers/gpu/drm/exynos/exynos_drm_fimc.c |  167 +++++++++++++++++-------------
>   1 file changed, 97 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index d812c57..bc8411a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -76,6 +76,27 @@ enum fimc_wb {
>   	FIMC_WB_B,
>   };
>
> +enum {
> +	FIMC_CLK_LCLK,
> +	FIMC_CLK_GATE,
> +	FIMC_CLK_WB_A,
> +	FIMC_CLK_WB_B,
> +	FIMC_CLK_MUX,
> +	FIMC_CLK_PARENT,

- What is MUX, PARENT ?

> +	FIMC_CLKS_MAX
> +};
> +
> +static const char * fimc_clock_names[] = {
> +	[FIMC_CLK_LCLK]   = "sclk_fimc",
> +	[FIMC_CLK_GATE]   = "fimc",
> +	[FIMC_CLK_WB_A]   = "pxl_async0",
> +	[FIMC_CLK_WB_B]   = "pxl_async1",
> +	[FIMC_CLK_MUX]    = "mux",
> +	[FIMC_CLK_PARENT] = "parent",


- How can I get "mux", "parent" clock information ?
   Normally we are using "mout_mpll" in exynos4210, "mout_mpll_user" in 
  exynos 4412. I want to get this two kind of clock name information.


> +};
> +
> +#define FIMC_DEFAULT_LCLK_FREQUENCY 133000000UL


- When do I use this value in the patch ?
   If not use. please remove this macro. If you want to use this value.
   please use platform data instead of macro.


> +
>   /*
>    * A structure of scaler.
>    *
> @@ -132,15 +153,12 @@ struct fimc_driverdata {
>    *
>    * @ippdrv: prepare initialization using ippdrv.
>    * @regs_res: register resources.
> + * @dev: pointer to the fimc device structure.


- We already set the dev information in ippdrv structure.
   I think this value is duplicated value.


>    * @regs: memory mapped io registers.
>    * @lock: locking of operations.
> - * @sclk_fimc_clk: fimc source clock.
> - * @fimc_clk: fimc clock.
> - * @wb_clk: writeback a clock.
> - * @wb_b_clk: writeback b clock.
> + * @clocks: fimc clocks.
> + * @clk_frequency: LCLK clock frequency.
>    * @sc: scaler infomations.
> - * @odr: ordering of YUV.
> - * @ver: fimc version.
>    * @pol: porarity of writeback.
>    * @id: fimc id.
>    * @irq: irq number.
> @@ -148,13 +166,12 @@ struct fimc_driverdata {
>    */
>   struct fimc_context {
>   	struct exynos_drm_ippdrv	ippdrv;
> +	struct device	*dev;

- please check this value about really need ?

>   	struct resource	*regs_res;
>   	void __iomem	*regs;
>   	struct mutex	lock;
> -	struct clk	*sclk_fimc_clk;
> -	struct clk	*fimc_clk;
> -	struct clk	*wb_clk;
> -	struct clk	*wb_b_clk;
> +	struct clk	*clocks[FIMC_CLKS_MAX];
> +	u32		clk_frequency;
>   	struct fimc_scaler	sc;
>   	struct fimc_driverdata	*ddata;
>   	struct exynos_drm_ipp_pol	pol;
> @@ -1301,14 +1318,12 @@ static int fimc_clk_ctrl(struct fimc_context *ctx, bool enable)
>   	DRM_DEBUG_KMS("%s:enable[%d]\n", __func__, enable);
>
>   	if (enable) {
> -		clk_enable(ctx->sclk_fimc_clk);
> -		clk_enable(ctx->fimc_clk);
> -		clk_enable(ctx->wb_clk);
> +		clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
> +		clk_prepare_enable(ctx->clocks[FIMC_CLK_WB_A]);
>   		ctx->suspended = false;
>   	} else {
> -		clk_disable(ctx->sclk_fimc_clk);
> -		clk_disable(ctx->fimc_clk);
> -		clk_disable(ctx->wb_clk);
> +		clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
> +		clk_disable_unprepare(ctx->clocks[FIMC_CLK_WB_A]);
>   		ctx->suspended = true;
>   	}
>
> @@ -1713,11 +1728,66 @@ static void fimc_ippdrv_stop(struct device *dev, enum drm_exynos_ipp_cmd cmd)
>   	fimc_write(cfg, EXYNOS_CIGCTRL);
>   }
>
> +static void fimc_put_clocks(struct fimc_context *ctx)
> +{
> +	int i;
> +
> +	for (i = 0; i < FIMC_CLKS_MAX; i++) {
> +		if (IS_ERR(ctx->clocks[i]))
> +			continue;
> +		clk_put(ctx->clocks[i]);
> +		ctx->clocks[i] = ERR_PTR(-EINVAL);
> +	}
> +}
> +
> +static int fimc_setup_clocks(struct fimc_context *ctx)
> +{
> +	struct device *dev;
> +	int ret, i;
> +
> +	for (i = 0; i < FIMC_CLKS_MAX; i++)
> +		ctx->clocks[i] = ERR_PTR(-EINVAL);
> +
> +	for (i = 0; i < FIMC_CLKS_MAX; i++) {
> +		if (i == FIMC_CLK_WB_A || i == FIMC_CLK_WB_B)
> +			dev = ctx->dev->parent;
> +		else
> +			dev = ctx->dev;
> +
> +		ctx->clocks[i] = clk_get(dev, fimc_clock_names[i]);
> +		if (IS_ERR(ctx->clocks[i])) {
> +			if (i >= FIMC_CLK_MUX)
> +				break;
> +			ret = PTR_ERR(ctx->clocks[i]);
> +			goto e_clk_free;
> +		}
> +	}
> +
> +	if (!IS_ERR(ctx->clocks[FIMC_CLK_PARENT])) {
> +		ret = clk_set_parent(ctx->clocks[FIMC_CLK_MUX],
> +				     ctx->clocks[FIMC_CLK_PARENT]);


- I can't review this code.


> +		if (ret < 0) {
> +			dev_err(ctx->dev, "failed to set parent: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_set_rate(ctx->clocks[FIMC_CLK_LCLK], ctx->clk_frequency);


- When do I set clk_frequency value ? and why doesn't use pdata->clk_rate ?


> +	if (ret < 0)
> +		return ret;
> +
> +	return clk_prepare_enable(ctx->clocks[FIMC_CLK_LCLK]);
> +
> +e_clk_free:
> +	dev_err(ctx->dev, "failed to get clock: %s\n", fimc_clock_names[i]);
> +	fimc_put_clocks(ctx);
> +	return ret;
> +}
> +
>   static int fimc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct fimc_context *ctx;
> -	struct clk	*parent_clk;
>   	struct resource *res;
>   	struct exynos_drm_ippdrv *ippdrv;
>   	struct exynos_drm_fimc_pdata *pdata;
> @@ -1734,55 +1804,6 @@ static int fimc_probe(struct platform_device *pdev)
>   	if (!ctx)
>   		return -ENOMEM;
>
> -	ddata = (struct fimc_driverdata *)
> -		platform_get_device_id(pdev)->driver_data;
> -
> -	/* clock control */
> -	ctx->sclk_fimc_clk = devm_clk_get(dev, "sclk_fimc");
> -	if (IS_ERR(ctx->sclk_fimc_clk)) {
> -		dev_err(dev, "failed to get src fimc clock.\n");
> -		return PTR_ERR(ctx->sclk_fimc_clk);
> -	}
> -	clk_enable(ctx->sclk_fimc_clk);
> -
> -	ctx->fimc_clk = devm_clk_get(dev, "fimc");
> -	if (IS_ERR(ctx->fimc_clk)) {
> -		dev_err(dev, "failed to get fimc clock.\n");
> -		clk_disable(ctx->sclk_fimc_clk);
> -		return PTR_ERR(ctx->fimc_clk);
> -	}
> -
> -	ctx->wb_clk = devm_clk_get(dev, "pxl_async0");
> -	if (IS_ERR(ctx->wb_clk)) {
> -		dev_err(dev, "failed to get writeback a clock.\n");
> -		clk_disable(ctx->sclk_fimc_clk);
> -		return PTR_ERR(ctx->wb_clk);
> -	}
> -
> -	ctx->wb_b_clk = devm_clk_get(dev, "pxl_async1");
> -	if (IS_ERR(ctx->wb_b_clk)) {
> -		dev_err(dev, "failed to get writeback b clock.\n");
> -		clk_disable(ctx->sclk_fimc_clk);
> -		return PTR_ERR(ctx->wb_b_clk);
> -	}
> -
> -	parent_clk = devm_clk_get(dev, ddata->parent_clk);
> -
> -	if (IS_ERR(parent_clk)) {
> -		dev_err(dev, "failed to get parent clock.\n");
> -		clk_disable(ctx->sclk_fimc_clk);
> -		return PTR_ERR(parent_clk);
> -	}
> -
> -	if (clk_set_parent(ctx->sclk_fimc_clk, parent_clk)) {
> -		dev_err(dev, "failed to set parent.\n");
> -		clk_disable(ctx->sclk_fimc_clk);
> -		return -EINVAL;
> -	}
> -
> -	devm_clk_put(dev, parent_clk);
> -	clk_set_rate(ctx->sclk_fimc_clk, pdata->clk_rate);
> -
>   	/* resource memory */
>   	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
> @@ -1804,6 +1825,9 @@ static int fimc_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>
> +	ret = fimc_setup_clocks(ctx);
> +	if (ret < 0)
> +		goto err_free_irq;

- please blank line and error log.

>   	/* context initailization */
>   	ctx->id = pdev->id;
>   	ctx->pol = pdata->pol;
> @@ -1820,7 +1844,7 @@ static int fimc_probe(struct platform_device *pdev)
>   	ret = fimc_init_prop_list(ippdrv);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to init property list.\n");
> -		goto err_get_irq;
> +		goto err_put_clk;
>   	}
>
>   	DRM_DEBUG_KMS("%s:id[%d]ippdrv[0x%x]\n", __func__, ctx->id,
> @@ -1835,16 +1859,18 @@ static int fimc_probe(struct platform_device *pdev)
>   	ret = exynos_drm_ippdrv_register(ippdrv);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to register drm fimc device.\n");
> -		goto err_ippdrv_register;
> +		goto err_pm_dis;
>   	}
>
>   	dev_info(&pdev->dev, "drm fimc registered successfully.\n");
>
>   	return 0;
>
> -err_ippdrv_register:
> +err_pm_dis:
>   	pm_runtime_disable(dev);
> -err_get_irq:
> +err_put_clk:
> +	fimc_put_clocks(ctx);
> +err_free_irq:
>   	free_irq(ctx->irq, ctx);
>
>   	return ret;
> @@ -1859,6 +1885,7 @@ static int fimc_remove(struct platform_device *pdev)
>   	exynos_drm_ippdrv_unregister(ippdrv);
>   	mutex_destroy(&ctx->lock);
>
> +	fimc_put_clocks(ctx);
>   	pm_runtime_set_suspended(dev);
>   	pm_runtime_disable(dev);
>
>
