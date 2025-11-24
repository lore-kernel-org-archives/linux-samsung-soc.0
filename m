Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE22ED846
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980525; cv=none; b=PF89Lj9dU4WyENMECHCq+0YHU0JBQWqLKKyOE5Ly2oaKo08rPFDsTet6yWusQNwEyEmI1/WbQQsobhlmUxZIR2THXlQ+HM/EjZKIYSpbwyTSRGk/gMAatbYT7xwFKxn4S6nGtULH4sAnJIGjU9cSsY2nJFn+ts2DxKMYLrOlmu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980525; c=relaxed/simple;
	bh=7d8DEOx2yg6NDuhtFka3LOEqH41+BuOXBDXoifyZ9PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncK7xuIaQYZYmBgjJuaWY9hUhZn3Q+VVvGfjvkU+EHOVJZR1WnNxb6cgRNIJQHhO92ZCA3fcOCWPPq3G9h+cMqfucRidY9Ywz0oup4RfSB4Srd3JM6HjW2rv5JH5kqZkSomF+FyE8NHkn05WZFtTiSJXC0xsKyxKJ0jLVVAoXbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WF+lv+fu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WF+lv+fu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a219db05so24512105e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 02:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763980522; x=1764585322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndD6GFhIDsyYEQSTuUmCfWcKYqCeLVrqI/SLqnCg8Xg=;
        b=WF+lv+fuAg6M9f14nCe7tOFBPqTIeRR1NvtN9dJ6iKHXhMTzaqx305arZ9VRmL1/Vr
         yoTvXI2khSBwlHteUGy1rfT9N7qrGT3UwcTw4ZzDGIs/j+jVF/bmcCw9RNBspednnVxy
         M1xHNZxUPGRGOmXocSwB5tXko8bdeLcCsTSmXswjW9oIvyAKtfF6POqMuOK4zW/EZWai
         GL5WX+2t3RV4BCBQQt5+LWg2DKFDdUuYUl3NhvsSK2QVgbG/f+VcdeWrZrizjngOGoDq
         0arxWo6KLNjX1zXXoaBEAS3kn4L6BTJ4cBQbLTWrH5SalTLsFg4aABmvj21jLNzACqSy
         YWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980522; x=1764585322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndD6GFhIDsyYEQSTuUmCfWcKYqCeLVrqI/SLqnCg8Xg=;
        b=T/3Fm4E7xXxh6VoNWsjF7eno3WDfJOmarshBYSJMmY6i9LSgULJhSygd/gSzB/00V0
         +KmZwObFjo+ZuF67WP4avElyFOepTCRniURXnE9gxYwg9pgke8lWhtXbfGvwTZtVZ4Ye
         uIPLcfrGTKP3BkyhYvABX2iGFz6kGwFpqQL9JXAoausGXfhpFGqiSPDj5gNG5hyEhq3T
         yMjpxVflpqaOoQaWlQgCzgFcu5MMLg0JBQVmBLCWrPO/R3X1lnvzkMVoo8lzEqm4pDyG
         7HcmByFqLcgKyOXSM8ra67yHYjIAuSqr7ct1MZixddnX/Mc+PaMk5xdBLyynJkPMGq93
         rKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqEPXxWQ0/9811ow5v0HjF6FcBnJ1ldo4homeSJk5KvICxFJFXStXCUCAgxQsOSNV+38QeWiUtN6DXCOzea7wNOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqmNSexGIYy35XT6lcxuNTxTkTQU6jowOVh1KtXoybl6aSKtLI
	2m8pWtQKV6uqiUPnOCFqOaWPaVU8S2SaQozqjCSnHwo0RDc+2l/uvCGSbki8VT3X5Hw=
X-Gm-Gg: ASbGnculqnw6X3/pVCkqektA+IcsxHJaUqryRXJ+B1cbLE+KXwQEK74kmy5MaVqroB/
	9f4l/kZq4K9/k2O/QBsxRlqEzwC8j8n82KVH/V8GEtEH91Lptbt7zA2KeuQKNi77Wy7BSwH8WjN
	ESTPGnRbqBTpZeWs6Dk3sqqafN2zTHL5jzBEtk2Hcv85JFjON9ZPJRGu6qOvxPrizB4IJC2bUff
	YNY5eb6cufM/qx0ucrK9x+9aIef9Gqbzua6WJcKf4UL2q73efE204YfNoTJdGhcRPctpeE8ISwi
	2juVHun6u/4ds+lgy43+cjoGCmwv5jrXIugUnrO3EtDkISJjwbHrPaS3kx7oHNZHOR8OHnaOd+L
	RORvSz56piYk6VpWwqFRoHjVXGcescpuIeZcqy2bw/TG1t3nJ8FsoSm2PDwCCx4+7pRfY1kOVb5
	TY2Ugi098r0jAO57ubFaUwM70g+06gb5S74upiyyZxfJTqp63J40Bmsg8MS3tbCib24w==
X-Google-Smtp-Source: AGHT+IElNEZ5h3JUQ/4nKEFrG2nnJ9W9xdmqEYug4voX9K+dF3FjdDILyhWbdWr6Fd3WQPE4haywCg==
X-Received: by 2002:a05:600c:3511:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-477c112f7b1mr105073885e9.29.1763980522164;
        Mon, 24 Nov 2025 02:35:22 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf1df3d5sm188767955e9.2.2025.11.24.02.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:35:21 -0800 (PST)
Message-ID: <ab35c20e-390c-4479-9bb1-9f5e49cba2a0@linaro.org>
Date: Mon, 24 Nov 2025 11:35:20 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>, 'Zhang Rui'
 <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <2180a854-8ba6-4424-add2-eb34637530c1@linaro.org>
 <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/25 11:06, 손신 wrote:

[ ... ]

> However, since ExynosAutov920 diverges significantly from the existing driver,
> Would introducing a separate driver instead of unifying everything be acceptable?

So this driver is one controller for multiple sensors while the others 
drivers are one controller for one sensor, right ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
