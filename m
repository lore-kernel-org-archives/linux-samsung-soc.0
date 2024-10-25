Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF521DF748
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2024 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850460; cv=none; b=qC1IgWSelbwShcrLETj4Myj/maSynbv4c3sIzjWS8O1KbH/ZRPiT8bAQKADWD6FBsZRnPS0/Y1dtbPzT2EwyQz+fQJuSRNkScQm3Zo2BAYsoBg6aG7cym0yDXK0nD2VCvAGqjucqWVfBHqyzvEIJBn1avL+KShreJzsbJzx0DQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850460; c=relaxed/simple;
	bh=aI1urz9KFxp3vtZsp5jxRvEPBHELYVj3ABjYSNdE2a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPBJNM3io/j3nmOmAjawGYV4gSoF5yAH1H9eoAupDF8flD8Zi0FzAo7fOnbyXotBudatUGCy/cm+Ns9omQNWAlZnQDKkpOoww6APj64MTByX6aJ+82zM8u+ASO8pVVJ624vsxOM4Bt7Pwokhxj9b5P9MDd1rdr3uebwRwdvYsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNJ8GBwH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNJ8GBwH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9932aa108cso280793166b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2024 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729850457; x=1730455257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWlbaIJ0hi4JFbHkI72bLaNDNUhZfU2viW5MR4J6woM=;
        b=kNJ8GBwHhVqVPeGW33AcHAFU6XfCsC1BcrigyhDTFqT1yYyHfTs0ZdiqvSAAKpR+U3
         JJSpXXhOxYSOOlPq3QvvAqXGvneTTLSSa3GQbtSjboHzCbQKbIobkAEF3GRXm2mG9NIW
         xqj0E1EX0mQemNpTxp1oMMXRCJAMA6Y0oS4aHhTiSwBjcTGQ54BV1mA6vXu6WYRsyQd1
         xG84VzbGOEgkhqdLZ8Nv/Vy/qMirVNtLtT3oyjtsXqLBIZ06g91HHZzqwPgP1jxwgVJE
         dd2IxN6mDt51iudGJ1xUN58EdRUyfaPH0idoENoIsdSxV4G8D69Yy2czAMkKHMF7LgLA
         KO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850457; x=1730455257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWlbaIJ0hi4JFbHkI72bLaNDNUhZfU2viW5MR4J6woM=;
        b=sllu098npMEXEYSr+I0iGcRGQzufyNE4e7YimORPf95WZg6G8DmQy7jRofwYwztCNL
         iTVzJFsHQOgehx/6v7cmJolsszVRmUM8RFsX8S4lad/8C3ftIvP7SNmn7SxOztWdOZPR
         25TVWpU9YPYxtEHYxQ5R5TiG+6XHz+syVypkp2oPxo9MGF+0VaApFcMKZxrGvWJ86scT
         vU5OtQF4tDBibylyabHUIEQnWkWwakyj/ffa0q2Ux2oR8fZHWnB3f/47YQua+gt0sNFO
         HqpzIFZ7B5x/OlOw3fYOhz9ryXgNEHuqj0mDmAw8+Mc+iEIWYpQlgaTavYEXCR9QqEUV
         3KMw==
X-Forwarded-Encrypted: i=1; AJvYcCVsPGer8JW4Uzj3Pm+Dh/3yK/CT3RArtzX0lgcAzS+X2KgNeCaZJNhHV2WDCn0LcZj5+w9H9oxJHb2wb0x+zSjkmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYlGo7VHZKlQcEaWYz/ESTVTguveEfkN0rmnQxNAM+DQnVGuI
	MGtegy5u3YWDJJFq6D6qccKIpV28pTjD11W5jEEQJHHV5Oqg6GFw2dtf7UgZ2Ks=
X-Google-Smtp-Source: AGHT+IFdts21GtnD76VhDCeCjho+8OH76wrvaoNYV2Y9mWY9mltExz6Sr41ezR5Fkxr73yIvhagmJg==
X-Received: by 2002:a17:907:6022:b0:a9a:c57f:9666 with SMTP id a640c23a62f3a-a9ac57f9ba5mr450700966b.2.1729850456437;
        Fri, 25 Oct 2024 03:00:56 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3099df78sm50972466b.158.2024.10.25.03.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 03:00:55 -0700 (PDT)
Message-ID: <88800ef0-2fb5-41f8-a303-e149ade7ed47@linaro.org>
Date: Fri, 25 Oct 2024 11:00:52 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
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
 <855101b0-0102-4c77-b110-bdec12b28f29@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <855101b0-0102-4c77-b110-bdec12b28f29@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/24/24 10:36 AM, Krzysztof Kozlowski wrote:
> On 23/10/2024 11:53, Tudor Ambarus wrote:
>>
>>
>> On 10/23/24 10:00 AM, Krzysztof Kozlowski wrote:
>>>>>>> I also cannot find any piece of code setting several of above, e.g. tx_base
>>>>>> I'm not writing any SRAM configuration fields, these fields are used to
>>>>>> read/retrive the channel parameters from SRAM.
>>>>> I meany tx_base is always 0. Where is this property set? Ever?
>>>> It's not zero. My assumption is it is set in the acpm firmware, but I
>>> Where is any assignment to this member?
>>
>> In probe() you'll see that exynos_acpm->shmem is a pointer in SRAM to a
>> struct exynos_acpm_shmem __iomem *shmem;
>>
>> Then in:
>>
>> static int exynos_acpm_chans_init()
>> {
>> 	struct exynos_acpm_shmem_chan __iomem *shmem_chans, *shmem_chan;
>> 	struct exynos_acpm_shmem __iomem *shmem = exynos_acpm->shmem;
>> 	...
>>
>> 	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
>> 						 &shmem->chans);
>> 	...
>> }
>>
>> shmem->chans is not initialized (or tx_base). I'm using its address in
>> SRAM (&shmem->chans) which I then read it with readl_relaxed().
>>
>> I guess one can do the same using offsetof:
>> shmem_chans = readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
>> 					      chans));
>>
> 
> I see, the code and the naming is confusing. Two exynos_acpm_shmem_chan

Noted. I'll refactor exynos_acpm_chans_init() in the next version.

> variables and one exynos_acpm_shmem. shmem_chans is used as an array,
> but nowhere pointed or indicated that it is array of some size.
>

I understand , will update. I added documentation for `struct
exynos_acpm_shmem` describing the array of chans and the number of
chans, but I'll figure something more, to be clearer.

> All this could be clearer if exynos_acpm_shmem_chan was packed, because
> then it is obvious it points to defined memory, but maybe packed is not

__packed shall be alright, but it's not needed because all the members
of the struct are u32 and the address of the struct is u64 aligned.

> correct here? Probably splitting all this into logical chunks would be
> useful. Like not mixing reading offsets with reading values, because I
> really have to spend a lot of time to identify which one is which in
> exynos_acpm_chans_init().
> 

I understand, will update. Need to figure out what other options we have
with the mailbox core changes first. Thanks for the suggestions!

Cheers,
ta
