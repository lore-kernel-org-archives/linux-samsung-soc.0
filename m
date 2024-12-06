Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623D8C07;
	Fri,  6 Dec 2024 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502553; cv=none; b=fTnJyk0o0QqMqBtTsSEgiHizx/0qmEofCDE3TfZ/zSVhR7EfRzgGN8QjNllIDar+yUfrC28GRWW9oz9r4sMWRq8vekI5xeivgbgSc+BK31oFoI5tUOtI797DaVhAnCooOsCMieRiEdgC0+eMgoh/yAF4drJIHtit+At++TA3epI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502553; c=relaxed/simple;
	bh=XHNXIk9Q9tx1RcxDKk5ge//IEzlU9eXboMCxBeonfTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYys51IQPAzw7Y0GvQPM8kvQazQTRAU81UYHuIHnZ7AfbcP3VI8fQt913625c9tDPk4NF8188+tLllDgimrXytwcGiDF+S6Ko9JB/VOsP7pYYfIMFYcyx51VXlwTi6XhvXGNCnN6LTs5ZdJDGgEVjI2oC42FvpFC+Gh5NAKg19w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il/vbvgS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il/vbvgS"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa560a65fd6so396595666b.0;
        Fri, 06 Dec 2024 08:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733502550; x=1734107350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fhFxr4SRTC9Zxf9sqZGYHRV8vzds5Ebl4ERuSfIh/gI=;
        b=il/vbvgSFEkOSgEyxWiG1AAJl1SyxB4zELjxRGFCP6Rx1zFpJj1QYgWYV+e4YrtLQs
         nDBcyI38XQMFLY9MdKDChafd+wmqVRUPeY1zLm6rCgX7x3t5CyyEpzBVLWcYsfAmHJP8
         mIjOob+DRT3IHdVnakgFS9iyfUqJ5YOTBYfnjFS62yl3RyEMmj4bqL0m9EHkyJygmubG
         lQOyn9JZHsZb2CksvKqjVjX7jLUN1Ng3EgT3AGjn0xHRjL8lvO1rql28xndxkZY9G0kh
         Rn7wINciomTb6zBt+mIcI48wGLlkrRZCLo+uw1HmWAlEWADtp1JJPxE4zfaUxH9D7q4Z
         SRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502550; x=1734107350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhFxr4SRTC9Zxf9sqZGYHRV8vzds5Ebl4ERuSfIh/gI=;
        b=spsV4Eli1z+hwPhHJ2yGqJx+ENHltEBf+dLHmGw9suqT7szEILFL7UHSK6RCKCxU6L
         BBPSp6lYbYn+yC4PoYm/BOFqyUpoAxb6zKJaeylbXtMaP09sT6HMRglY8EA8MQnFFhM+
         R5tQlKTSdlZe9tiX2LDzxCGmoB3nWNc/ZZQykXhdAZ52FtMb0zr5yM/nSc71BeXBSbgH
         zWhzghF/GdbEKNqH+qMsFiKWHYL9qoHMEah3Dv71ikJc5Oi84c+s2zBUc8nOX0xzxVPq
         ryxQJ+BmhDNRDMUl+7gzpnsMlHSQWdPFXQSn3ktxD6cZ4VY+Yerf+CjRKqDj89GiEvDa
         b4uA==
X-Forwarded-Encrypted: i=1; AJvYcCVFgRG2PpWOdr2JxnwU+ZcbdLpBDsE79vEbWBVS6EAuNLEzXotxE4ps5itsQwpsPnwo4Ki0C09NG2jDEr5C/rGkPBQ=@vger.kernel.org, AJvYcCW4c70XPl00+FHjJKHfnxBDxA35WgH1sxW9pq7YpGP3y5tGfNneTDJ/CI2sR5GbgmiU1UtAiAH6LDGs@vger.kernel.org, AJvYcCXCWrPh7aOU/dsOgijvLeAAVYELEHjW8+AathQCvqgzvb00pA/s6TxDX6dId/BHGYoogYhpFpQpmKj0sXjP@vger.kernel.org
X-Gm-Message-State: AOJu0YxV4qvn/YIsPKbbwcHhefn5f3WbtIpKxwKpFW/zArAnineb/SE3
	wxsUAItI1z4aFfIf7+MQPRqjNPKmb5O4+8YeVI9J/tRZaMGwOrpU
X-Gm-Gg: ASbGncvxRC0dJMJ5h8vKHWIP313QH/yrKeBwIR/8gZPpXG7vQOAnyDg0NsIYx5v+zH1
	EhMQhrRsidJ3IeeYoZOpjUnrZA4uz7P/DpmG/K3vC9rEf2cOvsbrfL6R3IbDIWijCG3+hf1z5iF
	LjOI8+0dzG/YpjFQPlrIZKgqIoerLIwtXiLVs85A+uoQDlUg4Z0Ezzldnp6o9QC/KxgMqdBmF+0
	SwdT7zpeEBAV40aiP/ESZz8sYX8TsXTv4bGbT9BvpNQ1YsB8Meh1sTE/RPw6ZXoOZrIci6fF3O3
	AemGPvZ7xVAg6E1mpZxIE0Zhl/Ad
X-Google-Smtp-Source: AGHT+IF86QyycasoUk+ELZ9QbLE4bGmnC9yh+mUscHAIYaOpvP1/1w6LcGQtootw3at/t7O2OP71pw==
X-Received: by 2002:a17:907:60ce:b0:aa6:4a87:3c4 with SMTP id a640c23a62f3a-aa64a8703d1mr22320266b.3.1733502549893;
        Fri, 06 Dec 2024 08:29:09 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62608855bsm261793666b.138.2024.12.06.08.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 08:29:09 -0800 (PST)
Message-ID: <be1bcd99-8a05-4b7f-8546-23cd96071e05@gmail.com>
Date: Fri, 6 Dec 2024 18:29:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 5G (x1s)
Content-Language: en-US
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 igor.belwon@mentallysanemainliners.org
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
 <20241206154149.4271-4-umer.uddin@mentallysanemainliners.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241206154149.4271-4-umer.uddin@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/6/24 17:41, Umer Uddin wrote:
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
> index 948a2c6cb..7dbecd367 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -10,5 +10,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos8895-dreamlte.dtb		\
>  	exynos990-c1s.dtb		\
>  	exynos990-r8s.dtb               \
> +        exynos990-x1s.dtb               \

I noticed that there's spaces instead of tabs to indent the '\' after
exynos990-r8s.dtb, unlike the rest of the entries. This patch also
uses spaces to indent the whole entry. If maintainers are fine with
it, then it's alright, but if there's a v6 you could change it to use
tabs for consistancy's sake.

Rest looks fine to me.

Best regards, Ivo.

>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s.dts b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
> new file mode 100644
> index 000000000..1ae881015
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
> +#include "exynos990-x1s-common.dtsi"
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
> +		      <0x8 0x80000000 0x2 0x7e800000>;
> +	};
> +};

