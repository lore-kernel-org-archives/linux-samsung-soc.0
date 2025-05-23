Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A56199FA2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 20:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748032784; cv=none; b=qUNoXfg956bVIbh/2SqWeHzzyYqvjnWQQdfdW1UIailORGJLlKkes7Dzle1JSPfIjdtg/Ns1zFVf7Ywv2i0quPUb7qjM17L8XFcMzScDxS0aLEZ0poyZgkmEGm9S7eyD92FdSmM/J+smG0YPqbE1xqE1X2988VaET1hxACxe/hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748032784; c=relaxed/simple;
	bh=NoFNWSDaQ/q09Uz+TdFjvizT/rD+Qjp28PV65Ss9HqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NU+FwnZhjzd1VEWP9Mw56O0iXJOo7kAQdG2d7Mv7Uk86RSygY787d/YO8zsZ0hklJVulD71ikfjS+k/JjrKUcWoLMt8Cpwki4pdbg6iXwByNfMCkpdIxw6E5w8Kx0690zlSEy+qCm04bPAozxVjsMrA0uVyTPkF/5lmpaWoRFd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JZcQQTXl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZcQQTXl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so2118765e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748032780; x=1748637580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZkCTIkoEPF/4oXgPPxT3DQfkcNtTOcqqQ2VA82+SL4=;
        b=JZcQQTXloijmli5VMgsE3+Dkfx4LS7B8EyP2zf4yoDDqGhq9tlSZP9uzfsaZ4eAnjT
         RHPr1zr2je6lAaDYFBcAtemmBBI2KHnVHNVrrBM1tM1JHR/Ab+iw3FGKrIkVxTbMbOpA
         QiaPdifn3Cpo5Gzb1qisnnKoRecHNdnAqHNwiqzXajADOz0J9ljWtBOTWM1BH0Dt6A8A
         RZh/jx1FFbMl0n85XHTKbFnS3jilrJMUN+ZFTenDs0jaFgay+UrejM+6V/Vg1dEgSDuN
         Vwdxp86RvJCnaJwElZLMFOeBcTBlRyFKWBKv6+7xZSLGRyroM59Xz5JFh2SxjY0Gd9vf
         LhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748032780; x=1748637580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZkCTIkoEPF/4oXgPPxT3DQfkcNtTOcqqQ2VA82+SL4=;
        b=sKqBsgwEpIsi7ggyfCtSKHWtDKFM98Rk2m/bjfyexlkcKnbCM4dWAFzq4ZGDEv3Lc3
         BHl5lZLm9e3L5Dquj7WaXcgUQJZxHP+Y+h1vFowtz9hwux+pyDGByz7WPz065vBYgt3n
         QZ0RIBhllI7O3d/uS/9Pb4Ndxi8WXILRvM/e52TVVY7TA8cQoOb0g6Pnl2Eg5e9zzS0o
         kV7Mqneo8T07wj8sdowbXf7pt7+nJKB7eAj6fzC/Bi1HsUkea5ej4C/F5EIoFkdfgFUU
         ZOzW7xjBckfQHR8owiFlKhcVTWnzrRQa37TDWFn2+fC1pAofTGGfYfbCP7wZuLzZrI7c
         P8wg==
X-Forwarded-Encrypted: i=1; AJvYcCUu++KRBg9y7DeM9MzVaaLK5SCdv60zk9LFBDctS0rC+7XjbWdFhfBNFxuCnepHuv1kPQNcBWB5hdkdTLtp8YA8MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDaQgZHe/Uti/a74hO2Knl2Q4z9SFU2xdfDFrr4Jkv4awTVe+9
	MJe/XXXBiEj7kx/T8GWW6G6FFXxiLSDVBMU3F8vkSTuAIWOfoL7TEV5u9TaNfeP52lg=
X-Gm-Gg: ASbGncsCsmVdp3GksHnOdjuIMEkxKMlge2/j10GHZQ/1zXAv57zZy1YDltZ/FJBxKtL
	zJ+QlONeOPCFp04Jfd6QfUPHgFQ6Qe6KAS4uICatU40P6sFS4BxsKPNZKunzBVbn0zSSZW0krTx
	68XlMH6/uTVfjN3DohBycz1Y7BJYWkP3Godtmstp2wViLQUh4GPnLmYEScMFrLimSAL5LmSeudY
	aq7L4DHVDArXCfGdirItXEoGZc2ABIHrJcIBTYrBrAyUEzfQf0lSx+vHFkmAnEL8XdkxAvmaJYT
	r54lSLTQo3L5meRT2ZAmI0YpbCXZpMgLOhGR+pKFB93wOie6XFmZ4FIePfImP1FMBDmKnZhOhCx
	SP2r+q81DJL6r0FI=
X-Google-Smtp-Source: AGHT+IF+UKW8HXeZsU44cfHfwETg11ROq2OaSMViVe7RnCpQ7MvNy+FadpEX11AaD2NWQvNTnzfJag==
X-Received: by 2002:a05:600c:c87:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-44c933ed842mr3184365e9.32.1748032779933;
        Fri, 23 May 2025 13:39:39 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f23bfdd9sm148920565e9.18.2025.05.23.13.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 13:39:39 -0700 (PDT)
Message-ID: <f2f914aa-c554-4135-afaa-f075537ed929@linaro.org>
Date: Fri, 23 May 2025 22:39:38 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Saravana Kannan <saravanak@google.com>,
 William McVicker <willmcvicker@google.com>
Cc: John Stultz <jstultz@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org> <aCUkN301jWUkXJ3_@google.com>
 <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org>
 <aDCrGT67ubNNUoUz@google.com>
 <CAGETcx84OfLNRjMNGh4jS54_DgRuXx+gF5DhfiGrgckoyOfTMQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAGETcx84OfLNRjMNGh4jS54_DgRuXx+gF5DhfiGrgckoyOfTMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/05/2025 20:06, Saravana Kannan wrote:
> On Fri, May 23, 2025 at 10:06 AM William McVicker
> <willmcvicker@google.com> wrote:
>>
>> On 05/23/2025, Daniel Lezcano wrote:
>>>
>>> Hi William,
>>>
>>> On 15/05/2025 01:16, William McVicker wrote:
>>>> On 05/13/2025, Daniel Lezcano wrote:
>>>>> On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
>>>>>> On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
>>>>>> <daniel.lezcano@linaro.org> wrote:
>>>>>>> On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
>>>>>>>> From: Donghoon Yu <hoony.yu@samsung.com>
>>>>>>>>
>>>>>>>> On Arm64 platforms the Exynos MCT driver can be built as a module. On
>>>>>>>> boot (and even after boot) the arch_timer is used as the clocksource and
>>>>>>>> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
>>>>>>>> source for the arch_timer.
>>>>>>>
>>>>>>>   From a previous thread where there is no answer:
>>>>>>>
>>>>>>> https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
>>>>>>>
>>>>>>> I don't feel comfortable with changing the clocksource / clockevent drivers to
>>>>>>> a module for the reasons explained in the aforementionned thread.
>>>>>>
>>>>>> I wasn't CC'ed on that, but to address a few of your points:
>>>>>>
>>>>>>> I have some concerns about this kind of changes:
>>>>>>>
>>>>>>>     * the core code may not be prepared for that, so loading / unloading
>>>>>>> the modules with active timers may result into some issues
>>>>>>
>>>>>> That's a fair concern, but permanent modules (which are loaded but not
>>>>>> unloaded) shouldn't suffer this issue. I recognize having modules be
>>>>>> fully unloadable is generally cleaner and preferred, but I also see
>>>>>> the benefit of allowing permanent modules to be one-way loaded so a
>>>>>> generic/distro kernel shared between lots of different platforms
>>>>>> doesn't need to be bloated with drivers that aren't used everywhere.
>>>>>> Obviously any single driver doesn't make a huge difference, but all
>>>>>> the small drivers together does add up.
>>>>>
>>>>> Perhaps using module_platform_driver_probe() should do the trick with
>>>>> some scripts updated for my git hooks to check
>>>>> module_platform_driver() is not used.
>>>>
>>>> Using `module_platform_driver_probe()` won't work as that still defines
>>>> a `module_exit()` hook. If you want to automatically handle this in code, then
>>>> the best approach is to follow what Saravana did in [1] for irqchip drivers.
>>>> Basically by using `builtin_platform_driver(drv_name##_driver)`, you will only
>>>> define the `module_init()` hook when the driver is compiled as a module which
>>>> ensures you always get a permanent module.
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1-saravanak@google.com/
>>>
>>> Thanks for the pointer and the heads up regarding the module_exit() problem
>>> with module_platform_driver_probe().
>>>
>>> After digging into the timekeeping framework it appears if the owner of the
>>> clockevent device is set to THIS_MODULE, then the framework automatically
>>> grabs a reference preventing unloading the module when this one is
>>> registered.
>>>
>>> IMO it was not heavily tested but for me it is enough to go forward with the
>>> module direction regarding the drivers.
>>
>> Great! Thanks for looking into that. I'll add that in the next revision and
>> verify we can't unload the module.
> 
> Daniel, is the module_get() done when someone uses the clock source or
> during registration? Also, we either want to support modules that can
> be unloaded or we don't. In that case, it's better to make it explicit
> in the macros too. It's clear and it's set where it matters. Not
> hidden deep inside the code -- 

Why do you want to unload ?

That is another aspect and the time framework is not totally ready for 
that. So I would consider for the moment to load only.

> I tried to find the answer to my
> question above and it wasn't clear (showing that it's not obvious).

Globally the idea would be to take a ref to the module when the 
clockevent or the clocksource is in use and release the ref when it is 
unused. That needs an extra function unregister_clockevent_device() and 
a verification of the current time core code to check if the ref is 
get/put correctly which is, after investigating a bit, not correct at 
the first glance.

>>> One point though, the condition:
>>>
>>> +#ifdef MODULE
>>> [ ... ]
>>> +static const struct of_device_id exynos4_mct_match_table[] = {
>>> +     { .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
>>> +     { .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
>>> +     {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
>>> +
>>> +static struct platform_driver exynos4_mct_driver = {
>>> +     .probe          = exynos4_mct_probe,
>>> +     .driver         = {
>>> +             .name   = "exynos-mct",
>>> +             .of_match_table = exynos4_mct_match_table,
>>> +     },
>>> +module_platform_driver(exynos4_mct_driver);
>>> +#else
>>>   TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>>>   TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
>>> +#endif
>>>
>>>   is not acceptable as is. We don't want to do the same in all the drivers.
>>
>> Are you suggesting we create a new timer macro to handle if we want to use
>> TIMER_OF_DECLARE() or builtin_platform_driver()?
> 
> One you convert a driver to tristate, there's no reason to continue
> using TIMER_OF_DECLARE. Just always do the "module" approach. If it
> gets built in, it'll just initialize early?
> 
> What am I missing?

TIMER_OF_DECLARE relies on a mechanism building an array at compile 
time. It is called very early in the boot process.

What would be nice is to introduce something like 
TIMER_OF_MODULE_DECLARE() where builtin means TIMER_OF_DECLARE and 
module means module_platform_driver()



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
