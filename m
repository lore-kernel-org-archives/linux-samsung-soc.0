Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE09530E82C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 May 2026 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972495; cv=none; b=PyZbubWQo03QkasmjGcWwSCrRNs2DZSMRfSFsVOwWwxPWfQqoxbh+DM7m8rde+1VNsmR2rQNcEyi3DZtEN5PD3Mcw9lAJiDs1XFey02A1jIgxTcrJDxl4EXQGDYJu5HVXznTOe2qS7Bt2Qp85iWor6P+faaJ0ae4E0Oo5v0xtD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972495; c=relaxed/simple;
	bh=21bhpduPBAzP/8bbIcPKvaU7pSC8NYtoArYXu1/phn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMGz7s/2EelRvOOl3me5Nq72in2Zc6l8/SWe894QiLCRzxyTwP/ROhpUYtY1GkroPjw1LfjFCjwf0MQhf+b05jr0qnHwep+6xsJ48WcORF58gY+NKTpAI4i84g8JJ/M5QFebI7iuo/tmCFinleDDwZ+7XTTU3uIpoJ5A68TCOQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9mQicBP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9mQicBP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ad135063so47186145e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777972492; x=1778577292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MJ5jvSmy3GosoYN4CBc5oeGoIhzHzzIKBuMNkH0u8Q=;
        b=a9mQicBPMAScg61mtgHczRkrfBpppDxn0875T5gwUUe9fKDI/5dKUMtStHVBjux1fP
         bXda+1zqlHFL/tDCxI0mlxdEG9tuuqSbC91wmG9Io1qcF1JoY0vZpgq+5Gslsde5zVPC
         uu4PBNuMoeTjswgPPVVdxG3LyyohPObOYL4OiDY2QX9j5zZ9B4Ihaf9xmDBqhXNdPeph
         /yINJM9z7AQCtVafKZ7y61qBCsJX5XqnpM1YXSpmxZkm0Xl3g+3rMcSd5qXYFHLVlwCV
         PzByXd0x+9Fnnq1rR3wXf7CMqrFbeA+r76wCuaWqKaF2jBYr8FEZGTLMtnPrPSc2WyHy
         Cf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777972492; x=1778577292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MJ5jvSmy3GosoYN4CBc5oeGoIhzHzzIKBuMNkH0u8Q=;
        b=OHZ1w6FwhZ/Yb7z/oXRZZcQEdtF0Pm87gL5OVxVBhojhbkIJHhNr8ylGWEvt72c4Gx
         lOLBjaI+MazqseTXtR1Co1MEdk7+flOsJUeOF/LelUc74w6/D9cZj9BzPjSJ/bqGip6D
         xvKtmBEZXZstLaZkm4rQLl0G5nPfQvKX5d8XwsmXg8PWEaJrynymc4guqzXoL4mzxgmo
         Um3nje6jAL5D8eNZMsjMGHUR3NZQ+zCEs7VjIcNnUrE2GtUPux7zTmV05x1hq5D+2JZX
         MpRssO00SVwIXFCPVPFLrBq5LKFaGU6Ve0HtmMep0MN4a49y794W7yvb/Mnuqd8dyzJI
         ZT0g==
X-Forwarded-Encrypted: i=1; AFNElJ94TskG/9afOKZE7APyR52QHFtkBlPPuSqgIp/AhDWvYSDsD9/t/VXzn4lSUjOJz1CaUQH130Tg6RpXMmkgLLF5Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZgP+pO2Iz6OlFcA4yzOcVa6fYoheXzENlksutUDYgBmoTZw7Z
	6+L58hpW2G7KFqwOkf4R2aPzK17qOoCfzTg8Nsh7KQBSeLwnAg7/7335v54wgiYZA1s=
X-Gm-Gg: AeBDietmJbysWEPNnSfYvTemHKBVMvMxn8nGxpf2XpIY9/fL2u2dsOXU4C3ySNiMMBv
	14nslyc63mVpn3IB2OprnKxaYB2zoMEasFZyjE9zB1TMYToDui2VDAWjbosXZTBEoA44gHDKwTo
	GpYXfe7s9VS9Io9sIHdXtgf8vEW9K1CTmaBQXo1kv9Vp9jvqgtuiLwSnnJH3FOdhSeotlIXVOy2
	tCB17hSmtV1OtWnXlEqUAngJyO3O5tPK5WO4oONq2+jML4Qtooh1f+FNoEyStnQ7mbeN/teNC5a
	GjYUvWbcczJh1LEBEasKm6YzL5ZMAr5Wra23CBVg9L7LCJDnzbUKJx4zYDCj/VLR57AcQ2fsRiv
	dWxghRUmfltkux9EHLc+VRMccmnwGO0te+htIS605i0sAEuqAH3Z2sF+YJBxeMzVODXPDiJEihQ
	Gt/UVryESSkUtLrAZVbb6fy+jm3C6E5FZiTE+ll4cTuYc=
X-Received: by 2002:a05:600c:4f48:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-48a988ccc94mr241921645e9.27.1777972492118;
        Tue, 05 May 2026 02:14:52 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17708195sm19352525e9.3.2026.05.05.02.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:14:51 -0700 (PDT)
Message-ID: <cc973c62-4e33-4055-8059-dfc454447d0e@linaro.org>
Date: Tue, 5 May 2026 12:14:48 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] firmware: samsung: acpm: Fix cross-thread RX
 length corruption
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
 <20260504-acpm-fixes-sashiko-reports-v4-1-529246be6b2b@linaro.org>
 <8e5ad1bc-e404-4247-8a38-aa2a51df24bb@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8e5ad1bc-e404-4247-8a38-aa2a51df24bb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/4/26 9:36 PM, Krzysztof Kozlowski wrote:
> On 04/05/2026 12:15, Tudor Ambarus wrote:
>> Sashiko identified a cross-thread RX length corruption bug when
>> reviewing the thermal addition to ACPM [1].
>>
>> When multiple threads concurrently send IPC requests, the ACPM polling
>> mechanism can encounter responses belonging to other threads. To drain
>> the queue, the driver saves these concurrent responses into an internal
>> cache (`rx_data->cmd`) to be retrieved later by the owning thread.
>>
>> Previously, the driver incorrectly used `xfer->rxcnt` (the expected
>> receive length of the *current* polling thread) when copying data for
>> *other* threads into this cache. If the threads expected responses of
>> different lengths, this resulted in buffer underflows (leading to reads
>> of uninitialized memory) or potential buffer overflows.
>>
>> Fix this by replacing the boolean `response` flag in
>> `struct acpm_rx_data` with `rxcnt`, caching the exact expected receive
>> length for each specific transaction during transfer preparation. Use
>> this cached length when saving concurrent responses.
>>
>> Consequently, ensure that `xfer->rxcnt` is explicitly zeroed in driver
>> helpers (e.g., `acpm_dvfs_set_xfer`) for fire-and-forget messages to
>> prevent uninitialized stack garbage from being interpreted as a massive
>> expected receive length.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
>> Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> I think parallel credits for Titouan Ameline would be suitable here.

I agree.

> If there is going to be new version, please also add:

There's going to be a new version, will add. I have to admit I'm
impressed by sashiko's review skills.

Cheers,
ta
