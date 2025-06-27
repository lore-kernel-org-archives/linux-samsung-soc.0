Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E012741A0;
	Fri, 27 Jun 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015552; cv=none; b=cBUfkLEl4KdSBvWbbcY6Wo/lFRT0oO8H7NVYshylrlbAvJJ05w7oG5THqndN86+rBegoosyfR3WxSKA6XnJle4mvkUY6vNkxtjNVZ5/I55EmnRjQnuSiY8C8shTCf1PmDZVaPVrm+CrYRbDgQFvbFnK3A5htdWZ/jkhk3+qrs2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015552; c=relaxed/simple;
	bh=pA/2XLoSO8QMzw/6J3xr5U+FO1FrMVD9L5FGTWj0y8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olRg+E9gbrRdNDZzoW+f5jMinh9FNi8rrG55vFIXa4JHNjc8Hm+gmTjZANi541uzgW3R7YEu/ucSzcgKWAMccRjBaMNa/cSzCVZks4indu+eRP2ze2IvncerdFi8iL1Nxiq1lgMVF8HnbcXwbLBMSg+OlKYVkyJkWL1YJozUhC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI2mMSNl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI2mMSNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE4AC4CEE3;
	Fri, 27 Jun 2025 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751015551;
	bh=pA/2XLoSO8QMzw/6J3xr5U+FO1FrMVD9L5FGTWj0y8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jI2mMSNl88IYMGZga3wZMRWakIsMngxDMC9h+SLZ7LkImtXBAfsPUlqOaxNZQ+NaU
	 uvAyupZzK+b0aVF4zCvqNqyxi7qSJfz9lq7MyucZouLrYBhXaoZ8GCl5D/OJa+7FoD
	 H5IYHckUvyqoLgu5TYQ/ZA4uJPWmVJsyEsfRjQbKINsI7mjyZCzce1Myob53lWCmrS
	 x4TE95ktDC2YE82AzYQ++bzgTw9i1E1LxirX2keL7AIggq0NdXoZ0wM/ynXjPVORvD
	 Owh/GwmJ7o2xIEDRknrQ5BpaDT4aUjlYu1Sr9xOMZmu3IUh/pKdElwKq/2kN/k9ixP
	 fJQJ8gu8W7bBg==
Message-ID: <4cbc691e-c725-48eb-9932-4549381fa55b@kernel.org>
Date: Fri, 27 Jun 2025 11:12:23 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 PMIC
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
 <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
 <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
 <b2c3b78d60f3dc3e4576e8b79298e22ea46567c6.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b2c3b78d60f3dc3e4576e8b79298e22ea46567c6.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/06/2025 10:54, André Draszik wrote:
> Hi Krzysztof,
> 
> On Thu, 2025-06-26 at 21:49 +0200, Krzysztof Kozlowski wrote:
>> On 24/05/2025 07:21, André Draszik wrote:
>>> +
>>> +		gpio {
>>> +			compatible = "maxim,max77759-gpio";
>>> +
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			/*
>>> +			 * "Human-readable name [SIGNAL_LABEL]" where the
>>> +			 * latter comes from the schematic
>>> +			 */
>>> +			gpio-line-names = "OTG boost [OTG_BOOST_EN]",
>>> +					  "max20339 IRQ [MW_OVP_INT_L]";
>>> +
>>> +			interrupt-controller;
>>> +			#interrupt-cells = <2>;
>>> +		};
>>> +
>>> +		nvmem-0 {
>>
>> Why is this called nvmem-0, not nvmem? Is there nvmem-1? I see binding
>> does it, but why?
> 
> 'nvmem' is used/declared by nvmem-consumer.yaml as a phandle array
> already so using just 'nvmem' fails validation:
> 
> Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@66: nvmem: {'compatible': ['maxim,max77759-nvmem'], 'nvmem-
> layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells': 1, 'reboot-mode@0': {'reg': [[0, 4]]}, 'boot-reason@4':
> {'reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]}, 'rsoc@10': {'reg': [[10, 2]]}}} is not of type 'array'
> 	from schema $id: http://devicetree.org/schemas/nvmem/nvmem-consumer.yaml#
> 
> https://lore.kernel.org/all/20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.org/
Heh, this should have been just folded into the parent as Rob suggested
during v2. Well, let's just merge it.

Best regards,
Krzysztof
