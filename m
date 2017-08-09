From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: Re: [PATCH] mfd: exynos-lpass: Handle return value of
 clk_prepare_enable
Date: Wed, 9 Aug 2017 10:10:48 +0530
Message-ID: <fa30740a-eb54-d259-79d2-dec665013fc5@gmail.com>
References: <0e52a230fce95714a12b72aeb1ee9be0490de2a6.1502192959.git.arvind.yadav.cs@gmail.com>
 <20170808182559.b5muiyk5vmurtznc@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33859 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750820AbdHIElL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 00:41:11 -0400
In-Reply-To: <20170808182559.b5muiyk5vmurtznc@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee.jones@linaro.org, kgene@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Thanks :)


On Tuesday 08 August 2017 11:55 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 08, 2017 at 05:20:55PM +0530, Arvind Yadav wrote:
>> clk_prepare_enable() can fail here and we must check its return value.
>> we must call pm_runtime_disable() and pm_runtime_set_suspended(),
>> If exynos_lpass_probe is not successful.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> This is not a trivial change so please mark all such patches as RFT.
> Submit checklist mentions testing in multiple steps and last time your
> ASoC changes were not tested.
I will ask for RFT.
>
>> ---
>>   drivers/mfd/exynos-lpass.c | 23 ++++++++++++++++-------
>>   1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
>> index ca829f8..c74ff62 100644
>> --- a/drivers/mfd/exynos-lpass.c
>> +++ b/drivers/mfd/exynos-lpass.c
>> @@ -73,9 +73,13 @@ static void exynos_lpass_core_sw_reset(struct exynos_lpass *lpass, int mask)
>>   	regmap_write(lpass->top, SFR_LPASS_CORE_SW_RESET, val);
>>   }
>>   
>> -static void exynos_lpass_enable(struct exynos_lpass *lpass)
>> +static int exynos_lpass_enable(struct exynos_lpass *lpass)
>>   {
>> -	clk_prepare_enable(lpass->sfr0_clk);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(lpass->sfr0_clk);
>> +	if (ret)
>> +		return ret;
>>   
>>   	/* Unmask SFR, DMA and I2S interrupt */
>>   	regmap_write(lpass->top, SFR_LPASS_INTR_CA5_MASK,
>> @@ -87,6 +91,8 @@ static void exynos_lpass_enable(struct exynos_lpass *lpass)
>>   	exynos_lpass_core_sw_reset(lpass, LPASS_I2S_SW_RESET);
>>   	exynos_lpass_core_sw_reset(lpass, LPASS_DMA_SW_RESET);
>>   	exynos_lpass_core_sw_reset(lpass, LPASS_MEM_SW_RESET);
>> +
>> +	return 0;
>>   }
>>   
>>   static void exynos_lpass_disable(struct exynos_lpass *lpass)
>> @@ -112,6 +118,7 @@ static int exynos_lpass_probe(struct platform_device *pdev)
>>   	struct exynos_lpass *lpass;
>>   	void __iomem *base_top;
>>   	struct resource *res;
>> +	int ret;
>>   
>>   	lpass = devm_kzalloc(dev, sizeof(*lpass), GFP_KERNEL);
>>   	if (!lpass)
>> @@ -136,8 +143,12 @@ static int exynos_lpass_probe(struct platform_device *pdev)
>>   	platform_set_drvdata(pdev, lpass);
>>   	pm_runtime_set_active(dev);
>>   	pm_runtime_enable(dev);
>> -	exynos_lpass_enable(lpass);
>> -
>> +	ret = exynos_lpass_enable(lpass);
>> +	if (ret) {
>> +		pm_runtime_disable(dev);
>> +		pm_runtime_set_suspended(dev);
> You need also regmap_exit().
>
>> +		return ret;
>> +	}
> Leave one blank line before return.
>
> Best regards,
> Krzysztof
>
~arvind
