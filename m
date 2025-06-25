Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6275F2F2702
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843416; cv=none; b=JCbVid5XypQEsVfKfBrUwxTMQaysSnr27YlI3JLU3SAcL9lzFDBamC1MIRcq/0KpXTa/YaMWNCyeW+y7yAt4XoV3rtin3f75J6hW0x9m8Q1GvL1emo6OjNqvBfdeJmZjnoebII6PRRp80QlvKs5+uIJSWFOAun3x5NX58RTYHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843416; c=relaxed/simple;
	bh=g+LaGvL64iYAo0KoHc4Bet/BvZRakWsZV8+qruq5TVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyjzP/OogvpHeE1ETscbQHJPjrsIQSQ5om8wsOs1RJiFZ8A6xsmPL7ED8B9kb/nDTdt+DQPJvC9iA+KHn8rizM+PHwsi7bENwoLLtSVG1MpIIIB4tS8y4q/6l2xYRu6DKUwM8kHzQFRP4AHeiQJjQRCVs0pGiRfcyKC/ttUcv8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=smjRfaD7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="smjRfaD7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so510329f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750843406; x=1751448206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWH9vvPYvKOZ6jTKsIAS1U0P9BTez35YILzqoZrwOZk=;
        b=smjRfaD7NR7deQrdCpQ64iWett6ydeLfDtvA3/bTVbdlv4EpMTqm0oZU0CNaK0n23G
         GVmn2UO7TVNy2nyWukrG5T+X+w2+VUnk5qlv2rZWBTc+YoiWhSkr7BX1/XudyPXXmcZS
         eK/xXFZLs3m/1kDzFhTeH9FAraz48pAwgf7cAqKiHFfmhBE3LkWJ7jA3SRo5zOHpSCrD
         3qqtzXguaKF4q6r8bNFSI7AHPKyPz/ReI8uDt8BxuuyChcKEDbrhffsjvaRfLAQ/tPoO
         GEbYl2p4IgFO36BiGOWw5aJqCpBhj+4g+y/DnFda67NvkMfsCCQ4YZC5TON66VsOoKGi
         cF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843406; x=1751448206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWH9vvPYvKOZ6jTKsIAS1U0P9BTez35YILzqoZrwOZk=;
        b=vTyHHR4//Acp8cCOS4/I9hvp3uLcPEJIGQgr+oXOAz6nf1TiFexYYZckLi2CZZWxxI
         oWV00M4595O0EukWkhpMhp3zDUU9Om0ha1C13RfMs1q6jy+oP8nclFFcBOUjZ9kw6KOc
         ZM7Oc/MBwXzwnKgOKM6bZV4VuM10Dd5nvVruxjsgjNYmxUIn3z1c7J3lQ4d1nGZaIxAK
         zctq2KfyXA81/Q1aidMIQHg+9XwXTM0Q3sOEdEqprruOUBJx8WRG/zXEcSTKwGqPM2of
         cYHcDlzEwDA93P/FmKd58J/Q7Z0+A+q8xuxlEgmoGGlLNRQO95bBdud/+hYUriPLqQft
         p/Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWJZ48i+nE+7qs2CGUH5b4uZVWCtiMAhVh1BHeg3KrZV+vU/2cfOm9We1+zRtzoD1bOwHfvye1FKoq83W6U+1Nd4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUKTrTnqMTYK4P7547vsqnmReU6wNAdSkCLnwOEaYaxSMn4cL
	jsTlTZYlF3b8zO+uWLLwSu+b2Kgrr0BySWwfZCPY4GZcP+Iz67lorxiDYBXE1Xz+3ko=
X-Gm-Gg: ASbGnctpiyJhg1XUjNQ25F6zzfFGHVjVA02mOPX9QFdvST4Ue6WOLCcovsdHeyOzc+C
	DDJQaCl0xyqNFdyBPBUCEfPmvdRpaWHh7q8wVevs82sWZqLrIRXk5dQhAupKPbd7lsW/EQYmwGa
	RHFo37f69q6TXQ34Dxq3UHdknAJ54+4FnZ7i6mgA/9NM11TP2CLXIr3iA/EQVBk8qv61ULL5GiO
	JzroqhYLdSGW99dHSUZmEIpBa8iX3vwsvZW3L3v3COd29z13p0+Zo2aElyh2let/k8HbAi4vLcM
	OH0AhZL6JhGfo+OlZudhE+JRr2etzwdIkT2QqujKenmCB0f++dhEtA+nUDJpi9pEFh0Fl4RGE0B
	rF5PEm8kCSdC7XojuWjalATojRw==
X-Google-Smtp-Source: AGHT+IFk44C1BBZqTWRdY4hcFP7t75lLhumDHg3FOCEud/iYnem/WMPerbWTZalUliYOPa9RKBhJtw==
X-Received: by 2002:a05:6000:2081:b0:3a4:eee4:f73a with SMTP id ffacd0b85a97d-3a6ecf52ab5mr1972437f8f.22.1750843405762;
        Wed, 25 Jun 2025 02:23:25 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6e8113b00sm4163210f8f.96.2025.06.25.02.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:23:25 -0700 (PDT)
Message-ID: <fdf70587-5960-4420-b1a4-4fc2f467fd06@linaro.org>
Date: Wed, 25 Jun 2025 11:23:24 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Donghoon Yu <hoony.yu@samsung.com>,
 Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
 <aFqsqr7i7cdR5-I0@mai.linaro.org> <aFs4--JdpE1W3Lh8@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aFs4--JdpE1W3Lh8@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Will,

sorry I missed to add you in Cc but the following proposal help in the 
module conversion:

https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/


On 25/06/2025 01:47, William McVicker wrote:
> On 06/24/2025, Daniel Lezcano wrote:
>> On Fri, Jun 20, 2025 at 11:17:08AM -0700, Will McVicker wrote:
>>> From: Donghoon Yu <hoony.yu@samsung.com>
>>>
>>> On Arm64 platforms the Exynos MCT driver can be built as a module. On
>>> boot (and even after boot) the arch_timer is used as the clocksource and
>>> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
>>> source for the arch_timer.
>>>
>>> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
>>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
>>> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> Signed-off-by: Will McVicker <willmcvicker@google.com>
>>> ---
>>
>> ...
>>
>>> -static int __init mct_init_spi(struct device_node *np)
>>
>> __init_or_module
> 
> Thanks, I'll update in v5.
> 
>>
>>> +static int mct_init_spi(struct device_node *np)
>>>   {
>>>   	return mct_init_dt(np, MCT_INT_SPI);
>>>   }
>>>   
>>> -static int __init mct_init_ppi(struct device_node *np)
>>> +static int mct_init_ppi(struct device_node *np)
>>>   {
>>>   	return mct_init_dt(np, MCT_INT_PPI);
>>>   }
>>> -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>>> -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
>>
>> Are you sure this is not going to hurt the ARM platforms ? Here the
>> timer is enabled very early in the boot process while with this change
>> the timer will be available later.
> 
> I took a second look at the TIMER_OF_DECLARE() macro and FWICT the timer will
> only be enabled "very early" via timer_probe() if "MODULE" is not defined which
> is only defined when this specific driver is compiled as a module. Note, this
> "MODULE" define is not the same as the Kconfig option "CONFIG_MODULES".
> That is why in my v1 and v2 patch [1] I had:
> 
>   #ifdef MODULE
>     ...
>     module_platform_driver(exynos4_mct_driver);
>   #else
>     TIMER_OF_DECLARE(...)
>     TIMER_OF_DECLARE(...)
>   #endif
> 
> However, I dropped that since Saravana mentioned that we should not be using
> TIMER_OF_DECLARE() for drivers that can be modules. I don't have an ARM Exynos
> device to verify dropping TIMER_OF_DECLARE() is safe. So if you and Saravana
> agree, I can work on creating a patch to define TIMER_OF_DECLARE_MODULE() like
> you proposed in [2] to handle this for all the drivers that are used for both ARM and
> ARM64 SoCs.
> 
> Thanks,
> Will
> 
> [1] https://lore.kernel.org/all/6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org/
> [2] https://lore.kernel.org/all/f2f914aa-c554-4135-afaa-f075537ed929@linaro.org/
> 
> <snip>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
