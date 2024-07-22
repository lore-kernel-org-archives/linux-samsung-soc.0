Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA3C1BC40;
	Mon, 22 Jul 2024 06:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721630068; cv=none; b=PEkAanbUyJ3+LFIme1HdI/Uf0Nfz7h73rndLmW/iY/Ak1jyPhm5zJye/eUBkYv5wGx7Zcg6Oo5xKrJk0JKez3xagfmNCKPE42910Epj5LOyGRxjI+zuISSI07CAzus0rLqO6t1FOFBak9Bdafw7Asi+/cjQubBKg+eozbQXQigQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721630068; c=relaxed/simple;
	bh=GbJKaqxK+MeKpofMt1tINVbJk1zdx7SlcWgSDkygXaE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WUWPPVT4ccZWLkzgB/PjPfiFflbY1PZ0bFwqvskCaaMDrFjhMHxKzSocLColnK7vv1+BFs6GeUMF0syPAYRTLr8pOyA2pB45/j7CcWOE8TJebSEvT9pVRSubAxeU8zVM+4Y9+I+EXYdrfdT6Gj/7FWysAje0JR99uOyzyEDk6u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVv4+6jB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVv4+6jB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903A2C116B1;
	Mon, 22 Jul 2024 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721630068;
	bh=GbJKaqxK+MeKpofMt1tINVbJk1zdx7SlcWgSDkygXaE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=pVv4+6jB6wSz0fIMyeGhRXD0WjllADSyMXSc1vkUcidfsnEAmwCMB04ZNpW4leJtq
	 uFznkL1OibEYQ7fzZsXF3pZ6iCfAiXAUPRSgBeGx5KTApTSgflb51vsmonauZNBEkO
	 yDy3nd3uLJE9xI7Sfk+o28fvZEuY578iH5zXV19kbZPFOmvYk74yflZt0dttoSopCK
	 wPoUs4N0AuFflSpIs9d7UmXFaLX3UeKVyu+3RwZEDjIEeFS3XCGZmZ40BxXRxJBWRN
	 QwrL6WAErzSccurMoqONaRn+8/haeqiXKE7y47kj75meWkgteSzwBQxiOiUOfwtR7t
	 BxPnG1Xjd6idQ==
Message-ID: <39897871-b750-4901-9f72-823d3703ca50@kernel.org>
Date: Mon, 22 Jul 2024 08:34:21 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: samsung: Don't register clkdev lookup for the
 fixed rate clocks
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
References: <CGME20240510065909eucas1p20067042a45b26e0a58110ff439dcc1b8@eucas1p2.samsung.com>
 <20240510065901.535124-1-m.szyprowski@samsung.com>
 <6227c1fb-d769-462a-b79b-abcc15d3db8e@gmail.com>
 <77380bf6-8651-4373-bb7d-3fc0497417c0@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <77380bf6-8651-4373-bb7d-3fc0497417c0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/07/2024 08:26, Krzysztof Kozlowski wrote:
> On 18/07/2024 14:20, Artur Weber wrote:
>> On 10.05.2024 08:59, Marek Szyprowski wrote:
>>> Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
>>> clkdev entries") revealed that clock lookup is registered for all fixed
>>> clocks. The mentioned commit added a check if the registered name is not
>>> too long. This fails for some clocks registered for Exynos542x SoCs family.
>>> This lookup is a left-over from early common clock framework days, not
>>> really needed nowadays, so remove it to avoid further issues.
>>
>> This commit causes a warning to appear during startup on Exynos 4x12:>
>>  > [    0.000000] exynos4_clk_register_finpll: failed to lookup parent clock xusbxti, assuming fin_pll clock frequency is 24MHz
>>  > [    0.000000] Exynos4x12 clocks: sclk_apll = 400000000, sclk_mpll = 800000000
>>  >                	sclk_epll = 96000000, sclk_vpll = 108000000, arm_clk = 800000000
>>
>> The warning seems to come from exynos4_clk_register_finpll in
>> drivers/clk/samsung/clk-exynos4.c, where clk_get fails with error code -2.
> 
> 
> Indeed, so clk_hw_register_clkdev() was needed for clk_get(). I have a
> fix for this.

... and of course thanks for the report!

Best regards,
Krzysztof

