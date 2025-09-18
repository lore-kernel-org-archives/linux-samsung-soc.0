Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5E625634;
	Thu, 18 Sep 2025 02:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758163408; cv=none; b=XCZZ0SaQiPC3+mEbZuiXyhbHrGpArUE6QNfvEcY6pv+s9QzeAOeQ5Kc9iKukmEdxYZGQnWEnstNGKcDQpkuYm60E0GY6x8TvbL/J/4l0/igmJjqNJGyVI6TgddV+IZ8c/mMR4S5FCoVilWf73fcAIEoulLqyXRJI/L+pWxDGmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758163408; c=relaxed/simple;
	bh=FAcw+FQV7zWtN4dnW973kFvdMmlphcacFHp3l6fofq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMQSXe4whZ0merp9r4LuAJ5JKxn2kxQNyXAiO922hXXfowrS7zGgmQ4ey81ZAnAnWN9LuwWiK+dWuhUnWEWLHT37a2ngsdOtCY1G8CF1fHR5pENTmDG/+D7cB3ZB3y0hWBAjg87Y3qrzzUFX15gguuZOP6gTG/MKKm/lG7TZWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gro7LzcJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gro7LzcJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E0AC4CEE7;
	Thu, 18 Sep 2025 02:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758163407;
	bh=FAcw+FQV7zWtN4dnW973kFvdMmlphcacFHp3l6fofq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gro7LzcJP00FzEQ8tzw4+teFGIHP0ik+ncwYjWtteoFULAqIyq7Xf6fs5MAf3eSMV
	 wDeckgiCv+7C+oWGb5DFO4vCoHCGCaW/9lvDBXqDDU1rM65tUdySFgNUw+TNk/5UPA
	 /KiNTep48aMsSnc2guGiygUNjORi018ZntdVr1Vtph8s3XRD9tKAVyRyw8o9viOo0n
	 dpJ8TQzkktx1UV0I52j0KhCywed6WKRGcn6J83mnrzVNtS6WCC3TZ6LrMtMcKols5E
	 kX6ThFTBrHcsv59RCv/5MwHZ+/VBYbs3aSUX+9wrvPsESZmmcr7ABDhssEupSJSrPP
	 VZt5ehN1nynlg==
Message-ID: <67c2b5c6-7559-4ae9-b2af-e839b6b8f4d5@kernel.org>
Date: Thu, 18 Sep 2025 11:43:22 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kauschluss@disroot.org,
 ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
 m.szyprowski@samsung.com, s.nawrocki@samsung.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
 <CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
 <20250903073827.3015662-2-pritam.sutar@samsung.com>
 <20250904-interesting-lovely-ringtail-38bbef@kuoka>
 <000001dc1d70$aebf7d80$0c3e7880$@samsung.com>
 <87857202-b436-4476-9384-67566126d844@kernel.org>
 <001001dc1d85$c0d56a60$42803f20$@samsung.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <001001dc1d85$c0d56a60$42803f20$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 19:21, Pritam Manohar Sutar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 04 September 2025 03:12 PM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
>> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
>> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
>> m.szyprowski@samsung.com; s.nawrocki@samsung.com; linux-
>> phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>> selvarasu.g@samsung.com
>> Subject: Re: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
>> ExynosAutov920 HS phy compatible
>>
>> On 04/09/2025 09:51, Pritam Manohar Sutar wrote:
>>> Hi Krzysztof,
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: 04 September 2025 12:18 PM
>>>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>>>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
>>>> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
>>>> andre.draszik@linaro.org; peter.griffin@linaro.org;
>>>> kauschluss@disroot.org; ivo.ivanov.ivanov1@gmail.com;
>>>> igor.belwon@mentallysanemainliners.org;
>>>> m.szyprowski@samsung.com; s.nawrocki@samsung.com; linux-
>>>> phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
>>>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> linux-samsung- soc@vger.kernel.org; rosa.pila@samsung.com;
>>>> dev.tailor@samsung.com; faraz.ata@samsung.com;
>>>> muhammed.ali@samsung.com; selvarasu.g@samsung.com
>>>> Subject: Re: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy:
>>>> add
>>>> ExynosAutov920 HS phy compatible
>>>>
>>>> On Wed, Sep 03, 2025 at 01:08:22PM +0530, Pritam Manohar Sutar wrote:
>>>>> Document support for the USB20 phy found on the ExynosAutov920 SoC.
>>>>> The
>>>>> USB20 phy is functionally identical to that on the Exynos850 SoC, so
>>>>> no driver changes are needed to support this phy. However, add a
>>>>> dedicated compatible string for USB20 phy found in this SoC.
>>>>>
>>>>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>>>>
>>>> You just dropped all tags without explaining why.
>>>
>>> Regretted inconvenience.
>>>
>>> There were significant changes in supplies' names in driver and
>>> schemas (patch-set v8). This led to make changes in patch no 5.  And
>>> review for these changes is needed.  Hence, removed RB tag in this patch-set.
>>>
>>> There was a ask for the same https://lore.kernel.org/linux-
>> phy/000401dc18cd$ec02a1b0$c407e510$@samsung.com/#:~:text=Let%20me%
>> 20know%2C%20because%20of%20above%20changes%2C%20should%20be%20
>> removing%20your%20%0A%27reviewed%2Dby%27%20tag%20from%20patch%
>> 201%20and%203.
>>>
>>
>>
>> Where in the changelog you explained why you dropped the tags?
> 
> Along with supplies' names, there were similar commit messages 
> for patch no 1, 3 as patch no 5 (v7). (though, they were explaining 
> schema more than h/w). Changed commit messages of the 
> patch no 1, 3, 5 (v7) as per reference commits and would like 
> to get them reviewed again, so did not add RB for patch 1 and 3,
> which you had given RB (in v7). 

I do not have time to review the same second time and I find such
request quite a waste of my time. It's v8 so I am surprised to see it
getting changed even after review.


Best regards,
Krzysztof
