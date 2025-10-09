Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A7C7082D;
	Thu,  9 Oct 2025 07:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759994782; cv=none; b=WtHeaWBFQcPmekW1hX5qz+wsfAHYOBHInviUg25y3+UJW2Hukg84vZlFfINCTXMafx28p7SiUJJLL0YLzEg1XTargp6i98nplan21lkfHqJfNNcl9yxTKty0rC5/iefRbMibXQuvzQH2AFbicB8LCAaqREIPelMsql7gjotHCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759994782; c=relaxed/simple;
	bh=aUZwCKZriS2mx9oDnUC1YNntsIyiN+ubGEGIPBl8MwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luKnM0udHhQnNYZ72lJHSkzw939dvM1ixNSCPPi/Axwyg4VYkfqaERV9o4RErS+B3wS1jy4CYYXzVFCqHPBQ87pNgQg8Vhtt6TGq/aFCi42ZtBIoM8//R9byTww6/nwaA2BdQhVPjyN5+6ne9mFqggGn3SH8fyydJpNaRotTeII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=En7eMwMe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="En7eMwMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F072C4CEE7;
	Thu,  9 Oct 2025 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759994781;
	bh=aUZwCKZriS2mx9oDnUC1YNntsIyiN+ubGEGIPBl8MwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=En7eMwMeJGkepvaJ8q2srUeiz31pgUGFFzkOIzFoManANQwcx6mbKGZs+E2G7b58P
	 uZJjFFiIWFCKTpHTzKGIGNNsYl8lBBzUWfpLKaoZOTvSywrOLh9EMAF+2P1msiWk1j
	 f4qZavZzm/ghXKSO4E4w3GSDLjAhtXbjlpAQYV0xyZTFZwlDa1Zac09X2UkPkd9A3s
	 w/3kITa3qYybgFGNJ3JBpHGYHjTwF8Sx7RUD+L2f0+MepcjlTfSkRtI46gBSUR3//A
	 ht2Up9KKwspeIpZCwqN7VC0V9TpD4gEHaULy3BBKSSwOsJxFW3gyj4G+H+VUkpD/W9
	 9u2X+9Q3z94Og==
Message-ID: <9ee299c1-edf4-4738-8b5e-6a684f683fbd@kernel.org>
Date: Thu, 9 Oct 2025 16:26:08 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>,
 Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20251008060000.3136021-1-royluo@google.com>
 <20251008060000.3136021-2-royluo@google.com>
 <8966b6a9-ff70-4833-a5c7-c6d6c13c6c8b@kernel.org>
 <CA+zupgwLu-y26X9eiENyC28i9ZxCkuhb0X8X9H6HBpqkqJ7O3w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CA+zupgwLu-y26X9eiENyC28i9ZxCkuhb0X8X9H6HBpqkqJ7O3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/10/2025 14:12, Roy Luo wrote:
> On Wed, Oct 8, 2025 at 4:56 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 08/10/2025 14:59, Roy Luo wrote:
>>> Document the device tree bindings for the DWC3 USB controller found in
>>> Google Tensor SoCs, starting with the G5 generation.
>>>
>>> The Tensor G5 silicon represents a complete architectural departure from
>>
>>
>> G5 does not have a model number like G1-G4?
> 
> There's no model number for G5, I'm sticking to the existing "gs" prefix
> as they're still in the same SoC family.  Please let me know if you have any
> concerns.
> 
>>
>>> previous generations (like gs101), including entirely new clock/reset
>>> schemes, top-level wrapper and register interface. Consequently,
>>> existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,
>>
>> Do not reference drivers. Explain the hardware.
> 
> Ack, all mentions of "driver" will be removed in the next patch.
> 
>>
>>> necessitating this new device tree binding.
>>>
>>> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
>>> Dual-Role Device single port with hibernation support.
>>>
>>> Signed-off-by: Roy Luo <royluo@google.com>
>>> ---
>>>  .../bindings/usb/google,gs-dwc3.yaml          | 145 ++++++++++++++++++
>>>  1 file changed, 145 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
>>> new file mode 100644
>>> index 000000000000..9eb0bf726e8d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
>>> @@ -0,0 +1,145 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +# Copyright (c) 2025, Google LLC
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/google,gs-dwc3.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
>>> +
>>> +maintainers:
>>> +  - Roy Luo <royluo@google.com>
>>> +
>>> +description: |
>>
>>
>> Do not need '|' unless you need to preserve formatting.
> 
> Ack, will fix this in the next patch.
> 
>>
>>> +  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
>>> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
>>> +  features Dual-Role Device single port with hibernation add-on.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - google,gs5-dwc3
>>> +
>>> +  reg:
>>> +    minItems: 3
>>
>> Drop
>>
>>> +    maxItems: 3
>>> +
>>> +  reg-names:
>>> +    description: |
>>> +      The following memory regions must present:
>>> +        - dwc3_core: Core DWC3 IP registers.
>>> +        - host_cfg_csr: Hibernation control registers.
>>> +        - usbint_csr: Hibernation interrupt registers.
>>
>> Drop description or move it to items in reg. See other bindings.
> 
> Ack, will use an item list in reg instead.
> 
>>
>>> +    items:
>>> +      - const: dwc3_core
>>> +      - const: host_cfg_csr
>>> +      - const: usbint_csr
>>> +
>>> +  interrupts:
>>> +    minItems: 3
>>
>> Drop
> 
> Ack, will use an item list instead.
> 
>>
>>> +    maxItems: 3
>>> +
>>> +  interrupt-names:
>>> +    description: |
>>> +      The following interrupts must present:
>>> +        - dwc_usb3: Core DWC3 interrupt.
>>> +        - hs_pme_irq: High speed remote wakeup interrupt for hibernation.
>>> +        - ss_pme_irq: Super speed remote wakeup interrupt for hibernation.
>>
>> From where did you get this style? Don't write bindings with chat gpt or
>> whatever other tool. it is a waste of our time.
> 
> I referenced the style from a recent dt binding change [1] that adds
> "Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml".
> I thought it would be a good reference because it's relatively new
> and is also a binding for SNPS dwc3 glue logic. Perhaps that style
> doesn't apply here because qcom,snps-dwc3.yaml supports
> multiple compatible and here we have only one?
> 
> Just to clarify, I'm a Gemini user and this patch is 100% organic,
> hand-crafted by a living human brain :)
> 
> [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@oss.qualcomm.com/

Your code is not at all like above, you do not have any variants here,
so you cannot use that syntax - is not correct here.

Best regards,
Krzysztof
