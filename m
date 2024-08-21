Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10531A4AA4;
	Wed, 21 Aug 2024 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724227353; cv=none; b=ZtWIYxEU6uChURP7J/o8IoKYMM5gJjNOCW0gFDEedz3evcpXgbKrnggJjyl67YMbnvDmTFsjAakKE0fRwqAVV2thPD/+PKkPmnU9X9Q3nR7OTuO6PyabRx3Okyj8/s9VbzrRAWaYmFkRFIrwmgYxpCyWPl6o2Ex/x4/PHlCo6Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724227353; c=relaxed/simple;
	bh=57FVmjY15X4+hH0dOdsQhV3PIudgNWOIg+Aw6gE7aiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjjtluwqsOmJOi9hNGWY3vW3GQjN5KCzsVMQ171mPVNv0zz/Beb1PuxsYnK9EFmqeDCazHWdzK1SYSYYIKSwg5VVt6s6eLGjHtp0eGHpNyF0bjUjTw3OLNx4tSACz3on6JHyhwQ5YKr9aoAej7El5YXLKE8ZwtaG9ZwJIuqRv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy4WIQqz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy4WIQqz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8AEC32782;
	Wed, 21 Aug 2024 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724227352;
	bh=57FVmjY15X4+hH0dOdsQhV3PIudgNWOIg+Aw6gE7aiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fy4WIQqzIu9WsEGiQqjg2nSu4H38w9PSZ9pFuAds0L/6z+Tzsp6OaVdQxxCzARqqQ
	 OCqtnQ4nGXP/ZT8lRHp4xPC4PZqeJa4wsrZiuFoXJ7woO3cpYqmpCuBTWHQqIwm4eT
	 XJyUPB2tlPJWzpwUCOdGQ5hKLaamlSEXjLFGLIAd+40iiNkQ8eIv7PNPjTfXmds/ax
	 D06FOceRZwYbTocqNJd0hDtho9gfpHFb4bQuZoJXprYChMvBFWJ68HIfM85h1h6OhN
	 zx4ZnUHSDDj3rxnFS+eiHxRE+bnTYWOu2HaxF8PUbANh5dM2LjrEJ5NuMOssf4IPXM
	 cAWJwg79PoFSQ==
Message-ID: <8a729db0-f587-42b6-8003-789091986324@kernel.org>
Date: Wed, 21 Aug 2024 10:02:27 +0200
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
 <76a46e34-fc22-477d-a2e6-4767e65a73c4@kernel.org>
 <0a7b01daf398$9465d090$bd3171b0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0a7b01daf398$9465d090$bd3171b0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2024 09:06, sunyeal.hong wrote:
>>>>>>> +	.clk_name		= "dout_clkcmu_peric0_noc",
>>>>>>
>>>>>> same question.
>>>>>> Isn't it "noc"?
>>>>>> https://lore.kernel.org/linux-samsung-
>>>>>> soc/58dfae564a4a624e464c7803a309f1f07b5ae83d.camel@samsung.com/
>>>>>>
>>>>>> In my case(autov9), if put wrong clk_name dmesg will show that,
>>>>>> exynos_arm64_register_cmu: could not enable bus clock ...; err = -2
>>>>>>
>>>>>> Kwang.
>>>>>>
>>>>>>
>>>>>
>>>>> clk_name follows the guide document provided by hw. v9 is bus, but
>>>>> v920
>>>> uses noc.
>>>>
>>>> What I mean,
>>>>
>>>> .clk_name		= "dout_clkcmu_peric0_noc", // wrong
>>>> .clk_name		= "noc", // correct
>>>>
>>>> Because there is no clock-names "dout_clkcmu_peric0_noc" in
>>>> exynos/exynosautov920.dtsi.
>>>>
>>>
>>> The clk_name written here has nothing to do with the device tree. Please
>> look at the code carefully.
>>
>> Hm? I see in the code clearly:
>>
>> 	clk_get(dev, cmu->clk_name);
>>
>> Where cmu is the discussed struct.
>>
>> If you claim it does not have anything to do with DT, then what is it for?
>>
>> Best regards,
>> Krzysztof
> 
> In general, clk_get is used via the clk_name declared in the DT.
> 
> However, the question asked here is the parent clock name of peric0_noc, so it is unrelated to the device tree.

No. The question was about clk_name entry in cmu info used directly for
clk_get.


Best regards,
Krzysztof

