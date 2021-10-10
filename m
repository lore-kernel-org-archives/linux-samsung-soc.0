Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E42C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 07:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E31761056
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 07:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJJHV0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 10 Oct 2021 03:21:26 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41442
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229697AbhJJHVZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Oct 2021 03:21:25 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4BE8A40013
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633850366;
        bh=Ic3GW4gOSsHpu/NsHMTbfjVwfCWWZa/S6KbhKViwbs4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=m1UgMTTeg2VxrSjHPlYT8XOhktZ43UTa5INy+yLKRZqEWGI45TFbWOmXn/yB2bJWm
         ZDvTxj+aIM+0yXt9Q6MJbY/NtycOr4iL8fAuNp/CT7c+mG+K9tN0cKYb5cBdTlt6DB
         OF9eHSgCMsj8KWEjQxxrgi/cKS2Yk5fGLrVX5U2qAOWOOvLitEpPzs+C5lF7/5vyRv
         9hXwR2H7IEdOpiulB58ORhMlf0BOoCCUzNjsTwZhjGTVT7iSm2StZfb67QKErWiHOT
         jTE14JCpQxExYzi4L05xcBvDEs2PCjOGM0Sv+cAp7hrRutoeIJKyQiZskzus5BfuYn
         bkq414plUFipg==
Received: by mail-ed1-f69.google.com with SMTP id h19-20020aa7de13000000b003db6ad5245bso4340682edv.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 00:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ic3GW4gOSsHpu/NsHMTbfjVwfCWWZa/S6KbhKViwbs4=;
        b=LTuZ22hvyjd7q697Hj6l6AOtI8GfwD11DQF3iaN85N09J9q+nJd7/3OzRomapH37B+
         tNLwYKRDfJ3NYz/akcCU68HFRwB7ooCJUuwerwkarjVCRxzm/QENQinV0whXzroR2wJE
         KUQSsVYkJoTPhPst6qa/tr9Lrr4wmnoynXevicn/Mebdy4SiNfkx6TArDUvwibSBmMl2
         lJHE2JZTMn3eeMWGDcbYf2iYanaRoO/78gPpVZuGo9Ztf6RnVBxR1MXcRYTdRsOyKHTE
         2pBrgajaUj0ox8y7jnu7n5lMzzJdp0xJUdmr/zC18x0cUvQTerFdHZo+bPtvLgz7Rg2E
         uubA==
X-Gm-Message-State: AOAM53179dVZoaGxa4bMGwmDBvWwEKdQTObcqR8adt1mD+YoiJzO1Ocv
        Tf2ABGjnFhNT/OqAaNj1OyIl/rDWTElaXM6yGctShWIZFNzG/F4Nuev8YkUKPvlOgMMTBMdo5mp
        aChO9zjgFutVhV0Bbrh6xuJcw4kS6mgaHC/zylt6epMu1UwAi
X-Received: by 2002:a05:6402:847:: with SMTP id b7mr30410103edz.242.1633850365766;
        Sun, 10 Oct 2021 00:19:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMLGbbBnzPJMFfSx8QyA314swpUvYWebtCE3jGVQ0ULdUt9ljOYJDSmlSmsledyJDAcAY4Ow==
X-Received: by 2002:a05:6402:847:: with SMTP id b7mr30410062edz.242.1633850365323;
        Sun, 10 Oct 2021 00:19:25 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d25sm2157020edt.51.2021.10.10.00.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 00:19:24 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] arm64: dts: exynos: add initial support for
 exynosautov9 SoC
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211010032246.146939-1-chanho61.park@samsung.com>
 <CGME20211010032456epcas2p29de8e098493cbe21a08db86d8253787e@epcas2p2.samsung.com>
 <20211010032246.146939-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c132d237-0104-da33-5e67-22b43eb5ffab@canonical.com>
Date:   Sun, 10 Oct 2021 09:19:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211010032246.146939-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/10/2021 05:22, Chanho Park wrote:
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
>  .../boot/dts/exynos/exynosautov9-pinctrl.dtsi | 1189 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  301 +++++
>  2 files changed, 1490 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> new file mode 100644
> index 000000000000..bef0942fd75b
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
> +	dp0_hpd: dp0-hpd-pins {
> +		samsung,pins = "gpa1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	dp1_hpd: dp1-hpd-pins {
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
> +	speedy0_bus: speedy0-bus-pins {
> +		samsung,pins = "gpq0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	speedy1_bus: speedy1-bus-pins {
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
> +	aud_codec_mclk: aud-codec-mclk-pins {
> +		samsung,pins = "gpb0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_codec_mclk_idle: aud-codec-mclk-idle-pins {
> +		samsung,pins = "gpb0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s0_bus: aud-i2s0-pins {
> +		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s0_idle: aud-i2s0-idle-pins {
> +		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s1_bus: aud-i2s1-pins {
> +		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s1_idle: aud-i2s1-idle-pins {
> +		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s2_bus: aud-i2s2-pins {
> +		samsung,pins = "gpb1-4", "gpb1-5", "gpb1-6", "gpb1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s2_idle: aud-i2s2-idle-pins {
> +		samsung,pins = "gpb1-4", "gpb1-5", "gpb1-6", "gpb1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s3_bus: aud-i2s3-pins {
> +		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s3_idle: aud-i2s3-idle-pins {
> +		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s4_bus: aud-i2s4-pins {
> +		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6", "gpb2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s4_idle: aud-i2s4-idle-pins {
> +		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6", "gpb2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s5_bus: aud-i2s5-pins {
> +		samsung,pins = "gpb3-0", "gpb3-1", "gpb3-2", "gpb3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s5_idle: aaud-i2s5-idle-pins {
> +		samsung,pins = "gpb3-0", "gpb3-1", "gpb3-2", "gpb3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s6_bus: aud-i2s6-pins {
> +		samsung,pins = "gpb3-4", "gpb3-5", "gpb3-6", "gpb3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s6_idle: aaud-i2s6-idle-pins {
> +		samsung,pins = "gpb3-4", "gpb3-5", "gpb3-6", "gpb3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +};
> +
> +&pinctrl_fsys0 {
> +	gpf0: gpf0 {
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
> +	pcie_clkreq0: pcie-clkreq0-pins {
> +		samsung,pins = "gpf0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst0_out: pcie-perst0-out-pins {
> +		samsung,pins = "gpf0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst0_in: pcie-perst0-in-pins {
> +		samsung,pins = "gpf0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq1: pcie-clkreq1-pins {
> +		samsung,pins = "gpf0-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst1_out: pcie-perst1-out-pins {
> +		samsung,pins = "gpf0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst1_in: pcie-perst1-in-pins {
> +		samsung,pins = "gpf0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq2: pcie-clkreq2-pins {
> +		samsung,pins = "gpf0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst2_out: pcie-perst2-out-pins {
> +		samsung,pins = "gpf0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst2_in: pcie-perst2-in-pins {
> +		samsung,pins = "gpf0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq3: pcie-clkreq3-pins {
> +		samsung,pins = "gpf1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst3_out: pcie-perst3-out-pins {
> +		samsung,pins = "gpf1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst3_in: pcie-perst3-in-pins {
> +		samsung,pins = "gpf1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq4: pcie-clkreq4-pins {
> +		samsung,pins = "gpf1-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst4_out: pcie-perst4-out-pins {
> +		samsung,pins = "gpf1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst4_in: pcie-perst4-in-pins {
> +		samsung,pins = "gpf1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq5: pcie-clkreq5-pins {
> +		samsung,pins = "gpf1-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst5_out: pcie-perst5-out-pins {
> +		samsung,pins = "gpf1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst5_in: pcie-perst5-in-pins {
> +		samsung,pins = "gpf1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +};
> +
> +&pinctrl_fsys1 {
> +	gpf8: gpf8 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	sd2_clk: sd2-clk-pins {
> +		samsung,pins = "gpf8-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <2>;	/* 2x drive strength */
> +	};
> +
> +	sd2_cmd: sd2-cmd-pins {
> +		samsung,pins = "gpf8-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <2>;	/* 2x drive strength */
> +	};
> +
> +	sd2_bus1: sd2-bus-width1-pins {
> +		samsung,pins = "gpf8-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <2>;	/* 2x drive strength */
> +	};
> +
> +	sd2_bus4: sd2-bus-width4-pins {
> +		samsung,pins = "gpf8-3", "gpf8-4", "gpf8-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <2>;	/* 2x drive strength */
> +	};
> +};
> +
> +&pinctrl_fsys2 {
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
> +
> +	gpf6: gpf6 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	ufs_rst_n: ufs-rst-n-pins {
> +		samsung,pins = "gpf2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	ufs_refclk_out: ufs-refclk-out-pins {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	ufs_rst_n_1: ufs-rst-n-1-pins {
> +		samsung,pins = "gpf2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	ufs_refclk_out_1: ufs-refclk-out-1-pins {
> +		samsung,pins = "gpf2-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	eth0_mdc_mdio: eth0-mdc-mdio-pins {
> +		samsung,pins = "gpf4-5", "gpf4-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	eth0_rgmii: eth0-rgmii-pins {
> +		samsung,pins = "gpf3-1", "gpf3-2", "gpf3-3", "gpf3-4",
> +			       "gpf3-5", "gpf3-6", "gpf3-7", "gpf4-0",
> +			       "gpf4-1", "gpf4-2", "gpf4-3", "gpf4-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	eth0_pps_out: eth0-pps-out-pins {
> +		samsung,pins = "gpf3-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	eth1_mdc_mdio: eth1-mdc-mdio-pins {
> +		samsung,pins = "gpf6-5", "gpf6-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	eth1_rgmii: eth1-rgmii-pins {
> +		samsung,pins = "gpf5-1", "gpf5-2", "gpf5-3", "gpf5-4",
> +			       "gpf5-5", "gpf5-6", "gpf5-7", "gpf6-0",
> +			       "gpf6-1", "gpf6-2", "gpf6-3", "gpf6-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	eth1_pps_out: eth1-pps-out-pins {
> +		samsung,pins = "gpf5-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +};
> +
> +&pinctrl_peric0 {
> +	gpp0: gpp0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpp1: gpp1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpp2: gpp2 {
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
> +	pwm_tout0: pwm-tout0-pins {
> +		samsung,pins = "gpg0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	pwm_tout1: pwm-tout1-pins {
> +		samsung,pins = "gpg0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	pwm_tout2: pwm-tout2-pins {
> +		samsung,pins = "gpg0-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	pwm_tout3: pwm-tout3-pins {
> +		samsung,pins = "gpg0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI00  */
> +	hsi2c0_bus: hsi2c0-bus-pins {
> +		samsung,pins = "gpp0-0", "gpp0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI00_I2C */
> +	hsi2c1_bus: hsi2c1-bus-pins {
> +		samsung,pins = "gpp0-2", "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI01 */
> +	hsi2c2_bus_pins: hsi2c2-bus-pins {

Still _pins in the label.

> +		samsung,pins = "gpp0-4", "gpp0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI01_I2C */
> +	hsi2c3_bus_pins: hsi2c3-bus-pins {

Ditto.

> +		samsung,pins = "gpp0-6", "gpp0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI02 */
> +	hsi2c4_bus: hsi2c4-bus-pins {
> +		samsung,pins = "gpp1-0", "gpp1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI02_I2C */
> +	hsi2c5_bus: hsi2c5-bus-pins {
> +		samsung,pins = "gpp1-2", "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI03 */
> +	hsi2c6_bus: hsi2c6-bus-pins {
> +		samsung,pins = "gpp1-4", "gpp1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI03_I2C */
> +	hsi2c7_bus: hsi2c7-bus-pins {
> +		samsung,pins = "gpp1-6", "gpp1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI04 */
> +	hsi2c8_bus: hsi2c8-bus-pins {
> +		samsung,pins = "gpp2-0", "gpp2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI04_I2C */
> +	hsi2c9_bus: hsi2c9-bus-pins {
> +		samsung,pins = "gpp2-2", "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI05 */
> +	hsi2c10_bus: hsi2c10-bus-pins {
> +		samsung,pins = "gpp2-4", "gpp2-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI05_I2C */
> +	hsi2c11_bus: hsi2c11-bus-pins {
> +		samsung,pins = "gpp2-6", "gpp2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* SPI USI_PERIC0_USI00_SPI */
> +	spi0_bus: spi0-bus-pins {
> +		samsung,pins = "gpp0-2", "gpp0-1", "gpp0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi0_cs: spi0-cs-pins {
> +		samsung,pins = "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi0_cs_func: spi0-cs-func-pins {
> +		samsung,pins = "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI01_SPI */
> +	spi1_bus: spi1-bus-pins {
> +		samsung,pins = "gpp0-6", "gpp0-5", "gpp0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi1_cs: spi1-cs-pins {
> +		samsung,pins = "gpp0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi1_cs_func: spi1-cs-func-pins {
> +		samsung,pins = "gpp0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI02_SPI */
> +	spi2_bus: spi2-bus-pins {
> +		samsung,pins = "gpp1-2", "gpp1-1", "gpp1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi2_cs: spi2-cs-pins {
> +		samsung,pins = "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi2_cs_func: spi2-cs-func-pins {
> +		samsung,pins = "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI03_SPI */
> +	spi3_bus: spi3-bus-pins {
> +		samsung,pins = "gpp1-6", "gpp1-5", "gpp1-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi3_cs: spi3-cs-pins {
> +		samsung,pins = "gpp1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi3_cs_func: spi3-cs-func-pins {
> +		samsung,pins = "gpp1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI04_SPI */
> +	spi4_bus: spi4-bus-pins {
> +		samsung,pins = "gpp2-2", "gpp2-1", "gpp2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi4_cs: spi4-cs-pins {
> +		samsung,pins = "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi4_cs_func: spi4-cs-func-pins {
> +		samsung,pins = "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI05_SPI */
> +	spi5_bus: spi5-bus-pins {
> +		samsung,pins = "gpp2-6", "gpp2-5", "gpp2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi5_cs: spi5-cs-pins {
> +		samsung,pins = "gpp2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi5_cs_func: spi5-cs-func-pins {
> +		samsung,pins = "gpp2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI00_UART */
> +	uart0_bus: uart0-bus-pins {
> +		samsung,pins = "gpp0-0", "gpp0-1", "gpp0-2", "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart0_bus_dual: uart0-bus-dual-pins {
> +		samsung,pins = "gpp0-0", "gpp0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI01_UART */
> +	uart1_bus: uart1-bus-pins {
> +		samsung,pins = "gpp0-4", "gpp0-5", "gpp0-6", "gpp0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart1_bus_dual: uart1-bus-dual-pins {
> +		samsung,pins = "gpp0-4", "gpp0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI02_UART */
> +	uart2_bus: uart2-bus-pins {
> +		samsung,pins = "gpp1-0", "gpp1-1", "gpp1-2", "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart2_bus_dual: uart2-bus-dual-pins {
> +		samsung,pins = "gpp1-0", "gpp1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI03_UART */
> +	uart3_bus: uart3-bus-pins {
> +		samsung,pins = "gpp1-4", "gpp1-5", "gpp1-6", "gpp1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart3_bus_dual: uart3-bus-dual-pins {
> +		samsung,pins = "gpp1-4", "gpp1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI04_UART */
> +	uart4_bus: uart4-bus-pins {
> +		samsung,pins = "gpp2-0", "gpp2-1", "gpp2-2", "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart4_bus_dual: uart4-bus-dual-pins {
> +		samsung,pins = "gpp2-0", "gpp2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI05_UART */
> +	uart5_bus: uart5-bus-pins {
> +		samsung,pins = "gpp2-4", "gpp2-5", "gpp2-6", "gpp2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart5_bus_dual: uart5-bus-dual-pins {
> +		samsung,pins = "gpp2-4", "gpp2-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +};
> +
> +&pinctrl_peric1 {
> +	gpp3: gpp3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpp4: gpp4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpp5: gpp5 {
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
> +	/* PERIC1 USI06 */
> +	hsi2c12_bus: hsi2c12-bus-pins {
> +		samsung,pins = "gpp3-0", "gpp3-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI06_I2C */
> +	hsi2c13_bus: hsi2c13-bus-pins {
> +		samsung,pins = "gpp3-2", "gpp3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI07 */
> +	hsi2c14_bus: hsi2c14-bus-pins {
> +		samsung,pins = "gpp3-4", "gpp3-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI07_I2C */
> +	hsi2c15_bus: hsi2c15-bus-pins {
> +		samsung,pins = "gpp3-6", "gpp3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI08 */
> +	hsi2c16_bus: hsi2c16-bus-pins {
> +		samsung,pins = "gpp4-0", "gpp4-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI08_I2C */
> +	hsi2c17_bus: hsi2c17-bus-pins {
> +		samsung,pins = "gpp4-2", "gpp4-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI09 */
> +	hsi2c18_bus: hsi2c18-bus-pins {
> +		samsung,pins = "gpp4-4", "gpp4-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI09_I2C */
> +	hsi2c19_bus: hsi2c19-bus-pins {
> +		samsung,pins = "gpp4-6", "gpp4-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI10 */
> +	hsi2c20_bus: hsi2c20-bus-pins {
> +		samsung,pins = "gpp5-0", "gpp5-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI10_I2C */
> +	hsi2c21_bus: hsi2c21-bus-pins {
> +		samsung,pins = "gpp5-2", "gpp5-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI11 */
> +	hsi2c22_bus: hsi2c22-bus-pins {
> +		samsung,pins = "gpp5-4", "gpp5-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI11_I2C */
> +	hsi2c23_bus: hsi2c23-bus-pins {
> +		samsung,pins = "gpp5-6", "gpp5-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI06_SPI */
> +	spi6_bus: spi6-bus-pins {
> +		samsung,pins = "gpp3-2", "gpp3-1", "gpp3-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi6_cs: spi6-cs-pins {
> +		samsung,pins = "gpp3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi6_cs_func: spi6-cs-func-pins {
> +		samsung,pins = "gpp3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI07_SPI */
> +	spi7_bus: spi7-bus-pins {
> +		samsung,pins = "gpp3-6", "gpp3-5", "gpp3-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi7_cs: spi7-cs-pins {
> +		samsung,pins = "gpp3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi7_cs_func: spi7-cs-func-pins {
> +		samsung,pins = "gpp3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI08_SPI */
> +	spi8_bus: spi8-bus-pins {
> +		samsung,pins = "gpp4-2", "gpp4-1", "gpp4-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi8_cs: spi8-cs-pins {
> +		samsung,pins = "gpp4-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi8_cs_func: spi8-cs-func-pins {
> +		samsung,pins = "gpp4-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI09_SPI */
> +	spi9_bus: spi9-bus-pins {
> +		samsung,pins = "gpp4-6", "gpp4-5", "gpp4-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi9_cs: spi9-cs-pins {
> +		samsung,pins = "gpp4-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi9_cs_func: spi9-cs-func-pins {
> +		samsung,pins = "gpp4-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI10_SPI */
> +	spi10_pins: spi10-pins {

Ditto

> +		samsung,pins = "gpp5-2", "gpp5-1", "gpp5-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi10_cs: spi10-cs-pins {
> +		samsung,pins = "gpp5-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi10_cs_func: spi10-cs-func-pins {
> +		samsung,pins = "gpp5-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI11_SPI */
> +	spi11_pins: spi11-pins {

Ditto.

Rest looks good, so I can fix it while applying. No need to resend,
unless there will be other comments.

Best regards,
Krzysztof
