Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D5D24886F;
	Mon, 20 Oct 2025 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760959321; cv=none; b=HEo3BHm/m+OHEvZ67H09rH87LoC2xLIqKBoHK4nC/3qm6EsL+2SZe/LjEsN3T9RNmo2SaBhPt0yaMF2P0Sh/MRhCbyZnBk8LxN0l/K2Q+ubMUMLEn2wB/xJhNcK852URPNsaR3QTm3P9u+8N9TsBTbhrv1MaQzaNUP028hku2XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760959321; c=relaxed/simple;
	bh=LSHVI2VLtnjMI4kRWYUVFoVw5grvJWjCEzPh2CrLB9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYzj/6owDoghY2Kn0WBqLoJFjoZqDgHw0W/7kT0K1baxDQ6IvKjCxYINWVBC1t5FENQyLxjnmB6aVdQhE8VZpt0GLDX+5g0ahiYIde72l1yaM1Y2zet1sqDPLi0uVqv7DgXzsmyAeaEpD8glN9vNzArb4P4O86u6Y184HCbOhGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfCWxJYu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfCWxJYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF8FC4CEF9;
	Mon, 20 Oct 2025 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760959320;
	bh=LSHVI2VLtnjMI4kRWYUVFoVw5grvJWjCEzPh2CrLB9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YfCWxJYus6FG0VhGEPHSD8Fv+hUPHuzdgxzvI/yj/ZVQO+yhR1lnZxExLt1uJ+Q9j
	 b1WuQP0XLv0ksoPGuIYH+IHHDfp5VdwtfBYHgQMxij7Scc2qyqcTcYaZ5FaO/Z8Q7A
	 pfOX5ug/YaKv9hRFViLXK2g0Rbsln0oERYmRj/VowBzXFeMoYQot23+nguqhIdzUtU
	 KBtNjWTBnmkeBywrJFHehgpRO2viLQXKH7W0x4MfoEYfeZk8+5+p2rgNUDwXWJSgC6
	 nh5ebyYJ5fuhhAhhWtP0Hvny47X5+bWq1bO08Kr6GW09Df2IpqcSVXecL9a60UMnTU
	 uNBZwtVal3QkA==
Message-ID: <c5712c26-439f-4c20-8d36-4179f345cca1@kernel.org>
Date: Mon, 20 Oct 2025 13:21:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
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
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
 <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
 <2f8da425-63d9-4321-9cd3-976bbd29a52f@kernel.org>
 <a03cd07f-8e9f-4b02-b301-f1bbb69eb7db@linaro.org>
 <f6812244-8e8e-45b9-87b9-fe96d740a843@kernel.org>
 <de77e673-c2f2-4293-88bf-be9c6779a5dc@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <de77e673-c2f2-4293-88bf-be9c6779a5dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2025 13:02, Tudor Ambarus wrote:
> 
> 
> On 10/20/25 10:58 AM, Krzysztof Kozlowski wrote:
>> On 20/10/2025 11:19, Tudor Ambarus wrote:
>>>
>>>
>>> On 10/20/25 9:22 AM, Krzysztof Kozlowski wrote:
>>>> On 20/10/2025 09:45, Tudor Ambarus wrote:
>>>>>
>>>>>
>>>>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>>>>> --- a/drivers/clk/samsung/Kconfig
>>>>>>> +++ b/drivers/clk/samsung/Kconfig
>>>>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>>>>  	  status of the certains clocks from SoC, but it could also be tied to
>>>>>>>  	  other devices as an input clock.
>>>>>>>  
>>>>>>> +config EXYNOS_ACPM_CLK
>>>>>>> +	tristate "Clock driver controlled via ACPM interface"
>>>>>>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>>>>
>>>>>> I merged the patches but I don't get why we are not enabling it by
>>>>>> default, just like every other clock driver. What is so special here?
>>>>>
>>>>> Thanks! Are you referring to the depends on line? I needed it otherwise
>>>>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
>>>>
>>>>
>>>> No. I am referring to missing default and defconfig patch.
>>>>
>>>
>>> default m or y would force compilation of EXYNOS_ACPM_CLK and
>>> EXYNOS_ACPM_PROTOCOL for all ARCH_EXYNOS, even on Exynos platforms that
>>> don't use ACPM. Since ACPM is not universally required by the Exynos
>>> architecture, I thought to make it opt-in (default n).
>>
>>
>> Just like every clock driver. So again - how is it different?
> 
> The key difference lies in the universality of the hardware interface
> across the ARCH_EXYNOS family. If EXYNOS_AUDSS_CLK_CON, EXYNOS_CLKOUT
> are considered core, integral, or nearly universal features across
> Exynos SoCs, then it's alright to have them by default. I can't tell how
> common is ACPM across the Samsung Exynos SoCs. I know it's present on
> gs{1,2)01 and e850. Heard it mentioned around some other phone but I
> can't remember which. Maybe we shall set to a default m when more users
> reveal themselves? I'm of course open to drop the defconfig patch and
> follow up with a patch setting EXYNOS_ACPM_CLK to
> "default m if ARCH_EXYNOS" if you think it's common enough.


OK, we can wait till one more user appears. Although the choice is less
about universality, but rather if this is a core SoC element. If this is
a core SoC element, then SoC ARCH should select it (not allow to disable
it), even if this is only for one ARCH_EXYNOS SoC.

Best regards,
Krzysztof
