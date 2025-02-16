Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C315383D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2025 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739706328; cv=none; b=SZTw8QJttBTXIdHWD0AVAJM+krZO0vDAtacy6kOFurQVGRJhkfAEcoE/G2JBbCod0lKnEtzKs6zPMbhm7Q2KjmrwuN2wToVflWd1dbVgIspKlx4MQLrrxxi+M9mAAhPdR1oAwFanEQiasu3sgeMPok+j6+8R5vLXpPWykksuLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739706328; c=relaxed/simple;
	bh=M2c4L8ULhYmZG7tSGY2a/ETvtRPq1d/mkUs8FNv4XlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbQ7n/1vpJy+mysmD7sW2FnftCoac0cAnho8xk1ZZu20C89Cu2CjXnnX1Ou7g90gvQvM87TrDTV74jzMp5oid0b2rxmlrsoPG9C7ovsvyUnOOIG8Yfs3nC4gD8aJWs9Mf3cvzmAohN5NSm6XWy7xgvXy6KGCxCd3gyDe3NzYQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTT6r8MC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTT6r8MC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dc050e6a9dso666546a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2025 03:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739706324; x=1740311124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0FDJ8ZAosIgJMDHyRhgR/+IbzksVeeI6dYKzBIqtwZE=;
        b=JTT6r8MCVRphE6bOPdtpfBNn/2zgQhhpaX6+IkL454biaTGbkWJQXnRvE0l3yuhsdA
         u8BIwHA7CCXTKRlVOJgb/wmPcb9UPGXzgKl1Tud6zkG8U8d2b5fGoPiuifYq4K1D7nWm
         KlYvBQPEcAQoHt2P/L8T2yWMpZXveCwtR0sLadVQyiACqqPXozDcGFQ/nSSpXpddqMUN
         vgemvpTZ4fG9oG+Q7gGfnv7/lJA8n1texhOKS6dz1bYTLitMEqdG+8sFOZ/IwsMnRAnt
         4oBAa7M8Nq99HUX7qg9Mf0xCy7kA0yfiO/UCm2GGv8rHzlRCp2hApQgIBHxzr8h8d6Mc
         6/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739706324; x=1740311124;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FDJ8ZAosIgJMDHyRhgR/+IbzksVeeI6dYKzBIqtwZE=;
        b=wAyJ1sPAahhHbkgzlE7EzQVXR8U1Omntk7MqtubJL0ynNt3nGX1zglx2ySu8bgAGGT
         PIviQZ/GWS9CmTYIHjzhpB8Lx+jbHwrL0OelLETw0JwLUtwfHQx+aUi132USR2U5Q85A
         Rj+9izPXrAApxF1lyshwAfcJDO36YFIuP48GcO6fVuTzFOJU1Oy4GkMprf+Kh2R12pee
         M1A9/+aCNmybmnuOYYzboBBKW8pkXfijikMznpviDp/pJk89ZUNNnwNTZKhkEU6ouxjK
         neCJDs6ZZ1oHtITZ8eKxRmLY2fpR67Af3W3gUwMFcgg84q/RGdd2jdZn4ujgFXp3d+5B
         viKw==
X-Forwarded-Encrypted: i=1; AJvYcCUtfH9aGXfPc7FW3pbaa7Ry9Yy48x/ivUXGLn3dQSDskH19NnEOCI/wmuetmvFtRPj+L8rceL/MksUQ5SFgtfK3Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNQOU4RwwX51NG/K8TlMnS3h1u5AlYsxQ9rsOwM2GIG4SjbYfV
	FyuTaCfERCD4tkcb3CCMlMeehg1w3zcJgMPgb2ygs9BUwHq1mG5Qso6JCb1Cohc=
X-Gm-Gg: ASbGnctleEFNQhEi3AM7WzdXmkP2cbtn2ifYLUCCfiFs7vTvkb0g2oYvXujQhOZ4JKk
	kuS1lXUBnG5z5TSsxsScQCZ2cE4SAf+Z/oaItRdZFVZKGKvafWgwxQaI7PkKC1BxJcAI2yqIoLZ
	/LwZhvo78lzIl+C/uqCKJ9EGK9QywDGKIilnebuW9n6N2Icz5sKrF1ckR42rWSN5eb81v+voU+C
	PP79z2kMTLA/qkHOnDNEIPfIqPJfYEluRl5VnMSBXPIspSerExbnj6DSChx6XZg2RCiy9CoQkL9
	22EI17SjJpFgsxDVw500Akev6DFj4qBv1mE=
X-Google-Smtp-Source: AGHT+IFyJBEbNKKiH7hvBmMsBfMZcW56f4DRp53Of4ItbGHoakD53OsGw79hZ5TnMUnxgOOJX1AUfw==
X-Received: by 2002:a05:6402:2793:b0:5de:b956:a749 with SMTP id 4fb4d7f45d1cf-5e03602c7abmr2341246a12.3.1739706324518;
        Sun, 16 Feb 2025 03:45:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c416asm5765041a12.18.2025.02.16.03.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 03:45:23 -0800 (PST)
Message-ID: <63c0557d-1438-42e1-9edb-7b5a00ad7cee@linaro.org>
Date: Sun, 16 Feb 2025 12:45:20 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Fix broken USB on Exynos5422
 (TYPEC dependency)
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
References: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2025 12:41, Krzysztof Kozlowski wrote:
> +
>  config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>  	depends on HAS_IOMEM
> -	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
>  	depends on USB_DWC3_EXYNOS
> +	depends on PHY_EXYNOS5_USBDRD_TYPEC

This probably should be COMPILE_TEST to preserve previous compile
testing options on !ARCH_EXYNOS

Best regards,
Krzysztof
