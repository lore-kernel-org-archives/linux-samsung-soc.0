Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513C185B56;
	Thu,  7 Nov 2024 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730995361; cv=none; b=MIvCxNbx44cv41RYOa028dgI788ltQgEURh/XpXvdjX2NcSHX8rTlDyP/mrDxk8Nkm5/E2tCIErsZOYIrh4mWla0ZjFjNiszcjuYSW3s/3X7iHYIfumulw0c2n9Xp1IAotR1NVdoR5jRK7iVaiBbema116OVxLerjAYC0j5QygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730995361; c=relaxed/simple;
	bh=5H8VYUSsa/rmfbbmvwzdB/Qh2fQw/jZe072rqC3lTN0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=raDmNgBgMgd3S4ETZreOzNQOhASrMCH6Sv/E1L3TrL+ywwgVqvp/ZqGFBDD+uYvgFfyFtjKoORJUAp6mO0aSS8MuNG9AmYb24sGcz3tVG+frSIaWWkha/49VUZvQmVNu0jt8Ps1/ai2oVW0xndS2MnmgdKnXlaM2xeGxCrods4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ubuq8N3t; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ubuq8N3t"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so175423566b.0;
        Thu, 07 Nov 2024 08:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730995357; x=1731600157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TJvjIBgWdRVHGu4BERauGlILYwLjHhOYN8wmcaPbpjw=;
        b=Ubuq8N3tI8Qg0vV8VaXaMhxCTqpTHIVby5L0egHdaRtWt7h8dYryXNb566Yz9kbalN
         UqLt1ACzjlGJDyxcMBj7ujmVIrCl/4a7YMZEvWmjP6RYKhnKsei8CQDEzP+4Bvp8gnqb
         UlCb3GU7nhEaUjIQHSxhEdS9LuQnVAgR4yLlrqeq+5bOd8Lm1Oly5mYmLbGCXiebfyDF
         6KpXfwOKT+nHlu6AY2b93CK/9Eb5TrY8aHsJrdMHbeGBsltqGSS/+Bz5sUUPvFHlfDv5
         stfhpywIhlHRNmbvsjGN1gCJAfwxt5yq7HySfFTc1GGMH1jj230ZzCpYT75b8lnlJCZe
         xkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730995357; x=1731600157;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJvjIBgWdRVHGu4BERauGlILYwLjHhOYN8wmcaPbpjw=;
        b=ecc6esPhJzJ7HryVKAQawfslCEvPHszzUb5CfwMKndYRSsiIfNF1HlVYiopb9hgtcK
         qskcsRbEvv3tckFNZcXO/HMnXwYPQHT5BQb8R+Xh5G1tVkP2tJ65Njkg1HBWNRXFUCtO
         CrybtGN/mMgO+cqKAZYJbZqpq4+xNVpq6p4s/zQtyrh9kQ9ps1iGprm2sQBY61khLgO8
         /JN03FjLQm02IAlTf3PvTatpJOjbncd1ufPx+5ld50eLohRsDEwVOpN853pvruUjj37h
         +IHw+onZaYT0D6IP180HTRyHYmT1bC9Vrf1STPqfJLGV+IPouvHSwlUU/whXLOT7y9hU
         +IHg==
X-Forwarded-Encrypted: i=1; AJvYcCUa9OFZVZtLo8Hl4xY0t3NXA7zkMZT61GCsh83bkuEP/UhsxCvw0QWnR08/QovoDI1Bu65nXPhglnEB@vger.kernel.org, AJvYcCX1JDhpR8W60Xx4KB+jUHgPJf+hItKpiy5WThhLcHrNlF0Z8JMyzyq+PiS24qBE4DGM1CoR3TbtdbwVnzzF@vger.kernel.org
X-Gm-Message-State: AOJu0YywP0u/ej5IG4nIk1O3xfGK4iYUPsTcAW7V33qxFPAe3T+iSIyZ
	nFtbR571mewTzbG8kOT4qt9gxY7lN4//94pA1NXECwcoWxqWyTVu
X-Google-Smtp-Source: AGHT+IFIPPiN4cxhxgS9k3tSd7lQ8QWj5rw6OUhe8AjJY3X7cg7WQ56GBHxgkVfInFoc7myICEPjJg==
X-Received: by 2002:a17:907:9413:b0:a9a:1f8:6c9b with SMTP id a640c23a62f3a-a9de5fe7455mr4423365066b.37.1730995355539;
        Thu, 07 Nov 2024 08:02:35 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc4c7asm108284566b.96.2024.11.07.08.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 08:02:34 -0800 (PST)
Message-ID: <cd326e01-75b8-495c-bc15-1d9ebde8c4fc@gmail.com>
Date: Thu, 7 Nov 2024 18:02:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <172994467264.24870.11860096857422265131.b4-ty@linaro.org>
 <f232dbb0-9036-46d6-83f9-27363813930d@gmail.com>
Content-Language: en-US
In-Reply-To: <f232dbb0-9036-46d6-83f9-27363813930d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 10/26/24 15:18, Ivaylo Ivanov wrote:
>
>
> On 10/26/24 15:12, Krzysztof Kozlowski wrote:
>> On Wed, 23 Oct 2024 12:17:29 +0300, Ivaylo Ivanov wrote:
>>> Hey folks,
>>>
>>> This patchset adds device tree nodes for multiple clock management unit
>>> blocks, MCT, SPI and UART for Exynos8895.
>>>
>>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>>> have been implemented in this series. Support for USIv1 and HSI2C will
>>> be added in the future.
>>>
>>> [...]
>> NOT applied patch 4/5 - I wait for bindings to be accepted by Greg.
> Alright, thanks for applying the rest!
>
> Best regards, Ivo.

Bump - now that the uart patches are merged, are you gonna merge the DT
changes after the merge window? If not, I can send a new patchset that
includes them and also adds PMU compatible node for the mongoose cores,
since that got merged with exynos9810.

Best regards, Ivo.

>
>> Applied, thanks!
>>
>> [1/5] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct compatible
>>       https://git.kernel.org/krzk/linux/c/e54eb0465e548a7c6115e336ec5cfec04bbe8747
>> [2/5] arm64: dts: exynos8895: Add clock management unit nodes
>>       https://git.kernel.org/krzk/linux/c/fa986d1073805154888a788eda38d46a796346e8
>> [3/5] arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
>>       https://git.kernel.org/krzk/linux/c/9ad6c3bd1bcbb73e2a5723e13b9d06e2296b07e4
>> [5/5] arm64: dts: exynos8895: Add spi_0/1 nodes
>>       https://git.kernel.org/krzk/linux/c/a5541d737c8de71948bcdaee912bcb6b0781af7e
>>
>> Best regards,

