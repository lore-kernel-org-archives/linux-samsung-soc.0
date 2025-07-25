Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745922D3720
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753436135; cv=none; b=nYd1rNBr52W8w2Yp22g8hDwp0xSlAIvaX5J47vpx4LWKYlksrip7C0o/OZFOkGfjQKaFufUj7ISgC7K4XnKKkNg7nfkfAIXwDnK/DW3Ka2sqGP6Nt8uSo0lMyzICEJN63oYdzNcquK1eGYGoQmdEqx1TAiePKKkpUzUqmyJJTD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753436135; c=relaxed/simple;
	bh=ZeUEe5UMSkF0nT6hu8e6znARfMishOxV9+MvpVMYNMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OXEfYxBtC0D39ZOwJzLPRPzcSkJMjNMuX1zipG/aqQcoZJPSWtFnvrmyN8XDJla4EnYh2zdU3WP8C+qbEa2juIR1tBp9JrAVC9Ud9PHbCdIDahs3ceHWtz4pgnqES8JJ4bzNLIPf3i5HSCSJvSGWgZqACvAnpo9LT5WBTJHybGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w61BR3YT; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w61BR3YT"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-af240271376so9706966b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753436132; x=1754040932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDMKZbsNj1pOigcD3OAknDIO20Ymz/IvNYLVkYnxKJY=;
        b=w61BR3YTlniL1IxpPKc3hOU/eNygJr1PZbLeVYElN4vzWzo21AgdM/a0IArXnTRkcV
         OXGev3mxZH9HsYUDaZOJ8DSZ7t2LSbgIRi5pInBZJ52icIqdDsYHz9wqWclBs3mlg/hS
         Em/iCgLgf3t/VfS0bS2Aj6782wNhKEnT7puQkPHL+kQ4VUAhH5TyGsS0HtFz0xvWr7LU
         FYsQuNZyrpUokCX4jkn/wDDDgNC8CMroB5wujLtGd6tZlzjQZOFLtZCGwi3f4G5TaM6N
         j3xqtg7zLWFfoXGlxWJEvuiNQs90f07dl2N2cq75DgPmUiADx19TBx4kBjQUAnAKvWxk
         Ii8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436132; x=1754040932;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDMKZbsNj1pOigcD3OAknDIO20Ymz/IvNYLVkYnxKJY=;
        b=fR32Bu4Hf3iZIQhBDBFbG0UQyvSzbflmreoxhhl7omYPsbkrfV3YjAOJCFWEBHfrWn
         dbkaS0X9Fv7MuCY98Mpagpce1euKJL83x9uxCGQws674WBYfE/048AnDwSwAN4h6m53c
         qZzqIuwowb3S8osNmJ4b0zjcmc3Yt/SF6BN449XfbqjV5ncu9jkln/gk+GFhn1PDV3nQ
         WSnHWhLtrv2toz0Xpe8b4h8dXEv43hCxoMEdhJvOIdFh0I/OV1S9xnfAigYK/t6tcinW
         F/zro0/qLqv2umLID8Cfz14fNf0xgAxbsKgWGA5gg4NiU0HZqOfjTTVdn31rUQnCrQs4
         FFWg==
X-Forwarded-Encrypted: i=1; AJvYcCW+xaQQNRseYDCuKYtbkUfDSu3VPPy+fzlfLxBTgGr5QP8zFXgq16EreOvi5xcI5aN5s9v/Jwtwpw00A9r+C48qoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmspHZPF5xdQ/UlPddFla7lU3pJGGTx3QJp160H6HWAccv9C54
	Boki//UC32nEjZFGV4jT511++pliHLCycLIO8wT1yXsF5+XQTx73UZqJRCy/niLPPYY=
X-Gm-Gg: ASbGncvIGKqlLowxXdmiaxUJDo7j3mjeLgqGAnpizNHPGU55yeRgk5+FpsXLa2l2Qj6
	4xop3OiHTVDe8fQ/1gmbKWzzBFvChQLmusLI1uKb2huA56sW4VNcMu2ZBfgbpTr8bj57NitiwJh
	j6ORXN3LB+p1kJzp+la4/W6NzyreXuuz0t+OhuMNwfKCwxW4g0BL3naavg05BXmezeFJZMcfyIA
	KX7+BTxF6MZrfTiJsezWF0T86KsXB3Ld+K1BDkKu+TsqdE9vn7WMoN7YYFok3mU1o3AsyyvMRYS
	SDVLu6ZPvOpktb8SQ0L9uj5fbquctHOpUvQ0FW+bB3dKwXnFMtWK9BjOcQpIcLwkObrNLp7CBUy
	jOEk1VhvMlN2ndUhzvsr7Bqjw1OHXBKe88fk3ErBNVA==
X-Google-Smtp-Source: AGHT+IFjiVZZ32q3obKsi9AEKl2X0egSMuZxDmapd1JUsHMLJYh42zTLmdtEZlJiYpYiDguGWh7Mzw==
X-Received: by 2002:a17:907:3f98:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-af61d37bb30mr56205366b.11.1753436131668;
        Fri, 25 Jul 2025 02:35:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f44dfa7sm244121366b.82.2025.07.25.02.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:35:30 -0700 (PDT)
Message-ID: <2f413942-8126-4d94-b64b-c4a05052b5a1@linaro.org>
Date: Fri, 25 Jul 2025 11:35:29 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Revert commits causing
 section mismatches
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Will McVicker <willmcvicker@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
 <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/07/2025 11:28, Daniel Lezcano wrote:
> On 25/07/2025 11:03, Krzysztof Kozlowski wrote:
>> Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
>> support") introduced section mismatch failures.
>> Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
>> mismatch from the module conversion") replaced these to other section
>> mismatch failures:
>>
>>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
>>    ERROR: modpost: Section mismatches detected.
>>
>> No progress on real fixing of these happened (intermediary fix was still
>> not tested), so revert both commits till the work is prepared correctly.
> 
> Please don't claim the fix was not tested. I reproduced the section 


section mismatch code MUST BE tested with enabled DEBUG_SECTION_MISMATCH
and disabled SECTION_MISMATCH_WARN_ONLY. If you have warnings which you
missed (although if you have warnings what did you fix?), means you did
not prepare testing setup.

> mismatch, tested it and figured out it was indeed fixing the issue. I 
> just missed the error because it sounds very close to the first one 
> reported initially and I did the confusion.
> 
> The driver is not supposed to be compiled as a module on ARM32.
> 
> The option tristate "Exynos multi core timer driver" if ARM64 is 
> misleading. From this change, the defconfig on ARM can do 
> CONFIG_EXYNOS_MCT=m which should not be allowed.
> 
> Before getting wild and revert everything, let's try to find a proper 
> fix for that.

I am not wild here. The issue is there since 9 days.

Best regards,
Krzysztof
