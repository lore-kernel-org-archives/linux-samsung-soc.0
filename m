Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACEC238C3A
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 06:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709816; cv=none; b=FU7+pbMYrkXTPvJrTnhGg9gSI/5lpzKwIfFQjxd4yyZvEhLXA1IYqBjAgU6oBDG+22+H1LHM7IoJ9GMluj3RJmC+5OHVKAQe01IhE3iKByaQH4JYxP91lgoKUEkRAz3FU8Hly0Oy829q4TEg7f1Djsolf7VfQaGmLoQkZD6IGm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709816; c=relaxed/simple;
	bh=RQx8BbMxP6+7qLnaDn+zVCrc4iYJd8swpHvRNV/hEpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxlYQGzXpq+FPJaaDXpLiz4zHXsEkB5jPnGblVZijXJh+KOFniw6nv30dqh/CpqGTrNOhZDu/zEwyFyUgvw0HUETsWD4nck3INuaFUSuxx68cvek6/2tgLuBkOogbmEPB7DvOuW2ehhJbHZXgl+Y6mq1j8hru4NPHLjR3xfIirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W95QRV/R; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W95QRV/R"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3cdc54cabb1so1607630f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756709813; x=1757314613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5gwX0oUoQ1OWBmNFYCauKpaErmMd3o/oWX1X0hG9WI=;
        b=W95QRV/RbOBJfBGEQbjHkNnMekyMcTCQStmS1SVIu5PBhdpWIDlBizDpcpJUrbgFvH
         auEQev19wXCW/6lgcMenHMXKzfYrrNcjHbvPfuLKJL2LHwm88QpnbbynZDx+3Wvpl3/6
         8v8QhwriwITf4ah1jBd6WtyiHAuJlqxBX7yu7+oXyN0qW5EqJqIjarFGdTDP1ujTov5z
         IOlZ/7Aw6rUBTk23e1UGxjLKTu6qyjedVQQROAj3dTQTajzumSdGbYTUfKFI7JOOqA7O
         FJct651te5sv+6bza4lmiYmHXQMyE1Soa9bXA++JwSG045fHSHAtjWqaiUdzpxBYgslf
         7cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709813; x=1757314613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5gwX0oUoQ1OWBmNFYCauKpaErmMd3o/oWX1X0hG9WI=;
        b=P/5GYlBJVt4BSDOYqb/m2LsG9Y/EW2s/6PJnQCNbM7t9VKY1Q5cSntPUQY7UM7O/fZ
         0YaQkRIeqPoMCKECvGui6R8Ql0VLQ3pW7UVEj8YBvUZg7U1Nim1sHnO+/PP9RoAs+JUH
         w+m2xLBxnddefcArFxtZJIyrP8S2PEKKJsEmA44/pj2fx6/mcJLLAZKT2U/v+Sc+Bp9O
         Usl59nXIY/qhbtyZF6YfrgYWUCE9SUm8eGCqf2gQbIdzjytZVC7TW1SfQ1eHcTjUniAk
         TQOAkQD4rUIlIcpJL0+co5FAl9rs6MsvW3dlw42/gZmjy2eCtqGYrSA6w3nmMuWGzU4n
         /xgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZj0xXbSWgA+dAmPSf/K8PmxDiXY1hatepee4oIeUupO/+PkakYxtUIEiLLz3bzrz/bEih4TdKIxgI2dBSLeVJsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOEa8sfOjX8fmRaxP1lXLol4XzI2GPVO0vcooklGd53VqQiIxe
	1rHVf7oLIapY0Q+IW2bAMC1zbkK9YNpBxoQM6Pi5NzPlmQ0xrBcSYDNN4/1gibDjzcI=
X-Gm-Gg: ASbGnctAryYq97g8tRalBXOV2MGMJ628Gl2id4bm+3f+kMrlAJR3a78iusBcz/9L38v
	sHAFbyXRyfDPCbQCTheTWKfuSDAStCD7OWWypbqbPENxVPZ6GFG6JEu20IRiDBdCA7bVxZJdo69
	vSKfbXmkYm+o8Ix7SW/FILgVQbX0ZacMw2sNOsdAQtcrYAPfWUejsJw/YKLh8/7oiaIxtXejPbu
	vyyIPh9PVxKlxLmse/tCHBEb727hag/nkFDFw+5ziixKj6TGUGbaAK1E090pR30p+D/b9f9h7SO
	UMdrNB9PkFHlCfMjfi0rPViPxVozi7SRnVP7YvLkHC4pXbVEbxfk4SW7NhwaGPMxc/0r5t7Huv0
	eQw4dqhUFagjzZXRbZEt11KUTVIjPRzMpn8f972LU
X-Google-Smtp-Source: AGHT+IFTyDtYclqmVOzGIS9ZJjlqs10NwWpon1hN8bxRSUY5lhRzsuWs0h2u4qUYWfT36TppjXjdDQ==
X-Received: by 2002:a05:6000:40ce:b0:3d5:f5ef:3bb with SMTP id ffacd0b85a97d-3d5f5ef0766mr2382494f8f.11.1756709812699;
        Sun, 31 Aug 2025 23:56:52 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d12c90a01bsm11387089f8f.31.2025.08.31.23.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 23:56:52 -0700 (PDT)
Message-ID: <761936e8-1626-47f8-b3f5-ebc62f4a409b@linaro.org>
Date: Mon, 1 Sep 2025 07:56:50 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] firmware: exynos-acpm: register ACPM clocks dev
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
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-4-de5c86b49b64@linaro.org>
 <e8346a38-fef7-482f-81ab-20621988b047@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e8346a38-fef7-482f-81ab-20621988b047@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/31/25 11:50 AM, Krzysztof Kozlowski wrote:
> On 27/08/2025 14:42, Tudor Ambarus wrote:
>> +
>> +static const struct acpm_clk_variant gs101_acpm_clks[] = {
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
> 
> I don't understand why clocks are defined in the firmware driver, not in
> the clock driver.

I chose to define the clocks in the firmware driver and pass them as 
platform data to the clock platform device for extensibility. In case
other SoCs have different clock IDs, they'll be able to pass the
clock data without needing to modify the clock driver. GS201 defines
the same ACPM clocks as GS101, but I don't have access to other newer
SoCs to tell if the ACPM clocks differ or not.

The alternative is to define the clocks in the clock driver and
use platform_device_register_simple() to register the clock platform
device. The clock driver will be rigid in what clocks it supports.

I'm fine either way for now. What do you prefer?

> 
> This creates dependency of this patch on the clock patch, so basically
> there is no way I will take it in one cycle.

Would it work to have an immutable tag for the clock and samsung-soc
subsytems to use?

> 
>> +
>>  /**
>>   * acpm_get_saved_rx() - get the response if it was already saved.
>>   * @achan:	ACPM channel info.
>> @@ -606,6 +636,7 @@ static void acpm_setup_ops(struct acpm_info *acpm)
>>  
>>  static int acpm_probe(struct platform_device *pdev)
>>  {
>> +	const struct acpm_clk_platform_data *acpm_clk_pdata;
>>  	const struct acpm_match_data *match_data;
>>  	struct device *dev = &pdev->dev;
>>  	struct device_node *shmem;
>> @@ -647,7 +678,30 @@ static int acpm_probe(struct platform_device *pdev)
>>  
>>  	platform_set_drvdata(pdev, acpm);
>>  
>> -	return devm_of_platform_populate(dev);
>> +	acpm_clk_pdata = match_data->acpm_clk_pdata;
>> +	acpm->clk_pdev = platform_device_register_data(dev, "acpm-clocks",
>> +						       PLATFORM_DEVID_NONE,
>> +						       acpm_clk_pdata,
>> +						       sizeof(*acpm_clk_pdata));
>> +	if (IS_ERR(acpm->clk_pdev))
>> +		return dev_err_probe(dev, PTR_ERR(acpm->clk_pdev),
>> +				     "Failed to register ACPM clocks device.\n");
>> +
>> +	ret = devm_of_platform_populate(dev);
>> +	if (ret) {
>> +		platform_device_unregister(acpm->clk_pdev);
> 
> I think this should stick to devm-interfaces everywhere, not mix them,
> to have exactly expected cleanup sequence. Now your remove() first
> unregisters and then de-populates, which is different order than it was
> done in probe(). Use devm-action handler for device unregistering.
> 

Right, I will take a look. Thanks!
ta
