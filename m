Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E6110A1E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787654; cv=none; b=cbGok9PkLa4IQMFN3zlTWU/GKBZwrvMCRheh3Yj0u4kT4PkT9YJqM4kW+GlZgFrH/8Zy/aTUt+LOMa/TmB2h1KrZosJl+l/4umnutTi7B9G/lTXF26HkVdT30TCEjS9Sa4FImsJilllmaMKvkbWQOBNrGS9Tz+3J65y4H+Ui8vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787654; c=relaxed/simple;
	bh=BoTRYcFxZ6NGZXZNjbYImqPGLfbEE8Ey0/2P2rucJJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpEviL5sFFwPW0LLokp+eI1GFjkj8nV4BsFwpiPRpVzqQtUYMAlRuzNJp97qV8bQia4kNlMNwD75xQAYqel0M5i8LLv3KKNTVUl6PBfav4dLzIKKTtuWiv973aE19IeipClKd5BmVS+I8O1cXo7hJ14WTu1AvqHW8avDx/FI1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hT1FVlXg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hT1FVlXg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so653780f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758787651; x=1759392451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04OhqlU+WA0ABhYmTZEnpjaIkFVoum1CHDRj/OYy7KA=;
        b=hT1FVlXgBuLemWar7wnXB31zBNckr8VZukt/rQz05zFPgIG3qORdm6epo+TKaIOMa9
         K15AlEciQUeukomsPN+5gggk/Z3Gdg6W5oMrIezLbTYbkp5HAtmvvhrnq++UFSheq6iR
         0fj1oDCXqyxMCpMRGubAddd7THwKvKkqCyRFASWPAgZQJVl5qftDKws6TZToj7FRfSSM
         kE2OogB6TW1418aOaI993FXi+s3wmdHl/KcuABQtkayIm3irl8zvTugy7E0o4UYBtCN8
         jIVsHuHbb0N1gTZO5zjY2P5HELRt9iu6OnoSUILo3zKId2+fq1bApDmbUSu+RjboOG1v
         Zisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787651; x=1759392451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04OhqlU+WA0ABhYmTZEnpjaIkFVoum1CHDRj/OYy7KA=;
        b=PQfYnLQfeK4zMH7ta4cf+9+MUeJ0D/hWqAIUSbXLYB1rkCpmK6RXLv5qYywOCORGha
         I4dgOB5wnza7q+c1SnXle6EFakm/TL//BmegBhU9gt6yJ4lQHEAxoULKCuCMxxWzTJfa
         XJ3GUYo5KEmhIAWhfL5bz3svN/Ri7GsdRdOwEbh+et70of/uky/HaciilwPpi6h1bXtj
         QP7oSmWRRqGCRdg/bo5Huxjz5W2JIvoaY6dbIXNA6PT8gee3PbXX4pr/7JwBnxRWeHSw
         iPY/JcO0FQNG4qCWInorNxu/eEfMXygrsoDha1HixsKBW5wGVhuQs9HZ4eWSUgggf8au
         0/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWztaxkj8xvobCXuF5y6zijfHpmDFMlPF0rtnoubj2e2Vi94UzERqgXRfpXcLQLjjsP0200rsl5WdNkYENftvHwKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpI7DBXIRXz3oJpjIpAgP586oVKBaNBoSw61wdwdYc9ffWIt2U
	UKGqjCS4o8OREii0oBSsIqau+N6cLvfqOvCCmcZwHRPybvYVLGvWPRUHBycUQgLGALs=
X-Gm-Gg: ASbGncsQ4yxKsG85ICLwt1eSi5PwumlgZ/7fUKbp6iKW+Oh44v812VWewWTdud7U/WT
	jmptFgDiMceSB5mjhqS/dtm5JcDqoLSXRsYCpMp1oGux/z3nOera8F3Qq+l1vMP8g/HlH7iptnS
	ZCuOBNjyhf+qJMEeXdh44yIv/NYWLFWeNFOLUfDWImJ7iQjQA9TwWpJ2Hx3WXxundQu2m+6Q5+U
	iDWP3YWeCWoq0vlFAXTVtF7TFMw8nVMsKy4hbP2zQ5B1oeHc//yWMxkUIbCsw/SBD3i2VuQqHYF
	hARw/ylECv9URDk7IJs91l0FFAZoksLqkiy3u1gmxH1UIcXkY8Ww9BlNpfWY9zLIDvJOAbQEu7B
	WNvzQujpCqEP6nEuj/wyYnkf6PQCbjlrMYkGUTdxg7xsWSTmykJKkuOI4OU/p5kQz56ajLMMK/m
	6q+A==
X-Google-Smtp-Source: AGHT+IFbP4rQd0qC/Stti6Fjua1sH3Ev3vXHXXxcw+KEizzwcVqcnJJWslwYOq75EI5o7tS2Kma8Cg==
X-Received: by 2002:a05:6000:2c0c:b0:3ea:ad2c:c166 with SMTP id ffacd0b85a97d-40e49aa11bbmr1956258f8f.49.1758787650544;
        Thu, 25 Sep 2025 01:07:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e33baa53dsm22283445e9.6.2025.09.25.01.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:07:30 -0700 (PDT)
Message-ID: <e1d4c00d-d706-41d4-88f5-bd39af52d846@linaro.org>
Date: Thu, 25 Sep 2025 10:07:29 +0200
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
 William McVicker <willmcvicker@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Youngmin Nam <youngmin.nam@samsung.com>
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
 <20250827102645.1964659-1-m.szyprowski@samsung.com>
 <8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
 <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
 <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
 <aNQnszeIfeHjx3GS@google.com>
 <5f69200c-0cce-4b7b-85df-8b9d37960269@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <5f69200c-0cce-4b7b-85df-8b9d37960269@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/09/2025 08:37, Marek Szyprowski wrote:
> On 24.09.2025 19:17, William McVicker wrote:
>> On 09/24/2025, Daniel Lezcano wrote:
>>> On 19/09/2025 23:31, Marek Szyprowski wrote:
>>>> On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
>>>>> On 27/08/2025 12:26, Marek Szyprowski wrote:
>>>>>> For some unknown reasons forcing percpu interrupts for local timers
>>>>>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>>>>>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
>>>>>> flag only when driver is compiled for newer ARM64 architecture.
>>>>>>
>>>>>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
>>>>> I am pretty sure the patch above was not tested on arm32, thus this
>>>>> workaround seems reasonable.
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Daniel, any chance to get this merged?
>>> The patch does not apply. However it is not your fault but a glitch in the
>>> previous pull request and the regression found in the Exynos MCT.
>>>
>>> Apparently, Thomas had to drop the entire pull request while I thought he
>>> dropped only Will's changes.
>>>
>>> A pull request with the previous changes for v6.17-rc1 and with the new
>>> changes for v6.18-rc1 is about to be emitted but without the Exynos MCT
>>> changes for the modularization. That means your change does not apply
>>> correctly anymore on the current changes.
>> Is there somewhere I can check to see which changes will be re-sent? I don't
>> see them in the timers/drivers/next branch. Will it be patches 2-4 plus the
>> fixes for the section mismatch and this new IRQ fix? Once that's all sorted
>> out, I'll base the new modularization patches on top of that.
> 
> The problematic mct patches are still in linux-next, merged via tip tree
> by commit 9703240ef617 ("Merge branch into tip/master:
> 'timers/clocksource'"). What are the plans to resolve this?


Ouch! Thanks for letting me know. Investigating how to sort it out


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
