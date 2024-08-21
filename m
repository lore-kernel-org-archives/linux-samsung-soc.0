Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4C61C6B5;
	Wed, 21 Aug 2024 06:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724221377; cv=none; b=daZkagTNw63+do7ew4187ZMKAUgstYwBZCAA5BtMpnZycTN6d+Om0TWpK26DsijQhh/qhMYnboJjdCRGDqiE762KkH/fSM53Npc0rs9bXz7gGGwhH0u05U+T+NMKNI/ax+Oh+hOiBI6Hve7Wav3fOYLHl0cm6rmSvU3x+gD+QsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724221377; c=relaxed/simple;
	bh=+Ca8p2IGyH6nc2ZHR6+G2NHhd+A2edfA9Q+GWa4Bv4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WF/9q9T+O8ss2TU5WsyI6IHw89ZnztdfQZzeONVFMaLjC3z8ueixPQDNNfP7geQh69N6HsU9i+qNvOefmkbHpnVo1gQNS9g4TujAZnPHCO8guEcwaZTMeX2ht29Q6m+rg++Je6NpwTg7VDMfJIk21W4lrrOQS5hUGaCBztXq0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qej8SjUZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qej8SjUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C54EC32782;
	Wed, 21 Aug 2024 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724221376;
	bh=+Ca8p2IGyH6nc2ZHR6+G2NHhd+A2edfA9Q+GWa4Bv4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qej8SjUZathbahQzP/xGKitWxeX3KJi2+E1amapV5Zflc3EGm/HNTGOxaETr9FK+W
	 kvNB+fQcmP1A/ic5Uj42q4Lxs15UFxA6FI0F6t61zi/OxGfQ+dcI8cywB500VrWn9Z
	 LQMIgPObfn4TGjWlr93WI7haAfyRN7so44dIBvmz83GB/6Xu1a0B5Q/3GgqVcphMuA
	 sjHMs+gIMAoLlXq++9fspZy5Wz6LHnyQFcjTpdPuYUdXvnYAIgCgCqpH8BjuIIsKPD
	 zmiyGs017Orb+UYwtf2xzdbSJ6wLR2tmmCgvmbhviNDAT+LKEu3Po4HTYBspQWiepT
	 IAIuiqH556VSA==
Message-ID: <76a46e34-fc22-477d-a2e6-4767e65a73c4@kernel.org>
Date: Wed, 21 Aug 2024 08:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] clk: samsung: add top clock support for ExynosAuto
 v920 SoC
To: "sunyeal.hong" <sunyeal.hong@samsung.com>,
 'Kwanghoon Son' <k.son@samsung.com>,
 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>,
 'Michael Turquette' <mturquette@baylibre.com>,
 'Stephen Boyd' <sboyd@kernel.org>, 'Rob Herring' <robh@kernel.org>,
 'Conor Dooley' <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
 <CGME20240819052422epcas2p258a29e773ebdd60573078c21f7a7da12@epcas2p2.samsung.com>
 <20240819052416.2258976-5-sunyeal.hong@samsung.com>
 <7f77dcc41173f2a20a0264b6242ecdac6ea85ad9.camel@samsung.com>
 <087401daf2a3$4ae602f0$e0b208d0$@samsung.com>
 <9ee0efad7a27202e6b830996b5ee661a2d350b84.camel@samsung.com>
 <0a0101daf371$0f2025b0$2d607110$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0a0101daf371$0f2025b0$2d607110$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2024 04:23, sunyeal.hong wrote:
> Hello Kwanghoon,
> 
>> -----Original Message-----
>> From: Kwanghoon Son <k.son@samsung.com>
>> Sent: Tuesday, August 20, 2024 6:54 PM
>> To: sunyeal.hong <sunyeal.hong@samsung.com>; 'Krzysztof Kozlowski'
>> <krzk@kernel.org>; 'Sylwester Nawrocki' <s.nawrocki@samsung.com>; 'Chanwoo
>> Choi' <cw00.choi@samsung.com>; 'Alim Akhtar' <alim.akhtar@samsung.com>;
>> 'Michael Turquette' <mturquette@baylibre.com>; 'Stephen Boyd'
>> <sboyd@kernel.org>; 'Rob Herring' <robh@kernel.org>; 'Conor Dooley'
>> <conor+dt@kernel.org>
>> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH v6 4/4] clk: samsung: add top clock support for
>> ExynosAuto v920 SoC
>>
>> On Tue, 2024-08-20 at 10:50 +0900, sunyeal.hong wrote:
>>> Hello Kwanghoon,
>>>
>>>> -----Original Message-----
>>>> From: Kwanghoon Son <k.son@samsung.com>
>>>> Sent: Monday, August 19, 2024 6:32 PM
>>>> To: Sunyeal Hong <sunyeal.hong@samsung.com>; Krzysztof Kozlowski
>>>> <krzk@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>;
>>>> Chanwoo Choi <cw00.choi@samsung.com>; Alim Akhtar
>>>> <alim.akhtar@samsung.com>; Michael Turquette
>>>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob
>>>> Herring <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
>>>> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
>>>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> linux- kernel@vger.kernel.org
>>>> Subject: Re: [PATCH v6 4/4] clk: samsung: add top clock support for
>>>> ExynosAuto v920 SoC
>>>>
>>>> On Mon, 2024-08-19 at 14:24 +0900, Sunyeal Hong wrote:
>>>>> This adds support for CMU_TOP which generates clocks for all the
>>>>> function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
>>>>> CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this
>>>>> block and they will generate bus clocks.
>>>>>
>>>>> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
>>>>> ---
>>>>>  drivers/clk/samsung/Makefile             |    1 +
>>>>>  drivers/clk/samsung/clk-exynosautov920.c | 1173
>>>>> ++++++++++++++++++++++
>>>>>  2 files changed, 1174 insertions(+)  create mode 100644
>>>>> drivers/clk/samsung/clk-exynosautov920.c
>>>>>
>>>>> diff --git a/drivers/clk/samsung/Makefile
>>>>> b/drivers/clk/samsung/Makefile index 3056944a5a54..f1ba48758c78
>>>>> 100644
>>>>> --- a/drivers/clk/samsung/Makefile
>>>>> +++ b/drivers/clk/samsung/Makefile
>>>>> @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-
>>>> exynos7.o
>>>>>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
>>>>>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>>>>>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
>>>>> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
>>>>>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
>>>>>  obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
>>>>>  obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-
>>>> audss.o
>>>>> diff --git a/drivers/clk/samsung/clk-exynosautov920.c
>>>>> b/drivers/clk/samsung/clk-exynosautov920.c
>>>>> new file mode 100644
>>>>> index 000000000000..c17d25e3c9a0
>>>>> --- /dev/null
>>>>> +++ b/drivers/clk/samsung/clk-exynosautov920.c
>>>>
>>>> [snip]
>>>>
>>>>> +};
>>>>> +
>>>>> +static const struct samsung_cmu_info peric0_cmu_info __initconst =
>> {
>>>>> +	.mux_clks		= peric0_mux_clks,
>>>>> +	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
>>>>> +	.div_clks		= peric0_div_clks,
>>>>> +	.nr_div_clks		= ARRAY_SIZE(peric0_div_clks),
>>>>> +	.nr_clk_ids		= CLKS_NR_PERIC0,
>>>>> +	.clk_regs		= peric0_clk_regs,
>>>>> +	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
>>>>> +	.clk_name		= "dout_clkcmu_peric0_noc",
>>>>
>>>> same question.
>>>> Isn't it "noc"?
>>>> https://lore.kernel.org/linux-samsung-
>>>> soc/58dfae564a4a624e464c7803a309f1f07b5ae83d.camel@samsung.com/
>>>>
>>>> In my case(autov9), if put wrong clk_name dmesg will show that,
>>>> exynos_arm64_register_cmu: could not enable bus clock ...; err = -2
>>>>
>>>> Kwang.
>>>>
>>>>
>>>
>>> clk_name follows the guide document provided by hw. v9 is bus, but v920
>> uses noc.
>>
>> What I mean,
>>
>> .clk_name		= "dout_clkcmu_peric0_noc", // wrong
>> .clk_name		= "noc", // correct
>>
>> Because there is no clock-names "dout_clkcmu_peric0_noc" in
>> exynos/exynosautov920.dtsi.
>>
> 
> The clk_name written here has nothing to do with the device tree. Please look at the code carefully.

Hm? I see in the code clearly:

	clk_get(dev, cmu->clk_name);

Where cmu is the discussed struct.

If you claim it does not have anything to do with DT, then what is it for?

Best regards,
Krzysztof

