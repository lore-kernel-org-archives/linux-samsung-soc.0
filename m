Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E42DCC08
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012626; cv=none; b=aKYeEvsr169vp0mS4SvDfGDZdgDtIEUiKUhcKI2nLXryNZt4g401UjpptWVAZ6F8g1MAHNG+jZktdTwnOJ6IJMgWhfA+Il8NSn1aHPlRCqZrGA7oZ+hCGcEL+CJQGYpb93Q+UIAYfJzfptJtv7AJ2vZbAYUpIVPGbgKaKM5oJU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012626; c=relaxed/simple;
	bh=gt14UkZ4PejnmdASx0UjnVuD0GVKd0I/tRd3QMFeD18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rs/GneFi8P9c3da2S76JPNAbWHPP8pi02ggQ/S/ucGanbrRa9/dnsfMdm1HUi/x0ibDQhi39gMSeFq0EwmjHaQ6biQH0Z5NqiRM1lSAMcE6bnbjsXoLY3tMlY4jhyWVgoyWQlipwcpHLObtlwvdyj+XBwkmmWyPY+1W99Fxt3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kGL2eaw5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kGL2eaw5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so74829765e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748012621; x=1748617421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gbvz/uK2pr2MI4jmK6EDAPEU/Gm2+BjOciuq5aXVONE=;
        b=kGL2eaw5qYWAlBXk1fwVgctZpFQkcVBDkzfmw/pebZXoRUD71jCheHWHEtPbvzaq8X
         IYE0DtYGtt4UDHmxhpg6tmxCcsc6aK25toq6IsCmlvpiHkCc/3IU/hSf2JiC1YxqT9EM
         OB1/Lo7wULaYAVll4D18FDKqUtuRenpQu6NWFwSjUpm/xbGvsKlq5YCiHvIx7M5z7cTe
         jcvKE4TTbOQ3ZvlH+5HxkdPCO8O622WuRVBk09CvR5+SQit+is3k0kvGnJUZe3iW8X8Q
         7x65VJ62KX5nJbFp5jmYb1uv7bzj84nNRL4lNpJh6YQZ+3ilshDQ33ENSU3wjIcTZ3iR
         UdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748012621; x=1748617421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbvz/uK2pr2MI4jmK6EDAPEU/Gm2+BjOciuq5aXVONE=;
        b=sFtRLjbkslheMlPFpud0Wxg83sQDfoa5mtEUMV7b0TqSpdA89wcTIAQ4qjgpPkNSc4
         th9HeHoB4xc9fFyQm93xD7YT/Vm70I1/xElMl4sWyuEt0Uvjsn1tkYCtVAnOsWyhXkHB
         HZnn3iH4NAmi3bX7QWSsx8QEWa64+7QOBWsxmpo/dd2NctriTITQG2hM/QqMkjuktdrv
         8FvDu3V/5HzH0ltBY8zGK2l7+0q8GIHz1dQjh+yXBSfSrYi2hrriCnpbn05Rnxh5lLmr
         A7O3B+0RgRq8IjksZnVqc7y+GTELsZZSCu/t2JcNvmRmCyWlMNcuUcuKlFaOsAa09vWA
         OVZw==
X-Forwarded-Encrypted: i=1; AJvYcCVfig5aTvxKoAdXPs2Wo4gVHxVN8H9yPZXguuSfFHV9wTXtN4Dhg7UlISu2XfN1WPfhDuN8D6OL4OBi7yzoh+OA/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfWHjcAuJVLPZbKe1DlIazzsDbto67o0O6gm5qzlGOWnrJwb2g
	CkNICMcsuK2+72F6HIyWby6odGfO3/ID/POn2Dfw5N/zQjJQ0knuHRbXulq3eTWPBdE=
X-Gm-Gg: ASbGncuk1+/xglQ9EGDOI2lAgB014/Ef4pK4tuKX9bX9y5n2+ZQaFBa2WEyvBpe2YLH
	v9cpLm9dXExP5NHbVDRZjq+dNzwRJdAWI/mgOcxnixrBafipn5bj4bivBH9miP1EPDJEX8JjTEh
	hqBJjwp2r8tfjrRNybLPH1OAlrVDbuqe8FYc627D9lf9wJX/OfnW5D1qApaFjnFDz46hH4TedXJ
	VdmRu5wLjl1PYSEwwSWgsKKN1Bv2ITkU6ku+9vg7Mhi0lIgn8c9A0F1GTwH/L+XsBmsFhd0YOJH
	Or2AzFiXmEm5GWKWr6PHw9WhiG3NH9hZxEtr1RKwPm/yQWu23OFCcQ40X0J/+h+ZN6nNWlOiUkQ
	olejM6HVvAAFc2ZY=
X-Google-Smtp-Source: AGHT+IF6xxRKnVQPDNFgsmCYk0Qf6SwE1QfyL2jwEhJSor+dcRHsUaLRMrkpLvb8B9U+ZEe9KiJLBQ==
X-Received: by 2002:a05:600c:3d0b:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-442feff05b7mr289497065e9.14.1748012621210;
        Fri, 23 May 2025 08:03:41 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a36835ef41sm22867132f8f.94.2025.05.23.08.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:03:40 -0700 (PDT)
Message-ID: <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org>
Date: Fri, 23 May 2025 17:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>
Cc: John Stultz <jstultz@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan
 <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org> <aCUkN301jWUkXJ3_@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aCUkN301jWUkXJ3_@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi William,

On 15/05/2025 01:16, William McVicker wrote:
> On 05/13/2025, Daniel Lezcano wrote:
>> On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
>>> On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
>>> <daniel.lezcano@linaro.org> wrote:
>>>> On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
>>>>> From: Donghoon Yu <hoony.yu@samsung.com>
>>>>>
>>>>> On Arm64 platforms the Exynos MCT driver can be built as a module. On
>>>>> boot (and even after boot) the arch_timer is used as the clocksource and
>>>>> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
>>>>> source for the arch_timer.
>>>>
>>>>  From a previous thread where there is no answer:
>>>>
>>>> https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
>>>>
>>>> I don't feel comfortable with changing the clocksource / clockevent drivers to
>>>> a module for the reasons explained in the aforementionned thread.
>>>
>>> I wasn't CC'ed on that, but to address a few of your points:
>>>
>>>> I have some concerns about this kind of changes:
>>>>
>>>>    * the core code may not be prepared for that, so loading / unloading
>>>> the modules with active timers may result into some issues
>>>
>>> That's a fair concern, but permanent modules (which are loaded but not
>>> unloaded) shouldn't suffer this issue. I recognize having modules be
>>> fully unloadable is generally cleaner and preferred, but I also see
>>> the benefit of allowing permanent modules to be one-way loaded so a
>>> generic/distro kernel shared between lots of different platforms
>>> doesn't need to be bloated with drivers that aren't used everywhere.
>>> Obviously any single driver doesn't make a huge difference, but all
>>> the small drivers together does add up.
>>
>> Perhaps using module_platform_driver_probe() should do the trick with
>> some scripts updated for my git hooks to check
>> module_platform_driver() is not used.
> 
> Using `module_platform_driver_probe()` won't work as that still defines
> a `module_exit()` hook. If you want to automatically handle this in code, then
> the best approach is to follow what Saravana did in [1] for irqchip drivers.
> Basically by using `builtin_platform_driver(drv_name##_driver)`, you will only
> define the `module_init()` hook when the driver is compiled as a module which
> ensures you always get a permanent module.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1-saravanak@google.com/

Thanks for the pointer and the heads up regarding the module_exit() 
problem with module_platform_driver_probe().

After digging into the timekeeping framework it appears if the owner of 
the clockevent device is set to THIS_MODULE, then the framework 
automatically grabs a reference preventing unloading the module when 
this one is registered.

IMO it was not heavily tested but for me it is enough to go forward with 
the module direction regarding the drivers.

One point though, the condition:

+#ifdef MODULE
[ ... ]
+static const struct of_device_id exynos4_mct_match_table[] = {
+	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
+	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
+
+static struct platform_driver exynos4_mct_driver = {
+	.probe		= exynos4_mct_probe,
+	.driver		= {
+		.name	= "exynos-mct",
+		.of_match_table = exynos4_mct_match_table,
+	},
+module_platform_driver(exynos4_mct_driver);
+#else
  TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
  TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+#endif

  is not acceptable as is. We don't want to do the same in all the 
drivers. Furthermore, we should not assume if the modules are enabled in 
the kernel that implies the driver is compiled as a module.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
