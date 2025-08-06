Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0328C851;
	Wed,  6 Aug 2025 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754489145; cv=none; b=WGcYaj6YdIQDDy6ATmfRBzJ9y+tHRI+L5febaSudGdWHALOG+rrWgYaSUoCJatrs2orlFBDmbPTR3BDHUo3lVyVekdeHhznwV+8lUIxJUIEjDtaZPkBLBdssUoS+AiG8tc+H3Trjocn9EVanNKMBGMAm1f11nekwtLkwPVuUxHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754489145; c=relaxed/simple;
	bh=nzXnJV2H+LOQWvXmb8R0wxyG9TSdceTV7d3RuFUb30o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAirtJdiWbYZ+MG4RXQ409QBuTB5joUoYmBRthSORazd4tjkV90mWDY5A6zjFbegSQa/usQ308+XxgDatuRYIOw8k1hE97r1D9XiSfZsCms54b3FxrMviPW4TtC/e0khIs+OuK2WBLJD8z85SyVlE99JbFNp5QIQePgrw1D10Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQh4tsIx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQh4tsIx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6156463fae9so1746038a12.0;
        Wed, 06 Aug 2025 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754489142; x=1755093942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lzSqgmLuDsaT1UbcCVkz5i3150XmTSjjDVRV2LRjBs=;
        b=KQh4tsIxMCncXZnRb9zJ6Dhlf/9WdKFDpsqhXcaIXlbICgzeZResLYrRGjapD4YGqL
         b0cRmBnfIrnX6aXjvPbjSi2lUpHcV9C1D/f0KwEJaGHlKBQ1Tsvn9okN7QsctEBy3rTa
         S2GVLtW4zY8fVjwUHYCsgvyW1WrMoiiAzGFTr0ND4KpMvdx6RNg3YOYnFeZ5jV58SDvF
         EhBhQx08brTgMMGC9v52/Hk3IhgvrYJbLFpybWkTUJ18YvP4Mekx/7azzv32za5Rhlwv
         JQ6YGENeBVWZ/B9RiCACDcybTs1y+ovsEh1X2sW/RbCkcGV6wHR95brxrkDbOMp66xvk
         m4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489142; x=1755093942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lzSqgmLuDsaT1UbcCVkz5i3150XmTSjjDVRV2LRjBs=;
        b=FUJ/RruV3egbDBL6lLaHWUsmtpQbh4XWkQvU1MJEP8WuglHfoHOtYZTNQmIWHAIeq0
         6Hpxi19Wko02kFAEWQfCaSspWTRdiCamohwPSQM+v1S9GRGTWtohgQO/uABr62R3K4Wa
         q5pYCzHdg9E+ADh5K45tG98mG/sQY1T2NgT/owkr3R44lRKNHWy+UD6bfka1d0H3sgMo
         J9zj6Dc09mdIupDoJGYLvNN9tPdnck5AG16DhsbEkZ9tP8OxT4Axw1F6U/rVxQkPLY4u
         z4OSY3rhT3njqAoJa2kFgoCmRFz9wp25OSgaRGy7DBPY5LEK306N/qgrw1bixYJGt9iq
         r+gA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+9rALAKM+fweKYC3MOfOAqG7cU8xBcAg4ffIAsj8BJJyG3Y46nqllLxuACEtm/AVVLe8klCawS6QjSj0VshoHwk=@vger.kernel.org, AJvYcCWqTiDY7uqjN7rAGKJxI1hDBvvtKdoSpik4+CaX4S1DGbZ6G27/5pmCmj3yUWgePJguKtbjR/Y6/sYB@vger.kernel.org, AJvYcCXqA9T21IihSs1vwGXYTBuHgTKBxnyg1SKyWi0MZ6XVxsh97kfmV7F1M5/qN5Saw9W3H91bZHs2+Hdfclww@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+nnxLOsezq5E2c/gKFvqhfoTrI256vjG+zg5mzhAYo33Pz/GS
	+ekgk7wKeXUyle/mB/2MhEP4pqduI7obDosp0s5tgu2kNgvBuyc8iGU+
X-Gm-Gg: ASbGncv+VbMbXRr7agtKxZ8ViNttFubEFLfDJxFcXOGpPR+ugXxqURsqeUdlmmE1tpe
	sGqFqzBetVVvHiKdHbvzM1rOvsLP8Gue5o8rjDHZLlNwnCK59gir5jmDyQ3T6bPTR3XLCZWPae+
	7G6XAhjqtd7jPM4Owd+NQTpZcg+AG3yLptG88Qu6cZ//+VpbG0LO4IOIGqjr4mUrf7J8xx2ilGq
	MIfI+1mqNZAxWyLir1nSz40fyFCz5MkVXhkd9ZyW1ufr+DJFRMaZNg2/wytA4AVsO7vfM7bZqEP
	DFB0tlr5XmQvknsl9d+OxUCr39wy1hcn144WlzP3Jror8hcEZBXikdJOPj0NespCNVi3r95NkK3
	KiUmxNapY6eKuW4I+hDXOUVdhMmgu9742/KGHxIAyXdtLsloRMxPdZ7HKxIgamx+csQeL/HJ7x4
	wQ
X-Google-Smtp-Source: AGHT+IGi2hEZYx2aJxgqivrh7ZZi3SqYFIp+6WucXhT44MYse/YZgsazsogj6Ura8DuadHFDLR5xmg==
X-Received: by 2002:a17:907:971f:b0:ae9:c8f6:bd3 with SMTP id a640c23a62f3a-af9907c2fb1mr311163566b.7.1754489142006;
        Wed, 06 Aug 2025 07:05:42 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91b36e91dsm1071448766b.69.2025.08.06.07.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:05:41 -0700 (PDT)
Message-ID: <adca090e-27ba-40db-bf99-54d27069415c@gmail.com>
Date: Wed, 6 Aug 2025 17:05:40 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: exynos2200: increase peric1 and cmgp
 syscon sizes
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
 <20250730074253.1884111-4-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4=QwTv96KMdJ7tcWd+Swh-fC7+h9bo22e2aZMeRbg4wKQ@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4=QwTv96KMdJ7tcWd+Swh-fC7+h9bo22e2aZMeRbg4wKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/2/25 01:11, Sam Protsenko wrote:
> On Wed, Jul 30, 2025 at 2:43 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Some USI instances have swconfig offsets that reside over the currently
>> defined syscon ranges for peric1 and cmgp. Increase their sizes.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> index 943e83851..bab77b442 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
>>
>>                 syscon_peric1: syscon@10720000 {
>>                         compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
>> -                       reg = <0x10720000 0x2000>;
>> +                       reg = <0x10720000 0x3000>;
> Exynos850 TRM says that all System Register instances (in Exynos850
> SoC) use 16 KiB (0x4000) of address space for their registers. And I
> can see some SYSREG registers actually have offsets over 0x3000. In
> reality though all IP cores are aligned by 0x10000. I have a feeling
> Samsung does the IP cores integration in the same way for all their
> modern Exynos SoCs. It can be actually deduced by looking at the
> starting addresses of the nodes in the device tree, they are always
> aligned by 0x10000.
>
> Hence I'd recommend doing this:
>   1. Use either 0x4000 or 0x10000 size (not 0x3000). For the
> reference, Exynos850 and gs101 use 0x10000 value.
>   2. Replace the size values for all sysreg nodes in your device tree
> (not only peric1 and cmgp), for consistency and to prevent possible
> issues in future.

Alright, thanks.

>
> Also, maybe it'd be better to use "sysreg_" prefix for these node
> labels (not "syscon_"), as it's called System Register in TRM. But
> that's minor, and probably out of scope for this patch.

Does not matter that much imo, just a label. You could make a patch to
rename it on other trees too.

Best regards,
Ivaylo

>
>>                 };
>>
>>                 pinctrl_peric1: pinctrl@10730000 {
>> @@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
>>
>>                 syscon_cmgp: syscon@14e20000 {
>>                         compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
>> -                       reg = <0x14e20000 0x2000>;
>> +                       reg = <0x14e20000 0x3000>;
>>                 };
>>
>>                 pinctrl_cmgp: pinctrl@14e30000 {
>> --
>> 2.43.0
>>
>>

