Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3FF1607AC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2024 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677210; cv=none; b=CEk0Xgce5d/TtYvGpJv4RcCmZOHGHeU1zgppOPO3W7v1lw2q7psNv63AM5V14S8dzoJMBDLrLzdB4Kl3YMwHV8pmhYiX+DKhxucngd8DSNzlD+kYEbRSWrMbn6l6Papc/lbo7YL3H3s2Qr2LpkyH+5hq1jWt4uQz96WNKTTADek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677210; c=relaxed/simple;
	bh=/BLIfQAtKqmhZEOcNIfrYKY9JpZSW1SIDoen9NMxzhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfQP6QrCzBbjkxQi5+LuGgCmbZUTNBRXA+a8C+I+itUb5TovUr9e2KTStFtKDgfNlSR+/0EEYQrUrM9WJI+9Ck9iZB0xF1Cx0auOkF9/vL7UTmlhznm0MlzmSaku7dpbAe1bskZdNYvIiLOo9AmgOB0hVfnepXMrN+786ie4D5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7+RKXA1; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7+RKXA1"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so4592155a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2024 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677207; x=1730282007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gInd/ZT940rkLW7Hy40LZDK1j6KO9dt/iHtLEkODb20=;
        b=m7+RKXA13OdLOVF4Fr7api5O4MK71Bf1FSevtucwLJ54dFa9S/AWuLNeLysbY7/0Ty
         FJE0srPSZA/UZ+QMPrbCT7mqJNaYxo8KaH6nregEl5vqVPBtDSd+DEFCeYF8/AXxw/Xl
         xr94obUZw9okcI92F0nv4Rqut4tPJIFe76OjKWhdefMeu2+iPaIiSqTIhfWtcEfIaCfS
         KDK6B34C+Gpcyb9J/UkmIo7P51XoEqQt84uoCn8dV8ahXP37B+wxZGbkpqZsH4awebAj
         RU53aFo2pBe5g46/nSE3eiSTGCMsCjG6GXUBNZLWFzsHr6qXnvz42/203olHCDOW6mhh
         bqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677207; x=1730282007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gInd/ZT940rkLW7Hy40LZDK1j6KO9dt/iHtLEkODb20=;
        b=NiZw/FzugBpms0DftR7X5wL5/8mIpgNodnRDyMlqojQM5xwCF4DOYQ5qRkxBU3leU9
         0y3W3DuLZKKWrL8brDqHusV9mgmIQbUlpYamXiz7MfVmGOxB9L0XZVLpqChAXuFTvA8S
         37gLsKlRKbEwUSgYFJ9lTsoqVSydq1yaNu6hdlD4otLYGqFCkyHuMUlk8SjycMPP1xrR
         OxZycOqPvZ4LsH11Xdu1XrCvxYccaxS1Lg8PYQHUsnuEpohJiJpAfUPY8zBuq2FEqvbO
         AFRo66HGYIfY+qlMTIyZ9zlqNZQxwMDqrSLpWYqmPS2avmmXGF2YzdrP0ckCnO+vclV+
         wuVw==
X-Forwarded-Encrypted: i=1; AJvYcCXQJa5p1QPTBQoSD/DPicWXMwdzuTTwj13YJxcGbbg9bDP4TrVrTxC1ZchuEmGdpO8JswKxAHrErcA8wwJ/I7NYsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx/ZV5bTdeBuF2VWiD6XNYUX0cWZGCeG/CLVJnUTXVQTzDHsFQ
	Mw1OqxTlksPhM77OLQIO6aNTwPAZj5ZSkKJsE2bj276cJuqGHRSu5L7riujixQw=
X-Google-Smtp-Source: AGHT+IGnIcL4a6Oer+hli449mELxDsnl6sHLLPt8fFrKySfMkHOlwqZ5FX2E1aHNIaTA/KyOnahWYQ==
X-Received: by 2002:a17:907:9411:b0:a99:762f:b298 with SMTP id a640c23a62f3a-a9abf94de80mr193476066b.41.1729677207496;
        Wed, 23 Oct 2024 02:53:27 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d62b8sm453063466b.25.2024.10.23.02.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 02:53:27 -0700 (PDT)
Message-ID: <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
Date: Wed, 23 Oct 2024 10:53:24 +0100
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <1e76bc70-21a6-4ac7-99ea-30a7ccf387bb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/23/24 10:00 AM, Krzysztof Kozlowski wrote:
>>>>> I also cannot find any piece of code setting several of above, e.g. tx_base
>>>> I'm not writing any SRAM configuration fields, these fields are used to
>>>> read/retrive the channel parameters from SRAM.
>>> I meany tx_base is always 0. Where is this property set? Ever?
>> It's not zero. My assumption is it is set in the acpm firmware, but I
> Where is any assignment to this member?

In probe() you'll see that exynos_acpm->shmem is a pointer in SRAM to a
struct exynos_acpm_shmem __iomem *shmem;

Then in:

static int exynos_acpm_chans_init()
{
	struct exynos_acpm_shmem_chan __iomem *shmem_chans, *shmem_chan;
	struct exynos_acpm_shmem __iomem *shmem = exynos_acpm->shmem;
	...

	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
						 &shmem->chans);
	...
}

shmem->chans is not initialized (or tx_base). I'm using its address in
SRAM (&shmem->chans) which I then read it with readl_relaxed().

I guess one can do the same using offsetof:
shmem_chans = readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
					      chans));

Thanks,
ta
