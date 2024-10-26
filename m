Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E728210E5;
	Sat, 26 Oct 2024 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729944181; cv=none; b=jkpbYvBxUO1Ws4VkrnPR+un8JAOzajW8PdDvaJpVpThTJs06s4EGrS9SsJ5Ln3oRtdSZTAPQLaCUr/e7N/FeCGSNUIG9pqsOSp5WPLxGW/SCwjK8fNfUdeNX9O6HgYIfBZFFdSKhNc4bkJ8nIGo6O3rg8QMZfJeSPuGT7/wA3r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729944181; c=relaxed/simple;
	bh=Gp969nbLLy2qXaC10Zwhzqhb0xcH6uuDvqbV4Y4+IMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMCW+L+6og+L66/Cw9hUzm9XDlW3ZQ/fUZC39bzqRR7L/l449722x2RZA5sVU7dcvvWz1T8E5zdpReqaLd6cAjXA9j76BSLaCKO1JQ3glxFljviwvNAUN1rOrnSWS7M9y/qeBT8gFE0QPuQSAEvGzt6eef6+btaADJOxcIdNaCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQrHdDKB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQrHdDKB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86960C4CEC6;
	Sat, 26 Oct 2024 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729944180;
	bh=Gp969nbLLy2qXaC10Zwhzqhb0xcH6uuDvqbV4Y4+IMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BQrHdDKBs+/wzMDtVnpYpXv51A1APKjIaweOxov0TsCay/AK14LsdLQcCfoUY3bj8
	 6QNWneG1qMW5nwr5n+qSwsrw7/GdCba5CmmIbRlR3MkmTaOLZNt79ctD8EueutHdkK
	 OxGORMSudtNykoyeg3Eg3o3OfLtiyYUWvRiMLDJTv0QCb4DSRtKmrgikm5LbxAjPs+
	 B0fYuS2a4Yw00qDT9gtvRI8lf6LYBqc+Cs3tFPNEkC+E3LS10gjaLCoDNXk771thkr
	 lZDDUIrxq/GBtVuvrzEHNZwdz+XBe7piuOwCLRqltjtD2uVFuE7IWAnww3e21wYgXi
	 DP30CQuquv1iA==
Message-ID: <0fbf3170-659e-49d4-ab8a-35546bc2d00f@kernel.org>
Date: Sat, 26 Oct 2024 14:02:53 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <8240d3b4-3367-4f13-a42f-0f40da08e371@kernel.org>
 <8e6810f2-366a-4c52-8406-79ea3970b530@gmail.com>
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
In-Reply-To: <8e6810f2-366a-4c52-8406-79ea3970b530@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2024 13:59, Ivaylo Ivanov wrote:
> 
> 
> 
> On 10/26/24 14:53, Krzysztof Kozlowski wrote:
>> On 23/10/2024 11:17, Ivaylo Ivanov wrote:
>>> Hey folks,
>>>
>>> This patchset adds device tree nodes for multiple clock management unit
>>> blocks, MCT, SPI and UART for Exynos8895.
>>>
>>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>>> have been implemented in this series. Support for USIv1 and HSI2C will
>>> be added in the future.
>>>
>>> This patchset is dependent on [1] and [2], which add driver support for
>>> CMU and UART.
>>>
>>> [1] https://lore.kernel.org/all/20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com/
>> I cannot merge driver changes into DTS. Are you sure you have driver
>> dependency?
>>
>>> [2] https://lore.kernel.org/all/20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com/
>> I cannot merge this either. This is serial tree.
>>
>> Maybe you these are not really dependencies? What is here depending on
>> what, specifically? What prevents me from applying it?
> 
> The specified patchsets add driver functionality, as well as bindings,
> for serial and clocks. This patchset makes 8895's device tree a user
> of them. I guess it's not really a dependency, as 8895 devices should
> still function without the driver compatibles merged, but there's gonna
> be missing bindings.

So the only dependency is on clock bindings? If so, that's the only
message expected here. There are no other dependencies.

Best regards,
Krzysztof

