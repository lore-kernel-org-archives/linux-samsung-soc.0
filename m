Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F305A795
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706526108; cv=none; b=oLCLw4sOMEm30RflNXP3czQrWtJ3dN+JJRJyqISVk7tgpP1EtivMb5PKaRpfQw6xvb/XlxrstQ1AUjEUf8zAQ2a8sLpw1cn7WthxhrUL9+AGcSea2YDxRBzwpVwLlU6Vawyip9bbclCjgkvDczFvi79UO7XskePyQ48D62Wx+bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706526108; c=relaxed/simple;
	bh=nvOwcwGmHbcTfUeLhNMoyIkPAfqJ/ohjGKKZliK0epc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAxADmFLmyNvEHI4ytxDOjjcQIeySQ9fpae2KzwPMEDUvqcntXeTWXtd50sETomX9vBPHPMmclOWp4o8R65/aR5Girp7s24dbs5uQb+XwEj8N2cBuvOgKbsE1tyrEl3vi86gMAK7qj/i6YYMdJAX6xyrpuNQC9q+ApHUmCPAbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWphcyGe; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWphcyGe"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so239025666b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 03:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706526105; x=1707130905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UA1w5gYMolOewO9t+jCWVuh5VHTtehAvbElOyTHrS7Y=;
        b=UWphcyGewdOotemTLUSBl6vPakfFDJ7wA7ZGVCFsjmTi7O/Y20plnJ2ED/nOlB96ib
         H4R2TmeSSfRVBMPdqSwEf+/RbrsNPKsMw8P8GczYZEMbHtKJwfA6m2kb6ida6W3MzYqm
         gOey4o5WEwDJjT9mdW3xnCedHHzP68x+zbmZxbAFIuz/xYNmeeS7UzX7SCAtEJV+6U3R
         sA1fuuQku3ettrXxVSvNndnsCkbOUXYQkG8hyLgVaGy/g2/Epl12a5bdxqflWqfmviKj
         zCZHrdWPgy85nzQB22KWjnkl8Y+P6K5VRwg4umaCnUrCJPTh+4J4MUajvVPKoTAFEsVm
         gSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706526105; x=1707130905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UA1w5gYMolOewO9t+jCWVuh5VHTtehAvbElOyTHrS7Y=;
        b=WmX/WDeTBf71WWD0kPGm6FHOjblhD5pKPk7fmdSWrR8NegZmZwy7OHvE1BnHLsbDNx
         1ytDkZOB0xm9DUFCJiI2yu/e4blCcLcS+2D4e3JUoMrIJ3M3VcLf9R+X/5H1+sq5Ihw/
         uHUnMiUAnZfUEPyBkGE2oZY2nJIIRhjUcrsAdKdIWYcUoj8J9AiGLwdtsqlBkLBG2EUO
         ujSZpto3DrBk0PuNazEP9Jr8+MdGFoSUSvwcP6RVAwKxgZ2krBtY9tPlKW4aCus4itBU
         SNrpSC9KaTxa5l+IvsWnLqZXUSV/9+q2rqaqdGPqtqMT20J/5HbUMVpn0/Pqd2XlTNXF
         76IQ==
X-Gm-Message-State: AOJu0YxWfe/OjGB71yzHe9vrrr7HA7HtQcVNuuSV+RrvNF6BnuaDF/L2
	73OUeRqW5ZWSAUQFjF6nswohXZOJJ+Hs/DzLONK86XyZC3nGHzQMSfQGvyzvJXk=
X-Google-Smtp-Source: AGHT+IGXba4TIKH/6LSzNh38HbZAu50tTISaZk+C+R3AAXPuk7Ht9a/coP4xJs8vF0jPWQjFERY7xQ==
X-Received: by 2002:a17:906:f2d6:b0:a31:5941:4f7 with SMTP id gz22-20020a170906f2d600b00a31594104f7mr4041068ejb.39.1706526104890;
        Mon, 29 Jan 2024 03:01:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906a29500b00a35d7b6cb3fsm508297ejz.95.2024.01.29.03.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 03:01:44 -0800 (PST)
Message-ID: <6900d000-ae30-436d-b3c0-5a734be23738@linaro.org>
Date: Mon, 29 Jan 2024 12:01:41 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: exynos: gs101: sysreg_peric1 needs a
 clock
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240127001926.495769-1-andre.draszik@linaro.org>
 <20240127001926.495769-9-andre.draszik@linaro.org>
 <CAPLW+4=PWCegZi8Wd=rhSUUiXNn_J46VGZoxDcRA89MX-2Y9tg@mail.gmail.com>
 <d234060148ab6027bd84c5475851a30329e877a2.camel@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d234060148ab6027bd84c5475851a30329e877a2.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/01/2024 11:45, André Draszik wrote:
> Hi Sam,
> 
> On Fri, 2024-01-26 at 21:00 -0600, Sam Protsenko wrote:
>> On Fri, Jan 26, 2024 at 6:19 PM André Draszik <andre.draszik@linaro.org> wrote:
>>>
>>> Without the clock running, we can not access its registers, and now
>>> that we have it, we should add it here so that it gets enabled as
>>> and when needed.
>>>
>>
>> That sounds like this patch deserves "Fixes:" tag :) Other than that:
> 
> I didn't add it, because at the time &sysreg_peric1 was added, the clock
> macro CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK didn't exist and &sysreg_peric1
> wasn't in use until this series here anyway.
> If this patch here gets backported to some older kernel due to the Fixes: tag,
> without the whole peric1 series, it wouldn't build. Therefore I left it out.

Clk patches don't have fixes tag, so Fixes for this alone would be
confusing.

Best regards,
Krzysztof

