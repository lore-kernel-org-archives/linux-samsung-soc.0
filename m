Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB313D53C;
	Fri, 26 Apr 2024 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714123581; cv=none; b=br25NQ8zfkZEXjwMi5v4acvwV8NrMGiiIuTHjYajeXniaQ53pLadoRkQEnGaViibhLviDD2ZCnCGvgs8sT+Mfuc6pyhr+yQtbycaYzuyyH9UpmYomDt55YOe70tQTlJRWnmzb8EOJoC7riMvxcKdJQfaVW/qmOCJCrG7FSv9jgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714123581; c=relaxed/simple;
	bh=66P7ey8YBHqn+j6ITUbLuM7XN8SoUg14umgmGAm1O8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M39clywpM9NVk9pfJrLMFEKcceF9QL+L1kDPFIGL1K4JmAfh2g+icRy2ea11mmqGqOqsrpA4EVEFq0xwkXTscEyrsbggcPF+xk2KWKQzsxBZCROKmJJr0dyCqdHRFHdteVe9YN0/AMjJH/pZy91XbV9GtgFj5aol+qNuPA/Ryaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSTnxrBw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSTnxrBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06114C113CD;
	Fri, 26 Apr 2024 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714123580;
	bh=66P7ey8YBHqn+j6ITUbLuM7XN8SoUg14umgmGAm1O8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OSTnxrBwgHRZ4CaDE8Aascm0bJMZ4I91EpEazyO3InSyYA0pWKIUnuXiWhDrdcAWh
	 m7MmQ4VxcG6JNRmWe08ef0Hu7Qt2lpWwOKslEdWwZxER2aOHbu5THcNNomMmN9qfDD
	 yaa9Glto0MfCA9jgLYOGiPwSANdjGhGYLvIU6ncg+45cTyu8r5/aHU2Im847oAJaOf
	 GMWWFIMwXrWGBtPiwfGPzOKmDemeZcdxIQ7NSb6js9DfuHzZocD0oPkenkb5TN0lj6
	 r792y8V+ChnU+4xFN61aodobTMLDzo7UMC8SggwK0Hw+f3MogKpCh6Nb4rJOpvhdNe
	 NtJrQD8bCdhAA==
Message-ID: <6615daa1-6bb5-4da0-84b4-e84e7e0699c1@kernel.org>
Date: Fri, 26 Apr 2024 11:26:14 +0200
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
 <b271df59-fb7d-4637-8ac0-1e53be2f0ee4@kernel.org>
 <ad2cf931-0b51-4439-9963-bdb8a8b63b2b@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <ad2cf931-0b51-4439-9963-bdb8a8b63b2b@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/04/2024 11:21, Marek Szyprowski wrote:
> On 26.04.2024 11:02, Krzysztof Kozlowski wrote:
>> On 26/04/2024 07:24, Marek Szyprowski wrote:
>>> On 26.04.2024 02:24, William McVicker wrote:
>>>> On 04/25/2024, Marek Szyprowski wrote:
>>>>> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
>>>>> module driver") this driver is instantiated as MFD-cell (matched by
>>>>> platform device name) not as a real platform device created by OF code.
>>>>> Remove then of_match_table and related MODULE_DEVICE_TABLE to avoid
>>>>> further confusion.
>>>>>
>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> ---
>>>>>    drivers/clk/samsung/clk-exynos-clkout.c | 2 --
>>>>>    1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
>>>>> index 503c6f5b20d5..0c7f4e2aa366 100644
>>>>> --- a/drivers/clk/samsung/clk-exynos-clkout.c
>>>>> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
>>>>> @@ -75,7 +75,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
>>>>>    		.data = &exynos_clkout_exynos5,
>>>>>    	}, { }
>>>>>    };
>>>>> -MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
>>>> I understand these are duplicates of the exynos-pmu driver, but was wondering
>>>> if this will impact the exynos-clkout module from getting auto-loaded? Without
>>>> the MODULE_DEVICE_TABLE() defined, the aliases won't be created that trigger
>>>> udev to load this module and the mfd driver is obviously not going to load it.
>>> This driver loaded and matched only against the platform device name
>> Matched yes, but "loaded"? As in module loaded? Are you sure? There is
>> no MODULE_ALIAS, no platform_id_table with MODULE_DEVICE_TABLE, so with
>> this patch all aliases are gone.
>>
>> The old aliases indeed could have been used to load the clkout, even if
>> not used for matching.
> 
> Right, the proper solution is to add:
> 
> MODULE_ALIAS("platform:exynos-clkout");
> 
> I was convinced that the module_platform_driver() macro adds simple 
> module alias based on the driver name, but it looks that's not true. 
> Thanks for pointing this out. I will send v2 with the above alias then.

So just add simple platform ID table and MODULE_DEVICE_TABLE. It still
allows growing and in general is preferred than spreading aliases manually.

Best regards,
Krzysztof

