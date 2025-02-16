Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42737197A7A;
	Sun, 16 Feb 2025 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739699056; cv=none; b=gjjk6XFKez8J6FH/UVaMrW7MpMVfLhdGEdJq7XuUkmoydMWxY4/9cazFq5E3MRA/8R4VFCa0ESBUGz/zz2D26f0otDN3OTdoDpCaM3bzmFMtwk5utxFNUw9GjxTgKiy8FDEwcBMJj3lZ3qKvceNhnxszdKf0kPWWYQdRRzA/z5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739699056; c=relaxed/simple;
	bh=zD0KT9CZGcw7t13T9u3q2BqVesbZ0W0Wa6rgYZKhLmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qk72vfm95IeF3u1rbOoxpcRmtEfzR9W9xT/WyPk3vfTOr59Pny6mQsL0+B3yKuZxSCCTPGz+3uEXfwudCSw+Yqj/m8QGTH8e4O7AusSn8InK79rsi8t3CMCdWoj9pbSGt2VSmaq6W9QCOuYAevb9QKsGXdyhfrmPkRoQ1S57Xzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFbKd6S/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFbKd6S/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8BFC4CEDD;
	Sun, 16 Feb 2025 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739699055;
	bh=zD0KT9CZGcw7t13T9u3q2BqVesbZ0W0Wa6rgYZKhLmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UFbKd6S/vwLqDQywKStuwPzw8ZvHttgL+NliLzZHxFxnFyX9gqse06lNgH1ZCixPN
	 jeEOJmEQnjSy6ShWpLf+4s3l/6RtyySfPuY5to3R747CykItS6lV0SY1eT3eEg10oQ
	 uABtZFs3CKsBBCOGRKgQ1Gf9hGBy4DN+4gBEEliQ8eCJV52PXAdCAemOERqacZao0m
	 WVKMpK32v04pFq6wI5ZxrZE3Dhxl9CpzXKncjIFG6OG6gIKy3CR0nW7NiX94JurHqH
	 aC7SHlW+W1TdUTePxORhnxRWOO7rjwQCl2zchxPOBPZuwrYlu4cX0NscGZW6oYY5KG
	 3z3OAgL22RWGg==
Message-ID: <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
Date: Sun, 16 Feb 2025 10:44:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
 <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
 <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2025 10:41, Ivaylo Ivanov wrote:
> On 2/16/25 11:26, Krzysztof Kozlowski wrote:
>> On 15/02/2025 13:24, Ivaylo Ivanov wrote:
>>> The Exynos2200 SoC uses Synopsis eUSB2 PHY for USB 2.0. Add a new
>>> driver for it.
>>>
>>> eUSB2 on Exynos SoCs is usually paired alongside a USB PHY controller.
>>> Currently the driver is modelled to take and enable/disable the usb phy
>>> controller when needed.
>>>
>>> The driver is based on information from downstream drivers.
>>>
>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> ---
>>>  drivers/phy/samsung/Kconfig                   |  13 +
>>>  drivers/phy/samsung/Makefile                  |   1 +
>>>  .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
>>>  3 files changed, 365 insertions(+)
>>>  create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
>>>
>>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>>> index e2330b089..f62285254 100644
>>> --- a/drivers/phy/samsung/Kconfig
>>> +++ b/drivers/phy/samsung/Kconfig
>>> @@ -77,6 +77,19 @@ config PHY_S5PV210_USB2
>>>  	  particular SoC is compiled in the driver. In case of S5PV210 two phys
>>>  	  are available - device and host.
>>>  
>>> +config PHY_EXYNOS2200_SNPS_EUSB2
>>> +	tristate "Exynos2200 eUSB 2.0 PHY driver"
>>> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>> +	depends on HAS_IOMEM
>>> +	depends on USB_DWC3_EXYNOS
>>
>> How does it depend? What are you using from DWC3?
> 
> Can drop, I guess.
> 
>>
>>> +	select GENERIC_PHY
>>> +	select MFD_SYSCON
>> Where do you use it?
> 
> Remained from USBCON driver.
> 
>>
>>> +	default y
>>> +	help
>>> +	  Enable USBCON PHY support for Exynos2200 SoC.
>>> +	  This driver provides PHY interface for eUSB 2.0 controller
>>> +	  present on Exynos5 SoC series.
>>> +
>>>  config PHY_EXYNOS5_USBDRD
>>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
>>> index fea1f96d0..90b84c7fc 100644
>>> --- a/drivers/phy/samsung/Makefile
>>> +++ b/drivers/phy/samsung/Makefile
>>> @@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
>>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>>>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>>> +obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
>> Entire driver looks like repeating existing qcom-snps-eusb2.
> 
> It's the same IP, but implemented differently on a different platform. At
> the very least, the register layout is different.


I checked few registers, looked very the same. Same blocks from synopsys
have the common register layouts.

> 
>>  You need to
>> integrate the changes, not create duplicated driver.
> 
> I can do that, but it would be come a bit cluttered, won't it? Depends on
> if we want to follow the current oem-provided initialization sequence, or
> try and fully reuse what we have in there.


I think it duplicates a lot, so it won't be clutter. We have many
drivers having common code and per-variant ops.

Best regards,
Krzysztof
