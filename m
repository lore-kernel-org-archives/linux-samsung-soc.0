Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928B6C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 13:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbiAMNTz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:19:55 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52344
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235060AbiAMNTy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 08:19:54 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6EFA13F1C8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642079993;
        bh=UOUdEGb7wEdGYbFlp4O3YYitu+PjyU8K/AOUKs49Rb0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=MtTK5DJxusz2DBiXNCwvzXrtQK2S3oDOOdtWw69U5bF3Atfn6sTdgeBr+acaG/1HK
         XAhL02eQ8S/3E7c1QCg/9gZWJsNXtnh6Ywb79XQSialkVHjY1LMRrlpCHbueftQZNs
         4Vyilp4bhYUxLRM9BlG0cPfRc+IUGlaTKo/NMm6KuJyU+SbqNJnXy1dYKD8VXt23NN
         /2UqdxOBZwaVIm32Goy4gBLZvVKcjwjKmqoz/j1RssYAQ1e06eezj865iwbtrupkOW
         Hmqr1l98mZeQXAXKWSeWJb/Is/lDZ92yOpye2eLw0/EqWdji01JHedbZnyPK10vHWe
         x+kFzCknzrWdw==
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso5375337edw.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 05:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UOUdEGb7wEdGYbFlp4O3YYitu+PjyU8K/AOUKs49Rb0=;
        b=5VESV6vwd3mIr1QoGe4P9Fnt6I+RFr0zoh/esy5fWUwE1fRumo6/OFPFUcURu90MuH
         PdVxp6xf97bA/KE834/ZF2RuuNzQGATxiuUFgHcuG2LH1QVs7nl5jfuIwl6OGDz4BB4j
         oZl0Gqf+6mPZIhN4Xpwv7w4pu/FtLQUMN9Ub9jOO/viBaerovIYqFXirSi5rKI0GsBkL
         A55DDH4HZInlfu1UAvioCzj0yQJh1lQnzzN2xToArH6piPPadbIsh7cwI5dkhj3oZWmV
         288WXigsIq3lyC03iD7Kkxuy+T6Cptmt0v/2uGDbEs6rY0XPKfpCZyI2BQxgLkBhHTIv
         1D7Q==
X-Gm-Message-State: AOAM533PM2nAZm7eyDXG0NRVMWSEzZNAVbtwtiaIhGgR5vbFdb3MW/s4
        lKM3GH7gt7QAl84K03XTPOyEJDCMsNfoZ9t+zhyp1OOGZaPP5ND4GCtA/T06k7KIPev3ITpZmFl
        +gvFxs9xCWXjbw3EY0KzPcQZxUtxLcnhhUw/G4nllymQ6U3sy
X-Received: by 2002:aa7:d785:: with SMTP id s5mr4033370edq.215.1642079992876;
        Thu, 13 Jan 2022 05:19:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT2lhQ3mOwZZIJMGGqBFmFbDHwdc9XrZq0CxY23tWw6dY8rlyIXWxbhd5cD/0kImAV/gctJA==
X-Received: by 2002:aa7:d785:: with SMTP id s5mr4033354edq.215.1642079992686;
        Thu, 13 Jan 2022 05:19:52 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id g21sm1139201edt.12.2022.01.13.05.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:19:52 -0800 (PST)
Message-ID: <2927c34e-3259-4e9a-a657-aeeebf9089d2@canonical.com>
Date:   Thu, 13 Jan 2022 14:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 15/23] arm64: dts: fsd: Add initial pinctrl support
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Shashank Prashar <s.prashar@samsung.com>,
        Aswani Reddy <aswani.reddy@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122417epcas5p47398a5190cdf4c574c6f1762918b549f@epcas5p4.samsung.com>
 <20220113121143.22280-16-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-16-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> Add initial pin configuration nodes for FSD SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Shashank Prashar <s.prashar@samsung.com>
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 338 +++++++++++++++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi         |  22 ++
>  2 files changed, 360 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> new file mode 100644
> index 000000000000..ec8d944af636
> --- /dev/null
> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Tesla Full Self-Driving SoC device tree source
> + *
> + * Copyright (c) 2017-2021 Samsung Electronics Co., Ltd.
> + *		https://www.samsung.com
> + * Copyright (c) 2017-2021 Tesla, Inc.
> + *		https://www.tesla.com
> + */
> +
> +#include <dt-bindings/pinctrl/samsung.h>
> +
> +&pinctrl_fsys0 {
> +

No need for empty line.

> +	gpf0: gpf0 {

FYI:
It's ok now, but the nodes will have to be renamed to "xxx-gpio-bank" later.

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf1: gpf1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf6: gpf6 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf4: gpf4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf5: gpf5 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +};
> +
> +&pinctrl_peric {
> +

No need for empty line.

> +	gpc8: gpc8 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf2: gpf2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf3: gpf3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd0: gpd0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
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
> +	gpb4: gpb4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb5: gpb5 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb6: gpb6 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb7: gpb7 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd1: gpd1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd2: gpd2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd3: gpd3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg0: gpg0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg1: gpg1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg2: gpg2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg3: gpg3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg4: gpg4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg5: gpg5 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg6: gpg6 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg7: gpg7 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	pwm0_out: pwm0-out {

All pin configuretion node names with "-pins" suffix. Upcoming dtschema
will require this.

> +		samsung,pins = "gpb6-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
> +	};
> +
> +	pwm1_out: pwm1-out {
> +		samsung,pins = "gpb6-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
> +	};
> +
> +	hs_i2c0_bus: hs-i2c0-bus {
> +		samsung,pins = "gpb0-0", "gpb0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	hs_i2c1_bus: hs-i2c1-bus {
> +		samsung,pins = "gpb0-2", "gpb0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	hs_i2c2_bus: hs-i2c2-bus {
> +		samsung,pins = "gpb0-4", "gpb0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	hs_i2c3_bus: hs-i2c3-bus {
> +		samsung,pins = "gpb0-6", "gpb0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	hs_i2c4_bus: hs-i2c4-bus {
> +		samsung,pins = "gpb1-0", "gpb1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	hs_i2c5_bus: hs-i2c5-bus {
> +		samsung,pins = "gpb1-2", "gpb1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	hs_i2c6_bus: hs-i2c6-bus {
> +		samsung,pins = "gpb1-4", "gpb1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	hs_i2c7_bus: hs-i2c7-bus {
> +		samsung,pins = "gpb1-6", "gpb1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	uart0_data: uart0-data {
> +		samsung,pins = "gpb7-0", "gpb7-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	uart1_data: uart1-data {
> +		samsung,pins = "gpb7-4", "gpb7-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	spi0_bus: spi0-bus {
> +		samsung,pins = "gpb4-0", "gpb4-2", "gpb4-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	spi1_bus: spi1-bus {
> +		samsung,pins = "gpb4-4", "gpb4-6", "gpb4-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +
> +	spi2_bus: spi2-bus {
> +		samsung,pins = "gpb5-0", "gpb5-2", "gpb5-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};
> +};
> +
> +&pinctrl_pmu {
> +

No need for empty line.

> +	gpq0: gpq0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};




Best regards,
Krzysztof
