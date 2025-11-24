Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C70C2874ED
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763951653; cv=none; b=M/QyNFScuD4UPz0Ucv0+lTg8tmnIbYVotdMyZgapDq+hMtDLZIpvMpAElgFJ8e4lwZCbucNIUvxm8MbQmZPGnZVG1+D14PVkxvPpppmXvr9HVeeXI4Bw7ce+KgCXED1LCgzJlPt+74KmvyQLXJTFYXy6ivrgnTfUwTLQOZANut4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763951653; c=relaxed/simple;
	bh=u50wiEtGTDGab7ZHLTtEof0ZVgdLfgY/RffYitv2A9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gi3FckYzPxFwlZQhTqQ4y3Oz4nKqrtJBMRZJQWe6bjPW1C0DIMDuwr3rkW193D1/jR+N9pa5/qPXIWFjBQapAQHpbUIrHnxv2WJk+psWIBCV7jYLwPs98QU4QYzASiznHEqyByGlloTVC/KpG+zckfRZZcN+eBpLc4dlQI1vPxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m8x/Irwa; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m8x/Irwa"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-640d4f2f13dso3106657d50.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Nov 2025 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763951649; x=1764556449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJnKQ9oJ9uOzEtfzk8AKk4PwanNXBUdVi5ibWSqh/IQ=;
        b=m8x/IrwaiGnCb0YBQz7bEJk0cbf46DK1nrNm2Kwf8vW9VvfhJto4J7VC6xJdKeWM58
         GEWqUnq2+rVPoIN+62SlrcgIizlmxlvmG50u0HenUdY3x7ttd2jzBxl7Fo08vaqaJXLU
         1lGuLVic55gDwMu+dOLEa9KHlp/YqJCukKMKeiZKRwyyq9WyIypGGv+Kh8wntAI3/Tgs
         RzDKPQOETilaHBt0vgwifEkDh24ZrSqIkox8G9aqwCOzyXZ+KVBt9nQqpqUahk3jc0yS
         U/2W2W4UvLW6njF1ue9GuGHZwkt1He9eUc8hRVE0rcX7BMQAttBfHYqs+Iog8XQl53M/
         WOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763951649; x=1764556449;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJnKQ9oJ9uOzEtfzk8AKk4PwanNXBUdVi5ibWSqh/IQ=;
        b=U2FwvemUe2xpoAriDjIssDfX26/ZgrVIQ9rQSaSuwOhSl+tZndHFMOYHj1xh3EW5SY
         k2+Lchhg9+PicTUlA6dI5TLqlm+aFbYEfXbC7AIx6Lk3xR+L7b57BH/Sd+VE58bNUNIi
         T+mEwp4vsOcc0O1ay8W0et0Ez3KfYlKps0ibzzmR34s+sgsFe93gdplEVUcZBs50FLhV
         fxWhLfbT+xFyc0NEaEApjVU/EiyF6QHgqeW4S8g6f2ajIDmL6VeJTxx7AlZ/zPzfJwAX
         EiF9Jz8EE3liFpHNP/jMz9AAW2i7Q1+V0Ns4cCi46DveTvjkPzJia9St06f9pzvVd0Nq
         LABg==
X-Forwarded-Encrypted: i=1; AJvYcCWUorkkGaK7GaBUFAM6qH8gDEUyF8NKQB2lHKrwxuXuVoRmjEmwJpZfMDy7SBKcnA0kjeXhg89yi/iGzLNjQUv4mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlh+/unbPOF+yRpRuOEsqGgg/cuXx+fl6oAUXLqpSCM+oIogu
	OWGcqRY5dj6NYYJY4SZLws0GU/b/V+6LGi0xkflJXuEG1z/kfxxn/myyHAwuILv9Gg==
X-Gm-Gg: ASbGnctYc3AHKSKdb+S7b05Abk5asJhfmHmfsgWRwattQUiZve7t3jesfbA+ocpAmgY
	bSb2m2TmNSNQ5yDkJcmbv4M9iwrLXajaI1qW7PKnEvBcpZlf9Hu9ZMGvsvxcjJU+M2c3oSfrh6Y
	nvVnq9pUbofArt9rTXSkBCkrceiA2GvpFGyAB5goKh4ibTpOwUW1MHpk7U8t/zgIwdf2RXDAgFG
	2agvmyVgaG/2OP7sfKCsRR8UEJ8NAMeC91ZP0XEMP4PhPc2rbYVeGe9VAbxMpdy1RYXwKVy7wAB
	NXBgzqR/KbK+FrCPXXjSjygdPHGBdb1QF92xcTIiccQK95H5nDpMXxHBYGcRB8P68/LdExIWZcW
	2BXtUUrrdacIhpy7nWyFQDs6uSoMsWttLgi2QLeoK25M/G1JgER+QQ7YkMqrxfA6XSQrOAphIlh
	yPUGWMXVxWeC7Jr3j7BmFCDaf0w/MWpL/hY760xt3mW+lMJL5erFx0oV3skg4=
X-Google-Smtp-Source: AGHT+IHxC+BdP7vzl95DrlP/y364+xUvzMJ0RS3cskY282bYh7RWJ066M6U+GDgwPwRF2d9d7KuiRA==
X-Received: by 2002:a05:690e:400d:b0:641:f5bc:699a with SMTP id 956f58d0204a3-64302b37d39mr6827251d50.72.1763951649099;
        Sun, 23 Nov 2025 18:34:09 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:1806:1fd4:facd:d088? ([2600:1700:4570:89a0:1806:1fd4:facd:d088])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a5decsm40005717b3.21.2025.11.23.18.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:34:08 -0800 (PST)
Message-ID: <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
Date: Sun, 23 Nov 2025 18:34:05 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759
 charger
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
 <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 11/23/25 1:28 AM, Krzysztof Kozlowski wrote:
> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add bindings for Maxim max77759 charger device.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>> new file mode 100644
>> index 000000000000..71f866419774
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>> @@ -0,0 +1,36 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim Integrated MAX77759 Battery charger
>> +
>> +maintainers:
>> +  - Amit Sunil Dhamne <amitsd@google.com>
>> +
>> +description: |
>> +  This module is part of the MAX77759 PMIC. For additional information, see
>> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
>> +
>> +  The Maxim MAX77759 is a dual input switch mode battery charger for portable
>> +  applications. It supports wired and wireless charging and can operate in buck
>> +  and boost mode.
>> +
>> +allOf:
>> +  - $ref: power-supply.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max77759-charger
>> +
> This should be just folded into parent node, no need for separate
> charger device or is just incomplete.

Thanks for the review! You are right, the binding is incomplete. This
charger block actually listens on its own I2C address, distinct from the
main PMIC.

I will update v2 to include the reg property. I will also add the
standard properties `constant-charge-current-max-microamp` and
`constant-charge-voltage-max-microvolt` to configure the hardware
limits, as this charger device does not manage the battery profile
directly (that is handled by a separate fuel gauge).


Thanks,

Amit

>
>> +  usb-otg-vbus-regulator:
>> +    type: object
>> +    description: Provides Boost for sourcing VBUS.
>> +    $ref: /schemas/regulator/regulator.yaml#
>> +    unevaluatedProperties: false
>> +
> Best regards,
> Krzysztof
