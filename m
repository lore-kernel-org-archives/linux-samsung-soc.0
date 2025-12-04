Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CD935771C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Dec 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764882404; cv=none; b=JGX4tcf/LJtBwbOxTOkrt9rj/P+pz/Ce6x5D87yszGgAkW6SgbD+GmRJXZeHVl6ZG0BkhHbmTiNfNFIZcgC2Lbhz9kmSmND9FLMwfIZIuyyWI0/6N9gINqKxXA1NACvHgd+vuL6P0hsQ4qZctUmFLi3jEX51hOTnzWw3DGb4NxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764882404; c=relaxed/simple;
	bh=4gvVbQE7D0PuHRtcnXsG0f97rNAS/tXWI1ikykCyHu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9bGvjJx2dCqdHHRPADgIgWPaCm2ZjyUJPYUfkVyrPfaT4FJIdolbt5Cn4/Ma4tVQz2rG15qBLcba8proGB0U3oAibJ0V1mf4hQlJGzo9SrcQRpN2T2ly4BVRAw7H0hTRBFkCfNF7k7L+wXqz91yLwCJyZgw+n20KdreGXfWcFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=djqu+2Vm; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="djqu+2Vm"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so1641166b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 13:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764882402; x=1765487202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEywpXmQqNwB/TS6CB+654YlLSBuSDJ8XZY6ihxAXlI=;
        b=djqu+2VmnFSX1eNkLgMcZSC76MyQqZJwykltkAiEH9TEDyBHxUj+wsPz+0imNjTNFh
         tArfYbDVmjQ0qhybhEQ/SvjVa0g/j+CO2nIOiMU+FM2a/a/51FRvgonQvVNoKxI2XB5b
         mjnfZeXwZLpra7NH/B9wtV2kPmMPVPvnhL6+bXNHGYUxGtsphW+Y6soTDEd13ESvp3+D
         ewgdb0+iGv5wQZwyWbRHD5Ninq8frMBqqGE8xM6Jki7K2SouOq5nTrzMTMYZJZUI7lh9
         56yvp1OJbSw6olQLmwzqwax6W94vovgJUIXIO3amNxs/L0VjFypqsbQy/FgLh5WRTHCT
         rjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764882402; x=1765487202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEywpXmQqNwB/TS6CB+654YlLSBuSDJ8XZY6ihxAXlI=;
        b=IOV7n4sqHndwTNpIpIktbeGrCCSWviWCikAcHWqxakDigyevJQm95jWzspWv9i3BZf
         2Fn+N4uVqNLsY7O2HxkvRxBkgl2SnpkwDtFC4q9q/Cwmfxi58ApvhUj2c16JpL//R7dA
         ++G2slGtHxmlS2Z3ltPqQ7h31vcmvjjLFUNPJHU7h10eMi32ynh+3IVbo9p4G8KSXaiF
         TtbAw35fanuvB+oEc0mYakWzABzYCbBdAHXOcTFFgJP0DIZy5Ha8eJkyJPQCJms3SkIb
         NyAVw6iOqv3ZJRCZQtkNbDwSIBM2i9mwuJwZXFZS71MvsvKPdPpso07j/Ucd/XpfEEn1
         hm8w==
X-Forwarded-Encrypted: i=1; AJvYcCXY7cR5cdl/QZ8pjJM7poldh1t2sNDN7fB5JjWWK/Jt96SNUZ1lLdMIgu6AhsRF9dvckd3WRJe+sEmGRT7YoyQ/vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQsSJdo6Qjsdn6tUflh7wjq12850ztXgm6osFkw4lZ5ZDbsVg
	0QHHQOXCsSOF9NX2L60m1aPup3W+9Oi/Jksp3iArXKfkjlGXTyDMefyf+xUSdCj6XA==
X-Gm-Gg: ASbGnctzsu6HqEKHiGpQZ9wCSAaUublYZJRTlWIPaAb1UxlXeWkqOGmx//uS1ZhSyUS
	GTNz/fA+DXTS1pf4wEcQpl/jBBcf+dGSRQd7NwE9ATVXeJVBsd5N5esxbiyf3Fh0UkjQjINUjH6
	87+fWpDYnPkLHHTFEzIbN0MpYWCvC+CDqMKQmXPhB4OneoRIhxOtIhfkPtzy75W8A2CUwNBSKhM
	mypVZeJx3JkV8cJpPS1UbQMMWzi1SJOWOyNZGO5Ii0vE0gFPIDXRKB2kbvknnrZuYesHpnWnw6X
	3boLoKWMC+OMZC6PIiOqArZGI3xziR3S7WucGec0/Ic0efKndrZQHCMqYqzeCGc1T885ExW6IdC
	9Tn53IDB7KJWk/E9b6o3XgGEi5I8Fl0JuXAeCWE3z0ony5Hk7NeCsLiM7laZQFlUjTY2siis91p
	E2cHbH9Uv4DeEwlHIvN99RJ834EpRekGyH2Qq9iybs/M+iMgIqXUWz3frBD6seefzbgwoJFu6dn
	gWWAkkRcMC50Q==
X-Google-Smtp-Source: AGHT+IHnjdg9J5Dv3DjKTAgPlUY1x6NH1Rmw5oo9i+e3bENd1vNzyqMp5aLbF57/RFRsp96OPvtSGQ==
X-Received: by 2002:a05:6a20:12ca:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-363f5db7158mr9697293637.24.1764882401346;
        Thu, 04 Dec 2025 13:06:41 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:d11d:bcc2:2743:bf88? ([2a00:79e0:2e7c:8:d11d:bcc2:2743:bf88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf817c3e6c3sm1857768a12.17.2025.12.04.13.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 13:06:40 -0800 (PST)
Message-ID: <19e501f4-da1b-4a91-8681-da78922bc302@google.com>
Date: Thu, 4 Dec 2025 13:06:39 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759
 charger
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
 <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
 <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
 <20251125-amorphous-bobcat-of-whirlwind-afdab1@kuoka>
 <7ad91325-e881-461d-b39e-6ff15d98b3c5@google.com>
 <076777c3-b238-4d1d-a11b-602027348ee4@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <076777c3-b238-4d1d-a11b-602027348ee4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/2/25 5:00 AM, Krzysztof Kozlowski wrote:
> On 26/11/2025 00:48, Amit Sunil Dhamne wrote:
>> On 11/25/25 1:56 AM, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 23, 2025 at 06:34:05PM -0800, Amit Sunil Dhamne wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 11/23/25 1:28 AM, Krzysztof Kozlowski wrote:
>>>>> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>>>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>>>>
>>>>>> Add bindings for Maxim max77759 charger device.
>>>>>>
>>>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>>>> ---
>>>>>>    .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
>>>>>>    1 file changed, 36 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..71f866419774
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>>>>>> @@ -0,0 +1,36 @@
>>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Maxim Integrated MAX77759 Battery charger
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Amit Sunil Dhamne <amitsd@google.com>
>>>>>> +
>>>>>> +description: |
>>>>>> +  This module is part of the MAX77759 PMIC. For additional information, see
>>>>>> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
>>>>>> +
>>>>>> +  The Maxim MAX77759 is a dual input switch mode battery charger for portable
>>>>>> +  applications. It supports wired and wireless charging and can operate in buck
>>>>>> +  and boost mode.
>>>>>> +
>>>>>> +allOf:
>>>>>> +  - $ref: power-supply.yaml#
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: maxim,max77759-charger
>>>>>> +
>>>>> This should be just folded into parent node, no need for separate
>>>>> charger device or is just incomplete.
>>>> Thanks for the review! You are right, the binding is incomplete. This
>>>> charger block actually listens on its own I2C address, distinct from the
>>>> main PMIC.
>>>>
>>>> I will update v2 to include the reg property. I will also add the
>>> AFAIK, the main (parent) device schema does not reference children via
>>> any sort of addressing, so reg here would not be suitable.
>> I agree that currently nvmem and gpio devices (which are children of
>> PMIC device) are not referenced using any address. But I was guessing
>> that's because they share the i2c client id with the PMIC and sharing
>> its address space (implied).
>>
>> The charger device while being part of the MAX77759 PMIC package has
>> it's own i2c client id and address space that's why I proposed "reg".
>> The underlying assumption I made was separate client id implies that a
>> "reg" property required. But maybe that's incorrect.
>>
>> I can understand the argument against having a "reg" property. As the
>> i2c client id will remain same for a max77759 charger device (as it's a
>> chip property and not a board property) it will always remain a
>> constant. I will drop the "reg" proposal.
>>
>>
>>>> standard properties `constant-charge-current-max-microamp` and
>>>> `constant-charge-voltage-max-microvolt` to configure the hardware
>>>> limits, as this charger device does not manage the battery profile
>>>> directly (that is handled by a separate fuel gauge).
>>> Well, still, what's the benefit for the bindings to have it as a
>>> separate child? Kind of depends on your example, which is quite small -
>>> one regulator and supply. Grow the example with battery and other
>>> independent resources (if they are) to justify it. Or show arguments why
>>> this is re-usable.
>> The primary reasons for keeping the charger as a distinct child node are
>> to model the hardware topology for the power supply subsystem and to
> You do not need children for that at all.

Actually what you said makes sense. I will fold the charger's schema 
into mfd/maxim,max77759's schema.


Thanks,

Amit

>> house the OTG regulator provided by the charger block.
>> The charger needs to be referenced by the Fuel Gauge (which handles the
>> battery profile) via power-supplies. Additionally, the charger block
>> provides a regulator for USB OTG VBUS, which is cleaner to represent as
>> a child node of the charger rather than mixing it into the top-level
>> PMIC node.
> Sorry but argument that you need a child device to be able to construct
> a phandle is just wrong. You can create phandles on every other way as well.
>
>
> Best regards,
> Krzysztof
