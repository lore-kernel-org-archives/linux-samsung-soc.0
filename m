Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC71248F66;
	Mon,  1 Sep 2025 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756719247; cv=none; b=uLazeuC8Vp2boVvntf0WuLsp0Ka8SgYAtI7nLoRfXLqw0JW+meNrRxRgrntLiFVB4oUxkQsZgtgybJAQLYu2coe7G7yjh1x+QyeRTSZpAzmr5KBh2ExTTdbBCTb/bVlXOIYfxbN6NlzuEJ8B2v7Rc8hGD84Y1eHltG6+aLDONR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756719247; c=relaxed/simple;
	bh=3pD43VmzuMnbKqEZBMBvRD8QOeColEDDiPA98Xg+SaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/A6m5gN/d17iWrueL+2Qz1GI8ye9l9ORJdj2K1au+SOSVJ7LP1Q6Q2pmBUWvuWs4hyNlike/iVRhOa3vDub4VYgnGMoOUWVm9yTMXZOpPK4FEeOLJlnl8Bx7JMslpqRgxnx2Wqp72N9Yqpnn76lrlMbN/ufGADj6EDNdkmtFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=up5IY0Lz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="up5IY0Lz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF865C4CEF0;
	Mon,  1 Sep 2025 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756719246;
	bh=3pD43VmzuMnbKqEZBMBvRD8QOeColEDDiPA98Xg+SaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=up5IY0Lz+TWMrst6sxwJCXHZlvksy+Kyvgdb5EAAQyC+UHTG6/VphlFt01RyHvzdY
	 SpU7YnF5+Jqv0wV6aIuRTNVyJMCpVHjQyME6P1+siibcpvKIrd1QOnpg8aTaePOXU/
	 QvT67wDPOMoeNkN9KpE1mREID6KnHbBNmAqEobXL092QepnV9neHZRxgpw6FGBEUUh
	 NPw6CEx8P9CGBIzoTcXJo+Y3n4/aN7N5E/YDXz95PBTWB2RVvsl7Mfp9smS62ZJXhp
	 izWNuW6h6BRCHrXysOq6sHn5ZHhZngDG/WcJAe3ynXx+8m1AjDe6cCP1rhiJl+yTmO
	 67GBt22Hy8KSw==
Message-ID: <44d8a998-efe7-4c2f-8580-5248b1a98c44@kernel.org>
Date: Mon, 1 Sep 2025 11:34:00 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] firmware: exynos-acpm: register ACPM clocks dev
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
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
 <761936e8-1626-47f8-b3f5-ebc62f4a409b@linaro.org>
 <2567a939-4938-4c92-8893-83d03ff8767f@kernel.org>
 <c1321c46-e7a4-4489-a63b-a3ed72e5e98a@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c1321c46-e7a4-4489-a63b-a3ed72e5e98a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2025 10:43, Tudor Ambarus wrote:
> 
> 
> On 9/1/25 8:48 AM, Krzysztof Kozlowski wrote:
>> On 01/09/2025 08:56, Tudor Ambarus wrote:
>>>
>>>
>>> On 8/31/25 11:50 AM, Krzysztof Kozlowski wrote:
>>>> On 27/08/2025 14:42, Tudor Ambarus wrote:
>>>>> +
>>>>> +static const struct acpm_clk_variant gs101_acpm_clks[] = {
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
>>>>> +	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
>>>>> +};
>>>>
>>>> I don't understand why clocks are defined in the firmware driver, not in
>>>> the clock driver.
>>>
>>> I chose to define the clocks in the firmware driver and pass them as 
>>> platform data to the clock platform device for extensibility. In case
>>> other SoCs have different clock IDs, they'll be able to pass the
>>
>> You will have to modify firmware driver, so still at least one driver
>> has to be changed. Having clocks defined in non-clock driver is really
>> unusual.
>>
>> This solution here creates also dependency on clock bindings and makes
>> merging everything unnecessary difficult.
>>
>>> clock data without needing to modify the clock driver. GS201 defines
>>> the same ACPM clocks as GS101, but I don't have access to other newer
>>> SoCs to tell if the ACPM clocks differ or not.
>>>
>>> The alternative is to define the clocks in the clock driver and
>>> use platform_device_register_simple() to register the clock platform
>>> device. The clock driver will be rigid in what clocks it supports.
>>>
>>> I'm fine either way for now. What do you prefer?
>>
>> Please move them to the driver.
> 
> Okay, will move the clock definitions to the clock driver.
> 
>>
>>>
>>>>
>>>> This creates dependency of this patch on the clock patch, so basically
>>>> there is no way I will take it in one cycle.
>>>
>>> Would it work to have an immutable tag for the clock and samsung-soc
>>> subsytems to use?
>>
>> No, just try yourself. Patch #3 depends on patch #2, so that's the cross
>> tree merge. It's fine, but now patch #4 depends on patch #3, so you need
>> two merges.
>>
>> Or how do you actually see it being merged with immutable tag? What goes
>> where?
>>
> 
> Unnecessary difficult indeed. Hypothetically, if we kept the current

No, it is impossible.

> structure, we could have have a single tag on #4. Since the dependency was

What does it mean tag on #4? There are no further users, so tagging this
patch has zero effect.

> on a new clock driver, the clock subsystem could have lived without merging
> the tag, as the chances of conflicts with the clk core are small. But not

Quick look tells me nothing would compile. Really, try yourself. Neither
patch #3 nor patch #4 builds!

Best regards,
Krzysztof
