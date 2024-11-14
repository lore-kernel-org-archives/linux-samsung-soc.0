Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5CE573;
	Thu, 14 Nov 2024 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731575399; cv=none; b=VjF0UIxsL0ZToSqDsig2QZQYCQsxD/5jqAYdDHja1vEh0m0/cOgey4mk9hc6UNU9gj4BV1NTPoYrj5ESf+GI8R69tmNk6mOtr2iOw1nZNIEVDvRQO3ZlQ8J5e3Png9GSLSG7QWqEqzjrtnlcH8wxOt/UDdgltlhSPNL4Cyo6dm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731575399; c=relaxed/simple;
	bh=No/4crTTpv6QPHBfpWl377ww/4W0f7VyAOTCbN9ZKDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGJvzeO35F9TLSQlQDgyrhT1Ape0rN//ozxRhOeuAV5pR5Q486FvzV1EItScpqCQPlYs8nMl+NFB7qysfhDL8WTuEW76qi7Jixgwt7AE2qq2eW87hniZD818Jveuc8pUYZA+QkXCWW311xXa1o2zM0YctwrhnMUfIBKxLj4aGfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAhbjdmB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAhbjdmB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa2099efdc3so101076166b.1;
        Thu, 14 Nov 2024 01:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731575395; x=1732180195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SIgMw3kcbX2cViYwKLxSrOgXx4G3278BNEqwDErsN4w=;
        b=DAhbjdmB+DvnWdzxv0nDdLEm1pe1KVVHDyXKM+RN0zWq5lFi0PfCbpTHnv0Nd4tuDa
         hR3OWPy68FinpP3GIKp/G5M36rGbkqxqMGLxZLjfeH1GEqeYq3JB9lrAyDFrSa4s1A+X
         1iGJ4Rj6EVwB+smkRgyopKcwbhqmovomLFYJZc1G/d0JFgrncMmbyccBCXiFlqFHjXRU
         FO5LuLgNEXax3wVTPDxR7wiaDlJYcm6SRebfrBYTZS7r2MT1wsmhcN3ShHZKaAcQrfRm
         BW28J9olZvcOl8OIkKZcafph0vI0soOH3blxLLhQP76sojqtVEFmfylc4PihCDNPoPBT
         lImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575395; x=1732180195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIgMw3kcbX2cViYwKLxSrOgXx4G3278BNEqwDErsN4w=;
        b=hD7IqIP6ccvU7BRmfOE7pvgzxd8vnpynKKldr5KqsY4lnLrXZ3QaC+5907kA2yrcNt
         hx3z1BFNNXTU2anL88Mz8wgx8E6/Qjj96fA6dUY2H0jUWj+H1ikjCgjdPlhuLYqYGpY+
         CnCX5D2K+9K5Ye8kr6gOsiLxsxFFFGpBDGZBWeaA0KKJXa+sADmJLt7p4ChvGe5q9SOK
         wBeyiIZEoH19//y8wQgYV8vPZ+hLfU31oZ6vNetuISNH0mZxoxzZ5CLFbvQHzwFbWGa6
         fAol/3TfIiDsGG277H4X9T03AdGm0Oo+1znxjHOfqjbkMlm9BPagX10v9E62dq3sw0dr
         539g==
X-Forwarded-Encrypted: i=1; AJvYcCV0NLwSCiyG2F9OKeaTwbtvqOIk47FuySyHIpVGEpizHMCgThc5fvdajGQKAQ85o/DkPmErQFUsRxHD7ANVAgcQajM=@vger.kernel.org, AJvYcCWC4hpwEcjOC1jFoOg9owpMxVVHjg2ItTranXr8jGYqrVJIgZiYXKidbgNZevZq0xi5disQZv8i5vWf@vger.kernel.org, AJvYcCXMYrADAaxelKm7W7NQqS/RG6ixtxXUSIqKiV4BjvbuC8BRib2J5tasoLOsSbLZ3X8Vi70ibe63odXRPG7Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxMAyKIJZhul0CitfZmE65LDJAykyEkTTHJlmSIg2CioO++sz6L
	QfIlsSxaQyezQm6LmA/QCtLO6XP9ONHUSLsUKx8Bk7x3YriRl6PX
X-Google-Smtp-Source: AGHT+IGBteVNoQuoY0Pbzb5nv37xUTx0G4wOdBXfGdk3MfgzzCLnRqq/tgiDnAX34GMPq6sktjArJw==
X-Received: by 2002:a17:907:6d02:b0:a9d:e1cf:b9d3 with SMTP id a640c23a62f3a-aa2076872cfmr223889266b.12.1731575395339;
        Thu, 14 Nov 2024 01:09:55 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df507ebsm39140366b.47.2024.11.14.01.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 01:09:54 -0800 (PST)
Message-ID: <9f48459e-f381-446a-86bf-c8d1bb8858bc@gmail.com>
Date: Thu, 14 Nov 2024 11:09:53 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 5G (x1s)
Content-Language: en-US
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 igor.belwon@mentallysanemainliners.org
References: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
 <20241030232308.72210-4-umer.uddin@mentallysanemainliners.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241030232308.72210-4-umer.uddin@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 10/31/24 01:23, Umer Uddin wrote:
> Add initial support for the Samsung Galaxy S20 5G (x1s/SM-G981B)
> phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
> has only one configuration with 12GB of RAM and 128GB of UFS 3.0 storage.
>
> This device tree adds support for the following:
>
> - SimpleFB
> - 12GB RAM
> - Buttons
>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  arch/arm64/boot/dts/exynos/Makefile          |  1 +
>  arch/arm64/boot/dts/exynos/exynos990-x1s.dts | 28 ++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 7a934499b..deb8dc509 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
>  	exynos990-c1s.dtb		\
> +	exynos990-x1s.dtb		\
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s.dts b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
> new file mode 100644
> index 000000000..162961446
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S20 5G (x1s/SM-G981B) device tree source
> + *
> + * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos990-hubble-common.dtsi"
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	model = "Samsung Galaxy S20 5G";
> +	compatible = "samsung,x1s", "samsung,exynos990";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x3ab00000>,
> +		      /* Memory hole */
> +		      <0x0 0xc1200000 0x0 0x1ee00000>,
> +		      /* Memory hole */
> +		      <0x0 0xe1900000 0x0 0x1e700000>,
> +		      /* Memory hole */

The space from 0x100000000 to 0x880000000 isn't a hole in the memory
though, is it? 0x880000000 is in the 64 bit address space.

Best regards, Ivo.

> +		      <0x8 0x80000000 0x2 0x7e800000>;
> +	};
> +};

