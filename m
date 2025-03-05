Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB11C139
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741208883; cv=none; b=uiV7LEJ0wKbvohoKvzqqYixdBKpidqCPsGkvyEtr7o2rqWJCg/f6hIhFvNaTIoJbhcUpvy+0foSpCctvnuXekC9MP+TglVeMROKTVSLHtpGeY0omZzh13evufFNUuj8eSbrokN/xzJFXC0v2/LVe9fkwBD0a5UwBW62Xi/WECFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741208883; c=relaxed/simple;
	bh=STbkp2/BtfQ2wV+O5wpEwKPRj6K4a9szsAQThf7kXmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZvdtgCB3g9ZI5nVLv7Q4i9JtQ2shz7N2/uPIqcG17X1yLIJY8cjChc7QXxjmgzTLbBA9yYFwO2/SZEdrXXYK2ViRXguFCSF5Wg+VPb0269lX21FhVPI89VkJZi9akMjecROR40FkRZqoTPXpEJbCBFhEdJiGFbKVKnBiMDtSzUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixV06ivx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixV06ivx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f2f391864so4095357f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 13:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741208880; x=1741813680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STbkp2/BtfQ2wV+O5wpEwKPRj6K4a9szsAQThf7kXmw=;
        b=ixV06ivxBeXiqoudzc9bFvhb8KmMJ4St6c5W33sDZfGDQEFvDKvhRold7jzfUAG7/T
         X1c3cpDWR+cusnal9nvoIqkRKntUXgR7az5EVMmvzx6VgVKjMP5ndtX4MpsljR/jFns/
         xvZhn5zJUpmtPReaTDygO5sXFdxoicTqInNkfOu27WzCuzUISLMridYhXCajjgg9gtNe
         nAp5adL+ohZDIQq7hVfSFB5qSnIcCo/KTFs36P1Gqeh2Uu4qBOtEowJ0G74aCYHkIGlZ
         OvOecDv0VjM0Ul8YHQRUdZWyDvxs045ZkZ9Fx0Ah0VfI9u5b3AqY+HyKCfrZeYqJyGAD
         usSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741208880; x=1741813680;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STbkp2/BtfQ2wV+O5wpEwKPRj6K4a9szsAQThf7kXmw=;
        b=daCX8DtRXbcYkrZENwNdWX/eXugrCdpu+nY9d+lQt2d/8Kf01CQxP3By1LiZw6tlkU
         TEBVAjftAuaSg4yUCjCZEO4IGsWf1YqjKpnlCOtob1KsVck5oYj+6vA9YxR2rLf4yjSf
         KQJNmTfUOz0kzmATrr3FwSpCH4b6Ys90ky/b37SNN0lM71yZKt9tnY4u+70M5RpliIBY
         rOSBZrWLGQdb/XyGO+PWGtfEdVYXBDWX3ApdWEHK+QuDXr4/QsTODZ2pDZYz3ZA7eSsv
         V2Ht2AsvjCOuTG+5l42xLm+4xos1NXt5Qs/WJEJS5wmyVpmFAPZntrBlpymHpdkt0V2P
         e3LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQTxABMrJ4tZGac7TaeucjdcT3s9hWDbAB/WozVPzE+caALCz3nSW711EbDePR6Ad5hDQ6D3YUUWoFIEYJLYD4/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5MZgFbrK3RMHY2x/w6BmyDj28i3HpfGEu4bJrHh/rCfP089u
	IgzHMDaRjkw/UXNVZaXi/MUBgbkqv82ui8afkCNwMdp0r5jUtACt
X-Gm-Gg: ASbGncs0qeJKNG/19jAurqLf0qZp008ea1991OtWnqwAXmiOhqXyOMuQtPZ+F3w0Eja
	pVGnWDVAhO3ZZdINM7b12PasGZlL+Mdi2volAedQQ48toyXhhWBf5rBPfv169xUOCqG0cHnbd91
	kNsyI8/hSrcsAQmS0ikWC68Wf58zSC62Mc41zoP0EJitMuN2EvT2PshqJ7Q5jk+Gzt59kTYBGEK
	2OJQbzBMeDDF6SbpQaIjs+RHUR06GMTL7BtYUTKAoow3K6VsmraHxTgo4pHfV2PVY+NKPPZO4RC
	tyTY5NaLT5z9HZJHLnHS3M7lqFAyYE20kP1rLDJen8fUnqXNeIynqaVDTMuB6jwfBTBAsO+1/Ss
	vJgXuCSPZHpr6Ucpszrz0tmA=
X-Google-Smtp-Source: AGHT+IFrp+cyrBeVaNbXDrNlpMlwKzd4QB0nHxIfYQemzF1xblwlFirqZBwgQt+qtiNRv+57DB6K4Q==
X-Received: by 2002:a05:6000:2d0a:b0:390:e8d4:6517 with SMTP id ffacd0b85a97d-3911f740ccamr3165925f8f.21.1741208880213;
        Wed, 05 Mar 2025 13:08:00 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844adfsm22276359f8f.62.2025.03.05.13.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 13:07:59 -0800 (PST)
Message-ID: <942684f8-39ac-4966-96f8-74feb9e9bde5@gmail.com>
Date: Wed, 5 Mar 2025 23:07:58 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Any pending patches on me for Samsung SoC? Closing applying cycle
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Kaustabh Chakraborty <kauschluss@disroot.org>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Denzeel Oliva <wachiturroxd150@gmail.com>
References: <56288828-c767-4198-8f5c-a891d169b6cd@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <56288828-c767-4198-8f5c-a891d169b6cd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/5/25 21:45, Krzysztof Kozlowski wrote:
> Hey,
>
> I went through my inbox and cleared my queue because I am approaching
> end of applying cycle. I think I dealt with everything and pending
> things are:
>
> 1. Exynos7870 SoC: waits for bindings,
>
> 2. Exynos990 watchdog: waits for bindings, replied some days ago,
>
> 3. GS101 pinctrl fixes: waits for review but I will apply soon:
> https://lore.kernel.org/all/20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org/
>
> 4. ACPM firmware debug interface: I replied now, need more discussion
> about interface
>
> 5. arm64: dts: exynos: update all samsung,mode constants: will wait one
> cycle
>
> Did I miss anything? Is there something still pending on me?

Hey Krzysztof,

Thanks for your work! I just noticed that there's an inaccuracy in [1]
where instead of setting only BIT(2), all bits in the register are getting
flipped except BIT(2), and it forces clock request state. Is there any
room left for me to send out a bugfix tomorrow?

Otherwise all other important patches of mine have been applied,
except 2200 usb phy and device tree series, which I think should be
sorted out soon for after the merge window.

[1]: soc: samsung: usi: add a routine for unconfiguring the ip
https://lore.kernel.org/r/20250204172803.3425496-3-ivo.ivanov.ivanov1@gmail.com

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof
>

