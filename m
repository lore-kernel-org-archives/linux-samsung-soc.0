Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955B93C5546
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778182752; cv=none; b=XNlML0w2ObLblGYBl6eZtgPNIiS7FXpBOhWgs1BuI/5QIoC6KwiY1WxLmX3CzManONLt11mVyx/UatWvTP/B7QD+qlCYvSPTCQ0lXAjfEbuaLj6gNX/m5yBUBqu+6vllQR1ZmhI/Pm7OKg9keZnG4pF8pLrsgVEYBD6nlRESDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778182752; c=relaxed/simple;
	bh=jKnGNKLqkB8e0df/XKOKodfYrWmIj9cCVvEjPQpZrkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUc7SpeE+Reol+oJuH7n4OVQ2ntoclnEMRJIjV/IZjybK+U5mpHPK0wtrz2+xCISDuDrvujhSLUWLgkcJleh8ic5TwPbXkhGJ3fvq8LG1A7mUmdCR1Ihewvsff3lZfwQEgWivZhwGyiQ/m19Iyo5TMLXH3RlGD0s7pjmIfhoXAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CspOxCzI; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CspOxCzI"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bc66ad3742fso214156466b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2026 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778182749; x=1778787549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtUJyWhJ561fYSVag2QyjsbPKhV41JyyzBoUWpnRnL0=;
        b=CspOxCzIqfROLf+4CckaCs5hMw3yebEWWKkwREfo/8CzFRLP6/EMaVHyvXWHv2JkQ0
         wFjsyX0WqYdCOdpuQeAHg5oO1p9+wJd9bv8aL/8z0DdCA79ET8YEASxuKGGnYIzQutDP
         iNGgLC+au7l+P42D5SHkjuxez8eSXoNUGk9gQh4p0EWdfPlEtXKFOxPmKNGAj2zJQUTB
         74YXUPABMCj2b2KjwbBGW/OJzPtu9NRzL+2qEent+58w2XMvSvFf+PBhUwDPFI4USwd5
         MsoI2k0Q6rvMK/2Gsb7kCI+bNaelvHUkUzAlfzlW4bEoNqteFqtiNnTXJGKnWAA/FJsB
         jQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778182749; x=1778787549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtUJyWhJ561fYSVag2QyjsbPKhV41JyyzBoUWpnRnL0=;
        b=f4/ozEqxFYXKyK6WcLF55BR2TCZ3u1kfkKEyGReLOR312No8EVR0CZiAvL4vp8Ytl/
         PWv5f+j2TP+0FKNjhhXH4B1UXtgYgm0mmGUY8JMn6zUVOBghUMZ3hH+o2s4SDhd9l/hw
         8NYx+Q+4ZJn0oB97uQAki9uE0BN6GYwx5EN77CGpNSDVSWFDYODoxCBM6pxKemTTQUez
         apKJ4qY7TVepgx3oVRLjvfbcgRVNCfAIXc0MLeCHJ+Q3map7YZ2aSTrevmy8wOZacY3a
         rm85Eq0lvQos/shaWmgp6wb4fzHL28jjOllhRI+3uw2/MuCPAyKBTQNKZci1Y7UtpqcU
         u/TA==
X-Forwarded-Encrypted: i=1; AFNElJ9996CrD3/sAz3+KI8tXlmvFASCIUnslHRl/RY1GT0HCcZEuvDwS1gp59A60O8WIOkd88vMe6qgONwP9g3YGXX/Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynsgZRp+JXbBUQHbKNGXpytgimWcoLpj93d8rKSmQqLbT0mY3U
	JUAZGMzoI8jU46YrhQvuZWYiLP9+YFph9agPzcpyp95raN07Fq2i42qf
X-Gm-Gg: AeBDietWVgBiaXFXr/2Ib6J5Yk9hGVVrSQLWB9H5EfK650IZSGdA4w/ylRBHzkw84lw
	Mshoh2D5NRmia4oBFuzyMFisG9epsWxodQbhEDpBE1if3vUjvp0qMTMMWHLrWyyMy5egwKbR5N0
	FUkAPBTfjo3zY3nRUKaau2MW954OaBER5Hqr+qAevw+lrMC4P8zJ0F9okXJcgWZmrrS/bYBf+nU
	zkNlzHGWNz2GcwMStlLXPUl+lnEk69lIIW26X9QcOvu8emqT28EwHJh23725qqD671/SSzgUyez
	5/0kgFJsBu6E8HCUlSDiI5LgC6Ci+YYT7VZA6RYimv2HRCIvLk7w5HEJ9Seqqz0XtBhsvyUrpcL
	UT2dWtuYgGLw+zDcx4aHDHOVKLjucOcblHmMX6TpOX9ntUggM1PN+rnZ+QQmevfaBnccmd2NR1S
	Rm415rmgwyFXQcCw0LJkMFUiaVlrlMzhrr/93j/h4wu/YcAw==
X-Received: by 2002:a17:906:6a26:b0:b9d:e301:20db with SMTP id a640c23a62f3a-bc56e316a92mr576277166b.25.1778182748538;
        Thu, 07 May 2026 12:39:08 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca578b332fsm20347966b.33.2026.05.07.12.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 12:39:07 -0700 (PDT)
Message-ID: <80d85385-f5af-44e3-b9ed-d4489542d4da@gmail.com>
Date: Thu, 7 May 2026 21:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] leds: flash: add support for Samsung S2M series
 PMIC flash LED device
To: Lee Jones <lee@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Nam Tran <trannamatk@gmail.com>, =?UTF-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?=
 <kernel@lvkasz.us>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-7-fcbc9da5a004@disroot.org>
 <20260507164654.GS305027@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260507164654.GS305027@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee,

On 5/7/26 6:46 PM, Lee Jones wrote:
> On Fri, 24 Apr 2026, Kaustabh Chakraborty wrote:
> 
>> Add support for flash LEDs in certain Samsung S2M series PMICs.
>> The device has two channels for LEDs, typically for the back and front
>> cameras in mobile devices. Both channels can be independently
>> controlled, and can be operated in torch or flash modes.
>>
>> The driver includes initial support for the S2MU005 PMIC flash LEDs.
>>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>   drivers/leds/flash/Kconfig          |  12 ++
>>   drivers/leds/flash/Makefile         |   1 +
>>   drivers/leds/flash/leds-s2m-flash.c | 358 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 371 insertions(+)
>>
>> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
>> index 5e08102a67841..be62e05277429 100644
>> --- a/drivers/leds/flash/Kconfig
>> +++ b/drivers/leds/flash/Kconfig
>> @@ -114,6 +114,18 @@ config LEDS_RT8515
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called leds-rt8515.
>>   
>> +config LEDS_S2M_FLASH
>> +	tristate "Samsung S2M series PMICs flash/torch LED support"
>> +	depends on LEDS_CLASS
>> +	depends on MFD_SEC_CORE
>> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> 
> The `|| !V4L2_FLASH_LED_CLASS` part of this dependency makes it
> unconditionally true. Was this intended? Perhaps this dependency can be
> removed entirely.
This is for a reason to allow building the driver if
V4L2_FLASH_LED_CLASS is turned off, or build it as a module
if V4L2_FLASH_LED_CLASS=m. You will get nice explanation from
Google AI if you type just
"V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS".

See e.g. [0], which fixes undefined symbol error by adding this.

[0] 
https://git.paulk.fr/projects/linux.git/commit/drivers?h=sunxi/cedrus/jpeg-nv16&id=dbeb02a0bc41b9e9b9c05e460890351efecf1352

-- 
Best regards,
Jacek Anaszewski

