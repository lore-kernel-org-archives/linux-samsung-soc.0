Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8F526560B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Sep 2025 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317184; cv=none; b=a96mR2QHLVLARls/QTStuBY29/MNXF8PRsjHuxp5R/MMNquUy+WQbigdkZQ7VlwDsbmmx2LP4l1bGMo87l5KM8rePU1/4VIeQzNRL9mA41J1NqPL37r5z9FqOJZOvfIWB9woP6lXZv2vjsX5kN9hrUkKZvdWD/2mOQNjrkHIdqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317184; c=relaxed/simple;
	bh=wq0AZVqJVXeupvwmG/HrcDN67x2rjEYrtQxIR3pw/jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKHXrxCE6MznxqAPsjaNQ+HS0sHloGr1xl3C+yd8v/VamoU4k4BYkqC+ynilxgaVkKVk0pnCDtjkhcI4tbePe4BAL2l8HzBtuPdxoxd9RskHVjm1Eo7gOZ58lHpqpLedPIhZxWUDTz5Qjmxd/RrUPOPBEfP9k0MbilZyHG56SYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AsmaEZxt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AsmaEZxt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45de221dc05so9210105e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2025 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757317181; x=1757921981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCyc7kQfoMfEL6TVndWCcMyXe6R2NRmKhQkJocZ5/1U=;
        b=AsmaEZxt6upz9ZrQO6ZIRqvFJTLUwdraYFGgjugv60NzIWk6UCzrKVPe/lFj67LDEd
         P6/FbIjfRhr/z414Psk1RrjqJsWBYcXjw+RMgya9srM6J6IJYDqJ+YJGD1WFTH6ncFku
         rVs6/C55d1bsizWb+5YEXqYluvmjmn/2nShCYPIQ0zG6+bDZ9G0weXKtr0xpVR7uTC5w
         saomTvUclw5ZmcZtfqJ3Fac5tAivGS9yQX7pK3INAgNxq8CNs/tcELRr4F4nHpkRvW1i
         psUWwoj4pqLqGWb8h2bclefd+0aJXtbZKpP+csyZt/DMLw9ajWMAog7eMoLspc4NsAqu
         ytEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317181; x=1757921981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCyc7kQfoMfEL6TVndWCcMyXe6R2NRmKhQkJocZ5/1U=;
        b=pHA/gDHcoR/lwpkhBV+K+tXWivTQ1kj0VHjiyw95WhfDxRViavXlF8i7Of4bOlvogI
         obtAv1b5B/MM+VKvIDWES3sgqJm5aYNKh5HQo5z4rz3J1Yslk5GC5k6d4Bqb2qqcl1SA
         99LrANZuYfDKCqY05u1O1ttGgY7HyfGoGPuoAOvrA9Tk+iWqllFIeUbG+DRzZvY0XrOV
         NSvkyfzi5IBnVucyIDv1fIu77zODmeeGjR7chzsSHhFZiryHuqrJyKcYBOfLTwtbBFFL
         8VYgb7zPBzi5tEv6C/sJsRZeUEPdUiEmHQvmlY7dlBeuj6Ral9fAKr+A3r0dq/sUXFIJ
         Hxew==
X-Forwarded-Encrypted: i=1; AJvYcCUQjhAOgcWqv4DIcz2WLloNzTN7HV2oRggunHvjI47N3Vp7j2Ri+pvHsJNTkiJx6MD/Jy/gU1b0m1zmoeCVndI33A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0KQFsFfDLqG1nXyv+nyVtx+5MGPGF0KN65zrO6c9QPmEAXwGl
	O0EWjVzrLk3LU2zuBDawR7xKHhiwqZ0P5T33b5GAOrT1XTdVVEZ/Ap8Vk3zFItOlVgQ=
X-Gm-Gg: ASbGncsuK8FhthV7od9TYfsJ/SAw2frMAkCPvVaX5WjjkX9ilA+9ScGkwCN5iTHHb6l
	ws+w12X/A8nBx0CF9uAHawKXpTQ0DpAL83wTiSMOLe3anaTUfijl4czY7aXmRmtRd/Ao4nITUU9
	hG+5m22n2KYZBzU1oXSZV/SsIv64POQpiOHF6MBMaP8DZSJPNcEmhX/JZYyIcnwXg9W4BAi82jd
	BF/vuz4wN7muKhAmXL1QACEBpkd+BASHv7Ojc1XSp8cyQjCELMD+6bJnkWm0bcWpEw0jHBURLu3
	ZMm/AmZX/1yMDo2VRv6bPQNQxywpHyaLm564BxrFLQ9mRRKyrC+JRmyRYT0Zui3u8FX6bjB1QbK
	0i3arTG06mSQLWQKVrdSTetdbl3mSgvrowCanlBEqErk=
X-Google-Smtp-Source: AGHT+IH+1Dsv8foQbfZSX/5/VoAySl4UUdGzifJPzufIcH96xXLSdDwjQ9Qlk+2F227iYeAIAqIiUQ==
X-Received: by 2002:a05:600c:1d16:b0:45c:b56c:4194 with SMTP id 5b1f17b1804b1-45ddde8984amr53951655e9.2.1757317180933;
        Mon, 08 Sep 2025 00:39:40 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddd47b6easm97814895e9.18.2025.09.08.00.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:39:40 -0700 (PDT)
Message-ID: <91407377-f586-4fd2-b8e4-d1fd54c1a52a@linaro.org>
Date: Mon, 8 Sep 2025 08:39:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
 <20250903-acpm-clk-v3-3-65ecd42d88c7@linaro.org>
 <eafb409d-5b5f-4791-939a-5a3c1eb00b9b@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <eafb409d-5b5f-4791-939a-5a3c1eb00b9b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/6/25 1:19 PM, Krzysztof Kozlowski wrote:
> On 03/09/2025 15:56, Tudor Ambarus wrote:
>> +
>> +static int acpm_clk_probe(struct platform_device *pdev)
>> +{
>> +	enum acpm_clk_dev_type type = platform_get_device_id(pdev)->driver_data;
>> +	const struct acpm_clk_driver_data *drv_data;
>> +	const struct acpm_handle *acpm_handle;
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct clk_hw **hws;
>> +	struct device *dev = &pdev->dev;
>> +	struct acpm_clk *aclks;
>> +	unsigned int mbox_chan_id;
>> +	int i, err, count;
>> +
>> +	switch (type) {
>> +	case GS101_ACPM_CLK_ID:
>> +		drv_data = &acpm_clk_gs101;
> 
> Just use acpm_clk_gs101 directly (see also further comment).

okay

> 
>> +		break;
>> +	default:
>> +		return dev_err_probe(dev, -EINVAL, "Invalid device type\n");
>> +	}
>> +
>> +	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
>> +	if (IS_ERR(acpm_handle))
>> +		return dev_err_probe(dev, PTR_ERR(acpm_handle),
>> +				     "Failed to get acpm handle.\n");
>> +
>> +	count = drv_data->nr_clks;
>> +	mbox_chan_id = drv_data->mbox_chan_id;
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
>> +		const struct acpm_clk_variant *variant = &drv_data->clks[i];
>> +		unsigned int id = variant->id;
>> +		struct acpm_clk *aclk;
>> +
>> +		if (id >= count)
> 
> This is not possible. You control the IDs build time, so this must be
> either build time check or no check. I vote for no check, because I

using BUILD_BUG_ON_MSG? that would work, see below the why.

> don't think the ID is anyhow related to number of clocks. What if (not
> recommended but what if) the IDs have a gap and next ID is 1000. I see
> your code using ID:
> 
> 
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "Invalid ACPM clock ID.\n");
>> +
>> +		aclk = &aclks[id];
>> +		aclk->id = id;
>> +		aclk->handle = acpm_handle;
>> +		aclk->mbox_chan_id = mbox_chan_id;
>> +
>> +		hws[id] = &aclk->hw;
> 
> ^^^ here, but why do you need it? Why it cannot be hws[i]?

so that it works correctly with of_clk_hw_onecell_get() in case the clocks
IDs are not starting from 0 or are reordered when defined. For example let's
consider clock ID 1 is wrongly defined at index 0 in the array. When someone
references clock ID 1 in the device tree, and we use of_clk_hw_onecell_get,
it would get the clock defined at index 1.

In my case the clocks start from index 0 and they are defined in ascending
order with no gaps, so the check is gratuitously made. I wanted to have some
sanity check. Do you still think I shall remove the check and use hws[i]?
> 
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
>> +static const struct platform_device_id acpm_clk_id[] = {
>> +	{ "gs101-acpm-clk", GS101_ACPM_CLK_ID },
> 
> Please drop GS101_ACPM_CLK_ID here and in other places. It's dead code
> now. It should be introduced with next users/devices.

okay. Thanks for the review!

> 
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(platform, acpm_clk_id);
> 
> Best regards,
> Krzysztof

