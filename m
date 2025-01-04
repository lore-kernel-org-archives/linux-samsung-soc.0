Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6767414AD02;
	Sat,  4 Jan 2025 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735983225; cv=none; b=QEyQPkBNjfA4rkf8Oqtsozc3l6rnr22RUNF8+BYhEEdxvZD7wtXTZJQqK9zahEEiMxx3W+IGmpAXL/Ol3xLwMd2Oj2tbyoioWf2TdnkWc1TZJHvQumaYGmD61I5csAGkxUL/uoTr05X0PjqfzxaBol+j+OqsK+JEC5xJJAOLW40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735983225; c=relaxed/simple;
	bh=hiR5087WCn1ZEN9uvHKctscc6QBNwlaEse63olnWpQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maVNakUbM1k6cnw1HOhy7fZOM5XBdLOAuiX51Vdm7tfqmhZ0LbPBg06Vxbuv8w5Q2J2pWGzQ6O3XO+4iL42SSjcWgLv4/dfquP3GJ08OP1/0x20Q4KT0wd3wn6FQG/MC09u/cI8iH9HSfT/HC2+MdKLQRIafohloS0fsekhqKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYVFg9tH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYVFg9tH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa689a37dd4so2054022566b.3;
        Sat, 04 Jan 2025 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735983221; x=1736588021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99XGlWA8sYUvn+NZcnWiPdOjfGCgXUnJjJ+Ku/Ii050=;
        b=MYVFg9tH8anMdIlh6ZtMZYUqLgGm+vPlSo9ADAcUKfFDYCiQRvqqbJXbu83AsGsLgr
         TeOW0MVYmkIWzxPF1I3rWjHqKR/rrgEWOdJh/dyLClvlS50oCyMQdjzwWI3/nEF8bY++
         /UuC/YbValMKScozZy4V3d2YRsIk4MObz6TgivBVphy3+qWKrXuszcQV03HXvqSSn3Rd
         lQhKIGeTKTmttJuxwDC3lCqlHA//nHyyffDgDIkJ/q3WBvK7MDqwcccPF7Vcc5czm3lX
         Eb1VGyYuqoH/HE9RYK7MTXegmLQDh+KCphfTjo9Za/2J1RkzwlPD1oJ3hYoUOwtiJhtb
         0ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735983221; x=1736588021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99XGlWA8sYUvn+NZcnWiPdOjfGCgXUnJjJ+Ku/Ii050=;
        b=rtzeOA6MAh6fv6hBqBfZJ3DpXrWgJqJfYr9iY8H93DBkLA5eAKK8QdMQ5U5aYvnscq
         rCd+zkBevBwnydamRjsjgPMPAJqiWeniR0LUbyOx5aGXwUBZkj1qTO9HAI8y+EywP9Kb
         /InbRGPssLC2+YZEyxYCy0iolkTXY/7VnM8R9RhEyvjMDxflnXs/+Guu0a/uyL/73TAw
         mmDpZQDxHhaF1zlyjxNwaaleThJXs9wZ3y044OvdAhEWKz1H9k86COnE/4xO1SQvXESt
         w+BBiWwnOLBeWO++Rj+j45OcUdF/XJC0qUF6C/x/mG0XnBzgW01/K0d7Gsco1BFISSOt
         v/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWpDWJ02Xs2uJfXJ8Hcxk/ZqjXFBPZ/gbs+XvHWxHcjDjtkY2nQJEo6lP1oAKY3qF+IKESiJlvHooXZuUop@vger.kernel.org, AJvYcCX+dyQo97RYLCZBrdakfNgK6pX2nEO6Q+ckai0qcoKaryC/rP6GnoALsymDXH090tMLkyZKg4wWJFKEUlLIPG3jdWk=@vger.kernel.org, AJvYcCXqjFF706paDVUUZX30P1+y3jMk1Y/sO1b038HhT9CYZ4LgOcfKaHrpRAcn63h0sV7UrWGw9MdzCa8y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7rcKKRUPgPaz9+PYXZUX0BIXfv//2VulcQQkpmhPdTJIcxNC0
	seGgktvQP0pvq6angaC7QqYvpYTN++7NolNS4d69iWJonezSx7Rs
X-Gm-Gg: ASbGncvuOJLzd3QcKp47oMgOSF08DPQSI92Azc8h9OmtsLsu7tnk8w2Vg+kmQw2xD9/
	bL7hIqZoOPcfM32LF1hBxWObn90RSitgmJgysnex1DcDxnowLMlZl+ptwNnpfJyIW6Uc8r+W2VO
	JAVGUXwQUxewAzXOr+BK8wznWQOC65PbNge6f5q1y0PLkthskkgQY2iyrFkaqKr1HMb7YrzkjTf
	nOOsra48bacc4CQZZs2Y41VrfemnaSIi1oeWGSJQ6Ll0sGtkawanSMOy00B5R1ULwwn
X-Google-Smtp-Source: AGHT+IGX0/IFZOKoUPpoqkbpi9w6cuTkdVo0i6Iyxp8Ed0KKnV+HFLaUTSEipHiUzf+2RWIqJN22GQ==
X-Received: by 2002:a17:907:868c:b0:aac:29a:2817 with SMTP id a640c23a62f3a-aac2ba3f550mr3655918566b.26.1735983220534;
        Sat, 04 Jan 2025 01:33:40 -0800 (PST)
Received: from [192.168.0.3] ([151.251.251.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f621sm1986086266b.40.2025.01.04.01.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 01:33:40 -0800 (PST)
Message-ID: <489b8c8f-b817-4ecd-87db-99499ae24288@gmail.com>
Date: Sat, 4 Jan 2025 11:33:37 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-3-ivo.ivanov.ivanov1@gmail.com>
 <bzjuy4idp2o2cgms3zaftrxxz2rg2adhv6gneedrxjpxswgznn@wycin7xdlddz>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <bzjuy4idp2o2cgms3zaftrxxz2rg2adhv6gneedrxjpxswgznn@wycin7xdlddz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/3/25 10:21, Krzysztof Kozlowski wrote:
> On Thu, Jan 02, 2025 at 10:40:14PM +0200, Ivaylo Ivanov wrote:
>> Add constants for choosing USIv1 configuration mode in device tree.
>> Those are further used in the USI driver to figure out which value to
>> write into SW_CONF register. Modify the current USI IP-core
>> bindings to include information about USIv1 and a compatible for
>> exynos8895.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../bindings/soc/samsung/exynos-usi.yaml      | 22 ++++++++++++++-----
>>  include/dt-bindings/soc/samsung,exynos-usi.h  |  8 +++++++
>>  2 files changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> index f80fcbc31..50db63a8a 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> @@ -11,11 +11,21 @@ maintainers:
>>    - Krzysztof Kozlowski <krzk@kernel.org>
>>  
>>  description: |
>> -  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
>> -  USI shares almost all internal circuits within each protocol, so only one
>> -  protocol can be chosen at a time. USI is modeled as a node with zero or more
>> -  child nodes, each representing a serial sub-node device. The mode setting
>> -  selects which particular function will be used.
>> +  The USI IP-core provides configurable support for serial protocols, enabling
>> +  different serial communication modes depending on the version.
>> +
>> +  In USIv1, configurations are available to enable either one or two protocols
>> +  simultaneously in select combinations - High-Speed I2C0, High-Speed
>> +  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
>> +  I2C1 and UART.
>> +
>> +  In USIv2, only one protocol can be active at a time, either UART, SPI, or
>> +  High-Speed I2C.
>> +
>> +  The USI core shares internal circuits across protocols, meaning only the
>> +  selected configuration is active at any given time. USI is modeled as a node
>> +  with zero or more child nodes, each representing a serial sub-node device. The
>> +  mode setting selects which particular function will be used.
>>  
>>  properties:
>>    $nodename:
>> @@ -31,6 +41,7 @@ properties:
>>            - const: samsung,exynos850-usi
>>        - enum:
>>            - samsung,exynos850-usi
>> +          - samsung,exynos8895-usi
>>  
>>    reg:
>>      maxItems: 1
>> @@ -106,6 +117,7 @@ if:
>>        contains:
>>          enum:
>>            - samsung,exynos850-usi
>> +          - samsung,exynos8895-usi
>>  
>>  then:
>>    properties:
>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>> index a01af169d..5fbeb426b 100644
>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>> @@ -9,6 +9,14 @@
>>  #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>>  #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>>  
>> +#define USI_V1_NONE		0
>> +#define USI_V1_I2C0		1
>> +#define USI_V1_I2C1		2
>> +#define USI_V1_I2C0_1		3
>> +#define USI_V1_SPI		4
>> +#define USI_V1_UART		5
>> +#define USI_V1_UART_I2C1	6
> Conflicting values with USI_v2. This is the same property and the same
> driver, so I expect the values to be unified.
>
> Rename (copy) USI_V2_ to USI_ and then just add yours at the end.

I see, that approach could work too. Although I'd much rather keep the definition
names the same as before for USI_V2.

Best regards,
Ivaylo

> Binding then in allOf:if:then should restrict with enum which values
> make sense for which model.
>
> Best regards,
> Krzysztof
>

