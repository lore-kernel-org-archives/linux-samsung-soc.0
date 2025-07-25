Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3437234966
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438544; cv=none; b=uVbM9XzBCK1XnSxeRcs55whEI155yLH5RdNigmLbqWWNqK0mwEK3G8qoYpUrVEpDvvZYz6zPYvTE1B+Q15D7woElPPsNmZ8k1bvjrr1xgRDhDEX6Ll/p7dPKIebwGvn7h2YsqSzvvBziDVS3Abku7vgzZ8cI8OfPtc5pGWKNsDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438544; c=relaxed/simple;
	bh=hQHZNoGj+Mm9+chtI5u5tv5ZuA3UsmqtE0qNjF+PVXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DD28ZHCtDexQJhxEokzV9kN5zpA2MSyU3J4o6GC23eZr12LxaRe9/S1aVKzEhTWG5MRzbUj2Ic4RHQaVpQqyE8P76FlMMen48Dv/12TEf5H/usax8KpeUmjBFAL68U/XhsSLcOCYvqi40JBG0Xqxf3bSPQZEW/hQLoF9CgWiS7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxpLYtXG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxpLYtXG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-455b00283a5so12311455e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753438541; x=1754043341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APLwVADmRioCZ7u0qB0EnkXcpcl6xZc3SqFMoJI4n2Q=;
        b=xxpLYtXGFf2TFWtW3VvlWCGdWVmvQRLCsN+2irGYtjWC/HYvme28x89nTATc9g5Ocg
         IzqTu+uw1KkjSQ9/UpWO3rnwMbZ9oXnPXNbKGqHN6ze+5KKoIQKv1aEU456i20HTQkGy
         UbF3jmP3+BW+fYcirXzaJx8XfBNaWxjT3qOLnNqhpZrafWKqwckkNJyOPeghNE2Kb7wt
         weEKkJte3KO3oBkS7koiTozyk/OgMa92hDggz6czpYdCm2Gkhm6J24jBzRU5j/thNjMi
         jqb+Gg1PzoAWE9eohjMyKTm8X55Kmqm+m4hud2zTotAHTeelhvJiVrP6qtEQxE8m/0Ov
         vglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438541; x=1754043341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APLwVADmRioCZ7u0qB0EnkXcpcl6xZc3SqFMoJI4n2Q=;
        b=Qyo5TE7NSzGByE05o9YAwZ7sZv+nPaggAWqiP+fMxdYPl+CTsIvEo6lWjrqV+XLSVG
         nGcPltTsVHtZOZxukpCvkRTlJgTyIcPoeOT3/O4Lr5a9l0q5rOZ8s/MoT5hELW7OqcdP
         I+WjOoe97aWi39XxwtMBIl6Fv1mP/b3Fojn8frDvtd5P9Kd5fBFhwC1rwQcJhjgnVtNf
         qbTx2ZigwSunW7KrbOyGP6/CIDFLDF8XBeIg7RsQK1RjveJT0PLwQQUePoOP01j+0N1V
         hh66jDeCRhTutND1/3iBIAqICED329X0sRXe/RhK3i/XH9OLfDeU5Sr2bj00/b3W3jAT
         msbw==
X-Forwarded-Encrypted: i=1; AJvYcCXh3hgqXYU3F1JZVZbVGn1Z2xykEv5t85FT0/FX4dlhoqO2aacZC2xCwmONXk18sJoF5+QgJVg9W8yg+7i/lKn6Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgc/Kyx64pJHczkmhdYuI5Ej69iyXzz5xgrobv5bJFMCxC/vP
	HcJdE85jW9QWPp9VYZovhpKWwQmIPb7VVPmofbo/RbstfnuJ9SrPhaFPpVAandgYiSQ=
X-Gm-Gg: ASbGncuMAJY0We/kR8Nxg63pzE6rvnv8NsGY3NOByN9W6mkRXYbstIYwoFKDiQPdXfi
	EIDTjyT1NAmO0ldX0bS1t4x6hKDL2eh0P91v0w4nIqz6Ub5klmU49o0WKTYPFVn9lCjutAxp7vj
	rH1YsBoFF0xnmj9zdd62REPr6A279eQBhasFCPR8LtNQWKZwbaMVDwJ/2jrsZIMai5ZbxSvkCWP
	Et0XzILfPYxWEGMwYnHR/3DT+W3vVZtsVAdSWKUhnfyo46bUu+Pq9/nsTvpq6CtdFe6U6iQIdOZ
	TsDuoyZoabzuB2IjKIFMfJ5L5YrP74FRtoGCRIUi3OTOp39pMEm+Lb8IUAzvlEYRC8AEgA8YkXg
	UC+3ymEUggadoThPxg3P10LCB3Gl18e+ZZZ7sLmjaJzv8TAhLBKpovLaScyJxeA==
X-Google-Smtp-Source: AGHT+IEBeHBXAtdpNhW6zbX7qpvXST3sXOdUSZ8cfnbAWldRkxy9ati6Hj+NpR/zEGXM2uDWeV3bag==
X-Received: by 2002:a05:600c:1c25:b0:456:1006:5415 with SMTP id 5b1f17b1804b1-4587630539bmr11432225e9.6.1753438541037;
        Fri, 25 Jul 2025 03:15:41 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4586f88ce71sm40030785e9.0.2025.07.25.03.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:15:40 -0700 (PDT)
Message-ID: <57687038-e70b-40d2-b2d6-d2c68fc7945b@linaro.org>
Date: Fri, 25 Jul 2025 12:15:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Revert commits causing
 section mismatches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Will McVicker <willmcvicker@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
 <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
 <2f413942-8126-4d94-b64b-c4a05052b5a1@linaro.org>
 <a345528b-1641-4f10-a9ae-6b853f625df4@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a345528b-1641-4f10-a9ae-6b853f625df4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/07/2025 11:47, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:35, Krzysztof Kozlowski wrote:
>> On 25/07/2025 11:28, Daniel Lezcano wrote:
>>> On 25/07/2025 11:03, Krzysztof Kozlowski wrote:
>>>> Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
>>>> support") introduced section mismatch failures.
>>>> Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
>>>> mismatch from the module conversion") replaced these to other section
>>>> mismatch failures:
>>>>
>>>>     WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>>>>     WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
>>>>     ERROR: modpost: Section mismatches detected.
>>>>
>>>> No progress on real fixing of these happened (intermediary fix was still
>>>> not tested), so revert both commits till the work is prepared correctly.
>>>
>>> Please don't claim the fix was not tested. I reproduced the section
>>
>>
>> section mismatch code MUST BE tested with enabled DEBUG_SECTION_MISMATCH
>> and disabled SECTION_MISMATCH_WARN_ONLY. If you have warnings which you
>> missed (although if you have warnings what did you fix?), means you did
>> not prepare testing setup.
>>
>>> mismatch, tested it and figured out it was indeed fixing the issue. I
>>> just missed the error because it sounds very close to the first one
>>> reported initially and I did the confusion.
>>>
>>> The driver is not supposed to be compiled as a module on ARM32.
>>>
>>> The option tristate "Exynos multi core timer driver" if ARM64 is
>>> misleading. From this change, the defconfig on ARM can do
>>> CONFIG_EXYNOS_MCT=m which should not be allowed.
>>>
>>> Before getting wild and revert everything, let's try to find a proper
>>> fix for that.
>>
>> I am not wild here. The issue is there since 9 days.
> BTW, merge window will start anytime soon, so if you do not apply this
> revert and do not fix it soon, it means NOTHING during merge window will
> be tested on Exynos.
> 
> Why?
> 
> Because my builds for Exynos rely on correct sections and they fail.
> Failed builds means: no boots.
> 
> No boots means no testing.
> 
> And if this reaches rc1 (imagine you send fixes AFTER rc1), then all my
> branches will be non-booting as well.
> 
> Time to "not be wild" was 9 days ago when you received reply from Arnd.
> Now reverting these is the appropriate step. None of this work was
> tested on arm32 Exynos, BTW.

Yes, indeed. Fair enough.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
