Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C2F290F;
	Sun, 16 Feb 2025 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739699473; cv=none; b=QVab+BfsCmX6Wz/ir0LYf188gzM7ul1c+lrrpszh+Y1Si/XlKuWWhXIINxEsA470XcqbowV4scPhFJ9qUTNAWgIHIVQH2ynzkTzUVdx57lTTNYJnpDQ3M8ae6QHup4BU4cuZJUKurm8rIUPJEWYjju8fEFcQ7OtYfifA4EI3dNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739699473; c=relaxed/simple;
	bh=yISe520NaURNs4pNJO6Yn+iblvFIFY4wu1aWR8VoVSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRfSxY7IIY0YcFoo1Eh1ng5yk0v3jsFM1GvCC9xjLZA8oWMiJtEXJTnciwKxfKYKW3T9ftERy+SUYpZLqheNVSONmNODUji61DkSAjElV/o+eBAer7/RHNgxwRDPagvPg/IBYxWqD4hEZULhenDCy4Jc7m1f+fFZAwjQlenLc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isANc/Px; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isANc/Px"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4396e9ee133so5128435e9.0;
        Sun, 16 Feb 2025 01:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739699470; x=1740304270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKkwKTyg9w786XwSKoYuBYLKS23VVWg1TYbTDYTWNCg=;
        b=isANc/Pxs7mDe2j4V/m4P0bzqGRvUfcp2NFgkudGn9zRUpHOolewz8qOmknoFPuLq1
         ZwOYFShNRv3a7j+jAR5DU4fgv6CrFPHbIc4F8kURYh54o4Y6llyiuMsMJT6LlwZoHqdj
         EdLm/RnRZOCHEhBp6KK2PrSgqBhvgms/0OElajT1VcOCvCuG4irofMTjioe8/qthUv+1
         PIrZBs4/r0HM/pq8k4sxWkH6AH9oXjjoBBJua1VcPjHmOUc2gjPSJP20aqBxdfRm55Qj
         Sxc9kW+2xl8HQHsAYlFEAqVlaz+nPKtKUUajelyxqVfqlmp2/WFSecxf9R/mXK9Gdr3r
         Dvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739699470; x=1740304270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKkwKTyg9w786XwSKoYuBYLKS23VVWg1TYbTDYTWNCg=;
        b=M7xLwg8ffTr2ZutP9L1Xrp0tFZ5onZOmayvXAqRB7254d5gd4Sm24vOftG+senzJNY
         0eDLIG+RINh38sHu0DK+IHAVYjNBegvP/olldCGgj2yP95U0QZhtExSi6JILFimpvVVQ
         vcocuYuRw98+oZ0XbcUT1IrGIBzqO5q3YNs1Ip6o4by52dOak1/XiG5cMKXA7zRIk8aU
         st+iElY2CYSIyFYl1bV42pvEu4ZeNLFY+Wd/STel7nAjgAQ5awp/J9Ky4//3dqw+Weus
         a5UJ8txo5c8rlwRBL5OS470xg6v3GAqZicG57TAvFIbnr5stIYqU61/58qCtyQqbmPk2
         W04w==
X-Forwarded-Encrypted: i=1; AJvYcCXE2i3XPlGgbWdAje3OD23HOEgAhb60OWhQO/k7teV0dup1p0qpn8vbV5fIqw+nSq/dOl7cw9oXTIrr@vger.kernel.org, AJvYcCXe3etdQr28S6E0/rzQdbyQ4bIk8rFrUc7G8LYhXxduhZOjfex5pVBVM2FSepOjFOAmUO6SzAGPj6j14Skm@vger.kernel.org, AJvYcCXukLl+MMvdWnmbH1S0ebgY7p0DYrgceNjhcZSqCG5Z5wdQMCw4Dl+6S1jtIroSVuxiB1TPsiQJUfzCZNuCcMExX6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8o7Awi7BPx2PPQnEyiUk6hUCDshtv7PROohxJMPpnTdtlND1+
	mo6zdUfyXA39dvr0eGO11cBREOmLoYDO0wY51vxoUJ9EebIcOVjh
X-Gm-Gg: ASbGncsUa0XkxER1KYwo2+niz5fPE1swoPozzRyiDE83b7sCfmuQms9H6DW4ZYyqYzr
	IIGPdjGpMzhv/K+k3KwDL3V8EYCn6N2JzZ2glJvnOqVMpqq6azgILPHTSH55x+ESHmy+QXoD71Q
	HjA3IsMWoXNz4phgPIaYZAdZtKIJbzBXaR4y0L12bjVAwa04roy9B7ak/1eIbsOg1UXYZk1G8mK
	uHNSFUOJALGaHGjzZiVIOoUiJ/DEhA3DlZ9Z5rpz1G4b1HpNxL97QX0cW2FgfdWUzGHRJr7aWdx
	o6XyzZZUrZfphUt9Kk3yNZQHx4Q1wnDVawaEKq1C4wSYQBEvxtmQUZiYt1TE+gJEMOgVRA==
X-Google-Smtp-Source: AGHT+IFPiVqkcK4Kd/T3e2U3LKZcUOmyLMjVkbQdDG1jJW67h/Annjc9EhvSTWnD04mKUQYqryGMpA==
X-Received: by 2002:a05:6000:381:b0:38c:2745:2ddb with SMTP id ffacd0b85a97d-38f339d8912mr4723327f8f.2.1739699470216;
        Sun, 16 Feb 2025 01:51:10 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258eb141sm9080681f8f.41.2025.02.16.01.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 01:51:09 -0800 (PST)
Message-ID: <f3d38b63-dc97-482e-aeac-b59e65f91424@gmail.com>
Date: Sun, 16 Feb 2025 11:51:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
 <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
 <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
 <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/16/25 11:44, Krzysztof Kozlowski wrote:
> On 16/02/2025 10:41, Ivaylo Ivanov wrote:
>> On 2/16/25 11:26, Krzysztof Kozlowski wrote:
>>> On 15/02/2025 13:24, Ivaylo Ivanov wrote:
>>>> The Exynos2200 SoC uses Synopsis eUSB2 PHY for USB 2.0. Add a new
>>>> driver for it.
>>>>
>>>> eUSB2 on Exynos SoCs is usually paired alongside a USB PHY controller.
>>>> Currently the driver is modelled to take and enable/disable the usb phy
>>>> controller when needed.
>>>>
>>>> The driver is based on information from downstream drivers.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  drivers/phy/samsung/Kconfig                   |  13 +
>>>>  drivers/phy/samsung/Makefile                  |   1 +
>>>>  .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
>>>>  3 files changed, 365 insertions(+)
>>>>  create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
>>>>
>>>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>>>> index e2330b089..f62285254 100644
>>>> --- a/drivers/phy/samsung/Kconfig
>>>> +++ b/drivers/phy/samsung/Kconfig
>>>> @@ -77,6 +77,19 @@ config PHY_S5PV210_USB2
>>>>  	  particular SoC is compiled in the driver. In case of S5PV210 two phys
>>>>  	  are available - device and host.
>>>>  
>>>> +config PHY_EXYNOS2200_SNPS_EUSB2
>>>> +	tristate "Exynos2200 eUSB 2.0 PHY driver"
>>>> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>>> +	depends on HAS_IOMEM
>>>> +	depends on USB_DWC3_EXYNOS
>>> How does it depend? What are you using from DWC3?
>> Can drop, I guess.
>>
>>>> +	select GENERIC_PHY
>>>> +	select MFD_SYSCON
>>> Where do you use it?
>> Remained from USBCON driver.
>>
>>>> +	default y
>>>> +	help
>>>> +	  Enable USBCON PHY support for Exynos2200 SoC.
>>>> +	  This driver provides PHY interface for eUSB 2.0 controller
>>>> +	  present on Exynos5 SoC series.
>>>> +
>>>>  config PHY_EXYNOS5_USBDRD
>>>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>>> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
>>>> index fea1f96d0..90b84c7fc 100644
>>>> --- a/drivers/phy/samsung/Makefile
>>>> +++ b/drivers/phy/samsung/Makefile
>>>> @@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
>>>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>>>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>>>>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>>>> +obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
>>> Entire driver looks like repeating existing qcom-snps-eusb2.
>> It's the same IP, but implemented differently on a different platform. At
>> the very least, the register layout is different.
>
> I checked few registers, looked very the same. Same blocks from synopsys
> have the common register layouts.

I see.

>
>>>  You need to
>>> integrate the changes, not create duplicated driver.
>> I can do that, but it would be come a bit cluttered, won't it? Depends on
>> if we want to follow the current oem-provided initialization sequence, or
>> try and fully reuse what we have in there.
>
> I think it duplicates a lot, so it won't be clutter. We have many
> drivers having common code and per-variant ops.

So the approach to take here is to make a common driver?

What about the current modelling scheme, as-in taking the phandle to
the usbcon phy and handling it?

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof

