Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDEF1EF0A1;
	Thu, 14 Nov 2024 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731572770; cv=none; b=Gg50mPYRrgkw2ejJXc60EaiZuNcZYVg/1YwhsAlZohzCaEWpRzR2xrtqCUj3j2CCPe4xgGtGxV15EMxuWU2J8kfgdU0p6s/G0m6By3DpCyfYccQbFkE98KDD+G4dSy1nw8syZ0ZsfpWDkG13mUgtQ2Va0lmIircagRAZdnXoAhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731572770; c=relaxed/simple;
	bh=GYL1Z33iDAW71hbOa6kteXwSx93rgNSq06IBAENRps8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOOkc5c5LHhWdTAWWQJGpNLf7QrREEKKtD57j+baY85c1DyKGRiZuWKHFLEncz/xAWAW5NfF0oAF815v5ELPfDMZuN8TyYBgNmdMWvt2dxVe3gefGf0Lhm0FldDI63gRTox6iOmtUimyw5Lywz+9dLdq2zWDmGG2KPySZ8s3W7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTX68oJe; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTX68oJe"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e8522445dso59487566b.1;
        Thu, 14 Nov 2024 00:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731572767; x=1732177567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLyvFPHpxm3Z8eNHyU2D0j8hgC2REPkIyuqNLE8iojs=;
        b=BTX68oJeYJt0bR8R6A+taI/ORKH7YnGqKDicKitMoEO2CsZnPa57CUNerd+t3+gcjV
         S8b+mMooNw1TWtT2Lnf1eeHimy9FiDhl1XWFv7xZY3hwX2p8Mcsf3nXTCoVAO0YAYO4Y
         oiOhVoKag/vzwPr7DBX+NuYMdRVD+g13ydbgqOetHkAoBOX5VcbZscmYVcUWIDQQReDo
         Z/FuM+LSeI1Mhk8O+QlQ2tMn3uyyxbdPAANlHsMPdAc0IDz4YVzzzYATaq/h+xXBiYQK
         y7Mm764R3YYUR/jE4fQ9yhhURrhez+7tPdPB5E1ZQlwIqm4nhSRo8KjmXiSsSC4UQUyN
         zb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731572767; x=1732177567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLyvFPHpxm3Z8eNHyU2D0j8hgC2REPkIyuqNLE8iojs=;
        b=B5IyaQgHNdCIajVUhCP9wsdNXioZzGWUao8udZOGEpK/cIcscG1Cv9BOEjJMMUevhm
         9gMqQKpdkva/aQWYxMeTO9tFokoNDfpE1wJEbL03rILU4rpQVmzy2FRak1fzcdnQTg9u
         2g0cqivNm788l4L83hmZVtUxOyCzGhqszDfYVpdUxAaB7IZWC9nCd60EGiNZTczYCDaW
         m7MeiD3i0JnK+VBxeg6BEI7vj61EKVMJWOJRTUDpfVRbZlmdGx6bwIDizHw4+/PkwMr5
         9BLsUwYF2lONt3oWdEIVtcKpyTk2hTW4p/h72x6LY96Gim5Z3aEQXj+CzzfTTVKm6KoE
         fTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcomjE4p6ySFkyMrJ9zQybfYfsIB8O9GanwvpAsm/f6iBBcQxhEER7xkya5hPblkgBypNhaV+sErgc@vger.kernel.org, AJvYcCVf2s9FfdwkZEY9xiWxzpI5eK570uea2QhMLJoZOePfeSYxa/vzj2h7UDXROXTnA4UYgKWvhv39dE8aicpGdII5nUo=@vger.kernel.org, AJvYcCWH7HzHVcbpYnIN2cq0XelqEQ99QUhZMImh9TUxIXGVEdq1/FnEllGDx9QJJDI3LOuZRYRs+kCr0Lsm2/I4@vger.kernel.org
X-Gm-Message-State: AOJu0YwICmSEIEQUquaU50IzoTsmMacaq/YHJ8062/49nYXJKBhF9yri
	iY2Z36xPQNbADvog8O1Rh464mmT9jNp8XFaJbazVcGQwbmTcJboFYLKU6Q==
X-Google-Smtp-Source: AGHT+IEf1WmcfXNdSENwfIUsrYNgAlR4c3RtKQdPsGuXCzLAnypp6yYLWhuIvEI3eSxUjjW590bBQw==
X-Received: by 2002:a17:906:7305:b0:a9e:8612:f201 with SMTP id a640c23a62f3a-aa20cdf5073mr103350866b.59.1731572766864;
        Thu, 14 Nov 2024 00:26:06 -0800 (PST)
Received: from [192.168.35.18] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df268d5sm35235566b.5.2024.11.14.00.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 00:26:06 -0800 (PST)
Message-ID: <746e218b-a00c-49ac-a998-511696bc9525@gmail.com>
Date: Thu, 14 Nov 2024 10:26:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: Add initial support for Samsung Galaxy
 S20 FE (r8s)
Content-Language: en-US
To: Denzeel Oliva <wachiturroxd150@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112193149.1262-1-wachiturroxd150@gmail.com>
 <20241112193149.1262-3-wachiturroxd150@gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241112193149.1262-3-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 11/12/24 21:31, Denzeel Oliva wrote:
> Add initial support for the Samsung Galaxy S20 FE (r8s/SM-G780F) device.
> Its launch was in 2020 and also based on the Exynos 990 SoC.
> It is only configured with 6GB of RAM, although storage options may differ.

As far as I can tell, there are models with more than 6gb's of ram.
How would the memory node differ for them?

>
> This device tree adds support for the following:
>
> - SimpleFB
> - 6GB RAM
> - Buttons
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/Makefile          |   1 +
>  arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 115 +++++++++++++++++++
>  2 files changed, 116 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 7a934499b..948a2c6cb 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
>  	exynos990-c1s.dtb		\
> +	exynos990-r8s.dtb               \
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
> new file mode 100644
> index 000000000..b21863bbb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S20 FE (r8s/SM-G780F) device tree source
> + *
> + * Copyright (c) 2024, Denzeel Oliva <wachiturroxd150@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "exynos990.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Samsung Galaxy S20 FE";
> +	compatible = "samsung,r8s", "samsung,exynos990";
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@f1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0xf1000000 0 (1080 * 2400 * 4)>;
> +			width = <1080>;
> +			height = <2400>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x3ab00000>,
> +		      /* Memory hole */
> +		      <0x0 0xc1200000 0x0 0x1ee00000>,
> +		      /* Memory hole */
> +		      <0x0 0xe1900000 0x0 0x1e700000>,
> +		      /* Memory hole - last block */
> +		      <0x08 0x80000000 0x0 0x0c000000>;

0x08 -> 0x8

Best regards, Ivo.

> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cont_splash_mem: framebuffer@f1000000 {
> +			reg = <0 0xf1000000 0 0x13c6800>;
> +			no-map;
> +		};
> +
> +		abox_reserved: audio@f7fb0000 {
> +			reg = <0 0xf7fb0000 0 0x2a50000>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_power &key_voldown &key_volup>;
> +		pinctrl-names = "default";
> +
> +		power-key {
> +			label = "Power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&oscclk {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pinctrl_alive {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +};

