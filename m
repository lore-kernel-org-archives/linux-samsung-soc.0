Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11F216393;
	Fri,  6 Dec 2024 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733501662; cv=none; b=Dc9nxxlKG7hGeRWF4wEplGXEfGksOTYqzKmwnxMWSjI64jJ+sCMb/Z7hJr5mxw9jR8i9xa8q5zJaK3acp5CZQeMwwUiFv8gyLMVAQNaxK6mNcm1tjXyCar0Jst6Vf53Qz9RfnPgQbvcVoGbt6MAU6Fv1xjQPB64Z9ZUTqV+QiPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733501662; c=relaxed/simple;
	bh=F1tJu0tNNZn8Kae/PiQYaJbS8f8Vv2Mwc4GURN/CsQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgxYAlBQy8uMDo3yewgG10UTcBqomHYHYu1xpDnxZIzhcK0ULEpRw7WAu7THYt+V7nW1qPgjfg8AWLPj+fhoEWUhD+SttEVNkL4b5sfJ0+zN3fz3eWDnaXvy++/yjHR3oRHZcJ4bPgHo+vpPYOVZs5x9Ov43dJWwEzVyDtcKhBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfJY1aCk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfJY1aCk"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa549d9dffdso322706866b.2;
        Fri, 06 Dec 2024 08:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733501659; x=1734106459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXaGALZRpVF00Ah97wy9KL1a0sGXBk3kjKaNXmrcIjI=;
        b=dfJY1aCkYWfWhBQHCrw6V1PVFFszNW3Ig2B2Iobfieby0adgRlAqTbNUk/xQURkYSJ
         OTvFpvH5Hu6mOucoLM+32r9Z4sXdZeiAo7hDrioED70V0p8WD30kl4pviYPxCBZ6Tkgn
         cY6gYVc4Uo53m/niBe2hGSp1Mk5TAQ4R+2cuMEShmG6phtAzPdlAAAm4TeFumHLMhSpu
         knVNOERYkajB4DFw7RB62rydgY/+N6R1Aju8t2PzItGiA/eBysJwH0FgMVlSefdepOpF
         gAeEkb99H3uKVBEgzS4LQdM8o+eL3Avq1JzlJjZWDswPA3GTwI23abD24A8WWFUCFMOk
         6qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733501659; x=1734106459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXaGALZRpVF00Ah97wy9KL1a0sGXBk3kjKaNXmrcIjI=;
        b=cFO/krQPoFllQJctjhAKj2FQy1J5XJum/xW1QFIgrI5hYQh0pLJPZyf9xMr8R/SJHs
         j/XJ7HIC4xVXrdKJcnZTmQbEjDDFe2EMkKSE805WcEnyr6wrLwirRZH/jhobTPj3kWud
         4EMYWQ8P8GNKXjmsPvDW0lc86vkIqi16+yKugzUKmGcOB44Ee1PVr6IU84P13CrIbYaH
         5fKV/OfXJcGA4huvNRReAx1CF1pwKpzYI+aQAEt+Td8wWChSc2jgctnYEhmN1cGVtn2S
         czBlbF2t1vGpeascQ/qgcOJqQObWPOdoj3RFfAjWX9hHbRaMTGY4yo+UC/vMGUtvowyG
         UQEA==
X-Forwarded-Encrypted: i=1; AJvYcCUs2osG4VJ9T3e85DFnxaF4+EmAdpMcXx9pknLS0M+/A2zyyO7CmFJPtpJ6/w3Vu9lPryJtp5uOyPyZ+E6J2Kp/02k=@vger.kernel.org, AJvYcCVPSoI9DYCM54sH9TKfuv7uZl8X9wDh3HxAi4OtQbBFtt0K9WWo0g21ySdqL40ikn87HKHnj5y69/Ng@vger.kernel.org, AJvYcCX6cytgKqqlFWSyXrQK+Q08tAeGiXmUJU9q5S0gPu88SIcW3C0yO/sBCssm2BMwu9IHVWCSlgt5vPl2dd05@vger.kernel.org
X-Gm-Message-State: AOJu0YxChkgO3K6cMEW9UAVI6Q7MjQPcaR7pTjv2LFTSVWJRtvUFeepa
	68jI9kQ/+VXcjWX5P+uEF7RDGAR2u2nQmnhwXi0HdeYgUEWwUH1V
X-Gm-Gg: ASbGncsFDoPRQYqvM9a0pb2hSotNEJrLn460+KZQ+fxkF5Aiq7cZosjUYS5fE+mxUAs
	pZC9XMErwLvl+hseE6ecrG/Os40ElKC7N/T5RN/rlYj/s4r6H8JxyluEIptrvUi6onN36fK7NpT
	I9Ol9S+cBn8MetzAUPIohSKy2m6xr3FwKxH8w9nAqPtfxnLGy+MDvGhlSfHR832ZMqqnrocXvzG
	XXjxsesHK41V4z5X8HPm8negGZAMLsvw5hM4YHoTGom52BfKd6eLJaJAGkYTLy1UMZq9qeMBR+L
	Wx0sciKdMMWVh3qB+5wtWRk851+i
X-Google-Smtp-Source: AGHT+IEBIRjHmYo28RiHnCZp8Gi2PiofN48HDLnGskCNXYlPsQ0Oej4qKEh8fJUXynlKVp/0AGxXGw==
X-Received: by 2002:a17:907:9508:b0:aa5:f39a:bc99 with SMTP id a640c23a62f3a-aa63a127f80mr256126966b.36.1733501658659;
        Fri, 06 Dec 2024 08:14:18 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62608d2fbsm258270666b.149.2024.12.06.08.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 08:14:18 -0800 (PST)
Message-ID: <51a87200-e562-409c-af21-2216288beb67@gmail.com>
Date: Fri, 6 Dec 2024 18:14:16 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 Series boards (hubble)
Content-Language: en-US
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 igor.belwon@mentallysanemainliners.org
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
 <20241206154149.4271-3-umer.uddin@mentallysanemainliners.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241206154149.4271-3-umer.uddin@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/6/24 17:41, Umer Uddin wrote:
> Add initial support for the Samsung Galaxy S20 Series (hubble) phones.
> They were launched in 2020, and are based on the Exynos 990 SoC.
> The devices have multiple RAM configurations,

A very small nit that I've noticed repeatedly in the other 990
commits as well:

In the future, try to wrap commit message according to Linux coding
style / submission process - neither too early nor over the limit, so
that commit messages can look as good as they can:

https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

For example, in this particular case, you could move "starting from
8GB" to the previous line, like so:

...
They were launched in 2020, and are based on the Exynos 990 SoC.
The devices have multiple RAM configurations, starting from 8GB
going all the way up to 16GB For the S20 Ultra devices.

Otherwise, it looks good to me.

Best regards, Ivo.

> starting from 8GB going all the way up to 16GB for the S20 Ultra devices.
>
> This device tree adds support for the following:
>
> - SimpleFB
> - 8GB RAM (Any more will be mapped in device trees)
> - Buttons
>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  .../boot/dts/exynos/exynos990-x1s-common.dtsi | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
> new file mode 100644
> index 000000000..55fa8e9e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S20 Series device tree source
> + *
> + * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos990.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@f1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0xf1000000 0 (1440 * 3200 * 4)>;
> +			width = <1440>;
> +			height = <3200>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cont_splash_mem: framebuffer@f1000000 {
> +			reg = <0 0xf1000000 0 0x1194000>;
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

