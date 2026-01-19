Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC92C35E52F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826714; cv=none; b=q6GR8t/2JvCRGFl76VPnaYbiBCWBggGbl61nBkNX5FneqwSefyEiwrIqX7ISdMQx+Hrlpk2bOdah5YnXmNfAQfPiohz1U+5yq2v7i+x+UAWO0WvkrQUMip26S89U7PuG78xs9024S+l+CS+F4ZFg8KqF96mTKJbQamZ+M84VfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826714; c=relaxed/simple;
	bh=58zqf0QRhFos7cRmq8vTrHcguHAy4GxQXQGtoEUAomg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMTCiTdiamXYPl+vjSv+Dd8FvJ62XTpb6HxxzikqWXlGW5lLnzKyGsPLr8ekx5vmZm2U15QesKchklY3PH8JuBLIg5rtuRM1NEFzL8KnHFPZo46YlLGKQyR79A96ZI8FYU8z3xN5RqijWaN+KKcC4N8Jc6h06p4NycgLCv6Yj4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BtWO1BDm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BtWO1BDm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so26543395e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 04:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768826710; x=1769431510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGK/JHtGxCZWFp0R8SxdcXdTEhWhNtsWilx8eiq1+lY=;
        b=BtWO1BDmiVo2a+LE6cgUTsZ8jaxNUH9MtBX8uJ1u8xKxB38JPizBLil9z4kOjX+B57
         wr4BaAuKf7MirYS275jTJPtH27QPbiXjHk4xAFZx/bY0HuKYE5oXctZXiW45y02/Hdwp
         xSMBZcMaGe0a8bmC7B4nLLEZFVKX7L1SIuvTcXvZ1gfzyT/iIIDTh4g7iZnNOw0/HmcQ
         f1TMHoR//S+BUUJ/uWNvG2Ay1vLfHYYcVeXf2MvTJ8z1QixnebAPMdyACfuAu9FglG2R
         DQDiGe/rSLVXnlNYjtHElIVTYzuhqQaUxv1pxlXwPrEnWlPoP83GJmNCRVqeWprxu79k
         wNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826710; x=1769431510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGK/JHtGxCZWFp0R8SxdcXdTEhWhNtsWilx8eiq1+lY=;
        b=aBJxR16QMpa3MbTyd5/PSWDYxF7LefwYpDItvGB8NpGDRaBqDBlgfP7UeQoFq6CqrM
         2pLG5FnxwU2Cr1nbkqsqafMpLtNQ/XtJ5Pucol3mODUebxnz2WGX1ZJbGlNQjIb/KTbq
         XPSmdScpKm2pWZprYu5fMJjWqhiVGHg9qRTpj5lmkSUpq2G/G7bgO4VsypVdprn1zFJX
         GMJOjwiyZ5mbFXNSILjC1/njdLQjTSNLsbjOl/qdJp7TuZqU83tIDYcg6WSjmDNJidQb
         RPoIyyqAJ4Ge3ip5tMpUVR4/zHTWwsiaLP9YE0kMOkKgRYXFEhyaM2y0gJubBhe160IK
         svuA==
X-Forwarded-Encrypted: i=1; AJvYcCWKxWbtBUx02D3RsDJDcf5zBMC9k2FiIUSsyTF4+MofL2GZBeVU+/tqdIFFWgT3sjNfS2K2watNN/8efmflRvRKEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHAhktMIB1VZwoA37EKIon9WKfC2JmwQXB9zMHHB6ysQXTYyq
	VrFLKfQATqqe+oZWVG7ChhHZgla0gU2+E9I0iNSgwXXWSEJKcCyrZgaBu21zv7LEGGI=
X-Gm-Gg: AY/fxX5lzcXtT8ULq8XNkHSoT50zA2N7/JJ7C1fpzVXE4Gok8lILug0HV1QMiYei9gm
	N2PtqLfgc0jqforDufYsJqqlT0RwIOIGQWPnol7JFRds4huUK4SH/S6A37/MZWY9gIBfwMOZd42
	M04gmzLrERkzc/yBQtMwJKmnb2qddhyK4epy/DUFEORFlrKTKokvCGWghO6xY6ua45TVxx3Sx/e
	/9E1FA8qL5ni7t9s085iAaqmYveOYkk2WX8qrW96JZQatv3AnKRn0BEFkKSNbOeRcQoju4E6TmI
	KGn5K06JmqziqaJ40rm+aO7D40arbhpKV3fBwmexemt5PEjLWngBM+jSVqQ3tUoCVtxPQ/Bh4YO
	pP86iLtF/JHUMtsNWjfjZgYJJamkkczG9VgjAFUqIv/aSMR0hbQBR+MgyT/6/X3kKevseB746F6
	r6DzHR5Oh/CQIlrVk7E8xgO1JPNSvJKTuNtQ==
X-Received: by 2002:a05:600c:6098:b0:480:3a72:5238 with SMTP id 5b1f17b1804b1-4803a7253d1mr13426025e9.30.1768826710239;
        Mon, 19 Jan 2026 04:45:10 -0800 (PST)
Received: from [10.255.242.87] ([109.166.183.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e86c197sm193288675e9.1.2026.01.19.04.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 04:45:09 -0800 (PST)
Message-ID: <10cb51ae-9cec-49a9-96c4-757cd1410d8a@linaro.org>
Date: Mon, 19 Jan 2026 14:45:07 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: thermal: Add Google GS101 TMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-1-cfe56d93e90f@linaro.org>
 <20260115-ultramarine-wildebeest-of-completion-ea1bc0@quoll>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260115-ultramarine-wildebeest-of-completion-ea1bc0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/15/26 3:32 PM, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 02:16:29PM +0000, Tudor Ambarus wrote:
>> Add device tree bindings for the Google GS101 Thermal Management Unit
>> (TMU).
>>
>> The GS101 TMU is a hybrid thermal solution:
>> 1. Configuration (thresholds, hysteresis) is handled via the Alive
>>    Clock and Power Manager (ACPM) firmware protocol.
>> 2. Interrupt handling is handled by the kernel via direct register
>>    access.
>>
>> This binding documents the required resources, including the APB clock
>> for register access and the phandle to the associated syscon node.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 64 ++++++++++++++++++++++
>>  1 file changed, 64 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ecf4a315ecf1ea0649c4e96a207d531c696282f4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google GS101 Thermal Management Unit (TMU)
>> +
>> +maintainers:
>> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
>> +
>> +description: |
>> +  The Google GS101 TMU is a thermal sensor block managed via the ACPM
>> +  (Active Core Power Management) firmware. While the firmware handles
>> +  the thermal algorithm and thresholds, the kernel requires direct
>> +  access to the interrupt pending registers via a syscon interface to
>> +  acknowledge and clear thermal interrupts.
>> +
>> +properties:
>> +  compatible:
>> +    const: google,gs101-tmu-top
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: |
>> +      Phandle to the APB peripheral clock (PCLK) required to access
>> +      the TMU registers.
> 
> Drop all the redundancies, so:
> items:
>  - description: APB peripheral clock (PCLK) for TMU register access
> 

ack
> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: |
>> +      The combined thermal interrupt signal (Level High).
> 
> Drop description
> 

ack

>> +
>> +  syscon:
> 
> I feel like suddenly you sent something completely different than what
> have you been working for the past 4 years.
> 
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      Phandle to the device node representing the TMU System Controller
>> +      (compatible with "google,gs101-tmu-syscon"). This node provides the
>> +      regmap for INTPEND and INTCLEAR registers.
>> +
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
> 
> No supply?

It seems not. Nothing specified downstream. Couldn't find anything in the
schematics that I have either.

I addressed the rest of the feedback in v2.

Thanks,
ta
