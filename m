Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006471E376F;
	Mon, 21 Oct 2024 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504264; cv=none; b=s8ZNaGun2Y8Dzc49THjXVqwdDVoO04+KyaU/MuIVDYaMnmHyVaNuetTDLUbaGLy2kqTi3Sc6RtLnSpzgkqjSVQ5+r+FlAl+AXwnKF9iMNqTlnaniAHVPv+5gQGsbhMrmlzz3SDulNijwV3srx0ec3BaJKjGzRudBu+j1McqWTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504264; c=relaxed/simple;
	bh=X09WrzGaODsmNxi4MZUA10RHzluSaOG9VjS7+1qrpMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcJI0gbk8jGbo/MKpTlPq4dTJ+rc16zwL/S+HLMhn8qSjplacpusdJ+Cw4cyjkWx5tAVQfF8kcX1fnmLY3XR8Soo4jvTWsSbqfqQfR+gEoBbg7q4haoVifjk3gkCiJeykj6rQLfyeG7DXGkPswTsiudo7o1Chyh0SJYD+JjVe9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHYEo0d5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHYEo0d5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCEAC4CEE5;
	Mon, 21 Oct 2024 09:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729504263;
	bh=X09WrzGaODsmNxi4MZUA10RHzluSaOG9VjS7+1qrpMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JHYEo0d5RBJSQzYVDBixw1G5aM9qjoSrsn+EAPW2Od38FXWsFyTagP97ArwK4nehI
	 wgpMjlXN1ztJxTkKSnLEsC4WQfNwWktvtQI3ON7BE+wobvejo3eMFR8YQMFGAXWqCg
	 SW9dpNY3eCNWCny7SAJ3Iic/3yk1UPy6a9elw3hUTf/G0yYyt0G8VtRD8CRT/Jmo/k
	 6Pq/9IXcNWBVL751DRM8wqgEmol0bBgYClQpyCPuAzAXWOGbHRVg7m9FocnmeCPjog
	 v/d3kgdGPRi7OfdG7uAR8/3f7cNDbleZqiXdVkG+Gf0DRK30vR8fiSixakfP+mXbnd
	 o2umvzuUfVvBg==
Message-ID: <6f090ce4-fa29-40c5-8959-b57d135b3a31@kernel.org>
Date: Mon, 21 Oct 2024 11:50:57 +0200
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
 <2b3566dd-71ac-4ef7-abdc-524277879aa6@kernel.org>
 <08d001db1b01$94a9b9f0$bdfd2dd0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <08d001db1b01$94a9b9f0$bdfd2dd0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2024 12:45, Inbaraj E wrote:
>>> Now if we look into CSI driver perspective it needs only ACLK and PCLK
>>> clocks for it's operations. But to access CMU SFRs (including
>>> ACLK/PCLK or any other CMU SFR of BLK_CSI) we need parent clock keep
>>> supplying clocks. While we try to gate ACLK clock, due to propagation
>>> logic of clock gating the CCF scans all the clocks from leaf level to
>>> the parent clock and tries to gate clocks if enable/disable ops is
>>> valid for any such clock.
>>>
>>> Issue here is that we are trying to gate PLL_CAM_CSI which itself is
>>> accessible only when this clock is enabled. In fact none of CMU_SFR
>>> will be accessible as soon as PLL_CAM_CSI is gated. CSI driver is not
>>> intended
>>
>> Obviously, but your CMU is taking the necessary clock and enabled it so what
>> is the problem?
>>
>>> to gate this PLL clock but only the leaf level clock which is
>>> supplying to CSI IP. So in absence of any alternate source of clock
>>> hierarchy which can supply clock for CMU_CSI we can't gate PLL_CAM_CSI.
>>>
>>> Please let us know if you have any other queries why we are insisting
>>> on marking PLL_CAM_CSI as CRITICAL clock.
>>
>> This is so far quite obvious - just like in all other cases, you need the top clock
>> taken by proper driver. I don't think you are looking at right drivers and right
>> problem here.
>>
> 
> Hi Krzysztof,
> 
> In this case, platform driver need to get this PLL clock and keep it
> enabled always. As PLL_CAM_CSI is source clock for accessing CMU
> registers of CSI block, and PLL_CAM_CSI itself lies in CSI_CMU,
> driver need to prepare and keep it enabled always. This way other PCLK
> and ACLK clocks can be gated. But the PLL_CAM_CSI which is parent of the
> PCLK and ACLK gate clock won't be disabled. Hope this should not be a
> concern. 
> 

Yes, that's expected. It properly models the hierarchy and consumers of
clocks, while keeping something as critical does not model the consumers.

Best regards,
Krzysztof

