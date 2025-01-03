Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83791CD1FB
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jan 2025 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735894000; cv=none; b=jQUg5LCEE4E2kf1VikOB5rcYXyuj8YWW7V5BsO57/K7c8K1rXhVtWoAVubtX8j88Juht3mzSWDWea6gU97Eg2hfMtmYKp0bWhPszObtiMK8KTSNgSOJuXqi9Bobw/u8GAkmMMJQpP81TemhbPvqABFL2UBAsKilbl4j30frMay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735894000; c=relaxed/simple;
	bh=O+EAGVQHC9pWEgyYom/lJW4JcUi14Rb7WDSu5s1H+wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h3eExlDBxcZGpwSRhAns4ZOT7FZO8J/cV0gG2ukwdHkyhd+xXiWTRwRXsn9Kvp9tfY4zLQ7bMB9fPpYO+x28FygZTyNll4aUTSMgkB+cte+WKzqtl+C71hE5Ttk+FO1afM1dwaUcR5EdkV7UJ6JEpJRFXiKbtJaKpE16xex/Ow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B4RD6cMg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4RD6cMg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso21108182a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2025 00:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735893997; x=1736498797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KLCC6CLZQeihBKxyImt/0LORJzTXRC0Daw+prTUMzI=;
        b=B4RD6cMgsd2xMhA4EtaZuu2FuyHcpdvqneMO5zt8nUNWqXOjwDlnCWsLNGfP+WwKGP
         1GH+iFS++4zjRl9Tj+WdDGXnsMQp00UsKI9oNHMnk7ntsjGkgZ3cmA3jkJH2Csj9F7GL
         9P7I5NoPUTXHPzNmqVzU4HvY1X6f5fKmg7tW98XPZXe6RLgtiSpWGxPu4I9hEYFzhRGK
         3ts36+H2TVzLZLOnYKIIxc/5eDgPwiiJA2YTvPutet+BhaIJOxcQg9OntFuPQVXYDR8C
         1hJDgbxVBwN+ce8PqcC21vIh9w4ewsvWmN1rm5L5vLHGwZ0IyKeKdNlhol/7T5u4UaQK
         zpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735893997; x=1736498797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KLCC6CLZQeihBKxyImt/0LORJzTXRC0Daw+prTUMzI=;
        b=G3iEAdk2rcB52kCZcsC+G/3Z5vKEf+JvlH0BvobmqpNTidWeLKv1bfZukia8fZWRVG
         BkVoMFdOougnWFjw/PihyLj6fQ4EhpBEmPtNhXetB4i5XTL7H7eR3Iy63A6A7oqyfh6y
         s+AEGjIp7Ab6gI5EMRz0pygA83feMjsj8Z1M1pKIovT5ZnuN4IzGuQDjYcbA8qHTXtNy
         UoWihU9Iq4fO7Hu/ocwba8MOWn2ybr77G8v6eugmo6rc5KY6e7zKMg1pcUzojQLsxX7a
         chWhFDSP3nBBpMw9mjU4IdleNdJXfV8U9zqs3N10qMkzcphafUVJqGnzmc+wKUusODwC
         iSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEOrZ43Rboh61uG4l3uLd3jEQMEZT0aGjdwKGJcxxkXfzIB4aaXUFTvKrdVf0LeK6VsY8TCUR9cHqszQ/BZFtn4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyhxLMCD8AYWEo875aGvpASS7L2tO7UBXROGWz/gUaDxhiv1iP
	/SPu/7U4ArtovPjP3zYGQ42zJeBkOtTRw4tDL6SqeWEZ/T2e3p25AZ8uHMvmBNMODlIURMe5JJL
	q
X-Gm-Gg: ASbGnct6y/fudUsquk/cOBSjuFaxysfuE9KAI/Su9YSsfbBLT3nYAsXQTVDIu0ORaFO
	0l0bKHhbKkrURRssgANvL83gwHA1wk2EFj0MOKSbeuIjvrvAbZxjVcTdQJ0EoczaB83U/z0HY7N
	iaiSFOZ11NSeEwY9wOTE1VPhGQUnRkRguk+tewWq2eoeZdAv1ryNUJEMk59AwxnvLIypCgyOAkh
	3glvpHYE+CKnfcbO9Xl7Vb90fL2VIFpeK1ustytskmgof8TD2oRY6W9NuKAv9h/
X-Google-Smtp-Source: AGHT+IEcs3R944zYh9ReswLIXPTV3wRvlLj0KFBEAD5OyqwmCdtx2diikm4O85f1161OsuoDmNRPMw==
X-Received: by 2002:a05:6402:3510:b0:5d0:96a:aa90 with SMTP id 4fb4d7f45d1cf-5d81e8f3832mr38382049a12.17.1735893996986;
        Fri, 03 Jan 2025 00:46:36 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701c8c2sm18984792a12.84.2025.01.03.00.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 00:46:36 -0800 (PST)
Message-ID: <df9c9c22-b3f2-4665-800d-d6d085d580ef@linaro.org>
Date: Fri, 3 Jan 2025 08:46:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible
 samsung,mode values
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/3/25 8:25 AM, Krzysztof Kozlowski wrote:
> "samsung,mode" property defines the desired mode of the serial engine
> (e.g. I2C or SPI) and only few values are allowed/used by Linux driver.
> 
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index f80fcbc3128b..5b046932fbc3 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -64,6 +64,7 @@ properties:
>  
>    samsung,mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
>      description:
>        Selects USI function (which serial protocol to use). Refer to
>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
