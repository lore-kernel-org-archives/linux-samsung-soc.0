Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B89269D18
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379989; cv=none; b=DU7LWFPJydHF6ryJXGhdB6nZihwSGDt7MpveVlMtlRxzmHMEQGJkEDF3rpBZYqtBK8TZr+HEWSA1cbTDC5fscl4S2CkmSUknZVIStzHGABxzZIg63MB02pqo6tAUUQ3DGlN0DKfD2OOBd7JXmikBW0M/p3qv/tW2qaw9W2WZcRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379989; c=relaxed/simple;
	bh=WYQPM7sFR1PYqOvjaSnXh4ZPk1fNGJ1EVGV7m5He4zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bu5G5MGQmpYsuDv1vtdTXTtydUNxWDwq8AjL8vPvzQh1p2OE53DLUysTnFJr+uo6ss2I2iLi+y9OwjtcfuX+CuOjgPODEoMJZj+LDU2wwXKBbIY4xNIIsZR5L20tHJyyrwt96dKsIPc8Ste2IwINiXtrcfjoibr/wgv3krbHruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5XXbhNr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5XXbhNr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477632b0621so27698805e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 03:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763379986; x=1763984786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PmAE4/SlQNnA4RBQKLIAp7T7uRex/v+oYXbbVoL1Es=;
        b=J5XXbhNrpfE/1DtN70VfdGGtDojjbhZuWDfh4FCKfmn3ALopJ4+gKIJ5jiZEabldfk
         SY/eIk8HkzoGBFyXovhbN2dk9s4S0YzE3dXUpRdVAj3NKzwvg4NWoRDuvHTUSje2Gnz+
         onz/NhtqdLB3S/+2iHdznfSZzC3XxfTPbGfNxLTS5QjAhWqGYRrUdBoK7vYjqWpVF6fS
         UIru59ntPWmRYswoZUhpH1ynGq4sfKOgWm029nq1kvFT6/oiwzMDJA/stAKhP8qH3wCk
         bX7YeDowiImOUphc52Rp9s99UP6Nnn4EAaz/dQXWFxqU8DML7LD+But/8l6c54Gbybf/
         6uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379986; x=1763984786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PmAE4/SlQNnA4RBQKLIAp7T7uRex/v+oYXbbVoL1Es=;
        b=Ngxg7RUVUWcIrYOWNvt24O7sOHAPdJiX4KsL8gHtje8a+vVuAavzQ363+YxXBpigw3
         UjfiGK5N/t1ZN2bo/X/r6hx1X5Ub2LoEJYr0H0R4DCW0aTrBMq9iom/o069J1LX9c5qV
         LXX/7rQbMSI0loi1GSrGt/5Ao+r+EKrOZe/W9926Y2NMFgKuV15nR1sNV7A+2raX6n2n
         b34lWX16KmO+dT2bHD9GeoBsguNjyQmQ+EFkz5uEjEpgU+jr3tArclYlv4bM39RPx2ae
         YVTs41kAPZqFEZ7zs7d5RqkHmRGoyyF/66b8doEHMOYGppzoNpfO+CJcaTU/zaMRUKLf
         UNkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQCCMLd/q/JgM6cUzAsxoZ1DtEh4cO9avoIM/Whx9qDgMbmJ9Ku4IhFUcpzj8ye4PkLZEEuN+CG58/+1xLtvFhzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxGZIU46DbMbfTol6GRnGNUU2KAhlTgBYGoKPVwgDTTjd22URL
	AYCPH9BpIdSlWg+pv/NqFT5bEJmfeh0QdeherBiVR/Gdq56Mx1nDiaIp6CSnIVpVlZs=
X-Gm-Gg: ASbGncuxcFu5K7qb5yut0wHa1bisuLf7oCkMx76sn0ea/GBwkiTErrUUqc2Xh76rHD8
	gXdnNsCIk66WpAt94+9WHPNSlJ2lLxRcZJWzF6VZEH9uXU7glme3AA4uljxjBIfPGFk+xI4ejmG
	axLJQmeBur2xDx39w33UnIFGydKz3f1WcVkqI6o4AdHLs847fMHVM84mwdRhBVHemcKzr//74rY
	HTLfyu8SnCYp0oiPWnDb5KoXcIHeDdtvVDJir0MMq3p7/bVcmaB4+ZGSAHVAqPNTcIH05Vj5Jnk
	NT/Mj5i8WDH1+Lcgfru0ccIz09ZrMKj86KIHuYf4Gb6NBu3/SZB+1Ata0qKc/akG2VVgD9+/wf9
	X+qcfigCPRvN/FULmP+t55U/6oIO36CP/AF8b1xGnN8nDMfjge49cPU0QamBXP+c6JnVj+dvuRU
	KWOCjbSVf6ulOKZCAeA/LEJFJFWcYjFKbBOD2ltL05FFW0TfBDcwsnvxk=
X-Google-Smtp-Source: AGHT+IFNvzfA8+IBQKGT5ANa4HDP2N9QX+3VtWlf5b77T6VzgwZ3FHSemKzoXYJh9ES00ThV6nFG0w==
X-Received: by 2002:a05:600c:1f12:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-4778fe9aedcmr115869275e9.26.1763379986306;
        Mon, 17 Nov 2025 03:46:26 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:b121:89be:2e42:dd71? ([2a05:6e02:1041:c10:b121:89be:2e42:dd71])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477a81c567bsm901765e9.9.2025.11.17.03.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:46:25 -0800 (PST)
Message-ID: <f1c5a4b6-3e75-418d-b7d8-7899dcd28ca3@linaro.org>
Date: Mon, 17 Nov 2025 12:46:24 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 John Stultz <jstultz@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023205257.2029526-1-willmcvicker@google.com>
 <CGME20251023205319eucas1p24eb9821bbcb2d59e2cb1e01c4366faab@eucas1p2.samsung.com>
 <20251023205257.2029526-7-willmcvicker@google.com>
 <40d3f3c9-7526-440b-9dbd-7ead22c8562a@samsung.com>
 <aPuhDFKINM9iXOKb@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aPuhDFKINM9iXOKb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Will,

On 10/24/25 17:53, William McVicker wrote:
> On 10/24/2025, Marek Szyprowski wrote:
>> On 23.10.2025 22:52, Will McVicker wrote:
>>> From: Donghoon Yu <hoony.yu@samsung.com>

[ ... ]
>> Sorry, but this still won't work on legacy ARM 32bit systems with MCT as
>> the only clocksource, which needs a driver available very early (that's
>> why it used TIMER_OF_DECLAREmacro). You need to make it conditional
>> under CONFIG_ARM:
> 
> Can we rely on the bootloader to setup the MCT timer and then hand-off at boot
> once the driver is initialized?
> 
> Daniel was working on a solution to transparently handle calling
> TIMER_OF_DECLARE() when a timer driver can be configured as both a module or
> built-in here:
> 
>    https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/
> 
> Daniel, do you have plans to finish that? In the meantime, can we go with the
> `#if CONFIG_ARM` solution?

I have a plan to finish that but it is low in my priority list. So I 
guess we can go for the CONFIG_ARM solution in the meantime.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
