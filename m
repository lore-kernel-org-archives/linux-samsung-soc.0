Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD9B290F;
	Sun, 16 Feb 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739699944; cv=none; b=FaTkavjcNv7+SaGz0fJyXBfIarpiMEMDriOhff0+dTymrbfWNp1IjZn+k5V8/6aiF2AgNwvneeYoiFhVHiBMeCdQElz+16gMIUG8oonniFMoxH9wRKp+TEsLw7fqTr2kzLZl1AksdNgph66LkrrIXis7mvdRSV+/ENqhRJk95PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739699944; c=relaxed/simple;
	bh=aL+04xZVulicpTdrxisp1JEl4Klmtg3++whjLvtr2xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOHV46mCk6JE0iRqckbVc4j+x2cVXUCatIgzeFrq6m4agx+11tMgRV9HM94DdK4KymuvJ+zApvV1UhMxPB8d0Uj+E7QOCChNs2vVMP3Bvp8C+eUatjD0ZvHBJQ8hHpG9L4z1aO6OOfRVQscVQLcULWZ1Pq6vzlnV8aXOlmZWj20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSvmUUZG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSvmUUZG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f3ac22948so248501f8f.0;
        Sun, 16 Feb 2025 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739699941; x=1740304741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Pv2ab+l4k/GmIjg6UFnNL/02FoWRRTFcUTIE2g9NS0=;
        b=jSvmUUZGbEkC0OqOgrBd7RkDRwQ8vFKizGOknw6ShBfgs9snx+WOZ3UUHZgsvSmBL0
         4r45YHwVI7VBQTcBQeaiXoaNwDO0wQY3oBDhDxFPWH9QT2fniMS1wJxusLFSFtPmDQsa
         W4DIG+o8w+lxssBhVebgWKMbIM69gXng8IVqWVTYTDccWh8txh3WTFdHaclxwQdMIUmg
         M5bZhGYxnN0wWjKXdUDECN4yEjeDhB7hSb8UGGrrJeQFcoo7A0j3Cj5dL82V1xvawRZu
         HEfeSKQcGMrfDFA90LjOLE6e7VC6ohZI10Zq1IYJhbQiHyWX73uepqlLCS9sEaq3+2B0
         WBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739699941; x=1740304741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pv2ab+l4k/GmIjg6UFnNL/02FoWRRTFcUTIE2g9NS0=;
        b=gRRS6WzrzDkIyYPvcJ3UVNVKygog9fE6pBKB8OVX131Yp+lrltYoxGTkQLaFUltGt/
         8Ayn74WfcxYAWtFaSNSj8UHS6RdARhoKx4O/9Ij9RQf7Mwbay5qnnnsjU7kzzTCJtZmf
         isl6HZthWJflNeDLDh5Wx7gQ6Dj2K+vIj4T7VoHU7OAVT4yIWA6GIrqfZ9PU9jWkhqoS
         wCIUcDCcLpL0adcwROd8VTmIlcc/+7orHJvpw5Iqp1jCz8hQ27DWM+W8vURGJ7sJEWo7
         Gs5+M2cdOK4YIOZuugKqxH6wqyIq95t/wmq+g5tvrtShlUiTjalouKSBV8k3YI8yRK7Y
         8F2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRn4l9VidYrQD3Nj2duzG3/4lGoK6jDl09t1rUewMGEyfMHKnl1PHTNs3RcNqnQHOLLLixL7ZUHOfYmqXO@vger.kernel.org, AJvYcCX7aw1ra+Xym5NZpvyYAHvDww9QGOIRmK/97GI/yIJetuGt0rH4aF3+qrzE8Gd5EkPTNGlJ/dh6AJxFOFI4UABE1Uk=@vger.kernel.org, AJvYcCXmtwcQitFJ9gkiaohH+XbJ6sGcQjJ9VIJUPpG9cm/pN8eEB3S6EaEO2TJCcIuXmJLA+tH1NwOa1pTj@vger.kernel.org
X-Gm-Message-State: AOJu0YwlA2HazfHsFAz1VbJuqktIX4ihuGsH9buPhjAS0n5gPAQEmXsi
	lcfPoKC5U9b1OjfsMLVbPGiDEaFqHeSzDChHIuCUnPrkJY6Lqsvy
X-Gm-Gg: ASbGncs1Dua4qrIHWAWAsfI7vUjxM0Tp4uvN7FZjRJ5WPSSAW8Jhze3muYhhdJ5gBx3
	NE0z6nBTLLFZibsXxVCUW6+aQn9nQ8tNzmjP+mlWZjNMK8UKgrfJvmKpD4JOGdzvJPKGEcebgXh
	6DPYpZlQGaKAdG2jU6yD9lJOjpVosjjk4s2i3OzG2iLRBQrnUchpaFQm1l7iuZXknyQbU9oJI/1
	eyViMLny2UXp3j+HFzbKnga948HQYYUn3Psb/QAsHYeNglsPnQt4bM5WVDpdN0sSETYZ8eZnhe0
	dXlxkgYU50KIRW8wkecc8ChOPminlYf8Y0XkbzNKCby2ykCrXw2e1OZK9qhCzZ6rhJ424A==
X-Google-Smtp-Source: AGHT+IHZgNqHyHCv5yT6p4apSYBg8SJTvge1/YRU31W+9aRlNzcxZQY9QQK2OBKvkkzXkaKW1nJebA==
X-Received: by 2002:a5d:59af:0:b0:385:ee40:2d88 with SMTP id ffacd0b85a97d-38f33f117d1mr4534496f8f.3.1739699941089;
        Sun, 16 Feb 2025 01:59:01 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5efdsm9144911f8f.43.2025.02.16.01.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 01:59:00 -0800 (PST)
Message-ID: <9451f339-c8ff-4be2-9cde-1aaf78fa8e7b@gmail.com>
Date: Sun, 16 Feb 2025 11:58:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] phy: samsung: add Exynos2200 usb phy controller
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
 <20250215122409.162810-5-ivo.ivanov.ivanov1@gmail.com>
 <32b67c56-9331-4391-90ad-031e0388434f@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <32b67c56-9331-4391-90ad-031e0388434f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/16/25 11:36, Krzysztof Kozlowski wrote:
> On 15/02/2025 13:24, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC comes with 3 PHYs - snps eUSB2, snps USBDP combophy
>> and a cut-off phy that origins from exynos5-usbdrd. The latter is used
>> for link control, as well as pipe3 attachment and detachment.
>>
>> Add a new driver for it.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/samsung/Kconfig                 |  13 ++
>>  drivers/phy/samsung/Makefile                |   1 +
>>  drivers/phy/samsung/phy-exynos2200-usbcon.c | 241 ++++++++++++++++++++
>>  include/linux/soc/samsung/exynos-regs-pmu.h |   3 +
>>  4 files changed, 258 insertions(+)
>>  create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index f62285254..47e9b9926 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -90,6 +90,19 @@ config PHY_EXYNOS2200_SNPS_EUSB2
>>  	  This driver provides PHY interface for eUSB 2.0 controller
>>  	  present on Exynos5 SoC series.
>>  
>> +config PHY_EXYNOS2200_USBCON
>> +	tristate "Exynos2200 USBCON PHY driver"
>> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	depends on USB_DWC3_EXYNOS
> How? What are you using from DWC3?

Will drop.

>
>> +	select GENERIC_PHY
>> +	select MFD_SYSCON
>> +	default y
>> +	help
>> +	  Enable USBCON PHY support for Exynos2200 SoC.
>> +	  This driver provides PHY interface for USB controller present
>> +	  on Exynos2200 SoC.
>> +
>>  config PHY_EXYNOS5_USBDRD
>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
>> index 90b84c7fc..f70e12ddf 100644
>> --- a/drivers/phy/samsung/Makefile
>> +++ b/drivers/phy/samsung/Makefile
>> @@ -15,5 +15,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>>  obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
>> +obj-$(CONFIG_PHY_EXYNOS2200_USBCON)	+= phy-exynos2200-usbcon.o
>>  obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
>>  obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
>> diff --git a/drivers/phy/samsung/phy-exynos2200-usbcon.c b/drivers/phy/samsung/phy-exynos2200-usbcon.c
>> new file mode 100644
>> index 000000000..7968c9792
>> --- /dev/null
>> +++ b/drivers/phy/samsung/phy-exynos2200-usbcon.c
>> @@ -0,0 +1,241 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> + */
>> +
>> +#include <linux/bitfield.h>
> Are you using this header?
>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/iopoll.h>
> And rhis?
>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
> And this?

Nope, it's a leftover I forgot to drop. Same with the above

...
> Same comments as on previous patch.

Alright. Thanks for the feedback!

Best regards,
Ivaylo

>
>
>
> Best regards,
> Krzysztof

