Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2272198A38
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2024 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677732; cv=none; b=hS1FS10E65XSox/pCBJAHRtO9URsl8A7XC11iw0GG7PLNRLym81MnAgBrlgXxkylFstL+oPisECCSGPXQf3F7NsyYmKmQt8ILLEJb+9P1bahqQ25Ec/ka+urNG8tlYo3liggE1nbTq5ycLo8ftmCKiWM5O8+XifLZBQtWvy704s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677732; c=relaxed/simple;
	bh=GJv7WXVNTlF7T7Vqd2XWKZkii/4y8dxQZ3yFBu5kxCY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qyxs5pBML2X7Y3HoceyMSifgqfFFMLMyW4X2AaN+lWfmtminqMTQlLyQanz3igz5Fd64F8qcTyby5zIcyBW8WfCAzkcr8gTaioltn/dBco4GnWZs+D/Njkj9VNov6Er0+9esc7foM0Kks/9uSUh0mVvw2Dwvgf0fWGPabRlZAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgyH7iPQ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgyH7iPQ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a3da96a8aso119725466b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2024 03:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677729; x=1730282529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUsyYzcBLI65EkyMKt9ic0GWqH2UepiiFrnn5rm1t2E=;
        b=NgyH7iPQQufmkJnV5dgoRETikrITJzBfQI2Gf6wmGjJRt7kUJlomsC3Ab3pcwawnrF
         AOavjwBDSCKBK3JOaPb2GuX5DBWYOSwTbAikbw65WjIiHq3uKTQnufe6x8qjqv3tNteR
         7jwhvBuOcKOVpDFtbppwm0t/p1YdwRAAxw6WmRIXxD6ECrB2eD0IDGZXZecp+4NgPypX
         qiUERg3G1A9lvFKzYfC+Lzma2uJb38d1ahzkDvazkJ6fM+Ng6Va0hqSLhM2v2mdI2ScQ
         4EngihUlKXPM234l58/fAN+akDlJrXJyknYafrKcZCgYoH1v4u8OeONl4pJZ+IR4Iilq
         wTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677729; x=1730282529;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUsyYzcBLI65EkyMKt9ic0GWqH2UepiiFrnn5rm1t2E=;
        b=tp8jDKs+fR5vBhthwR2jqvV0+Am31MQ0pmD1GaJwxRdqdi8vmLFh0+2CJKS5KH8fda
         EqLa7TanqoYxQbSE/D+MdLVrGqthLsZfk4DnGb9iGfKh3csfN29/nYUIf/+cFUGGYZtO
         7+6TgYO2MY/YY/pwqdk13vi7C2Ke6/8xxI54hTl9jhqh8NfvhQ0CF7EaQVKgleBtWtRX
         +Hw3egCkscIP4cHX2/hCw0h2sWAbTFQIJxCi/Y/z8Zgk7ickvyZFe+CrFkVtvIU6EXCx
         BBjJSTIMJ2jJUKG1iZAd9rUtUHr0xWbxyMDr6esIgmPWR2ulRcoujbKHTaHL2/6vbfX8
         SD2g==
X-Forwarded-Encrypted: i=1; AJvYcCV5tSJasfU38sYvg64A2cet3hXarbEquDTQ/BsARiKZ4O2fqsONG99d2GD1qUPQ6jmaEK0t6KI+wdYd/VKk+DcfNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJV2h4VCWJad3aarZA6K1zeTtQ6L6ZSzIHR4aYZUGQcyX3i5RU
	Uc6VoNXWzFxJQWor0ryK/Zmbu1rXUaw6j+8YyIU9kMijE/s74Q35NjRqbJaesMc=
X-Google-Smtp-Source: AGHT+IHC7zvwcyw194w8/6HD0iv1EPVzoje3wxQbXrndfVcLbOpXDwLNKGHuDv5F5S+9VIQBGvRm4Q==
X-Received: by 2002:a17:907:a09:b0:a99:fcbe:c96b with SMTP id a640c23a62f3a-a9aaa62250amr622623466b.25.1729677728513;
        Wed, 23 Oct 2024 03:02:08 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559951sm450387266b.106.2024.10.23.03.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 03:02:08 -0700 (PDT)
Message-ID: <9f15fa0d-9445-49f0-8ea4-889e5f51f3ab@linaro.org>
Date: Wed, 23 Oct 2024 11:02:05 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, jassisinghbrar@gmail.com
Cc: alim.akhtar@samsung.com, mst@redhat.com, javierm@redhat.com,
 tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
 <d41ee8f6-9a2c-4e33-844a-e71224692133@linaro.org>
 <1ece02e6-bf78-443a-8143-a54e94dd744c@kernel.org>
 <d91109a1-532a-4b95-ad4c-3b9cf8e3dbbb@linaro.org>
 <1e76bc70-21a6-4ac7-99ea-30a7ccf387bb@kernel.org>
 <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
Content-Language: en-US
In-Reply-To: <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/23/24 10:53 AM, Tudor Ambarus wrote:
> 
> 
> On 10/23/24 10:00 AM, Krzysztof Kozlowski wrote:
>>>>>> I also cannot find any piece of code setting several of above, e.g. tx_base
>>>>> I'm not writing any SRAM configuration fields, these fields are used to
>>>>> read/retrive the channel parameters from SRAM.
>>>> I meany tx_base is always 0. Where is this property set? Ever?
>>> It's not zero. My assumption is it is set in the acpm firmware, but I
>> Where is any assignment to this member?
> 
> In probe() you'll see that exynos_acpm->shmem is a pointer in SRAM to a
> struct exynos_acpm_shmem __iomem *shmem;
> 
> Then in:
> 
> static int exynos_acpm_chans_init()
> {
> 	struct exynos_acpm_shmem_chan __iomem *shmem_chans, *shmem_chan;
> 	struct exynos_acpm_shmem __iomem *shmem = exynos_acpm->shmem;
> 	...
> 
> 	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
> 						 &shmem->chans);
> 	...
> }
> 
> shmem->chans is not initialized (or tx_base). I'm using its address in
> SRAM (&shmem->chans) which I then read it with readl_relaxed().
> 
> I guess one can do the same using offsetof:
> shmem_chans = readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
> 					      chans));
> 

I forgot to add the sram_base, the counter example should have been:

shmem_chans = exynos_acpm->sram_base +
	      readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
					      chans));
