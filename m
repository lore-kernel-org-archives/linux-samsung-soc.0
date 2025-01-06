Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C77603F;
	Mon,  6 Jan 2025 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147483; cv=none; b=RfpiUcn4cJWQGA0slmdK/E+d6e8rJ0EnxL/nZev0NzEtepjDCQdK0TszNI/iGqcyMnlZy8M9I1JWi+KiD89vasN1io0qYrhymgv5fmYsxu3HhVoQs1nplNqOBfHI63XuRSLvYUMDEgoXfL5Y69hMrzz4QvH3705preVY5aRaolI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147483; c=relaxed/simple;
	bh=vT//YvoZHXN60RS4cxqWg0W3WG44kRsoBd8KtNhyty4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qN2te0J+TJDP2W7MNhIElcY34a353h/WkTya99RTpYrm2vTEiWDhHrFcl7K6/MQ3c4ja+fBh6boH7636XoHUKS+vyQQ1Qsid6wCofFqpvkichNxyX8UQ9aTL8sNKKiXIP/3fT5poE80lHQ0KS4e8teXy7iISQ+R7ekGHPLFv8dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqkZw8ek; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqkZw8ek"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa68b513abcso2621061966b.0;
        Sun, 05 Jan 2025 23:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147479; x=1736752279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuunkLgNDniHW9DBqAePlIoV8lCR704mAeFac1bTM1o=;
        b=gqkZw8ekYH8hf8x3PE2LK0THnnqffexANa/6aAkLtaXzkYjCRdsVnWbH//L6ObJ424
         Uw2aqAcTFvdb9BvNGjKOjhkLX2groLyk3z6qL/ReCBetEa15WkEtkth5v7KEexsw0LFx
         /BMylk3bTceDEzebbTEOFU+W76ZPaIqy9ciKlgdazokiEqKuzTW15HAusGZ1UmyxUmpn
         BGCb77nyFEbEFoGZiPwhhqPavrUEHwfHcYoHGT/JQeY3Pgdg3fMY2dtGrKcywfCAFMy2
         /ck1oS0LePTL5RdpCtbfEUGOG/r4npMafkBuoXDKXQPN6XculWiajUCzuM1RXcC7N4H/
         lDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147479; x=1736752279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuunkLgNDniHW9DBqAePlIoV8lCR704mAeFac1bTM1o=;
        b=wo4IgcbsYCBNv72pN1wNelsexoJoHtwW5XUiLJYKjQlE5dgF/TUXNGsXoYmbOGl4rg
         Ep89mZFppt97EmyZ2eXmp7Xjd8oU0L7G+Q0j10uo8wQDO0j5Glr7mRTTsVuwdPtdpzjk
         etwZS/TwAEuREWhowN0LlmcKd0BpvPPl/5kd7fgW9ETLEpko8WcVGiFjOurYxrplz3ZD
         1pwD+nhdHtlDy8/L38hex9zAc/d0m/rZA7nT9IhJNNXi4Jf3RNViVaNsuS2LZukkuzwv
         PeRmC66C542BU2XXeY284TAKWNjQv+A13c3aRCNBaTtovUY2yzVQ/CJz4KAA3rAZWzVZ
         nnMA==
X-Forwarded-Encrypted: i=1; AJvYcCUxWMtjRC7rkwo4R8wtmkB26f9o/bFjPKVNqUFaomC+CnZO1sSDcIbRdNCclT111NKHYVye6/hb0erAjNnV@vger.kernel.org, AJvYcCVZnIl1q5A0krr6ItHMz6YvJk50emuMRsa8zHKs+w7Lo5vYFtj9AW+nYoDHucxw9grZlwMR5P8MQqIaSyZCgtsbay0=@vger.kernel.org, AJvYcCWdfP5ZSBm5VSiHdHNifOdcFpkJU5zgov71ZUyaMKqE2J2UK6czcCFL9TYVjiaDz+T6KO7jtlW4//1f@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8q8VggSq+MGC3MBBGHVx3yefUOF2uJNSp5aFsAC0L6dJd1pG
	v+1w9d2dsepm3J/pQxGvMN8Z+7MsBNTCRJK3AfVck81hVy8PClQp
X-Gm-Gg: ASbGncsJFnyBdVYnof0yEzUoyrYqgDFsg0Ff70goRZgfjegDbsT+YqdxmxCidwvmVao
	jKxa47QvMfq4TvoPK339vC+jyJi6EXcn5FC7NZZFwbnviIU4B0moMYnmBRMDo6uClIQ3109v1YG
	+0ytskKiAmSmcZYK1uLUYYRU9PvyH7B/wN3QRROuPP2v7394YakyFipEyZpsR7y8DA7BO94Dhwv
	s8b+BevEPwMMLzyywoQEd1RURsydUF5qCeaThnrqAGSIXcTJMHnn/6f5Lq47sVdT6JFrxE=
X-Google-Smtp-Source: AGHT+IHbLwTDEHotcATlgP44Sg5PEzz1pnmxD3cstjHbts1E6mnuJeL7yroJC8Ey7jKFcDtZXcBLxw==
X-Received: by 2002:a17:907:3f22:b0:a9a:9df:5580 with SMTP id a640c23a62f3a-aac2b0a3f82mr5416462966b.19.1736147478739;
        Sun, 05 Jan 2025 23:11:18 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159b8sm2222577066b.157.2025.01.05.23.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 23:11:18 -0800 (PST)
Message-ID: <39e29fe1-ae45-47e6-950e-536d56cf1905@gmail.com>
Date: Mon, 6 Jan 2025 09:11:17 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-3-ivo.ivanov.ivanov1@gmail.com>
 <kgcgxhfwxdrja6djiv45f45pqwbtwnd2bw63xcsyo2msewkzfr@qypxgl2a7gyg>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <kgcgxhfwxdrja6djiv45f45pqwbtwnd2bw63xcsyo2msewkzfr@qypxgl2a7gyg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/6/25 08:31, Krzysztof Kozlowski wrote:
> On Sun, Jan 05, 2025 at 06:03:44PM +0200, Ivaylo Ivanov wrote:
>>    samsung,mode:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [0, 1, 2, 3]
>> +    enum: [0, 1, 2, 3, 4, 5, 6]
>>      description:
>>        Selects USI function (which serial protocol to use). Refer to
>>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
>> @@ -101,37 +111,62 @@ required:
>>    - samsung,sysreg
>>    - samsung,mode
>>  
>> -if:
>> -  properties:
>> -    compatible:
>> -      contains:
>> -        enum:
>> -          - samsung,exynos850-usi
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - google,gs101-usi
>> +              - samsung,exynos850-usi
>> +              - samsung,exynosautov9-usi
>> +              - samsung,exynosautov920-usi
> I made mistake during last review - the binding had a confusing "else"
> here, but that else was a no-op. All existing compatibles are fallbacked
> to samsung,exynos850-usi, so previous code "contains: enum:
> samsung,exynos850-usi" was covering everything.
>
> You can drop other variants and keep the original samsung,exynos850-usi
> only.

Yeah I thought so too. It's fine, will fix in the next revision.

>
>> +
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>> +        clocks:
>> +          items:
>> +            - description: Bus (APB) clock
>> +            - description: Operating clock for UART/SPI/I2C protocol
>> +
>> +        clock-names:
>> +          maxItems: 2
>> +
>> +        samsung,mode:
>> +          enum: [0, 1, 2, 3]
>> +
>> +      required:
>> +        - reg
>> +        - clocks
>> +        - clock-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - samsung,exynos8895-usi
> I don't see where this compatible is documented.

Right, ommited that. Yet dtbs_check W=1 still didn't catch that.

Thanks for the feedback!

Best regards,
Ivaylo

>
>> +
>> +    then:
>> +      properties:
>> +        reg: false
>> +
>> +        clocks:
>> +          items:
>> +            - description: Bus (APB) clock
>> +            - description: Operating clock for UART/SPI protocol
> Best regards,
> Krzysztof
>

