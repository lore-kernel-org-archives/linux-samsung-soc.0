Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA398226165;
	Mon, 30 Jun 2025 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272879; cv=none; b=CNTOxivnYU3vQl89Hoatr7IHCC+y7Hue3HEr57FmK+MLqeXSeod+f+hZBsndI2lnFFTnXgAEMcEwsGcU5zlWkw+keQELF4gmOix/OLBckBwncUGAM6XKdkMCYWwOfQkN3mkXDsR8U5xGgUn8E02deVYZkqNIwFrSMRrHq64YbJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272879; c=relaxed/simple;
	bh=vuDhO1E+0JgQZ3joYKllj+kVu+rr8nXDgvSoVbKxaBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgFI5r1RbeohJRBa3T3yDRB4avckVQ7sM/dAGwgruDYihCjxWh/6N7qBYkegGtoe2qNd4nVxsi2vWU6oaRSQ/CxsSm7Hc3Vd97PKWl4uX9BZk4Sv+8+ZvtMNaItP5cMIlyQs5M58C7vRE8FZCHalCBiFULKyCWlO2p50XkfbUro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlu1Vz/H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlu1Vz/H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF9AC4CEEF;
	Mon, 30 Jun 2025 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751272879;
	bh=vuDhO1E+0JgQZ3joYKllj+kVu+rr8nXDgvSoVbKxaBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jlu1Vz/HrWG80dDRxlPa37djs6aNVlmQvzSr6FDrQ30XOuQD/27RRG9jS3qMdUGzV
	 4hVjP46gWF94QkGSYfPKJh6W7th4GRRLocflylERDHkF5drmccFTANWPDGOKL6H04D
	 B2H+p4PZOwemAPrHpYSygL/SbIK1we38NCxChutLyrPSy7J0Ggl93/OucpdQwIWuhe
	 EtdJkjrIExhwEk008DXVO7oJZYQcWo4CLMtkCY1jOjXzaGqgeq/dxKmzeOWs/Cl1vX
	 iAuR73CA6CnTa1uzkorqbKm0SkCPcWhw0XvMSYZDhEdfVzcT9M7HQhN5V8F/oWVJxe
	 Ua+Y02VcPJ2aA==
Message-ID: <c2ca0751-e600-4278-85bd-4e6e6b4aa6d2@kernel.org>
Date: Mon, 30 Jun 2025 10:41:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <20250627-literate-talented-panda-cbac89@krzk-bin>
 <85c3658fdfa90636caac3b3fce295915@disroot.org>
 <efa167d1-a5f3-47cd-855d-250f41a5e883@kernel.org>
 <ab1a39df178b68e2f1d61a537e0d567c@disroot.org>
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
In-Reply-To: <ab1a39df178b68e2f1d61a537e0d567c@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2025 17:03, Kaustabh Chakraborty wrote:
> On 2025-06-27 14:44, Krzysztof Kozlowski wrote:
>> On 27/06/2025 15:44, Kaustabh Chakraborty wrote:
>>>>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>>>>> @@ -80,6 +80,14 @@ properties:
>>>>>        - const: vsync
>>>>>        - const: lcd_sys
>>>>>
>>>>> +  iommus:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  ports:
>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>> +    description:
>>>>> +      Contains a port which is connected to mic or dsim node.
>>>>
>>>> You need to list and describe the ports.
>>>
>>> -    description:
>>> -      Contains a port which is connected to mic or dsim node.
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description:
>>> +          Input port which is connected to either a Mobile Image
>>> +          Compressor (MIC) or a DSI Master device.
>>
>>
>> If this is only one port, then just 'port' property, but I have doubts
>> it should be one, because even you mentioned two - MIC could be the
>> input and MIPI DSIM would be the output.
> 
> DECON is the first device in the pipeline. So it should only have
> output.
> 
> It's either:
> DECON -> DSIM -> panel
> or
> DECON -> MIC -> DSIM -> panel
> 
> Exynos7870 doesn't have MIC, but other SoCs may have one.

Could be without ports entirely, but it is also fine to list port under.

> 
>>
>> Maybe if the MIC is integral part, it would not have been an input, but
>> then only 'port'.
>>
>>>
>>> I assume you want something like this?
>>> Is the formatting correct? Should there be a space between
>>> ports:$ref and ports:properties?
>>
>> Look at toshiba,tc358768.yaml or the simple-bridge (except you should
>> name the input and output ports).
> 
> Okay, thanks!
> 
> Therefore this:
> 
> -    description:
> -      Contains a port which is connected to mic or dsim node.
> +
> +    properties:
> +      port:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port which is connected to either a Mobile Image
> +          Compressor (MIC) or a DSI Master device.

and additionalProperties: false in ports level.


Best regards,
Krzysztof
