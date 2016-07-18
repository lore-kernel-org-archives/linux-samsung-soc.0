From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 4/4] ASoC: samsung: Add machine driver for Exynos5433
 based TM2 board
Date: Mon, 18 Jul 2016 12:41:37 +0200
Message-ID: <578CB261.60507@samsung.com>
References: <CGME20160705171538epcas1p14f034567982b67aad091c50e5adcec9c@epcas1p1.samsung.com>
 <1467738877-31555-1-git-send-email-s.nawrocki@samsung.com>
 <5788721B.7010602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:13941 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbcGRKlx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2016 06:41:53 -0400
In-reply-to: <5788721B.7010602@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: broonie@kernel.org, robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi Chanwoo,

On 07/15/2016 07:18 AM, Chanwoo Choi wrote:
>> +static int tm2_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;

>> +	codec_dai_node = of_parse_phandle(dev->of_node, "audio-codec", 0);
>> +	if (!codec_dai_node) {
>> +		dev_err(dev, "audio-codec property invalid or missing\n");
>> +		ret = -EINVAL;
>> +		goto err_put_cpu_dai;
>> +	}

>> +	priv->codec_mclk1 = of_clk_get_by_name(codec_dai_node, "mclk1");
>> +	if (IS_ERR(priv->codec_mclk1)) {
>> +		dev_err(dev, "Failed to get mclk1 clock\n");
>> +		ret = PTR_ERR(priv->codec_mclk1);
>> +		goto err_put_codec_dai;
>> +	}
> 
> I think that you better to use the devm_clk_get() instead of of_clk_get_by_name()
> because you don't need to handle the clk_put() when error happen and remove the 
> this driver.
> 
> 	priv->codec_mclk1 = devm_clk_get(dev, "mclk1");

The clocks are from the CODEC DT node, for which we don't have struct
device pointer here, that's why I used of_clk_get_by_name().

--
Thanks,
Sylwester
