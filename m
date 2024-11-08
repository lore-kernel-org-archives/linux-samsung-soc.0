Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131461E0E15
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Nov 2024 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731064286; cv=none; b=eYeiJeXPykjBwCUN+JrVBnj10K9yv8WGwVOvB9DBBqb9I7+Ypv2ks5rYJQt5UkUr/z/swn7NUZ7xoMyZdTZjUYUT0wJwgBIqh7PwhH5cEV/PZVfmiThwufiwAuIypirVkR0e+71imiAnPFNYxwm36HeQvbMvc7OgY0Y6wzFQaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731064286; c=relaxed/simple;
	bh=/rKPoOVH8eRIys8U2r+JvZFcF5RMOArqD+nswYHDrvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOMlEA8KlS5wzRi6xTWKIBCCCI/Eepbh25mRQYseHu/R84e4luHVtnraQNxQ7WMWTXL/HNwWAolp1NcrJq+xyxIFFBtUgeDoOvbDCg0HvZlqusqL00Kgax1h4gStTuJ4NQD7Oed4g2FELlqkgXEmaGcuAPxC5jL/rdWfLQgeMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8S9cjpN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8S9cjpN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314e64eba4so1792665e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Nov 2024 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731064283; x=1731669083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QDLNS/qPby703vO1F+zowX9M9g0jDDg8xaH4NFHT2lM=;
        b=S8S9cjpNGS3c8gCnNR6adWmyFGFQkrEdXCdIWMYPLJYa3RNymimWQp/DYvJMKUsveH
         L7B0DK647NNOw1Lvn75qQ2JDV6NjbeUC9styB1y9uLq1A5KnV429SDwY2QPYTX66fS51
         5NMjPKZRuYmeLeghX46cXNtUqrmbe1cqPpdmk7OexSFQgkUbHUZ7wASxTT66SxKEPJ95
         /g95Zrq0neD+k6w/nQaRablX6V41HE3bQ7r/Y0wrdylrwgdKBvhiiNXMMxMCN7n/VA0y
         VQmAtttEWcp7/nAMWhaQwpGcvbOE4AV/8vUZyZO55p1YbFRvysuHj++xuLGP9zAznNxE
         M5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731064283; x=1731669083;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDLNS/qPby703vO1F+zowX9M9g0jDDg8xaH4NFHT2lM=;
        b=JDO8+JQ2DmxJYapWG+eMarDCY7rrEJOWAX0IAmqlm+3iXvH7GCejrso50Mb5amrOJH
         utN96ha7Y4JUC//HqHq6Mg/8pOyAbHRw1FO2G8rWvEIkmVti+TrfKyllKUNR1SjCJmv+
         lhxO1RcCeC0HqnIrGtGJXFAvftngAv43fTvzFaLKn8+DrOi7C7G/khScUAA2AYwXr6W4
         3XGqxTzIlJ5DLqbgfl71yw7dFkFrvO+SdTvfSCdN+tVyKOmaslYyfb/qybvHQwa75LRa
         rAOU3ksIW+vlQY3EnkJq82QTg70tb/i4Igq6RZKSFCWGOxsu6mMh95S8Qexivx1WuUcz
         p9yw==
X-Gm-Message-State: AOJu0YxuboDZeHPtEwt9o5uZGjvm3R2BVOT+U3wB5CrTxe9MQnhe4Bi3
	vTZb2VoBdj6+4FJQXzUHjeYS2OQqbNTpW1pdTl8AGjPNR7c0NyHPYF45+hmfo6g=
X-Google-Smtp-Source: AGHT+IGgoDiDtUOfkG5Qw2tR51xgA+74Y2eRmiyJYpAZtUIt17I/3OpoI+McKMfI86SYpBbPB+XszQ==
X-Received: by 2002:a05:600c:1c27:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-432b752038cmr9147825e9.7.1731064283374;
        Fri, 08 Nov 2024 03:11:23 -0800 (PST)
Received: from [172.16.24.83] ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97ce1bsm4266761f8f.36.2024.11.08.03.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 03:11:22 -0800 (PST)
Message-ID: <fccee5aa-9ced-4773-809e-1ee66ccb74cc@linaro.org>
Date: Fri, 8 Nov 2024 12:11:21 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
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
 <cd326e01-75b8-495c-bc15-1d9ebde8c4fc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <cd326e01-75b8-495c-bc15-1d9ebde8c4fc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2024 17:02, Ivaylo Ivanov wrote:
> 
> 
> 
> On 10/26/24 15:18, Ivaylo Ivanov wrote:
>>
>>
>> On 10/26/24 15:12, Krzysztof Kozlowski wrote:
>>> On Wed, 23 Oct 2024 12:17:29 +0300, Ivaylo Ivanov wrote:
>>>> Hey folks,
>>>>
>>>> This patchset adds device tree nodes for multiple clock management unit
>>>> blocks, MCT, SPI and UART for Exynos8895.
>>>>
>>>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>>>> have been implemented in this series. Support for USIv1 and HSI2C will
>>>> be added in the future.
>>>>
>>>> [...]
>>> NOT applied patch 4/5 - I wait for bindings to be accepted by Greg.
>> Alright, thanks for applying the rest!
>>
>> Best regards, Ivo.
> 
> Bump - now that the uart patches are merged, are you gonna merge the DT
> changes after the merge window? If not, I can send a new patchset that
> includes them and also adds PMU compatible node for the mongoose cores,
> since that got merged with exynos9810.
> 
> Best regards, Ivo.

It is too late in the cycle for me to pick it up. I will take it after
the merge window, so feel free to send new version with some other changes.


Best regards,
Krzysztof

