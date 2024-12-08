Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722AB9461;
	Sun,  8 Dec 2024 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675933; cv=none; b=C0epDAbXJAtTqcRSf9/kMhg5RocqMMVYyBypRq7ndISuEwowFW5inY7GGhM1XGFPOn51gB0qDEnXE6/hEYV+NPdL7sqZQWfILMX7MNDjv1MZRu40GHTsBYiDZgHHBumQ+3TeV6oHo3RxV/gPCeTgkt6yOGrqbtlMMIMzgNQIb9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675933; c=relaxed/simple;
	bh=3QRoJuliQ2GiY5KhAfFErMtEwTxsFLCsYpkPLpQZ9N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxKqQSEaIInwCA/XgqdDqSsxJzaT6QL2YS2xWgvuEn9STamQdjTVJOXIlczIakmkG5drldqY8nZHY+mYCt1qn/A5JjccPAMo9/y6f4n0cu7+ISd3cOOKytsTgLQkmReW/I8KtUmEyzIG8dfbuJCSUDJxi9RhoMCN9mm4bAO0o8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMuh8AG5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMuh8AG5"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so99443e87.1;
        Sun, 08 Dec 2024 08:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733675929; x=1734280729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tWQla5gDVVjHcf6+8kHq7uu3GYxa3VODVaIW6aQ6YQs=;
        b=nMuh8AG5b1d9kEYfcpacrdm+1ZGxK+RUeXyj7/c6IA2kgJUk3tfgNOiEgqfsvUjcjl
         NbK6e6+QsRQAmF9MVxQOZyx8teKXg+2ICXOe/bOu8uEG8xq45fx/xJQ/UHa5yiZY8YVS
         gu8L/HlLo4rCbZtCUecK3Ve7Rml4CmmTnA/CwUN7An4ZN+DFQw0pOIeQYaUNnqzr8cvN
         XV7NZUgAAZCnlIw5dVk6Hb9VZ/vy5H3G+r3N1gJ1UllTbHJI0MjGVNZ9h0H389HZbc4p
         K+TZGlmOs7dByzVYtBCSvD+HVQDVre/Jyixm85desRv8GCAYX4a1jdMLnFKY+IjPuvb8
         dcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675929; x=1734280729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWQla5gDVVjHcf6+8kHq7uu3GYxa3VODVaIW6aQ6YQs=;
        b=V0sIb3Jf3DftN9JK3UiTEfqRvIT0F6W5c35HeGZe6P8Zfn2g7Ixj+vkP0J97JH3FdS
         lTnZa/rcQ294hVVDqKgmSghKfbcg3DDtQZ/5wZSXwC7J4ZYOcn/8aj2jaMgCaZdS4LK2
         fFiVljj9WRiyv4MembDTWjY00ZfhGaU5KyU79EN6S2+qCQyQffNp+5d3HyE3y0yXljxC
         YWJshhbl5+LN6G67vXCjJxxI+75TLo9Xv2Xk0kbZarZ3IAzPGG7DVq8xb+Q7Iz62ZJ/d
         czoRsninw6k1CDsb1pj9KNXUslWNajxf+cvumXiyUkSNzTkaQ/dCryRpH1Err0Nzjq6i
         cf6g==
X-Forwarded-Encrypted: i=1; AJvYcCUJC0g+yIrI9nEhrFTF7cfcRLQXLmWuD2gdFR7sZRKEhoYjOHF00czLg1YJSKxtepnUa7V5Q+3nIVXm@vger.kernel.org, AJvYcCUPxZ36ZQT7S4084h+/1GBj9UBk/f8Ak1mpr0VUeD/qZsearSJmyw0IVXtEcnsMmXhEGzDkWDRUw0EBKFBJfl0oq88=@vger.kernel.org, AJvYcCVXmBJHwwfAyt+RlUBdfE3Q/oh3R8kK42wPFjkUmojRfLIPREIQc3Y+p99cwDwB8y4K7xetnJaTObLH5scw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc6uAKIWgnRwwsqyNgID+/HQPVBT5HqM2NTCtjQB6wLKU/PaTK
	fc9aH4X7OyT8wwKlu4vfuGRy6dKHrz8E4D+pXpSllSlOguTUi5+H
X-Gm-Gg: ASbGncvkqqx3II10sFdDBtYSUw8TcS0EPoYGL4klW9UQBSmklm3yM3pG5WSkMg4uZ6U
	hcW1oASNUkkQQ3KjepS+MRYDNMLjG7/uc7wpc+4sKJ5fFP+3fheZ0MFlp9MTyO5T07mysPxFLUm
	siuw2PHdRSeB4Jt5lNaFx1fWfVCjvgBDqtIq3hjmCyYtuf3UpREJM3vf30WorkZ6pLeQOTE+fAn
	UVNXVNvWCc9H3Hg9KR9Q+zwXO0ywzu7xc3Ha0/EEZEjSdmk42L24iyqPBOqDw==
X-Google-Smtp-Source: AGHT+IEmssxRF3/VI/LS5anznY2lDPYeo55qvxp2918kMLu1tBVbr6MeSeOUzIRyxYJMjo7tk1GTHQ==
X-Received: by 2002:a05:6512:3055:b0:53e:39ba:fb3b with SMTP id 2adb3069b0e04-53e39bb00a2mr1907592e87.21.1733675929280;
        Sun, 08 Dec 2024 08:38:49 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f2309a3ffsm456864e87.35.2024.12.08.08.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:38:49 -0800 (PST)
Message-ID: <0ba62a72-8247-447f-b710-234385a29d14@gmail.com>
Date: Sun, 8 Dec 2024 18:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, javierm@redhat.com, tzimmermann@suse.de,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
 <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44>
 <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/6/24 9:50 PM, Daniel Lezcano wrote:
> On 12/6/24 14:28, Krzysztof Kozlowski wrote:
>> On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +config EXYNOS_ACPM_PROTOCOL
>>>> +    tristate "Exynos Alive Clock and Power Manager (ACPM) Message 
>>>> Protocol"
>>>
>>> Given the importance of this driver where a lot of PM services rely 
>>> on, does
>>> it really make sense to allow it as a module ?
>>>
>>> Some PM services may be needed very early in the boot process
>>>
>>
>> If it works as module e.g. on Android, it is beneficial. I think the
>> platform was booting fine without it, at least to some shell, so I can
>> imagine this can be loaded a bit later.
>
> Usually the firmware sets the frequency to the maximum in order to 
> boot the kernel as fast as possible. That may lead to thermal issues 
> at boot time where the thermal framework won't be able to kick in as 
> some components will depends on ACPM while the system stays at its 
> highest performance state.
Also, as far as I understand, ACPM is used here as an interface to the 
PMIC, so every driver which would need power management from the main 
SoC PMIC would get deferred until the ACPM module has been loaded. This 
would make it impossible to e.g. initialize the UFS or the MMC card 
before initramfs.
>
>
- Markuss

