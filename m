Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A7E1F5F6;
	Sun,  5 Jan 2025 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070673; cv=none; b=FWsi1tyJOwT42uFktwTPshC8GZ+OxFeGdqtn7q8b2RzKZVyn80twm8W+mwciKEYs+dJ7aanZZ0YqGfQKIi6uWOSGyJi+vXc5Dxe/PY7Hs8JxJ1X06CU46tYklwMT/JGewvQ/N5FzCQIK6vO3cYh9xxJ74OtDMBHMQWa5lg8EF38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070673; c=relaxed/simple;
	bh=tJVoPdgO+OYtib/SMle36MPOiDCVLeBFOviDnWNfk9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXU0pM2pAKAdUi9DAbYypDTiJ51qkz64Lu0yLhclJdmeTrOr+pXUNyt5kEhjAsKoC0UG4hu3DHHkpBMODCKFMaIjGa3c7K0y4EQ0vp+HU9W3LI2qh2qfr1QQe68CI1wRhdOgJlojSjNWqapdGKaFDqjUAUmAj3Zb/P3LVPEoO4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0MXst6W; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0MXst6W"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361815b96cso88996235e9.1;
        Sun, 05 Jan 2025 01:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736070670; x=1736675470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqHrB3RWMU7bV3iPucH88p5mwqp5ashiPx6Mz9MBKQI=;
        b=a0MXst6WOjgWXbi1FOE/CVc2SScTAWziNrdw/J3PEEWAIJxA2cVYqQ86bRBqlIgSFp
         owIPL7xnQUo2KnfvLXz/fyqg3kV+WvmOsFi7d8lrLYUQLZbweL/TwEPPw3++jFvyjCGi
         o13lUSnTKg7YLe42XwJtg7dQA32MYRFa6tto5mHTXiStg/gpqrM2SIgKuguY484aHsjo
         K37rzqJ82OYYg2f44/E9r8XrGW8pj1gRZt1NFT+xIuIZpXZ3W45uvw/9We5o2bwO8kAI
         lkTMO+SvC8/vnOvVAw3+xx8JN96V7qNOgMpXo6x5uux/TuZfj2qdn3K1D+yC+0HvI/v5
         ozrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736070670; x=1736675470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqHrB3RWMU7bV3iPucH88p5mwqp5ashiPx6Mz9MBKQI=;
        b=Q0NJunGLxZrHIs4SwF2WQKPBEu53qzKN0IIDsEB1EFMUW9nk+SICElR/vzw/z3PyTm
         lmQAA8rYTv1NMcAprH9pZV6HDBJ93U/WNdD2OkJFVYzZKDJRSuq4IMWI3t11vwnsAVTw
         FdeC1GtI+nI/amFooc60X8+5//KxBT1Y/ZBbF51WpmZl+7ysGMxnfTw3y0RjL8sNnqES
         7DxvQEjAmBBcFa+aytItnTEZo+hn0sy+D6i3ZULe9RCpWCNCXcIj54km6/ZYx5exPHRK
         CRp6eojDmz4HD34avMDjOH91ZX22kUR8fuTLo5FEVulBtxnvV25fLTCv/meHvk5nlh79
         WHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPPqQH5vZWgPXbPR+VxSTXW3HJEZhtD98tQ7VNT2k7lm/w4x5yMVNnSMRTCYdrPyVIaLot8YBe3r+L@vger.kernel.org, AJvYcCWk1fHXA38cXZo9ljfVVl1ctH64sSLTYnRulI/Sd11Lkh5MtDRAgFLt/APe8waxhkVCDI7Y7bBdslydYfqe6wvM/U4=@vger.kernel.org, AJvYcCX9yQl6NzlpAFkoub3GeqUvCeOxprM8IkyF2N1evAex95J1ywqy9sE7wY72nQt51iu0ZR0zdtP2C9td8zUr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66F/zghVvagA8tDOo2faYi9cwwLhxPYpHk9SbtPbAtg4AbFUO
	BKw9dcegrgaZEDugmuxY2842JkqQjZv4py3mpAaVYHhsTOzAedzIGt/fHQ==
X-Gm-Gg: ASbGnctlxGDCUiH6cgsT+904WWMi/9OcFvH90s3EST8cwzlgoZf/2hdkl7GeZ4Lj+vk
	Nqvaba63agaeZ4qssCEPQGgFG8KvcaqAcka3ZFZziWk68C0294GT9jYaLjnATtbC88V2a/tJ12c
	nz8aglvXg32KG+YoiOT778fbn8ituUTONTI9yeZnJSvUBHUF7FM7wcDAsYYlvxMK07QOXNlPKEj
	zjBrlCEil9Swz2YYrebT9UPdgHkU4nLTubFNVSHBEL/KpzW/LhnUlqZBvc4ILbGLr4MsMGbTQ==
X-Google-Smtp-Source: AGHT+IEEOPTfa4PfwVJhOwl8VnrMncxkZRkoL6bxSd5lLCXDE55/NQGvIzZQ0Xj/lbGgqwlw0qxl5w==
X-Received: by 2002:a05:600c:470a:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-43668b7a33dmr503151075e9.31.1736070669467;
        Sun, 05 Jan 2025 01:51:09 -0800 (PST)
Received: from [192.168.1.104] ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm568801905e9.9.2025.01.05.01.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 01:51:08 -0800 (PST)
Message-ID: <e7444f6c-f280-404a-8172-ae4869e3d492@gmail.com>
Date: Sun, 5 Jan 2025 11:51:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
 <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
 <nk7rifc5mcsdlmgpncrpoumerajrpdekxpvqwwe2hz4b63rgci@flowtxwchm7y>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <nk7rifc5mcsdlmgpncrpoumerajrpdekxpvqwwe2hz4b63rgci@flowtxwchm7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/5/25 11:18, Krzysztof Kozlowski wrote:
> On Sat, Jan 04, 2025 at 06:29:14PM +0200, Ivaylo Ivanov wrote:
>>  
>>    reg:
>>      maxItems: 1
>> @@ -64,7 +75,6 @@ properties:
>>  
>>    samsung,mode:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [0, 1, 2, 3]
> Widest constraints stay here, so minimum/maximum.

Why? If we are going to add new enum values specific for each USI version,
isn't it better to selectively constrain them in the binding?

>
>>      description:
>>        Selects USI function (which serial protocol to use). Refer to
>>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
>> @@ -101,18 +111,42 @@ required:
>>    - samsung,sysreg
>>    - samsung,mode
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - samsung,exynos850-usi
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>> +        samsung,mode:
>> +          enum: [0, 1, 2, 3]
>> +
>> +      required:
>> +        - reg
>> +
>> +    else:
>> +      properties:
>> +        reg: false
>> +        samsung,clkreq-on: false
>> +
>> +        samsung,mode:
>> +          enum: [4, 5, 6, 7, 8, 9, 10]
> Is it really true? Previously for example GS101 had values 0-3, now you
> claim has values 4-10, so an ABI change without explanation.

How is it unexplained? Citing the commit message:
"Add constants for choosing USIv1 configuration mode in device tree.
Those are further used in the USI driver to figure out which value to
write into SW_CONF register."

USIv1 and v2 write different values to the SW_CONF register. For example:

#define USI_V1_SW_CONF_UART        0x8
#define USI_V2_SW_CONF_UART    BIT(0)

..
 [USI_V2_UART] =    { .name = "uart", .val = USI_V2_SW_CONF_UART },
 [USI_V1_UART] =    { .name = "uart", .val = USI_V1_SW_CONF_UART },
..

Hence the decision to have separate constants for different USI versions,
which in my opinion is cleaner than meshing the enums together and
choosing what to use with IFs in the driver code.

>
>> +
>>  if:
> Missing allOf:
>
>>    properties:
>>      compatible:
>>        contains:
>>          enum:
>>            - samsung,exynos850-usi
>> +          - samsung,exynos8895-usi
> Effect is not readable and not correct. You have two if:then:else.
> Usually it is easier to just have separate if: for each group of
> variants and define/constrain complete for such group within its if:.
>
>>  
>>  then:
>>    properties:
>> -    reg:
>> -      maxItems: 1
>> -
>>      clocks:
>>        items:
>>          - description: Bus (APB) clock
>> @@ -122,16 +156,13 @@ then:
>>        maxItems: 2
>>  
>>    required:
>> -    - reg
>>      - clocks
>>      - clock-names
>>  
>>  else:
>>    properties:
>> -    reg: false
>>      clocks: false
>>      clock-names: false
>> -    samsung,clkreq-on: false
>>  
>>  additionalProperties: false
>>  
>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>> index a01af169d..4c077c9a8 100644
>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>> @@ -13,5 +13,12 @@
>>  #define USI_V2_UART		1
>>  #define USI_V2_SPI		2
>>  #define USI_V2_I2C		3
>> +#define USI_V1_NONE		4
> Drop, it is already there.
>
>> +#define USI_V1_I2C0		5
>> +#define USI_V1_I2C1		6
>> +#define USI_V1_I2C0_1		7
>> +#define USI_V1_SPI		8
> Drop
>
>> +#define USI_V1_UART		9
> Drop

How so? These bring different configuration values. Could you specify how
exactly you want me to implement these in the driver?

Thanks for the feedback!

Best regards,
Ivaylo

>
>> +#define USI_V1_UART_I2C1	10
>
> Best regards,
> Krzysztof
>

