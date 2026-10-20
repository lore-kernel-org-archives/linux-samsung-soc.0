Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495961;
	b=D67ryBRF8yy9IAZHxKSU9QfU+1LJN+RvjgKt+M0Ms58p3i5q8XrRsLgNUmExDlenLTiP
	 CQBnK4NDPxWnMZSiLq7dptDKXek41+UYBBCJvvk4a5PMFnRmX6Gjye+uSrJRhsDzM2SGP
	 ZahFFWxHAKtqT4TMVvK0oK8ZdnuayO/vWOJ8piZ9s2TLKBIa9WRQOt/V5XfDD1TeHv1eJ
	 NSvPNOytnqlHDcZIyMqQ53nzTT8/XCkiOJ1zUYWiTzUPJkmM53EQpDQZ0AYrFJnz2ovVw
	 OEoWA2k6zvzYMxmx7KnxTLR44TvEHCwbWDUDr9dJXikby1Ng2yTShcV2qPav4CL0zfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495961;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Sp5oihtLvg49MCLp/n/qyNEd5ihDt74z2SKQHiNYLbE=;
	b=wUrCHMlC+2cBDiN/o97kEqC36nP11jsJOH96Dngrl6NQgo9OIUTZ6Ypw79YncbLblWRX
	 /SO4fXAaSqL6PNldqyxckMqwU7GCiW/rSTXxUeT3bx/CVj5BCz/m5eMGzp0ZRiD61PVeS
	 QugVdCTeP6dgIFIQtbaFV3uWcVWEbUmnDYB9KRNDFH0RC6WM2GXbrRg90B4huKkdfoRoZ
	 PcjD8SZ+z5Em78wClcgQhZNwb/P3VVOHORDmF8cvr+Ai9B9Ls+vmt8wSya08ScNLR1hHD
	 LwP2na5/YHXtV0YbMOutNXCy7QR6wT1G2fmtYSVJ1dO1EY8+3cDLDTDIP8Ixjcpzztg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpYqxBJB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AAA606A31A;
	Tue, 20 Oct 2026 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpYqxBJB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A301F000C4;
	Tue, 20 Oct 2026 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792495961;
	bh=Sp5oihtLvg49MCLp/n/qyNEd5ihDt74z2SKQHiNYLbE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jpYqxBJBSJIS/6C50M/aTHWoWlaB0rsoKl9Kb3tr/jlBhef/bLfaK48s8b7VFjrrU
	 a2f2ImaCJU2kz0+GZmSj6mpWXl94MKI/0C31ePLDd7u3kikh8SyFD0ZYeHO4tZEqmc
	 HBAaUBzRWJNqjbx83kwJ8xMQV0EOrNXzPSQYBEIbT00P6+GWnWrt0U8/MzTbEeN83t
	 PonyHx/M+HdAwaoUU46b2dG9q9zLTeVlHz01ZEehRQnwes4t3PofyEGlzNwlZqsyk0
	 Op4fsmVLJdutqfQiu2KzYwwZSqgFkz+lY5IZzLNKiGW/FwfWhuhiDBaZYtYTYEUBAq
	 //USVk3tW0c6Q==
Message-ID: <2fd0111b-8dc9-40e5-b705-d9f3d5265035@kernel.org>
Date: Tue, 20 Oct 2026 13:32:28 +0200
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, mani@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com,
 dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com,
 eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com,
 thiagu.r@samsung.com
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
 <CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
 <20260916122229.2604003-3-selvarasu.g@samsung.com>
 <20260918-burgundy-marmoset-of-focus-c9b9a7@quoll>
 <fef2b2f5-3838-4eec-8118-d41f9ca0ed2f@samsung.com>
 <7fbcf497-a166-45d6-844d-faaece6f581c@kernel.org>
 <ad11251d-6632-498d-95f6-04a7c6dade72@samsung.com>
 <6643fece-aa39-42e6-8cd6-5264f15e12ff@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <6643fece-aa39-42e6-8cd6-5264f15e12ff@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/10/2026 10:02, Selvarasu Ganesan wrote:
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    items:
>>>>>> +      - enum:
>>>>>> +          - samsung,exynos8855-dwc3
>>>>>> +      - const: samsung,snps-dwc3
>>>>> And this fallback is not really accurate. Samsung does not have snps
>>>>> device, because snps is a vendor. Anyway, generic fallbacks should go
>>>>> away, drop, so you are left with samsung,exynos8855-dwc3 only.
>>>> Hi Krzysztof,
>>>>
>>>> Thanks for your review comments.
>>>> And We apologize for our repeated below explanation, but we wanted to
>>>> ensure our intentions were clear for each point to avoid any
>>>> misunderstanding.
>>>>
>>>> The original intent of the generic fallback was to support existing
>>>> Exynos dwc3 bindings from a parent/child representation from
>>> How does it support existing bindings? I don't understand. There is no
>>> such fallback in existing bindings.
>>
>>
>> Sorry for the misunderstanding, Yes there is no such a fallback in 
>> existing bindings.
>>
>> Our intention was to use new proposed generic fallback compatible 
>> string that will support USB dwc3 flatted node for all Samsung soc 
>> when those are migrated in the future without adding SoC specific 
>> compatible string in driver.
>>
>> Agreed, Here using generic fallback name (samsung,snps-dwc3 as a 
>> reference of qcom,snps-dwc3) is incorrect as snps is vendor not a device.
>>
>> As per DTS101 slide , Now we clear that the future Exynos SoCs could 
>> use  samsung,exynos8855-dwc3 as a fallback when they are compatible 
>> with the Exynos8855 hardware definition, rather than introducing a 
>> generic samsung,snps-dwc3 fallback. The dedicated compatible would 
>> still describe any SoC specific differences, such as clocks.
>>
>> And Understood that we were mixing the current Exynos8855 binding with 
>> the longer term migration plan for the existing Exynos SoCs and future 
>> SoCs.
>>
>> We will drop the generic fallback and use SoC specific compatible 
>> samsung,exynos8855-dwc3 (vendor,device), following 
>> samsung,exynos-dwc3.yaml as the reference.
>>
>> Regarding the binding filename, if the flattened representation is 
>> expected to support multiple Exynos SoCs where there is only 
>> differences in clock in the future, similar to how 
>> samsung,exynos-dwc3.yaml covers multiple SoCs with the legacy (parent 
>> and child) node representation, should we use a common binding 
>> filename for the flattened representation instead of a SoC specific 
>> name like samsung,exynos8855-dwc3.yaml.
>> For example,
>>     samsung,exynos-dwc3-flattened.yaml.
> 
> 
> HI Krzysztof,
> 
> I am writing to kindly follow up on my previous inquiry regarding the 
> binding filename for the flattened representation.

I started to ignore overly long answers, because to me that means
contributor expects me to devote a lot of time to their contribution. Or
second option: LLM proxy. There is even a trend where people paste
prompts or LLM-chat-confirmation-like answers. I often do not correct
even such cases, just put the ignore list.


> 
> To recap, I would like to know if we should use a common binding 
> filename, such as samsung,exynos-dwc3-flattened.yaml, instead of SoC 
> specific names (e.g., samsung,exynos8855-dwc3.yaml). This would be 
> consistent with how samsung,exynos-dwc3.yaml covers multiple SoCs in the 
> legacy representation, especially if we expect to support multiple 
> Exynos SoCs with only clock differences in the future.
> 
> I would appreciate your guidance or suggestions on the preferred naming 
> convention for this implementation.

Please use the naming expressed in on of the rules for writing bindings,
so one matching the compatible or fallback compatible.


Best regards,
Krzysztof
