Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A36D1A8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714031249; cv=none; b=NACk/sYfmLSqJojbfc++tHly9+bt0LTqNELJldQLm2G4NCeUWkrM3EIR/6fFeVZYGqUGM51gMV5mYJykU3pwfUz2jOXuN+kCopGPnneEZFpqZ8LnAp622IJwHcnHEacwXVAgopEc+Bj1fx7sE/FunCkXgcF/F5whtJrTWbP9N5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714031249; c=relaxed/simple;
	bh=qiKGRSHdGdyXnEluj1bfHE3GLYCMmIz+vDxNZnqQIb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWi703S7DhCzMUILTlf8AvOaVkO/p9duZrUX4jvw6wNEWVpwIfjyReoQjxOfusgZTWSJ+y9KqLp+76IgFAa1qGGpIVPudqIj9yuAsPVAQoDTYJEYpmNDb5hr7kyrhINNW+5QH94Y5ivaayuIKETmwvzLZl0lsWU0wjiX0scJSFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6s9EG8u; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6s9EG8u"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34be34b3296so632225f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 00:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714031246; x=1714636046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KO8qMaMD1WGtlgcA7W/Jq2+QozvRzg9eops1qALAJHY=;
        b=V6s9EG8uXmBZDqBecGLqi7qYQbTg6SxWipNyH+mll/EqQfaeKTNK3gJzTOXJgv6hF1
         klppAPqCi9wcOk8p/HryAeDcDPoPHi/cx2vM15ZAYVdyBqNNk6px5sXJg4eqwGhqSUxw
         WE54y7VAYly73ipEsBUNr0WK4uPm+ru4R6GqjGHOAaQ4152EksQsPdLKuviFRb5vKobU
         vQsK+TqE5HAY5aqr2OyfjsFJWsPZyX4qFVAMAp2ios2CO/0Kdwxj6SMShkFh4DUHlbRi
         G9DLCBO1c1zoWN7+7i6ZpHdXKYoS7+CPvCN/zKxySENsGW2p7EVuOvRRK2sZtHITHnEy
         XReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714031246; x=1714636046;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KO8qMaMD1WGtlgcA7W/Jq2+QozvRzg9eops1qALAJHY=;
        b=J1ZRnOVbHgBoMtHOrB6ZFrHYhTbzwXgDDIXelz7uYb5jNwAv+5S2U+86REnMnw38KO
         fyinV9Cx0XbCtCKXKvNa5bfZDvi7TUeJQjvWhfXWh1nO8Z5VD9UvZrWdlp+zWDQreOYV
         8fpRLijK8fwd6E796ScghLXDe+V9df02PAclCHCPto5FRQPaIE58+/FrAqzzjqIDfH5M
         EEhD7/oWVLdQzjWquQkmOj06ePExTs9mSMulXfBYC+VX1youEqBOWXhmzfHHtz3HZrF/
         VdRgRdpsAqbWz3thuPicQFoXkpnixyed5tPU/Xqibjmc+4uWXi7x2phwBl2/C4cr56E9
         Rqkg==
X-Forwarded-Encrypted: i=1; AJvYcCVCLWDHpzbmbCd+YOSqha5nlDbY4JGdwMZJ/U49k2wAwVaKl5Etot9EaIEl9BJtz59nqPBH4Qg3fPSjr96AEcnXWfzduRGmBdtLYLLRgqBM70o=
X-Gm-Message-State: AOJu0Yxd+a2842/F5y+mIdqV6tcwi1pTZCTEAP6+LAfoVYBBGx9mpcKm
	jFGswkeiGHnkPoGU3ie8W9pkVFzyGWR7cSO/WEGSn2KSD9yWN1ePqO+qKnX+7sY=
X-Google-Smtp-Source: AGHT+IHNJWEoIupqYCqnrknBlU5kEwSAVatdxAbl9PzA1MI4fM4js5TgSQnEtljhjy8byIOgYS3ezQ==
X-Received: by 2002:a5d:410e:0:b0:34a:4ad9:a93f with SMTP id l14-20020a5d410e000000b0034a4ad9a93fmr3909203wrp.55.1714031246146;
        Thu, 25 Apr 2024 00:47:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b0034b19cb1531sm9426224wrw.59.2024.04.25.00.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 00:47:25 -0700 (PDT)
Message-ID: <cf7200d3-f60a-446b-b9cc-1f63e3c90740@linaro.org>
Date: Thu, 25 Apr 2024 09:47:23 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] phy: exynos5-usbdrd: use
 exynos_get_pmu_regmap_by_phandle() for PMU regs
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
 <20240423-usb-phy-gs101-v1-2-ebdcb3ac174d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240423-usb-phy-gs101-v1-2-ebdcb3ac174d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2024 19:06, André Draszik wrote:
> Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> security hardening reasons so that they are only write accessible in
> EL3 via an SMC call.
> 
> The Exynos PMU driver handles this transparently when using
> exynos_get_pmu_regmap_by_phandle().
> 
> Switch to using that API to support such SoCs. As this driver now no
> longer depends on mfd syscon remove that header and Kconfig dependency.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/phy/samsung/Kconfig              | 1 -
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index f10afa3d7ff5..bb63fa710803 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -82,7 +82,6 @@ config PHY_EXYNOS5_USBDRD
>  	depends on HAS_IOMEM
>  	depends on USB_DWC3_EXYNOS
>  	select GENERIC_PHY
> -	select MFD_SYSCON
>  	default y
>  	help
>  	  Enable USB DRD PHY support for Exynos 5 SoC series.
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 04171eed5b16..ac208b89f5a6 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -18,9 +18,9 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/mutex.h>
> -#include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/soc/samsung/exynos-pmu.h>
>  #include <linux/soc/samsung/exynos-regs-pmu.h>

This is getting out of hand: shall we expect to convert all the drivers
from generic syscon to Exynos-specific API? What if one driver is some
shared IP, like DWC USB3 controller?

I already commented on Google hwrng driver: I prefer to keep the syscon
API and change the syscon driver to expose proper regmap. IOW, use
generic API syscon_regmap_lookup_by_phandle() and the type of regmap
returned is defined by the provider (so node pointed by phandle).

Best regards,
Krzysztof

