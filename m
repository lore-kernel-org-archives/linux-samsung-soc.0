Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C016393DCA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756124901; cv=none; b=q2tsB4HrY/jMLud9mfSpyuq7l1AXyAJ6/Fi7nJm2yjBgtWcVRB4tp0oiXAwGMqExG9/v5MDwKPE/4oM7kuwlhHJesloqxG+au6WwVDf/WseZohu9OwFVYONbuvG3wgO4g3+YKKh4NhoYPo0q64dqudgW8ii2FwnRo8a8T/4ao8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756124901; c=relaxed/simple;
	bh=OvKjzrztyO2BYir6lukFD8Gzi7C40pSWjuZ24qRh4dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0xpfSIGCKf3pgyMDDKAJ2mnNaxPO0YH5XQID5AVWmQURXWwYia0cjXMmpGzjFdgm7GUy5LNNJAbshDM2LUqr7uvHKbICtbE+kfmJK73+InzptDR+Ddi5ofhB3B4UrtIyMK/q1b3ceeiI4ES6VfjUzN1KOHW965BJwpyk5HoHE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8mlG+vf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8mlG+vf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c84925055aso969425f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756124898; x=1756729698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEci9uMjZdI28rwm3iBkZ0dPmOuD039KbuybMmsaWKg=;
        b=E8mlG+vftYM0fkfhtf5ocxo2E2PZABtzy82EC37Fnwr5AU2PYei2oi/6UjlUTZtSGV
         ixsNty1R8diXVVBpUrwKy93aIDo2LTuRr3gFf7S9ywkZMi+oJpXNhIFxNO0j22iOV6j4
         vZAdWICuGwCG3FYAziaLZTsHHTkpaQaP7Fg44iH3g8ZuerQPa8ZvBWaqnUNyQ2BhPrMt
         gCPxO9KM3AiD06IenkIAjqOOzKdsvmbFv24bN9giV8ELI7QoGVoXbwg6UzG2PdwpXqlk
         kFpP+eM70NVHgxzZMgTsAqzQEjyiZaBrhZYMpImfw+eik4efiTrF4P2In5OQJuvImuV3
         x0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756124898; x=1756729698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEci9uMjZdI28rwm3iBkZ0dPmOuD039KbuybMmsaWKg=;
        b=Cp+cuG95a2jRTT0ELOnaSloR3qaZAvpk+0RTr+1t83OKeY0F+lMxcnp9ycvKnwgaaK
         PnuGEJu9BMqgyFA97tOjmAK6RY7d1qKtt/5SjdE3QP/tlgm5cBgrxoVnVwpXV8UypIOZ
         50cPn6K19DnW22E2L75L1w/b7jVG/SIDreRMXKRcd3IJ+vVssqY5kHcWCk8jKTuVdfFs
         3nbkC861B6WCFMm5fPRSh60NqlJfo6oqBLAykYRN/9VqaIz/WprtnpJXswbLOXcMGZwn
         +Iwz6xB/osxWrN/oWDcDZVXAnpZjzgigVvzS39dM/HIC9dPTQkU8xBzBpFvKekAqUo/e
         bNPw==
X-Forwarded-Encrypted: i=1; AJvYcCXXNdpdgGctaW7Ygbo5wCFSQaaEERHRftrvTgVTc7mYFhrQGOlqGlomGZuTonj+cU5fuaspnQbF04UuTuRr2UkZEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX1qiYQvO2cxWjJ1t7q/JMpwvVlF3TtgvXe1TdoqSZmifi8vg6
	y12pnjr8oBrsf5ni+J5fO9aSgbZiBjAyuS/ErLu9Ww+M38B8Up9cXN4k5ekw8OrA6tw=
X-Gm-Gg: ASbGncvyxnX6ZdGD1d8vC7mw3Ai8u74WeQc+6CfeDmOHIlSSjIaQzIBYd3O9KFJ1p7f
	ajfSYLy3HexfrxDIFdoloMfgL06/AwXqiGkCtoYHZmLPKYR7hmigqupcX2IALz612RydgUBGT2K
	g1X8GRKMBxg/TtlfXov68JAPcI7mQTezjJ/HBF8hZsvy9CHamQXycoTOdObJ6sONPuXZIMksl7G
	IjsVE1PkqL2wYzh8UDmrGraIGpwbwj92CY36/VND4mcXhX087BD8G8P/noYufSCwZsYuzEl8Eas
	klnFb1SDMEzAVj38YLORy8ejIayQqBZwbRlQefYIRhyabeOK/sTfFZY0MDXAhU8bOheoOMwBMiT
	Ekaibeae0//uWlaJFqf/8p8FaKD9QezE=
X-Google-Smtp-Source: AGHT+IFIp/SnHEdMPilDFNbxP0Dbi82GGffS4GH1XlIR8cNBhKEBrJgtBQ7C69WSa2euQj37PuOC5A==
X-Received: by 2002:a05:6000:288d:b0:3c7:36f3:c352 with SMTP id ffacd0b85a97d-3c736f3c4c0mr6600072f8f.59.1756124898359;
        Mon, 25 Aug 2025 05:28:18 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7119c4200sm11315101f8f.53.2025.08.25.05.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:28:17 -0700 (PDT)
Message-ID: <6a52b243-11b1-4740-9d15-dcda7bf79777@linaro.org>
Date: Mon, 25 Aug 2025 13:28:16 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
 <e17ea82b-fb3e-45d2-a168-3b917816fe7b@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e17ea82b-fb3e-45d2-a168-3b917816fe7b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/24/25 6:10 PM, Krzysztof Kozlowski wrote:
> On 19/08/2025 13:45, Tudor Ambarus wrote:
>> +
>> +static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			     unsigned long parent_rate)
>> +{
>> +	struct acpm_clk *clk = to_acpm_clk(hw);
>> +
>> +	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
>> +					clk->acpm_chan_id, clk->id, rate);
>> +}
>> +
>> +static const struct clk_ops acpm_clk_ops = {
>> +	.recalc_rate = acpm_clk_recalc_rate,
>> +	.round_rate = acpm_clk_round_rate,
> 
> This should be determine_rate. Check recent patchset from Brian Masney.
> I applied the samsung bits from it to samsung soc tree.

Will do.

> 
> ...
> 
>> +
>> +static int __init acpm_clk_probe(struct platform_device *pdev)
> 
> module probe for sure should not be __init.

Ah, indeed, both __init and __refdata are wrong here, my appologies.
I assume they came from the time I considered the driver only needed
at boot time. Will drop them.
> 
>> +{
>> +	const struct acpm_clk_match_data *match_data;
>> +	const struct acpm_handle *acpm_handle;
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct clk_hw **hws;
>> +	struct device *dev = &pdev->dev;
>> +	struct acpm_clk *aclks;
>> +	unsigned int acpm_chan_id;
>> +	int i, err, count;
>> +
>> +	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
>> +	if (IS_ERR(acpm_handle))
>> +		return dev_err_probe(dev, PTR_ERR(acpm_handle),
>> +				     "Failed to get acpm handle.\n");
>> +
>> +	match_data = of_device_get_match_data(dev);
>> +	if (!match_data)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Failed to get match data.\n");
>> +
>> +	count = match_data->nr_clks;
>> +	acpm_chan_id = match_data->acpm_chan_id;
>> +
>> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
>> +				GFP_KERNEL);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +
>> +	clk_data->num = count;
>> +	hws = clk_data->hws;
>> +
>> +	aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
>> +	if (!aclks)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		const struct acpm_clk_variant *variant = &match_data->clks[i];
>> +		struct acpm_clk *aclk = &aclks[i];
>> +
>> +		hws[i] = &aclk->hw;
>> +
>> +		aclk->id = variant->id;
>> +		aclk->handle = acpm_handle;
>> +		aclk->acpm_chan_id = acpm_chan_id;
>> +
>> +		err = acpm_clk_ops_init(dev, aclk, variant->name);
>> +		if (err)
>> +			return dev_err_probe(dev, err,
>> +					     "Failed to register clock.\n");
>> +	}
>> +
>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>> +					   clk_data);
>> +}
>> +
>> +#define ACPM_CLK(_id, cname)					\
>> +	{							\
>> +		.id		= _id,				\
>> +		.name		= cname,			\
>> +	}
>> +
>> +static const struct acpm_clk_variant gs101_acpm_clks[] __initconst = {
> 
> This goes to top of the file, after struct declarations.

Okay, will do.
> 
>> +	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
>> +};
>> +
>> +static const struct acpm_clk_match_data acpm_clk_gs101 __initconst = {
> 
> Are you going to have more of such clk_match_data? More variants?

I see downstream that gs101 and gs201 have the same clock IDs, clock names
and acpm_chan_id. But I can't tell about others. I assume it's safer to
assume there will be other variants.

Anyway, I'll pass this as platform data, if I understood correctly.

Thanks,
ta
> 
>> +	.clks = gs101_acpm_clks,
>> +	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
>> +	.acpm_chan_id = 0,
>> +};
>> +



