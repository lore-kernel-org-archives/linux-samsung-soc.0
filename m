Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8725A2B5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958174; cv=none; b=KWLKuYVIRykxWesgIKoJ+26ilzeH52p5iIb9Rn5+cPG872u9RRBZ4VHZ3XDOSkhvFDAXZDTDo9z9f6dgjsP2Gr64qo4DIaO8QQDHdUrL5taG5h3mPy44Ldb1EYbQ8Rs65vD/4nT0vb5Pp/ymW0Adg1AEcpt3LBDC50niEqgS2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958174; c=relaxed/simple;
	bh=W1JaE8rS+GbY/d7gvazS4gQFxDwV4eMwNOn47dqusZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vi+NwSvM8g4F/otXGc23IOqFYL+GUmb8UN3tTfKV5j1A7Dsp2ysMMwa0tPzS9AINZ9oZtyTHdmOYSOXgtYAMNGumdUbgE28Tk5dXFXQYkjbODKaf+JUN0kjFLSJC0hfPtyEk58ThrksdITEEYcByXFkmuruBp+NIRzal5u+12UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKLcgTV9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKLcgTV9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so22207605e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760958171; x=1761562971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xaDzCk8g9Yg/TwlJeMcBMF5t+X3WKHYwMzLzHQCj6g=;
        b=SKLcgTV96RTAEsTyKqdP//fl68SsWZs0++NzmzOy7PerGASaHwpFNYtLBOenc6ZAyK
         0aB0ohdih/1OK6OQhvxx6+8S6rsfmOdXIpPrRncKOATOm2c7SqLsf/iQW82OE/IWNS7m
         RsC84qBitEiy3uCsBfEItwgIJWHvra4zmElwiYHoyrbLptmGA07smCKzYhEVK9O20NgM
         c/mhqOrbZRyuQvI3EjKcRd2cUjJ61xDaKanZX+HuZIdtSXy91d1gfovvNBXaXWfLikWm
         H4eEVa1Gd3jUEvPSjAgzS2VHNoiF25McgSyd1/0qHiqBlkZsouuLUl2EKcYqjh/1zRXO
         9aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958171; x=1761562971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xaDzCk8g9Yg/TwlJeMcBMF5t+X3WKHYwMzLzHQCj6g=;
        b=T/2UwXzznyyDKT1iU+nQN4HZtYvyy3DVjma/A4zjaCqGifvF+gZsGeet+LrUWTodM/
         TxDODAU2yyYQeSwc8bgJWKrJCNlwH8atQJlaVZD5VTqW7BzOII7vMPxL3VRuK+DFnejs
         VCoBBh6HJAaeeR2b0ZMza1dMZZ0dZFmoHG5iDdw9dZbsK5fVrWnY/qJBHQgUp4zR6l/X
         kCIcOiOCQ9cWG+paCj2dQdnlePbnAo+HiSPylz+PO/q4RU3vyy0grj4Xe+ezv3MjrJ3l
         dpupcdFRiI2UlOSikd+hTD0quOzgQuflCzs6sdKlbj0LD0H9PMUiIcxhEGs+RNzNhHJS
         TRHg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2/cOkyxKWil36tiwgU8GU75mCLtRDBXZp+W/g/Oau0rmgelER1x2xaP5FBo9xzflHnWop1reCof57B3zdmCrXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu4WydYh0iiTPqyp9kEAMlL3QEbigihX+1EjAvRw97LypLkqFw
	+woMvoTMydWJn6O0byIL2hLF3rv+FwYN/px0svPTjXhqOuH+mwoXnn+05PxyVKSdb9I=
X-Gm-Gg: ASbGncsLPnMljKTIYkIzeOtCVOEobjA+fLCIAXHXlAflgw+8tP7MbfmXd9k0Nb6Zzmd
	FjnwUHQbkTtPJ2FBy7YoMfZUHB9cbgvNS+YSJhFL5KHdhd+hH20g5G16pFU/cw8+rU5UtgnKJtf
	BenxdfKjKqdb2lbvrHMpylCXH8hq3JPt12wJWOUsXW2p48vt3Vh+MxGxnTu8qv3/x0v743yUfHS
	8/I/S3K+9ByVe669k2HpYKNizkMY9Lreh1zKTn/jrgkMITkgEP9KSSmV5g9xCiYOsZU4HQGWC0H
	MrBFK2AxnE4QB7/q1w+wvG4wf/Fy4bGdch92TlRI1GZAlXjzHyOjb62HGEWkKmd5Bq73h3msYO0
	/jtTZGu8FMaxctYJ9aMLqUCUkkj6z1JZPcAcI2GA8bkkdja0a74eUU8nA2D3iLQ4rbYMbwQ2FQ9
	mp+42bBPgU
X-Google-Smtp-Source: AGHT+IHVRGuyj2IpvPopVEw/V/0JRaYFv5Zr9eggn9/gr+9TUMeVNtov2/qg5jgRutFZM+D2sOlUeg==
X-Received: by 2002:a05:600c:820f:b0:46f:b42e:e365 with SMTP id 5b1f17b1804b1-4711791dce8mr93413745e9.39.1760958170945;
        Mon, 20 Oct 2025 04:02:50 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715520dd65sm137785635e9.15.2025.10.20.04.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:02:50 -0700 (PDT)
Message-ID: <de77e673-c2f2-4293-88bf-be9c6779a5dc@linaro.org>
Date: Mon, 20 Oct 2025 12:02:48 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
 <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
 <2f8da425-63d9-4321-9cd3-976bbd29a52f@kernel.org>
 <a03cd07f-8e9f-4b02-b301-f1bbb69eb7db@linaro.org>
 <f6812244-8e8e-45b9-87b9-fe96d740a843@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f6812244-8e8e-45b9-87b9-fe96d740a843@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/20/25 10:58 AM, Krzysztof Kozlowski wrote:
> On 20/10/2025 11:19, Tudor Ambarus wrote:
>>
>>
>> On 10/20/25 9:22 AM, Krzysztof Kozlowski wrote:
>>> On 20/10/2025 09:45, Tudor Ambarus wrote:
>>>>
>>>>
>>>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>>>> --- a/drivers/clk/samsung/Kconfig
>>>>>> +++ b/drivers/clk/samsung/Kconfig
>>>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>>>  	  status of the certains clocks from SoC, but it could also be tied to
>>>>>>  	  other devices as an input clock.
>>>>>>  
>>>>>> +config EXYNOS_ACPM_CLK
>>>>>> +	tristate "Clock driver controlled via ACPM interface"
>>>>>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>>>
>>>>> I merged the patches but I don't get why we are not enabling it by
>>>>> default, just like every other clock driver. What is so special here?
>>>>
>>>> Thanks! Are you referring to the depends on line? I needed it otherwise
>>>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
>>>
>>>
>>> No. I am referring to missing default and defconfig patch.
>>>
>>
>> default m or y would force compilation of EXYNOS_ACPM_CLK and
>> EXYNOS_ACPM_PROTOCOL for all ARCH_EXYNOS, even on Exynos platforms that
>> don't use ACPM. Since ACPM is not universally required by the Exynos
>> architecture, I thought to make it opt-in (default n).
> 
> 
> Just like every clock driver. So again - how is it different?

The key difference lies in the universality of the hardware interface
across the ARCH_EXYNOS family. If EXYNOS_AUDSS_CLK_CON, EXYNOS_CLKOUT
are considered core, integral, or nearly universal features across
Exynos SoCs, then it's alright to have them by default. I can't tell how
common is ACPM across the Samsung Exynos SoCs. I know it's present on
gs{1,2)01 and e850. Heard it mentioned around some other phone but I
can't remember which. Maybe we shall set to a default m when more users
reveal themselves? I'm of course open to drop the defconfig patch and
follow up with a patch setting EXYNOS_ACPM_CLK to
"default m if ARCH_EXYNOS" if you think it's common enough.

Cheers,
ta
