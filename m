Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE18846D;
	Sun,  5 Jan 2025 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736074316; cv=none; b=NIO4McR/6YWayCKEAaZAYeQMCSUdW/OIznnef54zx37872blElfaaisSUolQ7aZA9HWr8mgHDTTKnYYWbFXnPq6KVD8sHjILC6lHnLgwzOQhzRBz7k2/XJp8pLgc2ZYZc7caQy017tNbfztdXW7SfimAB+HuKpu4D6BU/a7PCjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736074316; c=relaxed/simple;
	bh=pUGhbanj46K/DhS1teMk6NuQMwoDRgKK16Ami0NeGdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVziBu+SgLWZ0/t2i70ITtyOQ01W9I/9ZYWLoPqaPLLSqjohTQ1r1k1MayzpU6rS1WM8uavxD5trU/XwI7CBWJ9hGOfnNzWuzcaYL6xre4OUkZ904i+4txfj9SCi4K9fY5D2RwtDvhvdnt8LBH6waZgY7WSwAskSGJzM7Opgyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+TU8GOm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+TU8GOm"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaeef97ff02so1597801366b.1;
        Sun, 05 Jan 2025 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736074313; x=1736679113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5VolyOiRVCeYJbZJVrBiLg0SsLQtCtA/FxSw1DsyG8=;
        b=k+TU8GOmijPdkI6OEWy9sS9pYLBG+x615SRaiu1c3a31zbZ69gCEsgJiudRHAk0OIr
         FoB8Qs2cyrHvV54myn3AjDHlIZFG5oCKaN4tnJ70TSCNERUXuXADOUXBAm31AJ2s3QqB
         cUKAIFH5zS1R+v/l2XJWGBsp42M9GX3AAbeCTcF4F8WWWiyauWfJX2eckgC7p/IYUCp4
         teXRZXCv9HYcY+5hQO6D57rmDSBZztl8Zzb2/urld2ubjDho8psejY/2ya3FD6ihU48L
         frLP/SQaGcBt3MyDrvhLNvDu/kPy33bgMLy/WTPpVWBXQpDOXqrAacf+USSQbEwef/jl
         3QRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736074313; x=1736679113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5VolyOiRVCeYJbZJVrBiLg0SsLQtCtA/FxSw1DsyG8=;
        b=fIYvl1ACLuxwW4YdwFtUvp+qUGmFkt6vaqBe9XzwR8/5Lf2ExaeCROsz9qrfjG+tuV
         GJJNRhVl/9JErSeOJdnv7oHisiHQnLpv5sBnY8zLocAKZqteyKaLOEubG9MthhoxX14T
         TlQeV1i/Oa5P5jHMQfj9xqu/n5s5VCNFtAOseqUgDh4FzGVkjwzvaLSxNy2IIfaHRSGr
         LQZFJEaPW67P3lrKDxL2XNbvtXYQwVRE54CA7iW4oQ7vTxXjKS+8x0zxT0nfZTt0pxgL
         qX4LNgGvq+Djh1hdZ70iH2k0ZVdMMLgN7cEfTIW9AL+YE17J04o3NthEtyeYzU3gbPa4
         f1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7eJzbclabMn0cqdqvpu+MQnwbNdGCsgBsxrfEDDGOe2mBhu5HBdtTiccwr9488oDlnhHMO2Tu7lvAslg0QSnutwU=@vger.kernel.org, AJvYcCXMnVooszoJqnR3lEmpU3ifwU/TJNyeOnliQo42cgqVOdQX1Cuzq4Go2ViSXmoKR2Hn6AuatHihCqHp@vger.kernel.org, AJvYcCXTsInORzPIhiuvJrijdS+SIfkUbZM5S2BmA6Ym3zo2OpaJy3eZ6tZ3ZcJhDphAmFpkO29OcDECSleTMNxo@vger.kernel.org
X-Gm-Message-State: AOJu0YzqIZQIzeNRfAkGmqAub8HocRzZF0/LfMuqdFpQ6xInfjugP0G6
	OI+cxQbmGpbHKcnk0LNb2L9xzQIOKCA5q1syWMJFaMomUmEDTvja
X-Gm-Gg: ASbGncuECK3VH+l72RWf7kmHt9Xbf6ddAxbS3/pKVU3FiPevaDwaDTBnfb30A53VM8R
	jXazn+dCGjfDf+u54BlHIrFL+oxmn/9EceRB8h/3kH1l+kfNZGdYNe3Bvz+MdpowtieVQJAJJH0
	1CB7Ha/VkXOoJV0FX9KLop8WwUQHbTW0Y3a2DitI46cKOTYKqtgCCdCJZgyGw438GHnit7RCOmK
	B7qz7zwiCAS4qlfGzk+qXCTDH4EVQUMf/v8BBb0GWaWVMuIRfk72Ehy9Ka6fYdSaEcK
X-Google-Smtp-Source: AGHT+IEJvx7PhT0pC6BfUepWRgXK13eXOmZzfv73ZCW6+TJiJYOCoxTGtNTu1yWDMUrWyMkblol/Xg==
X-Received: by 2002:a17:907:60d6:b0:aab:daf9:972 with SMTP id a640c23a62f3a-aac334c0ba9mr5396506266b.28.1736074312491;
        Sun, 05 Jan 2025 02:51:52 -0800 (PST)
Received: from [192.168.0.3] ([151.251.251.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaee340665asm1675202366b.187.2025.01.05.02.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 02:51:52 -0800 (PST)
Message-ID: <fbe88d1e-6ffb-4806-8210-fa83df0287a5@gmail.com>
Date: Sun, 5 Jan 2025 12:51:50 +0200
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
 <e7444f6c-f280-404a-8172-ae4869e3d492@gmail.com>
 <fca941a4-7c24-48dd-b36a-2f9b5c44575c@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <fca941a4-7c24-48dd-b36a-2f9b5c44575c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/5/25 12:39, Krzysztof Kozlowski wrote:
> On 05/01/2025 10:51, Ivaylo Ivanov wrote:
>> On 1/5/25 11:18, Krzysztof Kozlowski wrote:
>>> On Sat, Jan 04, 2025 at 06:29:14PM +0200, Ivaylo Ivanov wrote:
>>>>  
>>>>    reg:
>>>>      maxItems: 1
>>>> @@ -64,7 +75,6 @@ properties:
>>>>  
>>>>    samsung,mode:
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>> -    enum: [0, 1, 2, 3]
>>> Widest constraints stay here, so minimum/maximum.
>> Why?
> Because that's the coding style and that's how you define the field,
> considering you might miss a variant in multiple if:then: .
>
>
>> If we are going to add new enum values specific for each USI version,
>> isn't it better to selectively constrain them in the binding?
> You are supposed to constrained them.
>
> Again: widest constrains always stay in top level property. This applies
> to all bindings, all fields. Repeated multiple times, so here is
> standard example:
>
> https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127

Ah, I see now. Will get that fixed.

>
>
>>>>      description:
>>>>        Selects USI function (which serial protocol to use). Refer to
>>>>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
>>>> @@ -101,18 +111,42 @@ required:
>>>>    - samsung,sysreg
>>>>    - samsung,mode
>>>>  
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - samsung,exynos850-usi
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          maxItems: 1
>>>> +
>>>> +        samsung,mode:
>>>> +          enum: [0, 1, 2, 3]
>>>> +
>>>> +      required:
>>>> +        - reg
>>>> +
>>>> +    else:
>>>> +      properties:
>>>> +        reg: false
>>>> +        samsung,clkreq-on: false
>>>> +
>>>> +        samsung,mode:
>>>> +          enum: [4, 5, 6, 7, 8, 9, 10]
>>> Is it really true? Previously for example GS101 had values 0-3, now you
>>> claim has values 4-10, so an ABI change without explanation.
>> How is it unexplained? Citing the commit message:
>> "Add constants for choosing USIv1 configuration mode in device tree.
>> Those are further used in the USI driver to figure out which value to
>> write into SW_CONF register."
>>
> I don't see reference here about GS101 and others.
>
>> USIv1 and v2 write different values to the SW_CONF register. For example:
>>
>> #define USI_V1_SW_CONF_UART        0x8
>> #define USI_V2_SW_CONF_UART    BIT(0)
>>
>> ..
>>  [USI_V2_UART] =    { .name = "uart", .val = USI_V2_SW_CONF_UART },
>>  [USI_V1_UART] =    { .name = "uart", .val = USI_V1_SW_CONF_UART },
>> ..
>>
>> Hence the decision to have separate constants for different USI versions,
>> which in my opinion is cleaner than meshing the enums together and
>> choosing what to use with IFs in the driver code.
> This does not answer at all why GS101 receives now different values than
> before.
>
> Explain why you are changing ABI.

Oh I see what I've missed, it should be everything non-8895 having 0-3,
not just the top-level compatible samsung,exynos850-usi.

>
>>>> +
>>>>  if:
>>> Missing allOf:
>>>
>>>>    properties:
>>>>      compatible:
>>>>        contains:
>>>>          enum:
>>>>            - samsung,exynos850-usi
>>>> +          - samsung,exynos8895-usi
>>> Effect is not readable and not correct. You have two if:then:else.
>>> Usually it is easier to just have separate if: for each group of
>>> variants and define/constrain complete for such group within its if:.
>>>
>>>>  
>>>>  then:
>>>>    properties:
>>>> -    reg:
>>>> -      maxItems: 1
>>>> -
>>>>      clocks:
>>>>        items:
>>>>          - description: Bus (APB) clock
>>>> @@ -122,16 +156,13 @@ then:
>>>>        maxItems: 2
>>>>  
>>>>    required:
>>>> -    - reg
>>>>      - clocks
>>>>      - clock-names
>>>>  
>>>>  else:
>>>>    properties:
>>>> -    reg: false
>>>>      clocks: false
>>>>      clock-names: false
>>>> -    samsung,clkreq-on: false
>>>>  
>>>>  additionalProperties: false
>>>>  
>>>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>>>> index a01af169d..4c077c9a8 100644
>>>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>>>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>>>> @@ -13,5 +13,12 @@
>>>>  #define USI_V2_UART		1
>>>>  #define USI_V2_SPI		2
>>>>  #define USI_V2_I2C		3
>>>> +#define USI_V1_NONE		4
>>> Drop, it is already there.
>>>
>>>> +#define USI_V1_I2C0		5
>>>> +#define USI_V1_I2C1		6
>>>> +#define USI_V1_I2C0_1		7
>>>> +#define USI_V1_SPI		8
>>> Drop
>>>
>>>> +#define USI_V1_UART		9
>>> Drop
>> How so? These bring different configuration values. Could you specify how
>> exactly you want me to implement these in the driver?
> Heh, so the binding was made poorly for the driver and driver was
> developed in a matching way, so now this became an argument. Binding and
> drivers are independent, so whatever argument was in the driver does not
> matter really.
>
> What I don't understand is downstream for USIv1 and USIv2 has it correct
> - proper string values without mentioning any version. So, surprisingly
> proper downstream binding, really rare case, was converted to something
> tied to current driver implementation.
>
> You have only one sort of property - the mode how you configure the USI
> engine. The mode can be: I2C, SPI, I2C0, I2C1 for special cases with two
> I2C etc.
>
> The mode is not "USI_V1_I2C" because it is redundant. USI V1 cannot be
> USI V2. You cannot tell USI to be v1 or v2. It is either v1 or v2. Only
> one of these, thus encoding this information in the binding is meaningless.
>
> I even mentioned this in original binding review:
> "so please drop everywhere v2 (bindings, symbols, Kconfig,
> functions) except the compatible."
> Well, then I missed to check on that, so now this mess has to be fixed.

Yeah I get it now. Alright, I'll look into what I can do to unmangle this
mess.

Thanks again!

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof

