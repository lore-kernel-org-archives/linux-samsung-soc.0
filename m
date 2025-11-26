Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5910311969
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 20:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190224; cv=none; b=MQ8sSl0fwIyNRiW9BVVuHrJZoSyCj4zQx1fsjYOE98HF/pMrUTzLUwi8Dhni+tx/P0e4KXD9p1eLqEXaA3g4O5N/V4rmqfuC7YZefn/DYRfhGjTBm2w4gE75N6cdztK9DWwxiRevXrsmFbapKMM/pf9yaWy2OXox/IXm8MNF2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190224; c=relaxed/simple;
	bh=2hcVpa9scm0PygAHV2yhPwb8b1VqKc8achD9dLmNggM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8bRVmzrEZW1nJZk30nQAnEet8pwMdTLqCryQGJjkBTk5Z7mSB8rO+dmc8A3sK3o6DOHkHnc+qxkgZvr0OdK58eOqgnWHoLLRG7ehVcVwvoFOTwoTwcw14T/yYbH0VsdC7C5dXaFjZ3aNQCzKuZxlFQvCoLiAz7g0t06DP7iEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HGbDdCz7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HGbDdCz7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-299d40b0845so2697925ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 12:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764190221; x=1764795021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAe7krNX/FWdcfazYkx0OEalo6w7fciX1p3CljsQHjE=;
        b=HGbDdCz7fMh9auA5giOKC+up0GbVoGyfdlmnW3fyA3Gxeb/N0VXaJ7h8z9oxYb4vjA
         g+p+ZRULTy1pYN7EVv5B4HrwMHmGfgjly+28BhEPlXXtD/KWdwSqMfXw9NDqftFHdE/T
         CXq15IsJHKr6bJHsZs8IrqaLSSTkzKPU2I82uX6u58ZouSHjfKSYxKn/4eti0kglBfqH
         6FT1XKbMuy2JP+yi2OjHZQnX1+RHfCIkvrp4b5z+VaJHg6EoexoTIpw0JsUIvp4E42Qi
         xpVhXmwS0s1ou8X0njK31DhtPHOxTRa4nDS1mJWmErhGiynAQh7U5JJC+nlAPID9A7qR
         FYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190221; x=1764795021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAe7krNX/FWdcfazYkx0OEalo6w7fciX1p3CljsQHjE=;
        b=NdHBkoo8tGX/mhloxCn2T6mivfFQxxqgMfyLH29i4GCcUS8B9p+LLIiwCLNLTdbULy
         N6nJkwxUzUoAe1i2aMBjuvgJfXHzrqHVe3g/2dBiEOQuR+SurrQVozg9bfkF4KIzh3lT
         2IlXn6Mg16s52fT57jOlHr0kxjhrZ5sgYhV5nPO/N92K7wb1eajqOU7ThBKNLFb2J+Ud
         bCwE6xDfMXk6nsW8VZQdGmv7UlxPsyhPvWfocDuokGBQyVZyqDGKpczp/0Gi2/qrAbx+
         RlGRvYVl+LzDJ2jX7u6dLYnyDNXMGyqTENcLEWAEFnTXF4FqRoHOeqcwvmya1tUL6WD0
         Ebww==
X-Forwarded-Encrypted: i=1; AJvYcCVCmBvNKaRVCtr6ZcFImVFo3NFMnLuYnRXBnzbnxM+2ZpLRw+KfAHL0IoF5JYRUDckAxfTIAX6Q8mrP/IWaPskrig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMbGTkqMBxxhaklR2/M7AOSC3kwuqLdxRbJJKU4yFcroDP0CP
	DjQYM7NfnKk9zWQXhRVqha9XiMPsnQKTbUan3bTIdQ8f3GAhwmo0mSDLNNe1jvFXew==
X-Gm-Gg: ASbGnct0Lrr8Il2pVAPuktM4tY4zOVR9mVCzk9nWfn7QDUmPl776DEsrfrAjlwZBoaU
	Vd1TMcO3lOtHjbv5V4XUyf3ZP39MK6Gxw3Vng898KOx8y2zQVY559e3TgM+MR2iStgrTOjJy2ej
	W+Id5V8Aokygjo6GU0pKK/x260f0ah/LUgI5VQ0uUbmn7iFEkKnPCC3eHr+pWE+6H3ZihHvVoYA
	/XGdd0jK9lhmcEWquJCi1YHstnAMpPb51tXRXI02ehaabMPUDMhJCbS/CNk77kwTdqxTR4pRqGP
	9ECcV3ebks6Pej59NCmp9wtpBjIHkn7KgSj2G79v0Le1dZe8lT48oImx27HVIOjVMWbMIebtlwa
	BWIAAH8tITnBp/t4W1vzIPzmwwkVUdhtpzerjf6o+PeU/8dHpSzgQVtqCEER+VB4FKX10U+asdj
	CrVGsIOnbhWPG8EQRupKSUn9jZ+2au0WFqWJC3rNJdbumPh7mvr9p8ThK99kJq1vnfMnZTqe8OE
	KYSY50MXtuPrhfFmlpoJSAi
X-Google-Smtp-Source: AGHT+IFjQZz19LkV6uSbQD7V0osJzTvl1J8TedsGIZ78YPP9aLGTQiFmGEhYv2+QMQ+JGAYgRK90Dg==
X-Received: by 2002:a17:902:d4ce:b0:295:596f:8507 with SMTP id d9443c01a7336-29baac9f621mr97893625ad.0.1764190220828;
        Wed, 26 Nov 2025 12:50:20 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b12f988sm203367425ad.27.2025.11.26.12.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:50:20 -0800 (PST)
Message-ID: <3c72e1f3-7873-4f13-a5cd-0aecc5163aab@google.com>
Date: Wed, 26 Nov 2025 12:50:19 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply property
 for VBUS in OTG mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
 <aSbP5OanDUGhEXXV@kuha>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <aSbP5OanDUGhEXXV@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Heikki,

On 11/26/25 2:01 AM, Heikki Krogerus wrote:
> Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne via B4 Relay kirjoitti:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add a regulator supply property for VBUS when usb is in OTG mode.
> What is "OTG mode"?
>
> OTG is usually used to refer to the USB in device role, even though the
> specification actually defines OTG device as a device capable of both
> host and device roles. So the term was confusing already before.
> Nevertheless, the emphasis is always on data-role, _not_ power-role.

Thanks for the insight!


>
> Here it seems MAX33359 uses the term OTG as a synonym for "source", so
> power-role?

Essentially. The datasheet refers to the mode where VBUS is sourced as 
OTG mode.


> Please don't use the term OTG unless you really have to - it's too
> confusing. I know the MAX33359 datasheet uses it, but what you really
> do here is regulate VBUS. So please:
>
>          s/otg-vbus/vbus/

I will drop OTG term at least in the USB world and restrict it to the 
charger driver.


BR,

Amit

>
> thanks,
>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>> ---
>>   Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> index 3de4dc40b791..a529f18c4918 100644
>> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> @@ -32,6 +32,9 @@ properties:
>>       description:
>>         Properties for usb c connector.
>>   
>> +  otg-vbus-supply:
>> +    description: Regulator to control OTG VBUS supply.
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -53,6 +56,7 @@ examples:
>>               reg = <0x25>;
>>               interrupt-parent = <&gpa8>;
>>               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
>> +            otg-vbus-supply = <&otg_vbus_reg>;
>>   
>>               connector {
>>                   compatible = "usb-c-connector";
>>
>> -- 
>> 2.52.0.rc2.455.g230fcf2819-goog
>>
