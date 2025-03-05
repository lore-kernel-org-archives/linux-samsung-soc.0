Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5BF25A2C3
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211017; cv=none; b=U9TpEUW1UXf0OwFx/GrdrbLRqgNlZ8UQoeYmXGTtxdlFOprhH09hYcYrsz9Hcg5jdGvOHHWJHIcWcELt+TFhiuyIou7bUg6LP+xZJgGH63wHUAoCM8BWI22zAeB7B9Q9HB2lCNGweAG71gjDZ6P/xGqVnPxkku5LTkf3pFTYASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211017; c=relaxed/simple;
	bh=A0mXERdTPT+J3QrOhWFdLrvm/T0FFreOwek74H3AIyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCHsOOjNTWtlC+mNbNhZrEZ/lEaKBbI9gXK7/p22sa7v8+sOdxZXln9kqQeYy6pH9EXZAO+LEJ/Lu8PX41Aa9VH1zAaEJN9fNUoW9whE0VyJ+1d+nHjemF44kbkkL5z9GRDUXCns0TE4vptSJ2mAo7bsVckiNshGjZVtv5/+p+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a47pEFKH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a47pEFKH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bc21f831bso3951405e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 13:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211014; x=1741815814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wnuSDIhdx9q4u4ea2GT9aTgUR+DURbh9gXiW1kwt0oY=;
        b=a47pEFKHe+Yok35pwoMrvGk3n9iqWTI8H6NPPDH+S/74MD8E3sIu1fVr9Uh+by50oi
         7pYdpSOxIP+Yog/GKin5PI8IpeZV2d2fIocr5J5XFgJAUe1zlFZf40jVh3QRyWUI+4zn
         TjJo3hDhNw0k2o4MsVcKSGxJXHt1644pEGzQIAw8Q14p+5LX0/pyQ9ST+epYel3wZY/D
         FRYHgxTaSjP3ZldujEq4+sJx2NAQ1pUOGu1NJ8V/s3DiqDDNzo1+S2AFdrklaVZzwWF2
         AxOH9kwR8zDONvcyEGFyXoWZn4/ywqNsNqjwCkRrV+plkiyupnY5LVTLOVqGMOVFd/Hv
         MTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211014; x=1741815814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnuSDIhdx9q4u4ea2GT9aTgUR+DURbh9gXiW1kwt0oY=;
        b=w8zBD1k6OqRz9dUZekrf8hYs0S8NLmR1hhkTaFT4foeeLMud+Skan7QUZ37W4RT/OE
         YXVPpjg0b7/a6AHNvLsqH8b1eLBmA3eiYAjmD80e1cSGIIXRNRUofnTYdrqiSA1FktQe
         FohXilg6dVmKgc69B/gheOL4/JF8/ekZhLdFXGP05F2FmndX60QKaGbpDu6qW43m/OZK
         XjJqpom5HK4U+jn1PbYtry1ghn5Szmi/vs67XCuHP0YcSBwKt2s8/gspz9fIhxUA2UNd
         +/R1QI/cAuJ2namp15Th/30UzRn2ummuwbU+ONhWuVdeUSjVAB+lUVD8d9OX18KnkrpH
         +7cQ==
X-Gm-Message-State: AOJu0YzPLJxw+CUoPIW+c5MUTX06WXJkEr1QolmyTY9MMGK4WxdO08mR
	Psxvo9QPzxP4lHKVEonwW8iMGi8fmRJu6nl91hB2MJKzwJlKX5mrA7zyzm0rANY=
X-Gm-Gg: ASbGncvJX09hM8m45WUTEHOJng8JM6NgAO2Y8N05qBD41rgRBmFZ6Gd7oxpq53UAvXK
	KeCxXZKXN8JAmzYonYvvLRHENyB2Kq5ke20APTmKITn3gxOryAd9Mp1Y7oUY/ElyjKMblfr6iIK
	CA9/bINz1AtF4DXGQBOKHTz+7xau/ULsacKouwHLUXyzf9PDTy0nvEGpWGAITPw+r9JWZ4Ao6aN
	mhcjB4Oos1Nd7NFIhIOpIP0kWr17UtIXkh7Ej6EX/OKQUyC0Cdkr8Eo1y1A0P1taugHL1nCGWEA
	mCcHmlZLttvsrP3CYAKh1RZosCgggpoBeH/0z4Gib3/mQrQNnrfwRFMsnRhPfw1q
X-Google-Smtp-Source: AGHT+IFTRhoadsRhvhzPZMsjeOlJxQcH+ODbUFB0KQURKtxHX7crNHnSBHgTDlv6V/4yM7NXfZlnJA==
X-Received: by 2002:a05:6000:4026:b0:38f:2ad4:6b1b with SMTP id ffacd0b85a97d-3911f7cba35mr1471411f8f.13.1741211013625;
        Wed, 05 Mar 2025 13:43:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796522sm22309061f8f.11.2025.03.05.13.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 13:43:33 -0800 (PST)
Message-ID: <d54262ca-2229-4230-bd2d-6d9efa7257a4@linaro.org>
Date: Wed, 5 Mar 2025 22:43:31 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] clk: samsung: Use platform_driver_probe() to avoid
 __refdata
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250305-clk-samsung-ref-init-data-v1-0-cd144b4fe31f@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-cd144b4fe31f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2025 22:42, Krzysztof Kozlowski wrote:
> RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
> and it caused weird oopses which even KASAN did not narrow. Probably
> because of multiple exynos5-subcmu devices?
> 
> Switch registering platform driver to platform_driver_probe(), so the
> 'struct platform_driver' can be properly discarded after init and there
> won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.
> 
> The change requires using subsys_initcall instead of core_initcall,
> because no device drivers would bound in the latter, as required by
> platform_driver_probe().

Forgot to set prefix and I aborted this send. Please ignore, new posting
coming.

Best regards,
Krzysztof
