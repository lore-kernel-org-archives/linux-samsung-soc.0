Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F141E5B7A;
	Sat, 12 Jul 2025 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752308039; cv=none; b=Q4rHy0oXPqrNRARRcnkgeI3OzdIShhgXPyjpP+1LtghNCcYFAYy7OQkuRH0M564w/FfLSJLruaLCtYRJEu982995QfubWxwasM5njMUJyeapUQbHMl3pAHskyNZABkMlDyn3Wpg04z8OBmUoi15dRn9pspYJGuXI/dMlomkOGr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752308039; c=relaxed/simple;
	bh=VA30t7dnvV2wR8+/G/Sx+Tt/ksk9TRh6rruNucHezUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4ZPwoNOMZ+odzQCM0qAfEdKtE5F+cxm2pfjR6DBKff7s3nUpGdqHTkTy2sPcmiwpbQgVWEJ/Bswy6skfLM2me70grvwIAj0lA9C3Cekqdrdm4JwkWGVJjvCgarDQg/pRfpiCxfYj4KcBId/IZlNUaI9DvjbA5tSzu1HbvFTpvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJ7WnKkb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJ7WnKkb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB08C4CEEF;
	Sat, 12 Jul 2025 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752308039;
	bh=VA30t7dnvV2wR8+/G/Sx+Tt/ksk9TRh6rruNucHezUA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QJ7WnKkbEcxdwG+1MxX+s8ajsFIOU1r7Nvufpt/Y7fT+Hle06/5txFU6XxWWDyUak
	 QlK43GRwI36NsDQRurVYr5U6PxrWP43R497gp3Ms6Gahwc3hR00cJHG6XZxVN0LWVC
	 HvMGpWfH9KyfBVnqWLJy2pnEBCiUAV9CbNKTnNNo9Q20p71Lb3sZ+y0U+/l8eRHXxY
	 JVFoxoGJ3f87maqVa1VMhc/naXqtuZ458PvRq22Di55FFuxNQBCy9HvZNPSMP0gd4G
	 hUbc/+Iz7Vjz7ZgVk6Hsk3jev82n2RAkrd8OkHy36WZXjFidu1U2ia/zqT+rz+a1Ps
	 W7pVDDKmpfweA==
Message-ID: <9a2d0ad7-cb1f-473d-a91a-3a1b59b71280@kernel.org>
Date: Sat, 12 Jul 2025 10:13:51 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, andre.draszik@linaro.org,
 peter.griffin@linaro.org, neil.armstrong@linaro.org, kauschluss@disroot.org,
 ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
 s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
 muhammed.ali@samsung.com, selvarasu.g@samsung.com
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
 <CGME20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63@epcas5p3.samsung.com>
 <20250701120706.2219355-2-pritam.sutar@samsung.com>
 <20250706-fresh-meaty-cougar-5af170@krzk-bin>
 <07d301dbf0ae$0658cbe0$130a63a0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <07d301dbf0ae$0658cbe0$130a63a0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/07/2025 10:46, Pritam Manohar Sutar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: 06 July 2025 03:11 PM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
>> andre.draszik@linaro.org; peter.griffin@linaro.org; neil.armstrong@linaro.org;
>> kauschluss@disroot.org; ivo.ivanov.ivanov1@gmail.com;
>> m.szyprowski@samsung.com; s.nawrocki@samsung.com; linux-
>> phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>> selvarasu.g@samsung.com
>> Subject: Re: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
>> ExynosAutov920 HS phy compatible
>>
>> On Tue, Jul 01, 2025 at 05:37:01PM +0530, Pritam Manohar Sutar wrote:
>>> Add a dedicated compatible string for USB HS phy found in this SoC.
>>> The SoC requires two clocks, named "phy" and "ref" (same as clocks
>>> required by Exynos850).
>>>
>>> It also requires various power supplies (regulators) for the internal
>>> circuitry to work. The required voltages are:
>>> * avdd075_usb - 0.75v
>>> * avdd18_usb20 - 1.8v
>>> * avdd33_usb20 - 3.3v
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> No, really. Look:
>>
>>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>>> ---
>>>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 37 +++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>>> b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>>> index e906403208c0..2e29ff749bba 100644
>>> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>>> @@ -34,6 +34,7 @@ properties:
>>>        - samsung,exynos7870-usbdrd-phy
>>>        - samsung,exynos850-usbdrd-phy
>>>        - samsung,exynos990-usbdrd-phy
>>> +      - samsung,exynosautov920-usbdrd-phy
>>>
>>>    clocks:
>>>      minItems: 1
>>> @@ -110,6 +111,15 @@ properties:
>>>    vddh-usbdp-supply:
>>>      description: VDDh power supply for the USB DP phy.
>>>
>>> +  avdd075_usb-supply:
>>> +    description: 0.75V power supply for USB phy
>>> +
>>> +  avdd18_usb20-supply:
>>> +    description: 1.8V power supply for USB phy
>>> +
>>> +  avdd33_usb20-supply:
>>> +    description: 3.3V power supply for USB phy
>>> +
>>
>> None of these were here. Follow DTS coding style... but why are you adding
>> completely new supplies?
> 
> Digital supplies were here. Need Analog supplies for exynosautov920, hence added new Analog supplies; 'a'vdd075_usb, 'a'vdd18_usb20, 'a'vdd33_usb20
> 
> Will add "full stops" for DTS coding style in description.

You cannot grow one line change into 50 line change and retain the review.
> 
>>
>>
>>>  required:
>>>    - compatible
>>>    - clocks
>>> @@ -235,6 +245,33 @@ allOf:
>>>
>>>          reg-names:
>>>            maxItems: 1
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - samsung,exynosautov920-usbdrd-phy
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 2
>>> +          maxItems: 2
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: phy
>>> +            - const: ref
>>> +
>>> +        reg:
>>> +          maxItems: 1
>>> +
>>> +        reg-names:
>>> +          maxItems: 1
>>> +
>>> +      required:
>>> +        - avdd075_usb-supply
>>> +        - avdd18_usb20-supply
>>> +        - avdd33_usb20-supply
>>
>> Neither was this entire diff hunk here.
>>
>> This was part of other block for a reason.
> 
> Added regulators in driver. This block is added for regulators (other block does not have "required" field for power supplies)
> if excluded this block,  
> "make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml" will fail as mentioned below 


Nothing is explained in changelog/cover letter. You claim you only added
Rb tag. This is an entirely silent change while keeping the review.
Combined with not even following DTS style!

It's not acceptable.

Best regards,
Krzysztof
