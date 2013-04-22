From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/3] drm/exynos: Rework fimc clocks handling
Date: Mon, 22 Apr 2013 17:07:46 +0200
Message-ID: <51755242.9090304@samsung.com>
References: <1366192384-18829-1-git-send-email-s.nawrocki@samsung.com>
 <1366192384-18829-3-git-send-email-s.nawrocki@samsung.com>
 <517129FD.5040603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17546 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752531Ab3DVPHt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 11:07:49 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLN0062PWN6KTD0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Apr 2013 16:07:47 +0100 (BST)
In-reply-to: <517129FD.5040603@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eunchul Kim <chulspro.kim@samsung.com>
Cc: inki.dae@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, jaejoon.seo@samsung.com, jmock.shin@samsung.com, jy0.jeon@samsung.com, th908.kim@samsung.com, lsmin.lee@samsung.com

Hi,

On 04/19/2013 01:26 PM, Eunchul Kim wrote:
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>> b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>> index d812c57..bc8411a 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>> @@ -76,6 +76,27 @@ enum fimc_wb {
>>       FIMC_WB_B,
>>   };
>>
>> +enum {
>> +    FIMC_CLK_LCLK,
>> +    FIMC_CLK_GATE,
>> +    FIMC_CLK_WB_A,
>> +    FIMC_CLK_WB_B,
>> +    FIMC_CLK_MUX,
>> +    FIMC_CLK_PARENT,
> 
> - What is MUX, PARENT ?
> 
>> +    FIMC_CLKS_MAX
>> +};
>> +
>> +static const char * fimc_clock_names[] = {
>> +    [FIMC_CLK_LCLK]   = "sclk_fimc",
>> +    [FIMC_CLK_GATE]   = "fimc",
>> +    [FIMC_CLK_WB_A]   = "pxl_async0",
>> +    [FIMC_CLK_WB_B]   = "pxl_async1",
>> +    [FIMC_CLK_MUX]    = "mux",
>> +    [FIMC_CLK_PARENT] = "parent",
> 
> 
> - How can I get "mux", "parent" clock information ?
>   Normally we are using "mout_mpll" in exynos4210, "mout_mpll_user" in  exynos
> 4412. I want to get this two kind of clock name information.

The issue is that this driver is driver is setting parent clock, which
really belongs to other layers, like platform code or the clocks driver.

It I think it was a bad idea in the first place to code platform clock
names in this driver. The driver should use generic clock (consumer)
names for all platforms, and association with platform clocks is created
by platform code (CLKDEV_INIT()) or the device tree binding.
So for example in your dts file you might have:

fimc_2: fimc@11820000 {
	compatible = "samsung,exynos4212-fimc";

	clocks = <&clock 258>, <&clock 130>, <&clock 386>, <&clock 17>;
	clock-names = "fimc", "sclk_fimc", "mux", "parent";
};

And the clock indexes are described in Documentation/devicetree/bindings/
clock/exynos4-clock.txt. As a side note, the plain numbers should be soon
replaced with symbolic identifiers, once there is pre-processor support
in dtc.

The additional "mux" clocks comes from the fact that struct clk_clksrc
is now represented by 2 generic clocks: a gate and a mux clock.
Probably "sclk_mux" would be more clear.

>> +#define FIMC_DEFAULT_LCLK_FREQUENCY 133000000UL
> 
> 
> - When do I use this value in the patch ?
>   If not use. please remove this macro. If you want to use this value.
>   please use platform data instead of macro.

Sorry, no good news. Since Exynos platform becomes dt-only the platform_data
is no more supposed to be used. We parse clock frequency from the device tree,
and FIMC_DEFAULT_LCLK_FREQUENCY is just a fallback value, that the driver will
use if there is no "clock-frequency" specified in device tree.

>>   /*
>>    * A structure of scaler.
>>    *
>> @@ -132,15 +153,12 @@ struct fimc_driverdata {
>>    *
>>    * @ippdrv: prepare initialization using ippdrv.
>>    * @regs_res: register resources.
>> + * @dev: pointer to the fimc device structure.
> 
> 
> - We already set the dev information in ippdrv structure.
>   I think this value is duplicated value.

OK, I've overlooked it. Will remove that.

>>    * @regs: memory mapped io registers.
>>    * @lock: locking of operations.
>> - * @sclk_fimc_clk: fimc source clock.
>> - * @fimc_clk: fimc clock.
>> - * @wb_clk: writeback a clock.
>> - * @wb_b_clk: writeback b clock.
>> + * @clocks: fimc clocks.
>> + * @clk_frequency: LCLK clock frequency.
>>    * @sc: scaler infomations.
>> - * @odr: ordering of YUV.
>> - * @ver: fimc version.
>>    * @pol: porarity of writeback.
>>    * @id: fimc id.
>>    * @irq: irq number.
>> @@ -148,13 +166,12 @@ struct fimc_driverdata {
>>    */
>>   struct fimc_context {
>>       struct exynos_drm_ippdrv    ippdrv;
>> +    struct device    *dev;
> 
> - please check this value about really need ?

Ok, I'll remove it.

>>       struct resource    *regs_res;
>>       void __iomem    *regs;
>>       struct mutex    lock;
>> -    struct clk    *sclk_fimc_clk;
>> -    struct clk    *fimc_clk;
>> -    struct clk    *wb_clk;
>> -    struct clk    *wb_b_clk;
>> +    struct clk    *clocks[FIMC_CLKS_MAX];
>> +    u32        clk_frequency;
>>       struct fimc_scaler    sc;
>>       struct fimc_driverdata    *ddata;
>>       struct exynos_drm_ipp_pol    pol;
>> @@ -1301,14 +1318,12 @@ static int fimc_clk_ctrl(struct fimc_context *ctx,
>> bool enable)
>>       DRM_DEBUG_KMS("%s:enable[%d]\n", __func__, enable);
>>
>>       if (enable) {
>> -        clk_enable(ctx->sclk_fimc_clk);
>> -        clk_enable(ctx->fimc_clk);
>> -        clk_enable(ctx->wb_clk);
>> +        clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
>> +        clk_prepare_enable(ctx->clocks[FIMC_CLK_WB_A]);
>>           ctx->suspended = false;
>>       } else {
>> -        clk_disable(ctx->sclk_fimc_clk);
>> -        clk_disable(ctx->fimc_clk);
>> -        clk_disable(ctx->wb_clk);
>> +        clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
>> +        clk_disable_unprepare(ctx->clocks[FIMC_CLK_WB_A]);
>>           ctx->suspended = true;
>>       }
>>
>> @@ -1713,11 +1728,66 @@ static void fimc_ippdrv_stop(struct device *dev, enum
>> drm_exynos_ipp_cmd cmd)
>>       fimc_write(cfg, EXYNOS_CIGCTRL);
>>   }
>>
>> +static void fimc_put_clocks(struct fimc_context *ctx)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < FIMC_CLKS_MAX; i++) {
>> +        if (IS_ERR(ctx->clocks[i]))
>> +            continue;
>> +        clk_put(ctx->clocks[i]);
>> +        ctx->clocks[i] = ERR_PTR(-EINVAL);
>> +    }
>> +}
>> +
>> +static int fimc_setup_clocks(struct fimc_context *ctx)
>> +{
>> +    struct device *dev;
>> +    int ret, i;
>> +
>> +    for (i = 0; i < FIMC_CLKS_MAX; i++)
>> +        ctx->clocks[i] = ERR_PTR(-EINVAL);
>> +
>> +    for (i = 0; i < FIMC_CLKS_MAX; i++) {
>> +        if (i == FIMC_CLK_WB_A || i == FIMC_CLK_WB_B)
>> +            dev = ctx->dev->parent;
>> +        else
>> +            dev = ctx->dev;
>> +
>> +        ctx->clocks[i] = clk_get(dev, fimc_clock_names[i]);
>> +        if (IS_ERR(ctx->clocks[i])) {
>> +            if (i >= FIMC_CLK_MUX)
>> +                break;
>> +            ret = PTR_ERR(ctx->clocks[i]);
>> +            goto e_clk_free;
>> +        }
>> +    }
>> +
>> +    if (!IS_ERR(ctx->clocks[FIMC_CLK_PARENT])) {
>> +        ret = clk_set_parent(ctx->clocks[FIMC_CLK_MUX],
>> +                     ctx->clocks[FIMC_CLK_PARENT]);
> 
> 
> - I can't review this code.

Since parent clock setting is optional (it shouldn't really be done here
in the driver) the parent clock is set only if FIMC_CLK_PARENT is found,
e.g. it was specified in the device tree.

I'm going to add a short comment above explaining that.

>> +        if (ret < 0) {
>> +            dev_err(ctx->dev, "failed to set parent: %d\n", ret);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    ret = clk_set_rate(ctx->clocks[FIMC_CLK_LCLK], ctx->clk_frequency);
> 
> 
> - When do I set clk_frequency value ? and why doesn't use pdata->clk_rate ?

It's parsed from device tree. I removed pdata since Exynos becomes dt-only
and there is no board in mainline that uses struct exynos_drm_fimc_pdata.

>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return clk_prepare_enable(ctx->clocks[FIMC_CLK_LCLK]);
>> +
>> +e_clk_free:
>> +    dev_err(ctx->dev, "failed to get clock: %s\n", fimc_clock_names[i]);
>> +    fimc_put_clocks(ctx);
>> +    return ret;
>> +}
>> +
>>   static int fimc_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>>       struct fimc_context *ctx;
>> -    struct clk    *parent_clk;
>>       struct resource *res;
>>       struct exynos_drm_ippdrv *ippdrv;
>>       struct exynos_drm_fimc_pdata *pdata;
>> @@ -1734,55 +1804,6 @@ static int fimc_probe(struct platform_device *pdev)
>>       if (!ctx)
>>           return -ENOMEM;
>>
>> -    ddata = (struct fimc_driverdata *)
>> -        platform_get_device_id(pdev)->driver_data;
>> -
>> -    /* clock control */
>> -    ctx->sclk_fimc_clk = devm_clk_get(dev, "sclk_fimc");
>> -    if (IS_ERR(ctx->sclk_fimc_clk)) {
>> -        dev_err(dev, "failed to get src fimc clock.\n");
>> -        return PTR_ERR(ctx->sclk_fimc_clk);
>> -    }
>> -    clk_enable(ctx->sclk_fimc_clk);
>> -
>> -    ctx->fimc_clk = devm_clk_get(dev, "fimc");
>> -    if (IS_ERR(ctx->fimc_clk)) {
>> -        dev_err(dev, "failed to get fimc clock.\n");
>> -        clk_disable(ctx->sclk_fimc_clk);
>> -        return PTR_ERR(ctx->fimc_clk);
>> -    }
>> -
>> -    ctx->wb_clk = devm_clk_get(dev, "pxl_async0");
>> -    if (IS_ERR(ctx->wb_clk)) {
>> -        dev_err(dev, "failed to get writeback a clock.\n");
>> -        clk_disable(ctx->sclk_fimc_clk);
>> -        return PTR_ERR(ctx->wb_clk);
>> -    }
>> -
>> -    ctx->wb_b_clk = devm_clk_get(dev, "pxl_async1");
>> -    if (IS_ERR(ctx->wb_b_clk)) {
>> -        dev_err(dev, "failed to get writeback b clock.\n");
>> -        clk_disable(ctx->sclk_fimc_clk);
>> -        return PTR_ERR(ctx->wb_b_clk);
>> -    }
>> -
>> -    parent_clk = devm_clk_get(dev, ddata->parent_clk);
>> -
>> -    if (IS_ERR(parent_clk)) {
>> -        dev_err(dev, "failed to get parent clock.\n");
>> -        clk_disable(ctx->sclk_fimc_clk);
>> -        return PTR_ERR(parent_clk);
>> -    }
>> -
>> -    if (clk_set_parent(ctx->sclk_fimc_clk, parent_clk)) {
>> -        dev_err(dev, "failed to set parent.\n");
>> -        clk_disable(ctx->sclk_fimc_clk);
>> -        return -EINVAL;
>> -    }
>> -
>> -    devm_clk_put(dev, parent_clk);
>> -    clk_set_rate(ctx->sclk_fimc_clk, pdata->clk_rate);
>> -
>>       /* resource memory */
>>       ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>       ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
>> @@ -1804,6 +1825,9 @@ static int fimc_probe(struct platform_device *pdev)
>>           return ret;
>>       }
>>
>> +    ret = fimc_setup_clocks(ctx);
>> +    if (ret < 0)
>> +        goto err_free_irq;
> 
> - please blank line and error log.

There is already error logging in the fimc_setup_clocks() function,
plus you get logs from the driver core. So I don't think there is
need for any more. In general I find this driver overly stuffed with
error logs. If you feel it is necessary to add more logs, please
write a patch for it.

>>       /* context initailization */
>>       ctx->id = pdev->id;
>>       ctx->pol = pdata->pol;
>> @@ -1820,7 +1844,7 @@ static int fimc_probe(struct platform_device *pdev)
>>       ret = fimc_init_prop_list(ippdrv);
>>       if (ret < 0) {
>>           dev_err(dev, "failed to init property list.\n");
>> -        goto err_get_irq;
>> +        goto err_put_clk;
>>       }
>>
>>       DRM_DEBUG_KMS("%s:id[%d]ippdrv[0x%x]\n", __func__, ctx->id,
>> @@ -1835,16 +1859,18 @@ static int fimc_probe(struct platform_device *pdev)
>>       ret = exynos_drm_ippdrv_register(ippdrv);
>>       if (ret < 0) {
>>           dev_err(dev, "failed to register drm fimc device.\n");
>> -        goto err_ippdrv_register;
>> +        goto err_pm_dis;
>>       }
>>
>>       dev_info(&pdev->dev, "drm fimc registered successfully.\n");
>>
>>       return 0;
>>
>> -err_ippdrv_register:
>> +err_pm_dis:
>>       pm_runtime_disable(dev);
>> -err_get_irq:
>> +err_put_clk:
>> +    fimc_put_clocks(ctx);
>> +err_free_irq:
>>       free_irq(ctx->irq, ctx);
>>
>>       return ret;
>> @@ -1859,6 +1885,7 @@ static int fimc_remove(struct platform_device *pdev)
>>       exynos_drm_ippdrv_unregister(ippdrv);
>>       mutex_destroy(&ctx->lock);
>>
>> +    fimc_put_clocks(ctx);
>>       pm_runtime_set_suspended(dev);
>>       pm_runtime_disable(dev);

Thanks,
Sylwester
