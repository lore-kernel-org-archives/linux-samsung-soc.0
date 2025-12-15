Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD570230BDF;
	Mon, 15 Dec 2025 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765829203; cv=none; b=FILWGgWVQgEpMCU8buE02GJBM7vhSGKa+RErz+DPVJZ8R8vxymfyppmcxbkOgJWudtQ2PzjaCSS0Ud4widW7uWNKkEXYO3jX42qA5Ov2Ry2OF/ceJJdr8sAwz+yCQ2UN5zyN0BtTMl1aLmTu5AJxFngGKXwlswSaK8c6zhhnljE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765829203; c=relaxed/simple;
	bh=+fEPiG6nRDgYkSLJL7xmlOgRM1fqNKRYC1cgfFoj/D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZ+xDlDVi0EDQgC43RkOm9vy18eepqCsffCQRNaclKhhIVHbCsg7lj4XRakm5EvjvfFi0UZY8RGvJ85JMXyr7gO1JlYm3quFecCX8YcNl0c8iZjr08zPpGZZrTaiDAChJl/lQgCcLp+zQuNbvA6W/1L23wXO9MjAC045OIa3gPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=huo3+38U; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="huo3+38U"
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 2ADB753412AF;
	Mon, 15 Dec 2025 21:06:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1765829192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z4j2/uGpnszAMbRY/gTyuwO8hAfsQxxFOQaGfJQ8+/s=;
	b=huo3+38UZOFn2IkZEBBtuqFO09u1rKe8NVzXWLiYN2PP4BZeit03wPYs+ZwIWhqvA2Eztl
	pXjz9JJwqezQ5PT7wQ4urT532/DugbEppBUebJsX89ZLis9GNXE3YkHizFJrR+3JcTx0J1
	6gi5kUlYET02Et/Kx4Y7ATF564+2vLI=
Message-ID: <eb898d21-5fda-474d-979e-18da33a85415@ixit.cz>
Date: Mon, 15 Dec 2025 21:06:31 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Lukas Timmermann <linux@timmermann.space>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
 <20251215-lat3st-staging-v3-2-2e4914b64dd8@timmermann.space>
 <c62d6c99-0c8d-40e5-95fc-ae73ecaca926@ixit.cz>
 <546ff0cb-a3a2-4fa4-a78b-79c923ed7765@kernel.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <546ff0cb-a3a2-4fa4-a78b-79c923ed7765@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/12/2025 20:33, Krzysztof Kozlowski wrote:
> On 15/12/2025 19:53, David Heidelberg wrote:
>> Hello Lucas,
>>
>> thanks for the sending Nexus 10 upstream, see few nitpicks below:
>>
>> On 15/12/2025 16:05, Lukas Timmermann wrote:
>>> From: Alexandre Marquet <tb@a-marquet.fr>
>>>
>>> Manta is the code name for Google Nexus 10, and was manufactured by
>>> Samsung with their Exynos5250 SoC.
>>> This patch adds initial device-tree file for this board.
>>>
>>> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
>>> Co-developed-by: Lukas Timmermann <linux@timmermann.space>
>>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
>>> ---
>>>    arch/arm/boot/dts/samsung/Makefile             |   1 +
>>>    arch/arm/boot/dts/samsung/exynos5250-manta.dts | 511 +++++++++++++++++++++++++
>>>    2 files changed, 512 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
>>> index 7becf36656b1..e0143ee8c82d 100644
>>> --- a/arch/arm/boot/dts/samsung/Makefile
>>> +++ b/arch/arm/boot/dts/samsung/Makefile
>>> @@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>>>    	exynos4412-trats2.dtb
>>>    dtb-$(CONFIG_ARCH_EXYNOS5) += \
>>>    	exynos5250-arndale.dtb \
>>> +	exynos5250-manta.dtb \
>>>    	exynos5250-smdk5250.dtb \
>>>    	exynos5250-snow.dtb \
>>>    	exynos5250-snow-rev5.dtb \
>>> diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
>>> new file mode 100644
>>> index 000000000000..0f006590576c
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
>>> @@ -0,0 +1,511 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>
>> you could use here modern SPDX I guess (GPL-2.0-only)
>>
>>> +/*
>>> + * Google Manta (Nexus 10) board device tree source
>>> + *
>>> + * Copyright (c) 2023-2025 Alexandre Marquet
>>> + * Copyright (c) 2025 Lukas Timmermann
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include <dt-bindings/leds/common.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/clock/maxim,max77686.h>
>>> +#include <dt-bindings/input/linux-event-codes.h>
>>> +#include "exynos-pinctrl.h"
>>> +#include "exynos5250.dtsi"
>>> +#include "exynos-mfc-reserved-memory.dtsi"
>>> +
>>> +/ {
>>> +	model = "Google Nexus 10";
>>> +	compatible = "google,manta", "samsung,exynos5250", "samsung,exynos5";
>>> +
>>> +	aliases {
>>> +		mmc0 = &mmc_0; /* eMMC */
>>> +		mmc1 = &mmc_1; /* WiFi */
>>> +	};
>>> +
>>> +	bmp180_vdda_reg: regulator-bmp180-vdda {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "BMP180_VDDA";
>>> +	};
>> something-something-regulator (all occurences within the DTS)
>>
> 
> I don't understand this suggestion.

oh right, let me clarify,

the regulator name should end with -regulator postfix.

> 
>>> +
>>> +	bmp180_vddd_reg: regulator-bmp180-vddd {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "BMP180_VDDD";
>>> +	};
> 
> 
> 
>>> +};
>>> +
>>> +&clock {
>>> +	assigned-clocks = <&clock CLK_FOUT_APLL>;
>>> +	assigned-clock-rates = <1000000000>;
>>> +};
>>> +
>>> +&cpu0 {
>>> +	cpu0-supply = <&buck2_reg>;
>>> +};
>>> +
>>> +&ehci {
>>> +	status = "disabled";
>>> +};
>>> +
>>> +&i2c_0 {
>>> +	status = "okay";
>>
>> status should be before first sub-node (none in this case), with
>> preceding newline, please change all occurences
>>
> 
> Well yeah, but do you have actually any comment pointing real issues?

No I don't, just generic device-tree nitpicks.

David

> 
> 
> Best regards,
> Krzysztof

-- 
David Heidelberg

