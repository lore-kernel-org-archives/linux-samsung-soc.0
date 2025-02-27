Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D01E32D4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Feb 2025 07:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740639764; cv=none; b=UF7kKFaRAukEnhE3f+FSpf+nfvagJ0gwxz466dZGvZO9xaSqgeO4o5nCb6i0frjlqr0vzw5kDltqI+Pw7KIomgGLSkKM7T3mUmc3IeptsC8UuT7XqYbJqnT6yNpRZlEzFciHAf/x2ZcQQimtkOj+mvBCB96p72FGuu84Pos9XaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740639764; c=relaxed/simple;
	bh=AjNBnNrt/mUMgqkWz7yw8xWma5z7VeBH4ukBVPJ4NpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMFrB6lyFvouaJIFM7x37E8svV3HAbTfv5OHP7jAvYg3JywZj3oCrOI0m59Cup9Xql6FkN7Iw0bR+/V2Swaf/4vkanFjsENBti5GlT/ZUc7nN41I9k29gCAyz9+tS5fjo5jQd34b/2/fTTdKTdLf9gcED9Rv60D3PqaaU8t0D6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wC4qmWI8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wC4qmWI8"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7d8953b48so8933266b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 23:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740639761; x=1741244561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nt30vxCZ8dDJGA9f6yl5mbEhlcuKQimFoXdE6IW4R8k=;
        b=wC4qmWI81yXzUhPTslGw/riwkVNexEw8viX0x6Z5zRdw3jkL39tsttJyQOG7lJ1roD
         23LQHYQMULkY7abNk8M4ws2IbyQfQjiKILO77Ma2nNTaWm0ilS5KlWzBPelcbuYdUjzn
         yYlXxvwtB6igHpKeV5mdM0F1dhbdFP8qRVkd6wol7HGFfxzPWWWCwtbbd0SfzTc1x4xc
         +Z6WGiOwchZjba73fgpi3hKrc9OAc3euwRxYqzMkegnLgpcH8x9JcaGjf9AOpbPvggRK
         ONtBcBLy/HwEGNKwvqSwl7c95S+/stLWXaeVaTyFgUiazIdjgAaILMq1Lqdktahj28zt
         L6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639761; x=1741244561;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt30vxCZ8dDJGA9f6yl5mbEhlcuKQimFoXdE6IW4R8k=;
        b=Ffu/w3CkDdLeqz2wkFpcgHSCOZMs6djEoAcyzpUm5cNm/QgXQmIq+UfdSKvTXnF573
         Y9agQT+wmIs07T1R+7e5QXlCI82a1eqfno74c6xSUvvBbFtnS/qqXAueWcC1EYixUUhN
         E4TKNPxzz/QKJz7r6cutksKjWY/EGny984KgIykraH35WfY0vUmWJL7MzwHxwCTN4jkn
         a5cGASQkypSUUPdm9MWN2aZqFyUTo+K9dacnxQicr59sMDbB4PkvZDYCHVN1PQMdyjUz
         1CD1akSGq2lzC8LXpprfs0Syevw4cfOVLqWBiJCOpyK4Lrqwlsgmeb+GgzDnI6ssBdld
         QnIg==
X-Forwarded-Encrypted: i=1; AJvYcCVv9Uc9MfJJTApcrAp54r9B4fgvCoquR3uWy6fQPOzX90hOrk3OQYW44gS6sCPYCA76s4lV+JBzmC8OgAjs/8LbyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4asZP7GGoo8R77fsjgj/zjnxbxiOWvV2qCTtsPolRJZtrE9x
	x424UD8WDzKXlntQw4h+54+SxzuYkoJDhX6aCeMvdzCcVapUGPtsbZZBYyrd87g=
X-Gm-Gg: ASbGncsOufPmuHUr4rRrw0RKLJ0m4xKB3ar3EQMwTAbBTqATG39g5TWV0MrDFdgb7O4
	DA+jbc78SeJCAw/w0/aewC/6TbMU+nh190stnJAlfs4O2hnwLEOze7qD+Jm3NiuRmIEBTqOjYJT
	hRemwca5fgcVR2Eg3JiQL1NKb4QzcY4tEBTNghbLPqL4ZIOh6UlIApcWpChzrY41pZAj/6n3J67
	mQPkOhNz6vXDc4ZVxJm039/wadEvnZhr0XLifws+lmJwwWEnOqIB7jLOWprN3+HbdZcwq+lLD9J
	0yyF/5LxqX0LXfJX7BaDEX75q66o5bGcP7Cvjg6tK17hjw==
X-Google-Smtp-Source: AGHT+IFaX5Xx465ynY+QBW+bAA7zOiG4EkIiD1sgmpBcYUZdAaaw8LwpWoTVpJIUbrMT2ZdTel9FfA==
X-Received: by 2002:a17:907:96ac:b0:ab7:5fcd:d4db with SMTP id a640c23a62f3a-abc09e321a0mr931418366b.9.1740639761342;
        Wed, 26 Feb 2025 23:02:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dc5d5sm75582566b.63.2025.02.26.23.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 23:02:40 -0800 (PST)
Message-ID: <58a96f60-b748-493e-b935-649044c4a750@linaro.org>
Date: Thu, 27 Feb 2025 08:02:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC
 dependency)
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
 <Z7/+gXVFVzGadc4z@vaman>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z7/+gXVFVzGadc4z@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/02/2025 06:56, Vinod Koul wrote:
> Hi Krzysztof,
> 
> On 15-02-25, 10:41, Krzysztof Kozlowski wrote:
> 
> Can you revise the title to "phy: exynos5-usbdrd: dont depend on type-c"
> or something relevenant which describes the change rather than the
> Fix something!

Sure, it won't change the fact that we are fixing broken USB dependency.

> 
>> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
>> USB DRD PHY does not really depend on Type-C for these devices at all.
>> Incorrectly added dependency on CONFIG_TYPEC caused this driver to be
>> missing for exynos_defconfig and as result Exynos5422-based boards like
>> Hardkernel Odroid HC1 failed to probe USB.
>>
>> Drop incorrect dependency and rely on module to be reachable by the
>> compiler.
> 
> Changelog lgtm
> 
>>
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Closes: https://krzk.eu/#/builders/21/builds/6139
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
>> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Patch for issue in linux-next
>> ---
>>  drivers/phy/samsung/Kconfig              | 1 -
>>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>>  2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index 7fba571c0e2b..e2330b0894d6 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -81,7 +81,6 @@ config PHY_EXYNOS5_USBDRD
>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>  	depends on HAS_IOMEM
>> -	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
> 
> So how would this dependency be sorted..?

That was a v1 and new versions are on the lists with simpler approach.

> 


Best regards,
Krzysztof
