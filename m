Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7C2D1913
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435701; cv=none; b=qeeT1zHrAhdSv/a11QLHFxhVJcshf+pTySJubhIRzvjCwOAodXczfTHs0bcB7xNexVsh0KoZcoA/6rs/dUheu77sCf1bLGYYT4owAe5kMR1k5ejRIH/V6iKHr9T3UBzq1BL4FSGb8fYdmd1tfh+NuFt+JU8Qkmr49mMb2ZBnQLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435701; c=relaxed/simple;
	bh=Z8tg1pzRmanQT9LGpennwEt2z11fOoPYQhIqsiV9w3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AdBcN5FcnLLJjtgg//44Zmi31dpRsxjg0lLlSjAtSxacFt10p3l2++aeeQCRHltRCDtFISlJ4aXQq8N4QYdyrA5Rkd5EbksCkL9strLdnVwdp8ci4ov5U31mt6gYN+wheKZgWFBkNoc3kp4P7cIsV+ToDRGVEY16qpXBlmwLolg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SD/jjRqS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SD/jjRqS"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45611a6a706so9374445e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753435698; x=1754040498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sPxG6yqZoSGKmuHcBvDbXuEQ79jKCTtksMME9UcXBk4=;
        b=SD/jjRqSjUImeIGRlCNOM0GwpniW9bdMOtptWhubDjr2hX3YY9ahRRg4/WK60x+fUY
         s+7E5Xl6UTUEWc8GSHExBEeSJZOA+kbl2hdaVQJCDzbJT3JCeW/v2b5CQOxR+UUz4n0+
         DYmOZufZSsexcSqHUX6dkRToViAsD5mQ1MJ1d8nkwTMHng6rG6pp5keYtlBdxxK9ymLF
         v85b/tk72yhwg0qIWoTeFu3RCx/mZ4Hjb8q4wRlyZnkHTX40KPA01onQm4Bq2YuAk7Nx
         m5TF0C/d8FgSbHN4OIQPvY48dDVUyCHznRGOpCIMc2wwP5XLYmk5zWtn3eIGDVuVW1eF
         UBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435698; x=1754040498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPxG6yqZoSGKmuHcBvDbXuEQ79jKCTtksMME9UcXBk4=;
        b=T5Hl4uoFX31GANzJDakS2aCm+bMqv7R6ydSdstfyPh/yGkZyEJrnB8v3nfPbI1krso
         VzaALEeyxuzYoGC5wi+PLC4sIdrsgScAicvzlTaIjyLAfF/uvHiZ57qCABtST6A4glBE
         VYFRLB34F9v5Z+wZ/47aq/ergSYFZNiUNpJIa+/+1lPJZ47+vTh1hleC3f8hoYb0HPiU
         bFihbHUwxmZQyF6RI+jKv25dT3W4ZXHn7f40/kBq1xocBM4LM3ljPzRwPoxv8pUUJzmI
         owzUle5Iyk4CPxQMYU+tl/wzO79YN9hK69tAFSpac+WO0K0aRZEhkpJNcwXlSAnNatGo
         c05A==
X-Forwarded-Encrypted: i=1; AJvYcCWVC70zZnjOCm9V8HgN4gW0TFcUDBjPPas2mWsFQ689LTvMyYTA8jiXOzLrrzBJbF3ATrmHyYnUYYgB7GXT1N0K/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lE72VPnzlyFMYilwjXSarss3USrqyP0yyOzzTpshj4fgde6B
	9AbRQtZOPwPMR/g4aRKiavCZI2VjGo0JCI+D+MUZHHi7wvvv03y9A+PoqT+0kG8iHW8=
X-Gm-Gg: ASbGncv16VetQ6sKWyYK4hWySQffY7kHUZFm1KkIeJq3+bQwZG8YfhPI/QuHPWwjftM
	w5YKvF1rIla5iJbu5l3pMcTPnN6YBpzMhdurf6d+3l49dvpyMuYoTuHLDH0nCP9YO5bXYj29jiy
	zPBJtYhjhi4fZ/x8SNbLTNlrpLacZ4jWjoTTuaiDxCBeFFVZE4fvLS/CpSxSW9m7jr4VcChtQWF
	yWV4JK4J72rfUekNmI9C4cGQ19TapJnWxPWShLOv5Q0TEkFyI+eAGWqetYPElxGFEOLEaYOlrIQ
	JS4/NQ+09nFgVruF53KfeL1MxXi6zBAWRC0tby+iM+zikPxho4EAL87uLg09OVME6qJkhLRz4V7
	07ML/SGYA9bv/9iz4jKHucspHujQuJqT331l0Wc03QD6eN4uvENQc//sUO+CMiQ==
X-Google-Smtp-Source: AGHT+IEeWJ8pfIjF/cY4SpBJkCsGj7FjJWr60xEqhoo9idhozX/YBHCc5KuXapjBXZszZJJIzMrhzQ==
X-Received: by 2002:a05:600c:4f0d:b0:456:201a:99f with SMTP id 5b1f17b1804b1-45876442808mr10203155e9.18.1753435697965;
        Fri, 25 Jul 2025 02:28:17 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45870577987sm49752235e9.31.2025.07.25.02.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:28:17 -0700 (PDT)
Message-ID: <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
Date: Fri, 25 Jul 2025 11:28:16 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/07/2025 11:03, Krzysztof Kozlowski wrote:
> Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
> support") introduced section mismatch failures.
> Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
> mismatch from the module conversion") replaced these to other section
> mismatch failures:
> 
>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
>    ERROR: modpost: Section mismatches detected.
> 
> No progress on real fixing of these happened (intermediary fix was still
> not tested), so revert both commits till the work is prepared correctly.

Please don't claim the fix was not tested. I reproduced the section 
mismatch, tested it and figured out it was indeed fixing the issue. I 
just missed the error because it sounds very close to the first one 
reported initially and I did the confusion.

The driver is not supposed to be compiled as a module on ARM32.

The option tristate "Exynos multi core timer driver" if ARM64 is 
misleading. From this change, the defconfig on ARM can do 
CONFIG_EXYNOS_MCT=m which should not be allowed.

Before getting wild and revert everything, let's try to find a proper 
fix for that.

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
