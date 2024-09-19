Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232D1DA23;
	Thu, 19 Sep 2024 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726747395; cv=none; b=M85ZhexddNYqOEM8s6RESy6tL+nQUYyzkaYxx78C7oU19sBRDPyT0sUKkubEItzsEwGwHGq2v1cf+7Zdgy/zcga8RjaSiWbP+a6sycyDv8vw8OwxRVHOeeVTuVTlGCgRh4qGvIQI49JEpnahCGCvLftDX85fzYh+aEouycDp+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726747395; c=relaxed/simple;
	bh=teahakDqIA9+ghw7dKhk5KIoyLfefOvhzf0eXt39Qec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVQQrTAwmsC23+7r1CbgJjdOvnzuqeOEqgf9Q7d1xkRLIUivemyijzNew72DxLZE7DTAtd2bvzICfz1j79l3F84W1gKfWC5z5/RmSVrDxZXOF0+V+cFrO6bmd0VkVnpB1njOC8pIFqxeGikkmOYsP5QrSKSTKSVhzyJ+zVTfk8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDvPOKfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDvPOKfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E21C4CEC4;
	Thu, 19 Sep 2024 12:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726747394;
	bh=teahakDqIA9+ghw7dKhk5KIoyLfefOvhzf0eXt39Qec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rDvPOKfbq9KHyOx5YMOYo2Hjx1mO77vuvKBt2jOPuA/gxlqvy3Y8Lwt5oXZ1jd8mZ
	 wpLlWdIHP5DGZ8KWzoN5Gw8Oi0HOi5f2zObY5cVrYqSldFotzhKtPvRU8BcxBPrNkO
	 hfgkZIWwT+ZAu4eDoWTR8dk6HufK70XVVYbCPwC1UZDbJy1R4F6mm1hFrJHhzwKdmd
	 T6hNRFPPc0Ne0M3uic1Lg2E/xUr7uaqcNj1N2Nx4oCw7B37C6qG0uWos3sREoB0yzA
	 JQ9YqJ6XG7gs1rFPbkLg+xpwRLAaWKTBDVMnRRKctAKHhMhcs5K8bv9D32NZ50TdJ1
	 BG1NvCZUBbG8A==
Message-ID: <633ff284-101d-4651-833e-a6b01626c9a1@kernel.org>
Date: Thu, 19 Sep 2024 14:03:08 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <00f001db0a87$cd9ddfa0$68d99ee0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2024 13:33, Inbaraj E wrote:
> 
> 
>> -----Original Message-----
>> From: Stephen Boyd <sboyd@kernel.org>
>> Sent: 19 September 2024 15:51
>> To: Inbaraj E <inbaraj.e@samsung.com>; alim.akhtar@samsung.com;
>> cw00.choi@samsung.com; krzk@kernel.org; linux-clk@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
>> mturquette@baylibre.com; s.nawrocki@samsung.com
>> Cc: pankaj.dubey@samsung.com; gost.dev@samsung.com; Inbaraj E
>> <inbaraj.e@samsung.com>
>> Subject: Re: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
>>
>> Quoting Inbaraj E (2024-09-17 03:10:16)
>>> PLL_CAM_CSI is the parent clock for the ACLK and PCLK in the
>>> CMU_CAM_CSI block. When we gate ACLK or PCLK, the clock framework
>> will
>>> subsequently disables the parent clocks(PLL_CAM_CSI). Disabling
>>> PLL_CAM_CSI is causing sytem level halt.
>>>
>>> It was observed on FSD SoC, when we gate the ACLK and PCLK during CSI
>>> stop streaming through pm_runtime_put system is getting halted. So
>>> marking PLL_CAM_CSI as critical to prevent disabling.
>>>
>>> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
>>> ---
>>
>> Please add a fixes tag. Although this is likely a band-aid fix because marking
>> something critical leaves it enabled forever.
> 
> Sure, will add fixes tag. As per HW manual, this PLL_CAM_CSI is
> supplying clock even for CMU SFR access of CSI block, so we can't
> gate this.

Hm, I am not so sure. The CMU driver should just take appropriate clock.
Sprinkling CLK_CRITICAL looks as substitute of missing clock handling/


Best regards,
Krzysztof

