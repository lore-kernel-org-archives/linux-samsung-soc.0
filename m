Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7EB36D9FA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058238; cv=none; b=Vy1G/3IErloVYCSEUr5qcZx0SQBkLyYXQzAgXfQEcr0XmJeEYdAGe7Ljciy1VILt3o3Dr9yrZX3huPFPhUgyp9IfUhkuVKzoUBqXGKmnCiee3p6kw1JN7COERFoRFxvjIa0sv2bOISS3e4Tu1+tOxDM9M1X7BmcIAef80nlJJ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058238; c=relaxed/simple;
	bh=DojchXGz/KKYSE94iO1v9P4Lxh1mNKs7SpCF/Nl2JGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSnpvxtzYwZi/bo1w81z5+Aoy2mnsdedx6CeOax/WMMhKdKKmAN2/XTUaMiHnEyWw4uDmnaSYBucDPbMg92fByMXKmUoy2tb3TFLEWL4pu4jKorxjHITLbDHFVwykEPc+o9zDCCnFsPJ/ntVVvcwwRApYiirB9VJ1upZzkp+obI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtXw/yL0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtXw/yL0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef616daf6so124706f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780058235; x=1780663035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQzxiBtnUr7ain8V9TqP5xGod1EBAScgia3DVab5ruI=;
        b=xtXw/yL0BJXLsXKDdDDkxRhQ7QSaPmFGBsCrTsSiCRbednhJqwwGJgy/1GbtEcR4EQ
         OsH4xv5X1qWVmtO6zsGi9cUoXZU9NyLEwAt7WCyr+eHbgs+XGNVVpwmJn/Y3X+XcIKgU
         ZGvxDYIhwQYzPokgGdgjsnHC8UB8tl/zG8tXBkErZxEg4+gjiMHlpYjaZfHbng/W+ES5
         +scVzVyGqVAJmWtoQ4pVVw5svdbx6KptkIRyNBP7VLHaH1VMdzcH7MNd5KqjV6aajmR7
         Xq9JNPLhwwnZE0kQMjY1+TT2jNKBBmscqEU0kwr6o7B9hEpBnnxmPFa7w1QshW93Ljbu
         1Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058235; x=1780663035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQzxiBtnUr7ain8V9TqP5xGod1EBAScgia3DVab5ruI=;
        b=HmBPmM7mWwx/MNHxt+MLQ5xkWvzr133a93PTwwKYT8L1e9HhGfqm/1s1OH9txZ2rqq
         Lmblx9OnvX2DP1TWJlG+4iNwMF8Hpj39TONz6jXxh3w6YdLmIfgZCdNA1Thvtg1vfAxW
         yDNoxzOwOUUHfQsZuDXlTEADOXzmSbw/iljUzUtWiFBST5dCKsd25GKfJXX6akRPxy/m
         5T088OYrUJB1DsqDH8zr/zYZYpHVMDsah5heYXgfrePFMXUTKy0aqDnAVJMxoMqbXA7g
         PxHxV6di7O2a4+5UlKYp7soS+vjGTKO2DfszR1A5CHFXQYoEEzeJq0y/HVZ38ASuGIrp
         0quw==
X-Forwarded-Encrypted: i=1; AFNElJ8c3pf827Cf/Ic05k1MXmlckuxSFLslwhK3rvfAgEEl9n0+cLGuJCwrqwPrdheVJzoGGqxn3/6ltsSqaGdH6dSAKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWIiDmUMkzoPnf9hETmC+AbtSbgqi/sWwKRsZL7bdXdzXBASTl
	yBozKEIw5LPrKhFdRGHChI+eFjkA8h628YEMQ+MEfC+AS7fcqF4jqxiexXPOws6NL1g=
X-Gm-Gg: Acq92OFEvx9O02iQJVezuOrX5ADPOMu2+hMLT4buj51p9c0VhETvJY6QQb3ehRgUkb5
	RZU5DnWWVquZOQshBfdrQXYv/HSjDFWoSWVI7Wsi4aN/UyV7qF/sDPKLuOzRglLxN86kFkdVTLF
	n25lKTSt8kqYfbjWjsLx+/PrS0FBGLV+B1nJ1cfxUIP9Z2J/Owv0PKrY/V7BCiSctmUzaiQ0KsA
	aq/YeNWmmo18CilSdA0Ot1vWKo1OvAcixNM4Q8PJvMkBhBKyoSICMZgNtdF9oXj5y8/pHpQgi9K
	TkYD8+BuQYji8nv8M4OZ/NITzifi21FqExsIbhA+QHTiU5Frm/LhHagsFHTv0CHLdLUR+ppvvCK
	HKmpJImLkgYYP727lJEjt9bGupLJ6pE4//7006mqIFYAqm0hNK93JilErOgMa2cuci1DxTkRNeq
	PqXvojcy8wvRpN/maGf9p20kc3DwwCMAcdO55sMnZZ0g==
X-Received: by 2002:a05:6000:470c:b0:45e:f2bd:2b16 with SMTP id ffacd0b85a97d-45ef2bd2d41mr3802790f8f.18.1780058235304;
        Fri, 29 May 2026 05:37:15 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0374sm2981872f8f.2.2026.05.29.05.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:37:14 -0700 (PDT)
Message-ID: <a7994860-24a3-4f87-84bf-109ed653dda4@linaro.org>
Date: Fri, 29 May 2026 15:37:13 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-3-43b5ee7f1674@linaro.org>
 <03dc9ccc-d819-413e-b8fd-23ccd85675ba@app.fastmail.com>
 <6c77d706-5944-4e7d-8a4a-b3a6cac6a83b@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6c77d706-5944-4e7d-8a4a-b3a6cac6a83b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/29/26 3:09 PM, Krzysztof Kozlowski wrote:
> On 29/05/2026 13:51, Arnd Bergmann wrote:
>> On Tue, May 5, 2026, at 15:13, Tudor Ambarus wrote:
>>> Sashiko identified a potential NULL pointer dereference [1].
>>>
>>> The dummy stub implementation for devm_acpm_get_by_node() returns NULL
>>> when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.
>>
>> I meant to comment on this yesterday as well.
>>
>> Having stub functions like this return NULL is a common way to
>> define optional interfaces, where callers still work when the
>> feature is disabled, though this clearly does not work for
>> acpm because some callers have a NULL pointer dereference
>> when compile testing.
>>
>> My preferred solution to this type of problem would be to
>> just remove the stub helpers and drop the ||COMPILE_TEST
>> from the one user that calls them, see below.
>>
>> The point here is that CONFIG_EXYNOS_ACPM_PROTOCOL already
>> supports compile-testing itself, and all (both) drivers using
>> it clearly require the support, so this just simplifies

I confirm that the ACPM protocol is mandatory for the clients to
work, thanks!

>> the option space without losing any build coverage.

nice, I didn't know this. I guess it's a "greedy" algorithm in
allmodconfig, if the dependency is met the dependents are enabled too.

>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>
> 
> Sure, I am fine with it. I'll take your patch with a bit adjusted commit
> msg.
> 

Thank you! I need to drop the devm_acpm_get_by_phandle dummy stub from:
https://lore.kernel.org/linux-samsung-soc/a59c6e3a-6092-4114-8961-c2a71a812959@kernel.org/T/#m0ac077507129c37b84443513eecadd70b5eaf8b8

Shall I send again the entire set?

Cheers,
ta
