Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EFC13C90F;
	Fri, 26 Apr 2024 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714122132; cv=none; b=f2Lk+HWJF6vWp0Juk7GvTn4JSBCB1ImAIENK7SkVaZeksOT0ttDMc7Rae45DhY9Mh4nMOb4HBjwxfFLEDztmU2dFd4q0pVio89nmz7No+XGmAXwm4qPmAtTLFtlH+JzyDsiZdqRV263MNQtHcneRufdhC1J42isnkD3o6ZLuT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714122132; c=relaxed/simple;
	bh=jnQNC7YsYknHxVgl4mi2foO58zBNmHwtJ7PaDqgmmow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIZIezydRPddWL/K6+ux2AnzTVCwfHaaM2+RExIBA2Gjr1gpURIXfzYtpSX9uYXLO9JDjP/tZ/DkXp8+7zJzAZPhTu4PWY/6RLkHRzTmmwJR3MYYkQnhK3R4S1W1WuUsHW7x8OLCUrbITxjp+MzPPU8VI1ymBf8wPQzdBilPc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnIWQVfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnIWQVfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB7AC2BD10;
	Fri, 26 Apr 2024 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122131;
	bh=jnQNC7YsYknHxVgl4mi2foO58zBNmHwtJ7PaDqgmmow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OnIWQVfK20aSH5blZkr5+ZqsNctgb43NWt1lJBFRWV9QVWNkTTt+wx30ZUEbuZwC9
	 vvndQbKVj8vVl1OQ8kGX5+NGS1jBQmwm5cQQXHCi3PpZ9Fq6lfL0RCbzg22VPSsSDb
	 UAGa8jk4Xk4tHlE3Iwl1w5W7OG6BVc77/FNP2yobkVwihHpXOvyW3qinzrTduZ67DH
	 60UJeZNDa8rHX1yP/DkJNnfD8mFyjXuOusj4q/N1Y5owvPRSFV80gIskwVXu99ZC41
	 qsxyYT1GLt/NAujNB3HBLFlWFJcYBwl8QWkx1SnjzPTs2Ng1Q+uyzEGlgv+Ig5uF9y
	 moUQcIg7TBmtw==
Message-ID: <b271df59-fb7d-4637-8ac0-1e53be2f0ee4@kernel.org>
Date: Fri, 26 Apr 2024 11:02:04 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 William McVicker <willmcvicker@google.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 David Lechner <david@lechnology.com>, Bjorn Andersson
 <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <CGME20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7@eucas1p1.samsung.com>
 <20240425091429.948467-1-m.szyprowski@samsung.com>
 <Zir0Rhm7jZoF8r04@google.com>
 <d62aeaa2-8d3e-409e-acea-23b9e6ff0b76@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d62aeaa2-8d3e-409e-acea-23b9e6ff0b76@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/04/2024 07:24, Marek Szyprowski wrote:
> On 26.04.2024 02:24, William McVicker wrote:
>> On 04/25/2024, Marek Szyprowski wrote:
>>> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
>>> module driver") this driver is instantiated as MFD-cell (matched by
>>> platform device name) not as a real platform device created by OF code.
>>> Remove then of_match_table and related MODULE_DEVICE_TABLE to avoid
>>> further confusion.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/clk/samsung/clk-exynos-clkout.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
>>> index 503c6f5b20d5..0c7f4e2aa366 100644
>>> --- a/drivers/clk/samsung/clk-exynos-clkout.c
>>> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
>>> @@ -75,7 +75,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
>>>   		.data = &exynos_clkout_exynos5,
>>>   	}, { }
>>>   };
>>> -MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
>> I understand these are duplicates of the exynos-pmu driver, but was wondering
>> if this will impact the exynos-clkout module from getting auto-loaded? Without
>> the MODULE_DEVICE_TABLE() defined, the aliases won't be created that trigger
>> udev to load this module and the mfd driver is obviously not going to load it.
> 
> This driver loaded and matched only against the platform device name 

Matched yes, but "loaded"? As in module loaded? Are you sure? There is
no MODULE_ALIAS, no platform_id_table with MODULE_DEVICE_TABLE, so with
this patch all aliases are gone.

The old aliases indeed could have been used to load the clkout, even if
not used for matching.

> ("exynos-clkout") since the mentioned commit 9484f2cb8332. These OF IDs 
> defined as MODULE_DEVICE_TABLE and of_match_table are leftovers from the 
> old (pre-9484f2cb8332) instantiating method.and should be removed by 
> that commit too.

Best regards,
Krzysztof

