Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F145C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 18:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C7B060F02
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 18:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhJISZJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 14:25:09 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50206
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229518AbhJISZJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:25:09 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4C5903FFD9
        for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Oct 2021 18:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633803791;
        bh=zM6bXngNodKvbWIfKelGBWZlSPfZzg8bpEP/hU6qczs=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Xi/P9jiJkYrX4kATFu7r8i6S0gv89SHNTgYOYR6lsYYG8fN+zwoXPrKHBsnamXcAE
         TiLodbb2fpQAEylgTHuYoGh2MaVQdCCn9CIoeXi3fk647G81dnuJ9rJJmd5W3EStPJ
         LCfqKUm4ZEkUPdmo+eQ3o2qz6du+nsrCH8VLiMM3pzvcUvkt6OX0FXSm23SK9ffWar
         j4rvZlv3jzX003ICaFejpR26Bb34g+erzQxFhBLzNP1uGAP8+gXiKgRH9z+4WRj68A
         9MPVpMqgUo7dHesJn3pOm6ktXtaQCg+qTrFlDE2ZU1/PvOlTP/8/GRlUL6ELVkKPvN
         3z9cdLTjYVnkA==
Received: by mail-ed1-f72.google.com with SMTP id v2-20020a50f082000000b003db24e28d59so12030477edl.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Oct 2021 11:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zM6bXngNodKvbWIfKelGBWZlSPfZzg8bpEP/hU6qczs=;
        b=7U50ZymNKWiMGTnmYiXKMaAbPAEUUZAyoOqcG1kWOdzoDVfHJCHYZ4Lth6Tb7rNRM2
         SaK4hlgPP62iwgqwWwqlV+mpO0OmFVIoVReO5ZLTOE5EQXN++150wM598gQC0wKsswCb
         x79ENwaJjEUNoepOOuF9jYPB+/FNiopG/E0u2FrE8QF0rRqZrYwgTAK1i/v/7mfd0qRw
         /o61RXqwAsuUKylmnKaT2KFo7tFCKzAFvkKW0vXsMqvTLgEKdR2ToARySKv3idLh6Yfy
         0Ocq0Me3err1WlwVHQHY9wTso895AWqsQilXEqEUCF8K34pj5tisdmcxmMMfmb8x/FxX
         6R8Q==
X-Gm-Message-State: AOAM5333aQGkx4bnqLBkBDywUSqa9Qe2hKVGamRx2/VXGegAI3bR9BIS
        SXM4b+StUCipnZybJqXFrAuPPnzzoWYq254MmDhCy6sOBYQkn4w6/qSIt6jOIfxesZJshHk0q2w
        8Rw9OmTbSBmT7KXyK/goJFZTfX4pyQTY6vThcAESpEHcam5Qv
X-Received: by 2002:a05:6402:2684:: with SMTP id w4mr25332909edd.108.1633803790897;
        Sat, 09 Oct 2021 11:23:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+Cy2D+JVwcNKNtL8KsRRZa9b2S1k6ikrgWm8qJkLztlkO6oqjiuXs6ULdN9fAC1k0rK0pUQ==
X-Received: by 2002:a05:6402:2684:: with SMTP id w4mr25332880edd.108.1633803790657;
        Sat, 09 Oct 2021 11:23:10 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u16sm1245628ejy.14.2021.10.09.11.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 11:23:10 -0700 (PDT)
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211008091443.44625-1-chanho61.park@samsung.com>
 <CGME20211008091640epcas2p1fde9bedf5492db3f35207d118e5d9123@epcas2p1.samsung.com>
 <20211008091443.44625-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: exynos: add initial support for
 exynosautov9 SoC
Message-ID: <cadc117c-fc4e-cc86-fd99-77151c68b333@canonical.com>
Date:   Sat, 9 Oct 2021 20:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008091443.44625-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/10/2021 11:14, Chanho Park wrote:
> Add minimal support for ExynosAuto v9 SoC[1].
> 
> - Enumarate all pinctrl nodes
> - UART with exynos850 compatible
> - UFS0 HCI + Phy
> 
> Like exynos850, this also uses fixed-rate clock nodes until clock driver
> has been supported. The clock nodes are initialized on bootloader stage
> thus we don't need to control them so far.
> 
> [1]: https://www.samsung.com/semiconductor/minisite/exynos/products/automotiveprocessor/exynos-auto-v9/
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../devicetree/bindings/mfd/syscon.yaml       |    1 +
>  .../boot/dts/exynos/exynosautov9-pinctrl.dtsi | 1189 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  301 +++++
>  3 files changed, 1491 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index abe3fd817e0b..75dcbb741010 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -55,6 +55,7 @@ properties:
>                - samsung,exynos4-sysreg
>                - samsung,exynos5-sysreg
>                - samsung,exynos5433-sysreg
> +              - samsung,exynosautov9-sysreg
>  
>            - const: syscon

This has to be a separate patch.

>  
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> new file mode 100644
> index 000000000000..8489b9bea3c9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> @@ -0,0 +1,1189 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's ExynosAutov9 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2021 Samsung Electronics Co., Ltd.
> + *
> + * Samsung's ExynosAutov9 SoC pin-mux and pin-config options are listed as
> + * device tree nodes in this file.
> + */
> +
> +#include <dt-bindings/pinctrl/samsung.h>
> +
> +&pinctrl_alive {
> +	gpa0: gpa0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa1: gpa1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	dp0_hpd_pin: dp0-hpd-pin {

Keep same suffix everywhere, so "-pins", even if there is just one pin.
However no need for suffix in the label - schema does not care about
labels, so:

    dp0_hpd: dp0-hpd-pins {

> +		samsung,pins = "gpa1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	dp1_hpd_pin: dp1-hpd-pin {
> +		samsung,pins = "gpa1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	gpq0: gpq0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	speedy0_pin: speedy0-pin {
> +		samsung,pins = "gpq0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	speedy1_pin: speedy1-pin {
> +		samsung,pins = "gpa0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +	};
> +};
> +
> +&pinctrl_aud {
> +	gpb0: gpb0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb1: gpb1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb2: gpb2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb3: gpb3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	aud_codec_mclk_pin: aud-codec-mclk-pin {
> +		samsung,pins = "gpb0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_codec_mclk_idle_pin: aud-codec-mclk-idle-pin {
> +		samsung,pins = "gpb0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s0_pins: aud-i2s0-pins {
> +		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s0_idle_pins_pins: aud-i2s0-idle-pins-pins {

Duplicates pins pins.


Best regards,
Krzysztof
