Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44032FCC12;
	Tue, 26 Aug 2025 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197325; cv=none; b=TDIe4CZJ4pgDPV36Bt9Ud1TyN4PQVFa3fTPNb1377cEOj2wJPy9/u2oHKChigrnRlfYHkQktEWbZx7twnYymJYegvC0yW8VCcOpNe8P7/Al2/j2CN9LLEmo8PmRP081a4Lc1pq9i/+uepb+69orZGWtkuwOmRvyj6nVQXTy/3GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197325; c=relaxed/simple;
	bh=nrG+katxORgoz1280zOJ1BjvEfsOXCrjgMG9haaiYo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPZSnS4yCSjG9EAguETWMlBAMWEby5wrN4A2w9IZI2IZMv3IG1G5SGkD2fMNjkVyrNmM29jlHeeYqGZvfjtEUuqai6Pn49UHZ5DagYE0f7Lel9JGF32vq8Mmq4txwpY9HulG7kQZsb/dxaIesFaiWW0RKxivTCQBQ9mTq6Z5H3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0Nlq2+o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0Nlq2+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B0BC4CEF1;
	Tue, 26 Aug 2025 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756197325;
	bh=nrG+katxORgoz1280zOJ1BjvEfsOXCrjgMG9haaiYo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G0Nlq2+oVHJ6Cf52NPgTzUWVPenNhKHurD15yUf5QZrP3Iy1T8Bm4cBGvZBMcpvp0
	 3gE6tdomwYIrKJRtAUGcKHVG33jNRRBHUiPUW3Y+qlCj/Frvulqsw/0hd51qaijzsT
	 UmVsNItVGO6wcuLWiaFnD/xHb59dW6e3jIqL7zyaZHzcmci3Y6CXCx6yuum3xUfagL
	 JsZEU4AhbnD88yNuDQFeuqa+jUJj/ahsSjoqT0IVJAIiVGW0xoss9/XBGu2HC0j4Md
	 WtyiotIFbY3eC4K9KpolS/G49BwNc1a8Cm0XHFQ14DeHgiUqoqII6wnuW0PBhsjAPw
	 j1oEEKb9ie3UQ==
Message-ID: <83dc9435-5850-425d-b345-52e84ef9262c@kernel.org>
Date: Tue, 26 Aug 2025 10:35:19 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kauschluss@disroot.org,
 ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
 johan@kernel.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
 <CGME20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f@epcas5p4.samsung.com>
 <20250822093845.1179395-6-pritam.sutar@samsung.com>
 <20250824-rough-fresh-orangutan-eecb2f@kuoka>
 <007501dc1653$e36c3b50$aa44b1f0$@samsung.com>
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
In-Reply-To: <007501dc1653$e36c3b50$aa44b1f0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/2025 08:37, Pritam Manohar Sutar wrote:
> Hi Krzysztof, 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 24 August 2025 02:26 PM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
>> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
>> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
>> johan@kernel.org; m.szyprowski@samsung.com; s.nawrocki@samsung.com;
>> linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>> selvarasu.g@samsung.com
>> Subject: Re: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
>> ExynosAutov920 combo ssphy
>>
>> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar wrote:
>>> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
>>> compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
>>> "phy" and "ref". The required supplies for USB3.1 are named as
>>> vdd075_usb30(0.75v), vdd18_usb30(1.8v).
>>
>> Please do not describe the schema, but hardware. This sentence does not help
>> me in my question further.
> 
> This is a combo phy having Synopsys usb20 and usb30 phys (these 2 phys are totally different). 
> One PHY only supports usb2.0 and data rates whereas another one does usb3.1 ssp+ and usb3.1 ssp
> 	
> This patch only explains about usb30 (since these are two different phys) phy and omitted inclusion of usb20 reference (added separate patch for this patch no 3). 
> 	
> Hope this is clear.

No. That sentence still explains what schema is doing.

BTW, wrap your email correctly.

> 
>>
>>>
>>> Add schemas for combo ssphy found on this SoC.
>>>
>>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>>> ---
>>>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 23 +++++++++++++++++++
>>>  1 file changed, 23 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>>> b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>>> index f0cfca5736b8..96e5bbb2e42c 100644
>>> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>>> @@ -34,6 +34,7 @@ properties:
>>>        - samsung,exynos7870-usbdrd-phy
>>>        - samsung,exynos850-usbdrd-phy
>>>        - samsung,exynos990-usbdrd-phy
>>> +      - samsung,exynosautov920-usb31drd-combo-ssphy
>>>        - samsung,exynosautov920-usbdrd-combo-hsphy
>>>        - samsung,exynosautov920-usbdrd-phy
>>>
>>> @@ -118,6 +119,12 @@ properties:
>>>    vdd18-usb20-supply:
>>>      description: 1.8V power supply for the USB 2.0 phy.
>>>
>>> +  dvdd075-usb30-supply:
>>> +    description: 0.75V power supply for the USB 3.0 phy.
>>> +
>>> +  vdd18-usb30-supply:
>>> +    description: 1.8V power supply for the USB 3.0 phy.
>>> +
>>>  required:
>>>    - compatible
>>>    - clocks
>>> @@ -227,6 +234,7 @@ allOf:
>>>                - samsung,exynos7870-usbdrd-phy
>>>                - samsung,exynos850-usbdrd-phy
>>>                - samsung,exynos990-usbdrd-phy
>>> +              - samsung,exynosautov920-usb31drd-combo-ssphy
>>>                - samsung,exynosautov920-usbdrd-combo-hsphy
>>>                - samsung,exynosautov920-usbdrd-phy
>>>      then:
>>> @@ -262,6 +270,21 @@ allOf:
>>>        properties:
>>>          dvdd075-usb20-supply: false
>>>          vdd18-usb20-supply: false
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - samsung,exynosautov920-usb31drd-combo-ssphy
>>> +    then:
>>> +      required:
>>> +        - dvdd075-usb30-supply
>>> +        - vdd18-usb30-supply
>>
>> Why are you adding usb20 and usb30 suffixes to the supplies? These are
>> separate devices, so they do not have both variants at the same time.
> 
> This is a combo phy consisting of usb2 and usb3 phys combined. 
> To drive these separate phys, added suffixes for these supplies respectively.

But they are separate.

> 
> Moreover, gs101 is also using similar convention for its usb20 and dp supplies. 
> Added suffix for usb2 and usb3 as per our last communication https://lore.kernel.org/linux-phy/6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef@kernel.org/

Then please review patches on the list and help to improve them BEFORE
they got merged.

I questioned the suffix there, so I really do not understand why did you
added it.

> 
>>
>> From this device point of view, the supply is called dvdd075 or vdd18.
>> If you open device datasheet (not SoC datasheet), that's how it will be called,
>> most likely.
> 
> Yes, Agree. In device datasheet, suffixes are not mentioned, but in our board schematic it is mentioned. 
> Let me know your suggestion about adding suffixes?

I already said, multiple times on various discussions. You name these
based on how the inputs are called in this device.

Best regards,
Krzysztof
