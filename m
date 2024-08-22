Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71B178C60
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 06:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307718; cv=none; b=jx7xl5QKOdqcKHUk98yhGYrhurXhKlO9fT7Gm72WWLf3Ijm4TyjXAxxEKAKRriURusu8PmSGsLOHdeeTzOz5R6rL2Gj//iC9HCI6EPe6Cv4ud2S/mkhVmyVgafst5L0RSUykPeS7rC8Zbft5zuy3elCkBlSrDJ7AV4CuE1X6BO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307718; c=relaxed/simple;
	bh=OP443SSTh/VgDQFvUdEeIwWO/Vhljo7Vkax9zdxHmoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSBAdtQ+Y8mbd2dFkbRsI7nq965OBqetCRZUH7SVQYXQfmerwKi5mtKIOEd6nJ6XSyq8fnOtY3OMYgl3+At1tm/6YBmgzIfWe1Y9g0rWhyMNKZdHz+74gASzU7D0pHn65qkjsGeDn3UPLmQZB9cN2OnqDNNXXNXHpyf0bnDlU5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ps6ERRIb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ps6ERRIb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4280921baa2so332015e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 23:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724307715; x=1724912515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Th4fxbOrXi4rtluaN/trD8ZFCHj52Mic7foOWV6/DNQ=;
        b=ps6ERRIbU07kVMwyWyXgAwjufRMnTqKhzRwdKUeCUP+wrEReu/dAdLz4IZIzDuCyZe
         PDY7RIsNQZqt9kYprd12YxNPBTKE5p2pVwZ272p8jrsUzd75UMzN4D/FZxw2+7ciRwKL
         gQQ/o+nZ8GOCpo1fxrWSLHyWSm2bzYeswwILl8XZXJZ/J+qQLv/UmHdzJzyoh+keTUhI
         lmKavsSlFxSgqdZpPm10Gsxir+G+9WyWPcZoJvdFf1fsa/0yAo7R7hCjphyxasdWJWeI
         Z8jSmxIB36wXgD21SRwU8Q3OxAc75fU/kBpdOFDOMPTjIa+nikz4n33XzbNfWJRXZpJ1
         nGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724307715; x=1724912515;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Th4fxbOrXi4rtluaN/trD8ZFCHj52Mic7foOWV6/DNQ=;
        b=F2nulU19w2rf9o84c3vTSJFGSKfxDDe6CWfYoFdrUfDS37TSVFX2QvwVoF8iJlpDOw
         6BIWDqgquJ84ju6uQzlwNpN+D/2ZuUZFfEze5DD1Ch4AKyxhUEZS8hEkHOUtj7VZ4c6/
         J+6mdKBVhHvvPKflFtx7AA0E29PTeAThnahNA6Lgo1fF5wdDTxLsMs+LFo+GpZH+KBd1
         NK9fw5RNN0qrpBETxY7rqM0BZicDzuVTaPko8aCMs6kArdoXhiyDYgsG0au7PguXpi2O
         c4F2yrdKSXEEq+gBOIqLIyAgfR2DAYxkjFONinoDwMhZa7H8sZWNlD98nljBt2/cLMd6
         V/zA==
X-Forwarded-Encrypted: i=1; AJvYcCUmizqGD5WiCxRF9uTPJaclrw4G3qz0BndGL0so/StzJsuMaIPJyU8yM9SYcPX/i/q5sKFVkZNZ+/ydrkqRYgQVqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZW5geChKqp7IYrJ/I56vHUzUHFZuDjRH/UsOFrFidGm0yXhX4
	T+Z6JfwxkIBP32xgQIlA8r+mD0SHRr/N2mKwx+2fRTy0K9L0aCOmcxWQIojihxk=
X-Google-Smtp-Source: AGHT+IGZ3dTQ7X/ih2+ZP1ZcY+1uIFZ+jEuS197/12xOVUcTyJYPZIciuYIw4NCT+K7rkUoENswVgQ==
X-Received: by 2002:a05:6000:154d:b0:362:4aac:8697 with SMTP id ffacd0b85a97d-372fd4d1195mr1844120f8f.0.1724307715046;
        Wed, 21 Aug 2024 23:21:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308274aacsm786804f8f.111.2024.08.21.23.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 23:21:54 -0700 (PDT)
Message-ID: <2e38f14b-41f4-401f-915e-fe3a4c1bfbe8@linaro.org>
Date: Thu, 22 Aug 2024 08:21:52 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynosautov9: Add dpum SysMMU
To: Kwanghoon Son <k.son@samsung.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e@epcas1p3.samsung.com>
 <20240819-add_sysmmu-v1-1-799c0f3f607f@samsung.com>
 <172423973836.252925.2617927566866963313.b4-ty@linaro.org>
 <754863f6-0fc3-4223-940a-4ca33bfbe633@linaro.org>
 <62304fa0bdbc76cb006927b6d40c670c4843f83f.camel@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <62304fa0bdbc76cb006927b6d40c670c4843f83f.camel@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2024 04:16, Kwanghoon Son wrote:
> On Wed, 2024-08-21 at 13:29 +0200, Krzysztof Kozlowski wrote:
>> On 21/08/2024 13:28, Krzysztof Kozlowski wrote:
>>>
>>> On Mon, 19 Aug 2024 16:55:45 +0900, Kwanghoon Son wrote:
>>>> Add System Memory Management Unit(SysMMU) for dpum also called iommu.
>>>>
>>>> This sysmmu is version 7.4, which has same functionality as exynos850.
>>>>
>>>> DPUM has 4 dma channel, each channel is mapped to one iommu.
>>>>
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/1] arm64: dts: exynosautov9: Add dpum SysMMU
>>>       (no commit info)
>>
>> I should reply here - unapplied. Does not build.
>>
>> Best regards,
>> Krzysztof
>>
> 
> I apologize for the inconvenience.
> 
> This should come after
> https://lore.kernel.org/linux-samsung-soc/20240809-clk_dpum-v3-0-359decc30fe2@samsung.com/
> patch (already merged in next) as 'next'.
> 
> Would it be okay to you if I write 'next' on title and required patch
> in cover-letter? or anything more make you more easy to review.

'next' has no meaning. It is impossible to apply patches on next.

You should document the dependency in changelog or cover letter.

Best regards,
Krzysztof

