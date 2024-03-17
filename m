Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C551C6A4
	for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Mar 2024 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710689221; cv=none; b=YKj/jiqPL0pp5xPniYgKXdQ418aAAPpiLhmHzrMKLACRE+qlOFq0s/0xhXkNKxT6lug0kj5pLIUsk20sYNEQCHKKXEjZ6HZZ04zVL8R/niL4ODzXuSalNvQNg+KmyHEnI0b7+FmQqjSuOLQMGo0YVvrqGGunoQ2hhgCqKW0aZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710689221; c=relaxed/simple;
	bh=xjlalaPHr7PCM/uCvvlBxJnzyT7VMSZjEnPEIkSNxVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Db0ZhRTKSrN3i1J6TrrNbRip8VThAF9sUleFJWAG0iFhL+Qn1qrqcteB67bfEFafXorSKm59T9igsrnahq/P8iSvx97JkruDn5oqv5tRu4+QvUKAaPBBFoXbbWVyxs/VSV3ww7qbPtR8Fr1+wlMjKjASK+ykJg+v5cmXXnOV5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rzdmrdE8; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rzdmrdE8"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-568a9c331a3so3018513a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Mar 2024 08:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710689218; x=1711294018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1GydW8fho2xm28D1MjHoIdz14a0vow/iDN2ooGgdYY=;
        b=rzdmrdE8dI5+vMYBusVRIQKics/o82bjbdj3Wi479f+ntnMI6Lh3bjPOXiJd4/ldVi
         G0x9kp+ViDHbBCsOK93uXbjuMCKOyD5Yfpo+uI2Io3UZN7k12qJSFBHqVZZ+GWhA1JFa
         hRwqNCyvH7TI1LObf9t4hOzYT6pvEFcx0zGvyj7nkHh7gPyu8kNXtmkBisTp7cluGE/r
         +lLVK77SVq5UTYSqUGlmsYcKSdw8dCkx1t/F33mjbZtCEjtSjSlmqkqeev217+t8zRxj
         iMJ3NQuBv603UvB1dv9lHYUh/QV4VXDGXth/HHNP9UTmcl1oXt/Er4HVDi906NfO3kug
         qgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710689218; x=1711294018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1GydW8fho2xm28D1MjHoIdz14a0vow/iDN2ooGgdYY=;
        b=rUpcGItpcyAWJt50683vZ0YRJUpuYoApBNPIc4kFVkhznZ1vOas82STJYAJyWYmUNs
         V4SWP6mH6ByPoASpEi50rmOXIGvWQFPY2G7jfqmvUrwyG4HkPcF+N6unJEgr4/zthKjr
         dtj590iWr31GMwQp3z6WMcEyKoiBSOfcYYZ40fnpv0xTXjYzLgIshvrVcwgVqiefPmdE
         dw73O6lb8zWdC+a2tpDLEzgca3f8Rsl+urY4In3tLNGXT8RF/R20XyzX2/r44AqYlRyy
         jzjVfPW1b1oZUhuGua6JTzSSvpxZd0TCwTUbB9EZNgOnz6eCTV7TO0NAHmGcjiSyf77c
         K6WA==
X-Forwarded-Encrypted: i=1; AJvYcCWbTgWBSff00cqCSCZn2ikTpvLBpwT6+zW1CZS2pAFHE0BG79UYhvNqCvUFNqWlDq61pSySknMR7JiVyYLZ9MekS5xUUqmFRrC57dJsVociNJY=
X-Gm-Message-State: AOJu0YyaoMudcPIimskbMLcH3UrN4u8iDhSWHa8T6x1L7V44XiX2CP8w
	+4s73E8mJ0PuaTxiivGIcWF0+M8PKAooGeqxBJLTnY8oIo7Z/VlRMVFAbUi1iro=
X-Google-Smtp-Source: AGHT+IFA3/Sm/GC71EC8oPWqKbhJbUqKKvrW+w59Rcn01ddOTCghb/OiDZ1WaQH624MBuDOh2J4ijA==
X-Received: by 2002:a17:906:1309:b0:a46:acdf:5a20 with SMTP id w9-20020a170906130900b00a46acdf5a20mr1670196ejb.37.1710689218075;
        Sun, 17 Mar 2024 08:26:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id ho16-20020a1709070e9000b00a4672fb2a03sm3756177ejc.10.2024.03.17.08.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 08:26:57 -0700 (PDT)
Message-ID: <60039f49-a20d-49b9-8a3d-2ded499435a4@linaro.org>
Date: Sun, 17 Mar 2024 16:26:55 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: samsung,s3c6400-clock: convert to DT
 Schema
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240312185035.720491-1-krzysztof.kozlowski@linaro.org>
 <20240317-curator-smoky-99568f9308bc@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240317-curator-smoky-99568f9308bc@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2024 16:23, Conor Dooley wrote:
> On Tue, Mar 12, 2024 at 07:50:35PM +0100, Krzysztof Kozlowski wrote:
>> Convert Samsung S3C6400/S3C6410 SoC clock controller bindings to DT
>> schema.
> 
>> +description: |
>> +  There are several clocks that are generated outside the SoC. It is expected
>> +  that they are defined using standard clock bindings with following
>> +  clock-output-names:
>> +   - "fin_pll" - PLL input clock (xtal/extclk) - required,
>> +   - "xusbxti" - USB xtal - required,
>> +   - "iiscdclk0" - I2S0 codec clock - optional,
>> +   - "iiscdclk1" - I2S1 codec clock - optional,
>> +   - "iiscdclk2" - I2S2 codec clock - optional,
>> +   - "pcmcdclk0" - PCM0 codec clock - optional,
>> +   - "pcmcdclk1" - PCM1 codec clock - optional, only S3C6410.
> 
> I know you've only transfered this from the text binding, but what is
> the relevance of this to the binding for this clock controller? This
> seems to be describing some ?fixed? clocks that must be provided in
> addition to this controller. I guess there's probably no other suitable
> place to mention these?

To make it correct, these should be made clock inputs to the clock
controller, even if the driver does not take them, however that's
obsolete platform which might be removed from kernel this or next year,
so I don't want to spend time on it.

Best regards,
Krzysztof

