Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1783F34BA21
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856994; cv=none; b=lHgndaDWx/F4cR1zEj4a/1zTSwn7rHilJVF7SBQPb1Nse9JlxP0Ga6IppThr7eXnGP/Yi092/22kMwTe4XsouguQo1kBubdg3pFvapF3qIjib8NXHigeMLWMb7HJQThONJVGFSVi71t+ZkGOYsaY8HWnaZGxF623Zw2C2qJXErI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856994; c=relaxed/simple;
	bh=HLKGy0mKbpQ8h+3kSmFm7cUNZcoYemdFaDqBdUyA25s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t3310raX9OtOqbk1H14wQsupA2z+oGKaPMdvnmjYhitC+/1buozNosld1BSy0UF7PB/DPVMjzdouxeo7v3KgmJ+xbaZkYVTnMdMXIDz11au0c8TvJbqGoVhpCul6h9Z1ldP73v7VKuY0XeMMejC0Lr7x9whJG6g84Jcvthk4GT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TLCrMhPQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLCrMhPQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso18513825e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 02:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762856990; x=1763461790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mA4OYGuehEdlKuRHHZkCIxOoAid/iNBTle5X4sDzSO8=;
        b=TLCrMhPQRzB5j1v8TSW+sC6RojrdNXA+tcJLfzUaCy67lu0rwRNX671GZX7SEsO7VJ
         jf0LIWKMK6zabvAzsT9FcnEJpS6oZPVF50f5PsBDi6j0i4NxgYvSVGc5GgyIyO22tZRw
         TZwMmziLkzn5BPKWVbOdWRYwZjKSWuNpyjueKv7Kgatde6o7ePHyG5fcb/l9XGktgzlo
         tWmxMNqjOEMdG8BmqKjM3lqwtnxvbQQiAiDM8u6IllVDiwPnGDAykBzVQ3FkrHsLXxwo
         Yn/ZInsymFSXOIZiCtFurlKCJMRleUvC6//X8eCPEMGQYrLxeXbnQYNkF4S6ABIlVsLT
         +e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856990; x=1763461790;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mA4OYGuehEdlKuRHHZkCIxOoAid/iNBTle5X4sDzSO8=;
        b=XKGIyTNDF5L6uikyeO6ijYyB2yKsLu7+AEmzu1sHTzwz90AHZCVXqfDbb2RsH7GiHj
         GFTklR92EzgUHH+D88pXpap3zAEK3lS9Mhr8eUJSE/H+v8bZ+4ImH1k2aPVtOXdWPjcb
         D9NML+i+kdHIUH5z7PqgbWR3KwMMuo2L2kB6pJOrqrPJxXAhuGfl3A4oD+J8RLKk3aDb
         kovY97aDT1ZZKDOx2XbyQLf+V9/R8TbhkriO46Gdro2yXY8Po5yLmPTtB/DIokDaASrl
         uaOwPKljMHQd7HWYPV7/qgEnPVkUMa2DEOC+Pvv7YWMy3FUy/RdOJLOaiP/quYdw2wYu
         GobQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqcjZ5kbGire6x0W3JLXx3ANFBwtq7eDAyljJWVwx21oHY8ymi28tTznaAGZSpaAAeF1uN+394Jikg/0jwG/ellw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqhoDuXGwx0NGOR4fDIBPU/gsnehBYXZjihvooXXqWoWZoYLUi
	9fMGfERoV2MnMp5ZdXoIDcydVyP7sW3ZroRQAlM4jQ8xrIgXDkCUoc3t9wQ6eG1bKE4=
X-Gm-Gg: ASbGncs+h9nD0D6ifqfyVwf9rfMXUqVk+nnIHl5t1bSaJaRODvNMs1H2yPLevM2ii7t
	iUgcDf0hofmbNo14U1JXdPJBesxFUHM7r6lakzivejMmnIKYWrrEX4h1WYwcmiSz18vl2CGSbou
	Bb4fH16LpQaBl8I5IxeCPXlUbsTPR1w1pWmrGIAMTzleAxe6donxM4dnabR6P5TR1vGStrxOPqn
	kw1GEwYEFjSG3WjGg4pglu2yH6FF35+mNWTAPY+nA9UvRa3sqoSN3oLU6eS4k0TNrN5q03Tf2bu
	Hpqv0qXTVhKJfW/iBDdGSp4UIiBMamtBNkeiYalIegtmL6jdmDhblSazLsyBdVJJBidfarWgajs
	7trlA6cvssp1aEt1F2NGc3wFEZFNSGSj5TjrhpahT/9SFICt1wrhUzVi707wLMj1A7N/sZzcCnw
	EIR6HEIzjcwyedgSY+ZscZMkFRUy4=
X-Google-Smtp-Source: AGHT+IEvLEjIZw4+8whQM79OrY00R9vJVyO1rxoxD4fhQm/KifAlq8r0yaMnGCz1oNKbvCj2h/xcDg==
X-Received: by 2002:a05:600c:c4a3:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-47773290e9dmr106627935e9.29.1762856990270;
        Tue, 11 Nov 2025 02:29:50 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675caecsm27313955f8f.30.2025.11.11.02.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 02:29:49 -0800 (PST)
Message-ID: <5eaaf3cf-a271-467f-b015-9cb9b49590f0@linaro.org>
Date: Tue, 11 Nov 2025 12:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
 <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
 <176282517011.11952.1566372681481575091@lazor>
 <c5db97fa-8789-447f-909a-edbdb55383f8@linaro.org>
Content-Language: en-US
In-Reply-To: <c5db97fa-8789-447f-909a-edbdb55383f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/25 8:24 AM, Tudor Ambarus wrote:
> 
> 
> On 11/11/25 3:39 AM, Stephen Boyd wrote:
> 
> Hi, Stephen!
> 
>> Quoting Tudor Ambarus (2025-10-20 00:45:58)
>>>
>>>
>>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>>> --- a/drivers/clk/samsung/Kconfig
>>>>> +++ b/drivers/clk/samsung/Kconfig
>>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>>        status of the certains clocks from SoC, but it could also be tied to
>>>>>        other devices as an input clock.
>>>>>  
>>>>> +config EXYNOS_ACPM_CLK
>>>>> +    tristate "Clock driver controlled via ACPM interface"
>>>>> +    depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>>
>>>> I merged the patches but I don't get why we are not enabling it by
>>>> default, just like every other clock driver. What is so special here?
>>>
>>> Thanks! Are you referring to the depends on line? I needed it otherwise
>>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
>>>
>>> ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!
>>>
>>
>> I don't understand that part. The depends on statement "COMPILE_TEST &&
>> !EXYNOS_ACPM_PROTOCOL" is equivalent to COMPILE_TEST=y and
>> EXYNOS_ACPM_PROTOCOL=n, so are you trying to avoid
>> EXYNOS_ACPM_PROTOCOL=y when COMPILE_TEST=y?
> 
> My previous comment was misleading.
> The depends on line allows CONFIG_EXYNOS_ACPM_CLK to be selected in two
> main scenarios:
> 1/ if EXYNOS_ACPM_PROTOCOL is enabled the clock driver that uses it can
>    be enabled (the normal case).
> 2/ COMPILE_TEST is enabled AND EXYNOS_ACPM_PROTOCOL is NOT enabled. This
>    is the special scenario for build testing. I want to build test the
>    clock driver even if EXYNOS_ACPM_PROTOCOL is NOT enabled. For that I
>    also needed the following patch:
> 
> https://lore.kernel.org/linux-samsung-soc/20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org/
> 

What I described in 2/ EXYNOS_ACPM_PROTOCOL [=n] && EXYNOS_ACPM_CLK [=y] 
can be achieved with a more relaxed:
depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST
because of the stub (dummy method) that I referenced in the link above.

It's really what Krzysztof explained in his reply, I wanted to avoid
the link failure for COMPILE_TEST [=y] when
EXYNOS_ACPM_PROTOCOL [=m] && EXYNOS_ACPM_CLK [=y].

We have the following possibilities with:
depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
1/ CONMPILE_TEST=n
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

2/COMPILE_TEST=y
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n,m,y
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

We have the following possibilities with:
depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST
1/ CONMPILE_TEST=n
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

2/COMPILE_TEST=y
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n,m,y
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m,y <- link failure when y
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

Thanks,
ta
