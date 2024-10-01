Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19EB67D;
	Tue,  1 Oct 2024 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727776835; cv=none; b=L/EcmWbhUk1tLyh/yZA92m5fgTsNXB+FmV38pSDrYtWbc1MIIx7M4j0x9AulyP62cqXTEjpdtO9rmZchadpNmButQB1VEhLmRc0fOksAcSAom/MrmCjBHM4IAVdnvCgVNcayM3h1ldedfkfQhJ/t4E3cQa9aRymzAmDOn/yje4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727776835; c=relaxed/simple;
	bh=L18kY3Hi4NirIDL3N4HZfh4hTLuUjuq/kXl6br9Vuus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJocmqni0D3nuuWqKNPs9SzLx6mV89pRy0Y9Q2WiVhmrcfpXYjhifuVXSO0sdTvuJGFOel8G1k5nndiWTaAenRdNIVxl5RE0QtCy7hqGUJ5ejmPmCiIeLf3VRWikx5Nd+yzG+4CLjtLMbaiaMyxFjqha7k4qzfHcLNCO4zYKmIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cs03Zo/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cs03Zo/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33108C4CEC6;
	Tue,  1 Oct 2024 10:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727776834;
	bh=L18kY3Hi4NirIDL3N4HZfh4hTLuUjuq/kXl6br9Vuus=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cs03Zo/FEqO4lAHTZKDnzIGcaqclATvBJNez8GLjHDpl7ojkgLRsOiEetGA9mZe0r
	 b4fi7Z8czM3hOMzed0PxROamiF/d1jY52i7xt+IIWm7Gl0Ybq8Kb+is8A+Hlh+HKbD
	 OiHdmLD0xOLj1PAXqqMfThk9hz5vkHYhmhJqlVODyJ97vJ5JmjpncME5YjW0oEm+Sn
	 +TqCYhXFLgeja8TvPmJVuapiwXgwQkq4GnBKd59xBliCPvYugUdmRxayIsaccOfPr7
	 ljk+OhI1LS0qJNKQTjgbSrn82WxKNGRt5At7Fap3Js5l+To/E90s7vEIk6e5iW/uD2
	 XrI2cAF4bmE7A==
Message-ID: <2b3566dd-71ac-4ef7-abdc-524277879aa6@kernel.org>
Date: Tue, 1 Oct 2024 12:00:27 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
To: Inbaraj E <inbaraj.e@samsung.com>, 'Stephen Boyd' <sboyd@kernel.org>,
 alim.akhtar@samsung.com, cw00.choi@samsung.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 mturquette@baylibre.com, s.nawrocki@samsung.com
Cc: pankaj.dubey@samsung.com, gost.dev@samsung.com
References: <CGME20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300@epcas5p3.samsung.com>
 <20240917101016.23238-1-inbaraj.e@samsung.com>
 <0d43a00985a815c1869ebc6c441a2aed.sboyd@kernel.org>
 <00f001db0a87$cd9ddfa0$68d99ee0$@samsung.com>
 <633ff284-101d-4651-833e-a6b01626c9a1@kernel.org>
 <011401db0b13$cbd045f0$6370d1d0$@samsung.com>
 <1c6c56f7-bdda-4e14-9910-80e0cda0d631@kernel.org>
 <03ca01db13e3$bc12e360$3438aa20$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <03ca01db13e3$bc12e360$3438aa20$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 11:24, Inbaraj E wrote:
>>>>>>>> CSI stop streaming through pm_runtime_put system is getting
>> halted.
>>>>>>>> So marking PLL_CAM_CSI as critical to prevent disabling.
>>>>>>>>
>>>>>>>> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> Please add a fixes tag. Although this is likely a band-aid fix
>>>>>>> because marking something critical leaves it enabled forever.
>>>>>>
>>>>>> Sure, will add fixes tag. As per HW manual, this PLL_CAM_CSI is
>>>>>> supplying clock even for CMU SFR access of CSI block, so we can't
>>>>>> gate this.
>>>>>
>>>>> Hm, I am not so sure. The CMU driver should just take appropriate clock.
>>>>> Sprinkling CLK_CRITICAL looks as substitute of missing clock
>>>>> handling/
>>>>
>>>> As per HW design, PLL_CAM_CSI is responsible for suppling clock to
>>>> CSI SFR, CMU SFR and some internal block of CAM_CSI. In this some of
>>>> the clock is not handled by any driver but it is required for CSI to
>>>> work properly. For example CSI NOC clock. So this is the reason we are
>> marking PLL_CAM_CSI as critical.
>>>>
>>>
>>> This is clock hierarchy for CMU_CAM_CSI block.
>>>
>>> PLL_CAM_CSI -----> DIVIDER --------> CSI_SFR clock
>>> 			|
>>> 			|----> DIVIDER --------> CMU_SFR clock
>>> 			|
>>> 			|----> DIVIDER --------> CSI NOC clock.
>>>
>>
>> And what is the problem in adding proper handling in the driver? You just
>> described case valid for 99% of SoC components.
> 
> Hi Kryzstof,
> 
> Sorry, but it seems I was not able to explain the issue. Let me add more
> details:
> So for CSI IP we have two clocks as ACLK and PCLK which needs to be
> handled by the driver during start and stop streaming. 
> 
> In BLK_CSI we have CSI IP along with other bunch supporting modules such
> as CMU_CSI, NOC_CSI, CSI_SFR. For all these components of BLK_CSI we have
> a single top level parent PLL clock as PLL_CAM_CSI. 
> 
> Now if we look into CSI driver perspective it needs only ACLK and PCLK
> clocks for it's operations. But to access CMU SFRs (including ACLK/PCLK
> or any other CMU SFR of BLK_CSI) we need parent clock keep supplying 
> clocks. While we try to gate ACLK clock, due to propagation logic of clock
> gating the CCF scans all the clocks from leaf level to the parent clock
> and tries to gate clocks if enable/disable ops is valid for any such
> clock. 
> 
> Issue here is that we are trying to gate PLL_CAM_CSI which itself is
> accessible only when this clock is enabled. In fact none of CMU_SFR will
> be accessible as soon as PLL_CAM_CSI is gated. CSI driver is not intended

Obviously, but your CMU is taking the necessary clock and enabled it so
what is the problem?

> to gate this PLL clock but only the leaf level clock which is supplying to
> CSI IP. So in absence of any alternate source of clock hierarchy which
> can supply clock for CMU_CSI we can't gate PLL_CAM_CSI. 
> 
> Please let us know if you have any other queries why we are insisting on
> marking PLL_CAM_CSI as CRITICAL clock.

This is so far quite obvious - just like in all other cases, you need
the top clock taken by proper driver. I don't think you are looking at
right drivers and right problem here.

Best regards,
Krzysztof

