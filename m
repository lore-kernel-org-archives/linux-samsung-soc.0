Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8491B392E;
	Fri, 13 Dec 2024 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083261; cv=none; b=TeRIciNubcdxllLsZF7VXQBtPqc09vZwMV7dTuOQfT51H4pKJ0efdN+Ejf79mAFGEaL3TvKla/aSFgiSx0mYeso50n7lRqaZLwkAkG21n4CcHmyMhqZ4SwTYVPPvsb9Gj0/FnfEKnP6tYR+/W4imemhCjwBO8hRMa2dPFHVWtbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083261; c=relaxed/simple;
	bh=oCE+dd5SPcmuqEdvLxpo+CPfYUW0b61fh7ss8dlVND0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdeuckDc7cKGv+ldjfLM+Il4rhxwladEa5nw+LNCeQPNgTEIqrGpm53uCbNpBlISH3ROsfxFCeoMb1NqzU8TrriStN5xg5+v11FznWtlUtcD8hB/pdB28RB6dJPzLiJaWTYsP+MNRUDJeqjiQ8k4az9I9a1OQ/74UDaBELl64lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKxf7ca6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKxf7ca6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso236566266b.1;
        Fri, 13 Dec 2024 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734083258; x=1734688058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpephPbr8Jh4XgfdsqtKilUmRrp2rdQXAGdN0OMY/vk=;
        b=fKxf7ca6K+6WicLWXPCyMapx1JZq3M3lzAhJWQU/2Wf3aV4rOR2ZM77fzA5MQGYGnj
         3fsLoA/H/tud+N9o3ZvSHdIFKvrvpnsCvI8XI1f+w3J8jf0dP9zXGEWBvODwHutJn42G
         774Y2lkvNXNnD2ciNzdR6mZ61Ug0ECO6Jm2+Ixk4oiSq8hmfqIpje1BjpUSMUkymfiDb
         opajE6e1O3Cvw+j3AR5asamLXVkzFSaN7riRNEY+zxoj3rN1gTT7QtnqG+1Y5K91wC39
         cJPqkZX5Xn5dTtBEIm2hWdsHx/7ICzwjYSZE2DLCIL8xZzZSVpWOQs6p8XRhzvv0zNgb
         ztvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734083258; x=1734688058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpephPbr8Jh4XgfdsqtKilUmRrp2rdQXAGdN0OMY/vk=;
        b=BToBXfptDLvIDcWGiaMemCbKz3E0TWE4OipmVlIfNXXPPBFbIZS2llLOUAiASvtGbU
         hhBfZn+7PpIjXnam6eA1YruOE6DQCZ0yJbbfwKOgRjnm3WJssmM1T5fmHf67m5Mwxbdl
         aIGAgV4giOOnLQIDeP4i4zrDBFkwUgvdhqQHct17NyL2UPeZP7NzNB4JxeUTmTmgqVX1
         7TY4VyPtSIVOjkWAcKIThGPWcFpmehVX1uZSl6C23Bo5nM+YgThvUMrFlwPZiRzusi7o
         CYbH012KgRO+wQSAfp336z8UEpytJPVKqq7CrE9OwMgFhCIflXVaY+FWuhutQZPoTpzy
         Hadg==
X-Forwarded-Encrypted: i=1; AJvYcCVr03568UrbwGuRnADCqU3Lnd0Lvv5prgMbj2dGK5TtCf+GEcs8IyKZxEgn0umNYfbTUxZwa1ydyi+C/H9q@vger.kernel.org, AJvYcCW4m/fgUXi/WMFWt3B+Rb7124rLCnKyyl2x/PZ6u3dWREnF2EP4xAWxYQEMLFOyiFqEuFEy6ARyK0hQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhm2ZG+S5q0WtTnEbvnMP02vlqawOzzp7dTRbyPl4yVU/1Wss2
	buII8RIHedyBE5nlkWlayQ2IssQGzPjFsnUQySZM4KEdJN1QmqPj
X-Gm-Gg: ASbGnctvf3xRfVpgt/Xkt80NDE3HAwmcpY6KRzXcT+b6TMP+EGbW5lQEgF+i4UT/6+5
	UAXRq1Aud9Rr+VqpC49XOIEhNVULmJGw1UjCU8gdesx4WTXodlKgWyX5cC2+AWwsmfEai2h2bcT
	SMqJKBflW1ca8aux1vd1UjIj5jOxgbrppLO31tFPq1kmRzXzBj9igGYenkJjpaOzfLDgEl6S3rd
	94CK3D+Mk3WLWhw8l82+sQCeoW6hR5tVP6IS1yZkqLip3kCboJ8puUXqhjYLa6g4Zdt
X-Google-Smtp-Source: AGHT+IFbJyb8LbVaxZmbBTC8001dyPPQdOCNGCC+QQjAz4MNlXdB1nD7gssl9owCB/VTMauuYyt5IA==
X-Received: by 2002:a17:906:3112:b0:aa6:82ea:69d6 with SMTP id a640c23a62f3a-aab77907a5fmr190336166b.18.1734083257326;
        Fri, 13 Dec 2024 01:47:37 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3bc829433sm10177180a12.38.2024.12.13.01.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 01:47:36 -0800 (PST)
Message-ID: <7753293a-0ab1-48b1-abcd-a9cd544cc356@gmail.com>
Date: Fri, 13 Dec 2024 11:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: samsung: exynos-speedy: Document
 SPEEDY host controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-1-544ad7bcfb6a@gmail.com>
 <207354ad-e363-4156-ba6b-86dbaa13ab95@kernel.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <207354ad-e363-4156-ba6b-86dbaa13ab95@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 12/13/24 9:40 AM, Krzysztof Kozlowski wrote:
> On 12/12/2024 22:09, Markuss Broks wrote:
>> Add the schema for the Samsung SPEEDY serial bus host controller.
>> The bus has 4 bit wide addresses for addressing devices
>> and 8 bit wide register addressing. Each register is also 8
>> bit long, so the address can be 0-f (hexadecimal), node name
>> for child device follows the format: node_name@[0-f].
>
> This wasn't tested so limited review.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
>> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
>> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>> ---
>>   .../bindings/soc/samsung/exynos-speedy.yaml        | 78 ++++++++++++++++++++++
> Filename must match compatible.
>
>>   1 file changed, 78 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..304b322a74ea70f23d8c072b44b6ca86b7cc807f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/samsung/exynos-speedy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung Exynos SPEEDY serial bus host controller
> Speedy or SPEEDY?
Technically it's an acronym (Serial Protocol in an EffEctive Digital 
waY), but we could agree on if we use the capitalized or uncapitalised 
version and use it consistently throughout.
>
>> +
>> +maintainers:
>> +  - Markuss Broks <markuss.broks@gmail.com>
>> +
>> +description:
>> +  Samsung SPEEDY is a proprietary Samsung serial 1-wire bus.
> 1-wire? But not compatible with w1 (onwire)?
Nope, I suppose this requires more clarification, as explained in the 
previous letter, there are several differences between the protocols, 
looking at the Samsung patent. [1]
>
>> +  It is used on various Samsung Exynos chips. The bus can
>> +  address at most 4 bit (16) devices. The devices on the bus
>> +  have 8 bit long register line, and the registers are also
>> +  8 bit long each. It is typically used for communicating with
>> +  Samsung PMICs (s2mps17, s2mps18, ...) and other Samsung chips,
>> +  such as RF parts.
>> +
>> +properties:
>> +  compatible:
>> +    - items:
>> +        - enum:
>> +            - samsung,exynos9810-speedy
>> +        - const: samsung,exynos-speedy
> Drop last compatible and use only SoC specific.
Makes sense, for some reason I didn't realise it doesn't make much sense.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    - const: pclk
> Drop clock-names, not needed for one entry.
>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
> You do not have them in the properties, anyway required goes before
> additionalProperties
>
>> +
>> +patternProperties:
>> +  "^[a-z][a-z0-9]*@[0-9a-f]$":
> That's odd regex. Look at other bus bindings.
Okay, I'll look into it.
>
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
> maximum: 15
>
>> +
>> +    required:
>> +      - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    speedy0: speedy@141c0000 {
> Drop unused label.
>
>> +      compatible = "samsung,exynos9810-speedy",
>> +                   "samsung-exynos-speedy";
>> +      reg = <0x141c0000 0x2000>;
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
> No resources? No clocks? No interrupts?
Will extend the example.
>
>
>
> Best regards,
> Krzysztof

- Markuss


[1] https://patents.google.com/patent/US9882711B1/en

