Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1150290F;
	Sun, 16 Feb 2025 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698887; cv=none; b=c7c3paie/5l1Wbt4zXlvGnaEzzoPTJO+/JBWz85eK1//MNt0p9AUVOb31IBP6+NfSpLn4sqZCXolFqKmfGeG1z6iTZ3wWU5DuOQgFA8MmQb08kia/YeoeuIvIvnN4FQQA2DY72qK3Wu6FDhwiM/sECB4f8C2EGe0X2+OhTtlkzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698887; c=relaxed/simple;
	bh=E8PpzKQBTIHLCdeHuS3m7W0qOJeKRwaOcsIaKNMYCnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcbiXwvFlovmeO/aKXtavk2Cac1A98wTCFURXWYYqqfP8hJh5aUKjiqdsRKhWyv5YIhO+NCnazLS3dUMDYwuEL24AuwEuBvz6rda03rOJwGrVZoKS+pfkPyy5M8jF3shkKJiXFggHX6sNLFi8eb8N5iD/R1YQLDbQxdGshioGmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTBo6N+e; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTBo6N+e"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f2b7ce2e5so1150581f8f.2;
        Sun, 16 Feb 2025 01:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739698884; x=1740303684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5A6h6iCJneZy4mP9pZb+hu2qmd2HY0brexOCwmkBrQ=;
        b=fTBo6N+eOxMzBfPwRIGk79vi1cOJMh49wuFF3XuoMcDFEfrZ7iuqnpBQk0+hJdLViS
         n646loIE3TEnMWAP+4oEBoK7NfQPX2S7uk0ajSQsAxzm89XIkw+g9MZ58fuUZBPpGNYr
         rWEG6kb4lsrutspi60aD7qqIW1/FInVHbyskG2iBJHQ3/PgtyKOm/lldU4cFJSTEEoKK
         4DWxsdBgftGyqwVM1khSYw29oFgciNS3z0Z2weTtswvx4+XgARaiyGPGT1stuHm0zS3t
         vKBdsZP/ntco93TfObk4nucmE/tZMOUG+ANoueEPzJp6chw03JPb/GFWcGKgaFdtrudt
         mOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739698884; x=1740303684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5A6h6iCJneZy4mP9pZb+hu2qmd2HY0brexOCwmkBrQ=;
        b=WUG8jspmc6/tOoBQpbjg32hqIfTIaY3OrobENyWYA6dhAdqBisW7vSDp+wzdxBWIQa
         6lSN/3NcxWKJ5CTqUII0fif6nJsuSQR7hVo/xKCShJ19OXml7seujHOuvYYtkzadTXbO
         dZOwreN94PMvecepscV0m+yvquZvxB4Lufcpd/ak5qfGHDreqnubSU1SSKZhJ/mqlVfA
         HvBgWlx1LPJ1ZCzGDwDvZLOYRuPi9K04xQQRSjjqLvdOjvzbKx0W1LCivKX6tZGAGNZD
         abxaYz1ZRasIOwztC6BIBi3Y5pGdR3BAXyBx9s0whUIeepW3rP+udQ54yB7qR1cpCCWE
         04CA==
X-Forwarded-Encrypted: i=1; AJvYcCUKw5V8J5wvgU96OSXAtBVgIiu2DOkI2fpURF0+HUbOgtpTZrGuKFzjR4tKDy6/Ss0LKZH+4FEWuIMA9aCx3S4ge78=@vger.kernel.org, AJvYcCVu1CsBWIFVJP/c4tQi7dLeAoCdkHAuEee88b7e/oWJmMxQsyp3pye/YRY+MYeXSxZ3+aMAzNpRdoxm@vger.kernel.org, AJvYcCXZMFIFlNKo0ARODqgQEN799iz7pz7eFRQ7GhxqILQaHXUo4exr+ZFRLo0W1lC6TXxaaQmQ3GmhxTtkNVF9@vger.kernel.org
X-Gm-Message-State: AOJu0YxNxjPGHDbE8/qDq3rcnD5hb373DUu+BA+AvrS8JbRRSu5dEX9w
	8zl0iJACyDJXLW9STH2d6i7iiXT10j01JY7o2AHnIWjszrD1Av9v
X-Gm-Gg: ASbGncu5dBhGDQUEo768bFnXf8wkrIQo/0pdmTR/otum7ko9S4FZkWAUc3WtqJPq/s+
	Q1vZtpthssZ7cBT6ahnrfQU7C/4UnvLJZse08osblyRYhKbjsHN60eC+WwlMkvEK71A1f7SgPpM
	rcpPG67mS2sxE+dzRgb1w0dD/gvg0Whib93tR+5QpghGy5S4hvxA6YLil5B16WYeySuxG+AoiwM
	j6fkRLdV9UvA40x6lnz1silaaOFQ1ZkfLibEp/lD4jbLW5I9EZM9kGgHn8vt98OKhFY6cC2lD0m
	NfETGB+pZFP8foxB03hpK6h5pB17ypF//Z5OyG5UF8Cn+eErSwsVCuTRrT/56cn+hVouFQ==
X-Google-Smtp-Source: AGHT+IEb2OQelhkZ2wVYFcVcHXQRhSgxb1xWaG3Vk4kg47/uyDzz72WWWsuUpEK0jcrP+/DgGN6R1Q==
X-Received: by 2002:a05:6000:18a9:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38f33e87e68mr7582693f8f.0.1739698883317;
        Sun, 16 Feb 2025 01:41:23 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ef9sm9212015f8f.76.2025.02.16.01.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 01:41:22 -0800 (PST)
Message-ID: <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
Date: Sun, 16 Feb 2025 11:41:21 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/16/25 11:26, Krzysztof Kozlowski wrote:
> On 15/02/2025 13:24, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC uses Synopsis eUSB2 PHY for USB 2.0. Add a new
>> driver for it.
>>
>> eUSB2 on Exynos SoCs is usually paired alongside a USB PHY controller.
>> Currently the driver is modelled to take and enable/disable the usb phy
>> controller when needed.
>>
>> The driver is based on information from downstream drivers.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/samsung/Kconfig                   |  13 +
>>  drivers/phy/samsung/Makefile                  |   1 +
>>  .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
>>  3 files changed, 365 insertions(+)
>>  create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index e2330b089..f62285254 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -77,6 +77,19 @@ config PHY_S5PV210_USB2
>>  	  particular SoC is compiled in the driver. In case of S5PV210 two phys
>>  	  are available - device and host.
>>  
>> +config PHY_EXYNOS2200_SNPS_EUSB2
>> +	tristate "Exynos2200 eUSB 2.0 PHY driver"
>> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	depends on USB_DWC3_EXYNOS
>
> How does it depend? What are you using from DWC3?

Can drop, I guess.

>
>> +	select GENERIC_PHY
>> +	select MFD_SYSCON
> Where do you use it?

Remained from USBCON driver.

>
>> +	default y
>> +	help
>> +	  Enable USBCON PHY support for Exynos2200 SoC.
>> +	  This driver provides PHY interface for eUSB 2.0 controller
>> +	  present on Exynos5 SoC series.
>> +
>>  config PHY_EXYNOS5_USBDRD
>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
>> index fea1f96d0..90b84c7fc 100644
>> --- a/drivers/phy/samsung/Makefile
>> +++ b/drivers/phy/samsung/Makefile
>> @@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>> +obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
> Entire driver looks like repeating existing qcom-snps-eusb2.

It's the same IP, but implemented differently on a different platform. At
the very least, the register layout is different.

>  You need to
> integrate the changes, not create duplicated driver.

I can do that, but it would be come a bit cluttered, won't it? Depends on
if we want to follow the current oem-provided initialization sequence, or
try and fully reuse what we have in there.

Best regards,
Ivaylo

>
> ...
>
>> +
>> +	ret = devm_clk_bulk_get(dev, drv_data->n_clks,
>> +				phy->clks);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to get phy clock(s)\n");
>> +
>> +	for (int i = 0; i < phy->drv_data->n_clks; ++i) {
>> +		if (!strcmp(phy->clks[i].id, "ref")) {
>> +			phy->ref_clk = phy->clks[i].clk;
>> +			break;
>> +		}
>> +	}
>> +
>> +	phy->vregs = devm_kcalloc(dev, drv_data->n_regulators,
>> +				  sizeof(*phy->vregs), GFP_KERNEL);
>> +	if (!phy->vregs)
>> +		return -ENOMEM;
>> +	regulator_bulk_set_supply_names(phy->vregs,
>> +					drv_data->regulator_names,
>> +					drv_data->n_regulators);
>> +	ret = devm_regulator_bulk_get(dev, drv_data->n_regulators,
>> +				      phy->vregs);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
>> +
>> +	/* we treat the usblink controller phy as a separate phy */
>> +	phy->usbcon = devm_of_phy_get_by_index(dev, np, 0);
>> +	if (IS_ERR(phy->usbcon))
>> +		return dev_err_probe(dev, PTR_ERR(phy->usbcon),
>> +				     "failed to get usbcon\n");
>> +
>> +	generic_phy = devm_phy_create(dev, NULL, &exynos2200_snps_eusb2_phy_ops);
>> +	if (IS_ERR(generic_phy)) {
>> +		dev_err(dev, "failed to create phy %d\n", ret);
>
> Syntax is return dev_err_probe
>
>> +		return PTR_ERR(generic_phy);
>> +	}
>> +
>> +	dev_set_drvdata(dev, phy);
>> +	phy_set_drvdata(generic_phy, phy);
>> +
>> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +	if (IS_ERR(phy_provider)) {
>> +		dev_err(dev, "failed to register phy provider\n");
>
> Syntax is return dev_err_probe
>
>> +		return PTR_ERR(phy_provider);
>> +	};
>> +
>> +	return 0;
>> +}
> Best regards,
> Krzysztof

