Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAEE374EA;
	Tue,  7 Oct 2025 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759846696; cv=none; b=fM4fmnBXB1kk7qUBPZy2AAhW4+plB8BOhmhQQE4LMgApOX5/RGsR8WsdS39z7wQEgnjVLjD5fGsftJNUlmgFLwOBXWb0g9+nH7Vyc6f4ckYpNTLehmkInxZQnCU2Gl8ItFgwpHUht9iGmniHSrBPQNoO9AN+dXrXlBqSol5n2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759846696; c=relaxed/simple;
	bh=G/NshkMJ1GZbtO3UIa9SqYi+nufWNB4mZlO3zufyam0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUXvIQHwbgnmtbf46RpJIL+u4dCa1sTU2JILIKmX6FF9n9LOLB9GG+ggCkgrGQ7GSxvHILHfBEEi2uGoVtBTIW12qnmem2r65ULlyZdCXD7PJXr36qnaWD1+HXR752vUrb53TR60WxnOjgEprCoakaeA0VPsnvSxtHnyIj6Bz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLEBgklu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLEBgklu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCD1C4CEF9;
	Tue,  7 Oct 2025 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759846696;
	bh=G/NshkMJ1GZbtO3UIa9SqYi+nufWNB4mZlO3zufyam0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VLEBgkluXeahLBiq1Q8q74aSbv9sUk8S4cduCCxdRDeAUEmAGnpgT2dd+ksDo9KZp
	 TPcksti+HsUH8pFCU61wkEbT/aYAaPpHRA+y6NTCHqP4xPH9SG397h9kS32wIqs24s
	 h44CpSGxzl9ePGWUWhOWW0kb3oAphuENyakg/QfeoPzuPIGh/Mzf9mUhmNsfi58zNj
	 Be3k2bbXybJQvjBHxrSobLIrxkG3l+2U+rKsvU0OWna64yWtAl8pECHgqRcOo8fBc4
	 MtJ1mNa8tuXV+8tIXqt8l2v/2d8Sc5OUh3ac4tc1vGBQ5kXqT4AZQ5EiAf//4c1t+e
	 YJ8MxK/7lqJ/w==
Message-ID: <d592eb91-84e9-4bdc-8363-1d0bfd47c17c@kernel.org>
Date: Tue, 7 Oct 2025 23:18:04 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20251006232125.1833979-1-royluo@google.com>
 <20251006232125.1833979-3-royluo@google.com>
 <8ca61364-df47-41f2-b0d1-f2a8a74ec728@kernel.org>
 <CADrjBPr7Jp_ZyGv2Krv6iLG0avgFWpcWJEO-Z=cEkhwEY-+z5Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CADrjBPr7Jp_ZyGv2Krv6iLG0avgFWpcWJEO-Z=cEkhwEY-+z5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2025 18:09, Peter Griffin wrote:
> Hi Krzysztof & Roy,
> 
> Firstly thanks Roy for your patches, it's great to see more Tensor
> support being posted upstream!
> 
> On Tue, 7 Oct 2025 at 01:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 07/10/2025 08:21, Roy Luo wrote:
>>> Document the DWC3 USB bindings for Google Tensor SoCs.
>>>
>>> Signed-off-by: Roy Luo <royluo@google.com>
>>> ---
>>>  .../bindings/usb/google,snps-dwc3.yaml        | 144 ++++++++++++++++++
>>>  1 file changed, 144 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
>>> new file mode 100644
>>> index 000000000000..3e8bcc0c2cef
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
>>> @@ -0,0 +1,144 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +# Copyright (c) 2025, Google LLC
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/google,snps-dwc3.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Google DWC3 USB SoC Controller
>>> +
>>> +maintainers:
>>> +  - Roy Luo <royluo@google.com>
>>> +
>>> +description:
>>> +  Describes the Google DWC3 USB block, based on Synopsys DWC3 IP.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - google,lga-dwc3
>>> +      - const: google,snps-dwc3
>>
>>
>> There is no such soc as snps, so you grossly misuse other company name
>> as name of SoC. Neither lga. Otherwise please point me to the top-level
>> bindings describing that SoC.
>>
>> You need to better describe the hardware here - why this is something
>> completely different than GS which. Or switch to existing bindings and
>> existing drivers. Did you align this with Peter Griffin?
> 
> I think (from what I've seen at least) this is the first submission
> for drivers in the Tensor G5 SoC used in Pixel 10 devices (which as I
> understand it isn't based on any Samsung IP). Hence the new drivers,
> bindings etc.


That could explain a lot. I would be happy to see background of hardware
in the bindings commit msg and the cover letter.

> 
> However the issue is that none of the other base SoC drivers on which
> this driver depends currently exist upstream (like clocks, reset
> driver, power domains, pinctrl etc). So it's very hard to reason about
> the correctness or otherwise of this submission. It is also likely
> that when those drivers are upstreamed things could change in the
> review process, to how it looks today in the downstream kernel.


Bindings and drivers can be contributed without core SoC support, but
then please describe the hardware (SoC) here. Having core support posted
earlier is of course preferred, but I think not a requirement.

Anyway, compatibles and all commit messages in this patchset are too
generic and need to reflect this actual SoC, not "Tensor" because we
already have a Tensor with USB. So basically based on existing support
all this patchset would be redundant, right? :)

Best regards,
Krzysztof
