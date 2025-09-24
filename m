Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C6289E36
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758703283; cv=none; b=B4/LXNH3RfuXiKnsJeMTNcRDLb5PYh3at64c2GvCkkgpWijpJY3GvpCFvwZw8pie0+V6amCB2ViiRXvFe19K6dhtK9edv/SFtfkmp4P5Ip3o6APbNKYyxAGfxbop4gO3P/yA2wY6+XjcjFAD2+RFsX920ez72B6ipZQPo7XmkQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758703283; c=relaxed/simple;
	bh=ZowF0b9qjWRW+fF283CjvmqcXrGsMRydOqykoeYhLvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoiBItzDiDVj8LdSpypYRqMV71K9hCCqdvFwfT8oUWCCFvPrDMEVSase+OCeS6EAXXzIseNNWtAu7BuF7YD91GISD+qVEOf3b9n4ikyeT2j8p0o7GhoW262hiKFN9xDWELbmKkMNx7EwlmwgFL+m1b3NMWM4P0BUe/jwtj1p3tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byF9Rmc7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byF9Rmc7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e29d65728so4140225e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 01:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758703280; x=1759308080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WI73KSwQqhq1Gh+2IcGy32QhBQAYgTIk/JPEYFLFV2Y=;
        b=byF9Rmc7gmc0ULJOrmN/olOUWcluJ6eI+MntuH+V+JG+BorVaDfTVKCLxAClLwAlim
         W3OWm6YsEZL5CT4t0XwOTrssMVomQ3Hp9H/ZqcSsKHUW674z3Fd40gi/4hp+KdrT+cTm
         +hqfXHBwjOAeseb+1SDhkIgwELdiMk6oTKsJG8mHFv2n0mDod9F8P3MClJ665NJq9w3q
         EXZpVByzD8BiQ/KdSEuBbN0Xd6qu4HgzrRxHLymm0VG4SxkornrmAZfCKv9k9XaNj2Oh
         4livdKl3bivxT7XyP/8tqs39LGXBkdarK1nQzzvh3G4z2WYVNURLgTvywIImSELmQ46q
         0mVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758703280; x=1759308080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI73KSwQqhq1Gh+2IcGy32QhBQAYgTIk/JPEYFLFV2Y=;
        b=rM6PEuzfQaXMnxLeekvdXcxral9+Wuho/zDDVR0q+dGAKgZp4wMZna2iMb29KtV1ir
         IfzaEl119ztn4K3bG+eaE5nxyLmj/8/6ao8XNZ49ImulrBpqD24esvS53ZHOkFHZ2PSA
         owH7fFuDKhDvKuZ+uSI86pQMgPwfsIIPqcXBmvo7/H6HoEyrPsWQ+57IKemhU0t/KPYP
         dqcZkKKlkLVQwoJCuhB62EmNNQ+gdSMj9LcZI5/JxPQMqqPVYtDONduSNt+aCArwx5Yr
         ek7v+onUbB+KrWHrPKbma8kQOXp+HK4J+AZ72q44YQ6V/DN6nNEL2jDIV2FN30EuZPIy
         V56Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkbrFum/oD2hydaAnSrGZe6c3fptvXW6qQoK8BTXA9qMVORYVc0K2w12CLNLXA/Q8ptjjQopVwBtVxFIouDdn0EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPBDkJAROTD1DOACtNsuBj/BVFrhILJc0JUoYZjaJAFEpQqkvf
	f+gtECWv47ek3tAlq7rOcPknH709OAKIHpZ0nBovhsodhQOxdmMjgnvZRWDB96lrdv0=
X-Gm-Gg: ASbGncveFv6+zpwQK5kPxvsRhKBJKQc6BUWvSs+kYuyoqomwVaXbVbhA63O3wNfydxw
	qxDduVNMz7n/ZdWXyHhHFzXX6WYK0hFjNqnJuG4ozc/Q3jTeNGFW3biQfnbV6hOi0K4fYTDP/zr
	TerCGDVH7UuHLEuxxKq3bTWAt38sw7+cG7hQPylU4ZilpvTjxwAEK/EpGG7KrJX4mJAqFMY/OoC
	iiWBQN98b1SIgeVLQ/T6q1drbTYyfRNMUnTxlOruB6EJTF6hq93f9qQty+iNNorwNMhaLYNp5ZJ
	bJs7iebt2L7HLCWpiW7z+44FY045ZPoHaOXuSQKKM5V9gzpIyprOXWL8YDEtnfzSYdxfYG2HXHf
	z78/UQiY3e4+S2dYZp/SSaQBduZj79chSvtzMSoUIkXvCHaBd0Ys/xg/9JSnRoaauUQBoESZ0f9
	NdKA==
X-Google-Smtp-Source: AGHT+IG1DdlpxlL0duxNewRctsIzz5UZfKcQ2utw+x/rbFZjfa3j++4y90r1/7+EYFvHa6wtluGcQw==
X-Received: by 2002:a05:600c:1c09:b0:45b:74fc:d6ec with SMTP id 5b1f17b1804b1-46e1d974906mr72852475e9.8.1758703278633;
        Wed, 24 Sep 2025 01:41:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bc4b:2611:54b0:29a4? ([2a05:6e02:1041:c10:bc4b:2611:54b0:29a4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e2ab7d4e3sm21594365e9.23.2025.09.24.01.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 01:41:18 -0700 (PDT)
Message-ID: <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
Date: Wed, 24 Sep 2025 10:41:17 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Youngmin Nam <youngmin.nam@samsung.com>,
 Will McVicker <willmcvicker@google.com>
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
 <20250827102645.1964659-1-m.szyprowski@samsung.com>
 <8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
 <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Marek,

On 19/09/2025 23:31, Marek Szyprowski wrote:
> On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
>> On 27/08/2025 12:26, Marek Szyprowski wrote:
>>> For some unknown reasons forcing percpu interrupts for local timers
>>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
>>> flag only when driver is compiled for newer ARM64 architecture.
>>>
>>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
>>
>> I am pretty sure the patch above was not tested on arm32, thus this
>> workaround seems reasonable.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Daniel, any chance to get this merged?

The patch does not apply. However it is not your fault but a glitch in 
the previous pull request and the regression found in the Exynos MCT.

Apparently, Thomas had to drop the entire pull request while I thought 
he dropped only Will's changes.

A pull request with the previous changes for v6.17-rc1 and with the new 
changes for v6.18-rc1 is about to be emitted but without the Exynos MCT 
changes for the modularization. That means your change does not apply 
correctly anymore on the current changes.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
