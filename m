From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: Add device tree support for fimc ipp driver
Date: Mon, 22 Apr 2013 17:57:13 +0200
Message-ID: <51755DD9.4010004@samsung.com>
References: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
 <1366133486-22973-4-git-send-email-s.nawrocki@samsung.com>
 <51712CA5.4030206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40702 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590Ab3DVP5Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 11:57:16 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLN000LIYYGWVC0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Apr 2013 16:57:15 +0100 (BST)
In-reply-to: <51712CA5.4030206@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eunchul Kim <chulspro.kim@samsung.com>
Cc: inki.dae@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, jaejoon.seo@samsung.com, jmock.shin@samsung.com, jy0.jeon@samsung.com, th908.kim@samsung.com, lsmin.lee@samsung.com

On 04/19/2013 01:38 PM, Eunchul Kim wrote:
>>   static void fimc_set_type_ctrl(struct fimc_context *ctx, enum fimc_wb wb)
>> @@ -1628,7 +1617,9 @@ static int fimc_ippdrv_start(struct device *dev, enum
>> drm_exynos_ipp_cmd cmd)
>>           fimc_handle_lastend(ctx, true);
>>
>>           /* setup FIMD */
>> -        fimc_set_camblk_fimd0_wb(ctx);
>> +        ret = fimc_set_camblk_fimd0_wb(ctx);
>> +        if (ret < 0)
> 
> - please adds error log information for indicating error.

OK, I'll add it.

>> +            return ret;
>>
>>           set_wb.enable = 1;
>>           set_wb.refresh = property->refresh_rate;
>> @@ -1784,26 +1775,50 @@ e_clk_free:
>>       return ret;
>>   }
>>
>> +static int fimc_parse_dt(struct fimc_context *ctx)
>> +{
>> +    struct device_node *node = ctx->dev->of_node;
>> +
>> +    if (!of_property_read_bool(node, "samsung,lcd-wb"))
> 
> - It also need error log ?

No, but it definitely deserves some comment why it is done like this.
Please see my other reply to Inki.

>> +        return -ENODEV;
>> +
>> +    if (of_property_read_u32(node, "clock-frequency",
>> +                    &ctx->clk_frequency))
>> +        ctx->clk_frequency = FIMC_DEFAULT_LCLK_FREQUENCY;
> 
> - We have many kind of H/W version of FIMC device. I think we need to use pdata
> instead of static value.

This is just a fallback value that will be used when "clock-frequency"
property is not found in fimc node in the device tree.

>> +    ctx->id = of_alias_get_id(node, "fimc");
>> +    if (ctx->id < 0)
>> +        return -EINVAL;
>> +
>> +    return 0;
>> +}
>> +
>>   static int fimc_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>>       struct fimc_context *ctx;
>>       struct resource *res;
>>       struct exynos_drm_ippdrv *ippdrv;
>> -    struct exynos_drm_fimc_pdata *pdata;
>> -    struct fimc_driverdata *ddata;
>>       int ret;
>>
>> -    pdata = pdev->dev.platform_data;
>> -    if (!pdata) {
>> -        dev_err(dev, "no platform data specified.\n");
>> -        return -EINVAL;
>> -    }
>> +    if (!dev->of_node)
> 
> - ditto.(error log)

Probably won't hurt, I'll add it.

>> +        return -ENODEV;
>>
>>       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>       if (!ctx)
>>           return -ENOMEM;
>>
>> +    ctx->dev = dev;
>> +
>> +    ret = fimc_parse_dt(ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
>> +                        "samsung,sysreg");
>> +    if (IS_ERR(ctx->sysreg))
> 
> - ditto.(error log)

OK. Will add here as well.
