Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AA435E548
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555433; cv=none; b=f+0RlKs17ro2VbqKjanPPT/eU3tMHp14Dt6aKcuzshWK4pWtzBNhMQdXYlN6NRgLDyzLlaKGAYY8+XCl97YoHEj7nc/q7PXdKq46Kxc2LnQifHZ5BxHH1Vm9fiixUZeypW+85wHnjuPTSfWhmkk+WBwVb9EjvZDCMxYqPioPZRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555433; c=relaxed/simple;
	bh=kXPjrkL1yFxBo0v4ux0Of/j01hMOeLRVISHZiR1+1yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrEKAr52BIXkICdHWIRJIUwb4JcCjn9LXqNG/iehRjPHxqDWUwGpbbdiwCvK7B7zQxrDbB0jaF094s6UiDmuk2kPMJZThrSHncB3jgNq8UAebxjO9WXmhLL3u0VyG/D6Cq7vttdxEu90+zA4Q9yCoEigGX1SiL1Ivgkq6UTajRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bnfSHyM7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bnfSHyM7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso46646565e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 04:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763555428; x=1764160228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ANuLCsNtCUF8tPoNyJV9ss6Pl4S7P3c/OwbemWzc+jQ=;
        b=bnfSHyM77VNkMvXIqgyNMIdSQHUWytulsBEYKYMSkui+KSV9JdE/I6xCNDRLVocKAq
         nfOqx2J6gtidiDJKKtkp8iGNvBzQYdw7K3RXqgBrxXwM1kRu4tPUK1QC4FEO5KXOkDii
         e9/vI9dul7hoizGWEFNQ3zYEyXJscJlWcueXwHelunGg5KAm7XnjLpYJJY/0/nwQxuUH
         cRCG6T9JvcjhHNJwk9bvX8yp6B8fu+/DpkEkmVSVI9aNZbFZRvoLFyPrIaYc+VhSb/Wb
         XX1crldlApuD4hUyn6gljbWsWom9wGWtMHoDwT4igBL1XjRt0FYwCrEys2ewHxUAR1Tg
         xdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555428; x=1764160228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANuLCsNtCUF8tPoNyJV9ss6Pl4S7P3c/OwbemWzc+jQ=;
        b=IQ48EkAnDTYumiMlsr5uwWluaBOs9qp3odG5shW+E4W9HpEaFXVcgxHksZh+VSBmRt
         Bt3PATqBsmjfXYsIfiuAAsmUbctza72c2ncnkEINgbthF3M0673zc7At4Gs5dpq03J2X
         J+mvuc62j7zhdqWeFPjTPqyYOebeDfzbeeQfrTBZ9IwrpvA7JIVLR1kteHLk/0nN+Eh0
         iIiaiLjdFKGCL0mvLqUqPAFBNSvrBQkVuf4lGBmG8wuO4FeFfF/tVZWskFbrlNsia9S3
         nfFaBey/86NAUtlwGW+EO942XvN+r2kcYUuJq3u3KFDsnm4vEXBG5oiy9ZSW2otV4j4a
         vpiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUTPg95EEOwcgGpXGnpl8gxWND5zrB+VeEaHYGi2Kg//siZ/6tCcPwwgLu44nEWX6lwEagE7C0xi6A7tXzq2gqDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVyGx2xq3PMQOaoic5Lt8Mplf+g4IagzHIaAdtiSxEuGn8ErAI
	tmjTJ+68+B7OOFYInD9iHlEdGMrrG/+4gYJkRcTI+PTK62phFDhqK8Z1aly73GDbyUw=
X-Gm-Gg: ASbGnctOp2kdrfgsCzMBecyHV19b0ypbcrzh49VX1L0jTvBE95JjoWJvkzw4i5ZB7/p
	X6QaalmA8aY2W3o8md0ThQpSgVX6qsYPOG5E+DfA7b0q4iSfY3QNVCWE1Pne4Xa1/VHOsVy0wUr
	sjK7RdyqAnOswNwzvXOpeuvZPYR6J+SCibiB8+EBhlkzmDYSxEhJ0fXFiuh+VsDG8qD9LTW72QM
	JSw0DUg1IjGXiCLEUd7sUMISiyhltpio1WjpTJQhOKJKUtfsayHt0+M/rCHbS1give1yb/484J1
	vJCDRRSBPF77geV6aziGo2fl7Y2vSnA+OhgrkfPTcjI+5MpmSMjpqD3Cp/KBH/CLoJewW1NRQkp
	wuTA4E6IpOTvBwQAjl1eIzlGBGV9QroGFS1EAogswRpngdnvxFR9PhWMFzwWaFYER0+OikUDP15
	tpGo3utLDfwP1K1g9igLMaaEqQu98=
X-Google-Smtp-Source: AGHT+IHqhbbvVZExNtwvyM5VtD1QzsNi1upkWPblMC3uEuvom1Rb/Pq0EdVbzlawrXFh3afQBP4jgw==
X-Received: by 2002:a05:600c:19cc:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-477b19e248cmr19240965e9.29.1763555427738;
        Wed, 19 Nov 2025 04:30:27 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477afb54774sm23714085e9.3.2025.11.19.04.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 04:30:27 -0800 (PST)
Message-ID: <4a94884d-ffc1-45b7-b014-65f9724a820a@linaro.org>
Date: Wed, 19 Nov 2025 14:30:24 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
 <20251118-gs101-chipid-v2-3-e9f1e7460e35@linaro.org>
 <e25b9f14-b583-434d-ac4f-364b962f0ed1@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e25b9f14-b583-434d-ac4f-364b962f0ed1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/25 2:13 PM, Krzysztof Kozlowski wrote:
> On 18/11/2025 14:56, Tudor Ambarus wrote:
>> Simplify the unwinding of the soc device by using a devm action.
>> Add the action before the exynos_asv_init() to avoid an explicit call
>> to soc_device_unregister().
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-chipid.c | 27 +++++++++++----------------
> 
> Can I take the cleanups before new GS support?

Fine by me. I'll send v3 then, to have the cleanups first.> 
> That's btw preferred order for all work. Fixes should be independent or
> first in the patchset. Then cleanups before features/new support.
I agree for the fixes. In the past I used to do the cleanups before new
support, and I got feedback that the cleanups might delay the integration
of the new support. I'm okay with both approaches, v3 will come.

Thanks,
ta
