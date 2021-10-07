Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097F4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 18:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C22C260F4C
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 18:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243591AbhJGSYO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:24:14 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51658
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233748AbhJGSYN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 14:24:13 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CA5B73FFE9
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633630938;
        bh=ODKq5aimNd2jH4NWksCXmWM0rFQ81Z+Zt7rYPQBJ1m8=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=nY2f616j0EGBEgLZEpVkqhAsmkEx3Yi55rTT8iqviBT0tXgxuEg4ddcFrY4weOot1
         PLe3s1MpIyNnxKfya+SaXDDm4Wj+w+VhN+rVgPsoZMwjJ6eSgCMhp6gzcktyKOlig/
         IPUeFMIm9QitowLP0rFfXHkfaMUXLFXE7suYoYWoPG2mEXG8ljdGwNQ4499K/h9dhX
         P2h+Av+Ff3RphB8HiI/qFt/Hf+NooDyVfCU7TKIcC2/3sk8Bh2IcvXUl9ZfKFboISp
         TrE308+YhVazPMCkv3BH8Rz2W5GrU/o7E1z38HJK+s/RTOSUftuaf9RGrGUvI+Z1Mw
         9LkoU0WfW/mMw==
Received: by mail-wr1-f72.google.com with SMTP id v15-20020adfa1cf000000b00160940b17a2so5366758wrv.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 11:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ODKq5aimNd2jH4NWksCXmWM0rFQ81Z+Zt7rYPQBJ1m8=;
        b=nvm10UVuERR/pQyAncdbefJAutOMj8eYcir84tT1vP89MBvWQFzgW9HnMgibsfNbhA
         M3ZkWYCzz7Vw5fU0qT7VPDUxSopN/vDsTo4IhNfFaAdIDv8C3tPcQ3kvIhJBvB2Eedan
         yF7B1dzIQvNBTUhlo6Vxu/8tP4kI9HJOIy2JBVX9nqibtWP+CbtrM7AgFu8D0L0s+lGX
         rb2ErUcdfY9HcJgGO/0xBlVPImXPyfs54Xovzzj/fpWwqHeed5ckqifOKitFJchZbfUg
         sU0o0MnSFpc3OX2xzdgZTH2yi8iJwERPB4fjN7/kNSk7a+ChnnKW8xw4Ur8wwyfnLRDj
         VLvA==
X-Gm-Message-State: AOAM532Rr5WKhuMde0pKHgR+ke44yNS/wKoZCmi1jSesAvmiScEIRUUi
        wGg5CjRfuieX0FyVj1ekXTkpEws2WTocSfmZT6sYMo9n/xZEbFU3UOfwCnQUtwKDMzA7oLWLLS2
        0/YekYlTf4sNPvDRF6JmQCAAr6/9HU5UjLnJb4BsLNHfJGKHz
X-Received: by 2002:adf:9147:: with SMTP id j65mr7330183wrj.163.1633630936673;
        Thu, 07 Oct 2021 11:22:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+MNNovnrStlye5RBJN6ZjdMlhmZXde6LEXFDYvfZMAPZwhLiPgK774S3sVt/64BWfbxXSeA==
X-Received: by 2002:adf:9147:: with SMTP id j65mr7330140wrj.163.1633630936202;
        Thu, 07 Oct 2021 11:22:16 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id d2sm105565wrc.32.2021.10.07.11.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 11:22:15 -0700 (PDT)
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211007120855.56555-1-chanho61.park@samsung.com>
 <CGME20211007121055epcas2p235ccb59d72521ff65ba1bcc6af6723a3@epcas2p2.samsung.com>
 <20211007120855.56555-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 2/3] arm64: dts: exynos: add initial support for
 exynosautov9 SoC
Message-ID: <e01f7ae1-bc46-311a-8b37-bd3da9afd464@canonical.com>
Date:   Thu, 7 Oct 2021 20:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007120855.56555-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/10/2021 14:08, Chanho Park wrote:
> Add minimal support for ExynosAuto v9 SoC[1].
> 
> - Enumarate all pinctrl nodes
> - UART with exynos850 compatible
> - UFS0 HCI + Phy
> 
> Like exynos850, this also uses fixed-rate clock nodes until clock driver
> has been supported. The clock nodes are initialized on bootloader stage
> thus we don't need to contol them so far.

Thanks for the patch.

s/contol/control/

> 
> [1]: https://www.samsung.com/semiconductor/minisite/exynos/products/automotiveprocessor/exynos-auto-v9/>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../boot/dts/exynos/exynosautov9-pinctrl.dtsi | 1206 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  290 ++++
>  2 files changed, 1496 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> new file mode 100644
> index 000000000000..d8c5210ddba4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> @@ -0,0 +1,1206 @@
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
> +	dp0_hpd: dp0-hpd {

Suffix all node names with pin configuration with "-pins", just like Rob
suggested for Exynos850.
https://lore.kernel.org/linux-samsung-soc/YRwDETpe019RFU%2Fq@robh.at.kernel.org/

> +		samsung,pins = "gpa1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	dp1_hpd: dp10hpd {

Typo - dp1-hpd

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
> +	speedy0_bus: speedy0-bus {
> +		samsung,pins = "gpq0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	speedy1_bus: speedy1-bus {
> +		samsung,pins = "gpa0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pmic_m_irq: pmic-m-irq {

This does not look like typical pin for SoC. Should be in board DTS.

> +		samsung,pins = "gpa0-1";
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
> +	};
> +
> +	pmic_s_irq: pmic-s-irq {
> +		samsung,pins = "gpa0-7";
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
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
> +	aud_codec_mclk: aud-codec-mclk {
> +		samsung,pins = "gpb0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_codec_mclk_idle: aud-codec-mclk-idle {
> +		samsung,pins = "gpb0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s0_bus: aud-i2s0-bus {
> +		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s0_idle: aud-i2s0-idle {
> +		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s1_bus: aud-i2s1-bus {
> +		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s1_idle: aud-i2s1-idle {
> +		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s2_bus: aud-i2s2-bus {
> +		samsung,pins = "gpb1-4", "gpb1-5", "gpb1-6", "gpb1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s2_idle: aud-i2s2-idle {
> +		samsung,pins = "gpb1-4", "gpb1-5", "gpb1-6", "gpb1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s3_bus: aud-i2s3-bus {
> +		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s3_idle: aud-i2s3-idle {
> +		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s4_bus: aud-i2s4-bus {
> +		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6", "gpb2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s4_idle: aud-i2s4-idle {
> +		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6", "gpb2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s5_bus: aud-i2s5-bus {
> +		samsung,pins = "gpb3-0", "gpb3-1", "gpb3-2", "gpb3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s5_idle: aaud-i2s5-idle {
> +		samsung,pins = "gpb3-0", "gpb3-1", "gpb3-2", "gpb3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s6_bus: aud-i2s6-bus {
> +		samsung,pins = "gpb3-4", "gpb3-5", "gpb3-6", "gpb3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s6_idle: aaud-i2s6-idle {
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
> +	pcie_clkreq0: pcie_clkreq0 {

Hyphens (-) for node names. Pluse prefix -pins.

> +		samsung,pins = "gpf0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst0_out: pcie_perst0_out {
> +		samsung,pins = "gpf0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst0_in: pcie_perst0_in {
> +		samsung,pins = "gpf0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq1: pcie_clkreq1 {
> +		samsung,pins = "gpf0-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst1_out: pcie_perst1_out {
> +		samsung,pins = "gpf0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst1_in: pcie_perst1_in {
> +		samsung,pins = "gpf0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq2: pcie_clkreq2 {
> +		samsung,pins = "gpf0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst2_out: pcie_perst2_out {
> +		samsung,pins = "gpf0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst2_in: pcie_perst2_in {
> +		samsung,pins = "gpf0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq3: pcie_clkreq3 {
> +		samsung,pins = "gpf1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst3_out: pcie_perst3_out {
> +		samsung,pins = "gpf1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst3_in: pcie_perst3_in {
> +		samsung,pins = "gpf1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq4: pcie_clkreq4 {
> +		samsung,pins = "gpf1-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst4_out: pcie_perst4_out {
> +		samsung,pins = "gpf1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst4_in: pcie_perst4_in {
> +		samsung,pins = "gpf1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_clkreq5: pcie_clkreq5 {
> +		samsung,pins = "gpf1-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	pcie_perst5_out: pcie_perst5_out {
> +		samsung,pins = "gpf1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	pcie_perst5_in: pcie_perst5_in {
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
> +	sd2_clk: sd2-clk {
> +		samsung,pins = "gpf8-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <2>;	/* 2x drive strength */
> +	};
> +
> +	sd2_cmd: sd2-cmd {
> +		samsung,pins = "gpf8-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <2>;	/* 2x drive strength */
> +	};
> +
> +	sd2_bus1: sd2-bus-width1 {
> +		samsung,pins = "gpf8-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <2>;	/* 2x drive strength */
> +	};
> +
> +	sd2_bus4: sd2-bus-width4 {
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
> +	ufs_rst_n: ufs-rst-n {
> +		samsung,pins = "gpf2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	ufs_refclk_out: ufs-refclk-out {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	ufs_rst_n_1: ufs-rst-n-1 {
> +		samsung,pins = "gpf2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	ufs_refclk_out_1: ufs-refclk-out-1 {
> +		samsung,pins = "gpf2-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +
> +	eth0_mdc_mdio: eth0_mdc_mdio {
> +		samsung,pins = "gpf4-5", "gpf4-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	eth0_rgmii: eth0_rgmii {
> +		samsung,pins = "gpf3-1", "gpf3-2", "gpf3-3", "gpf3-4",
> +			       "gpf3-5", "gpf3-6", "gpf3-7", "gpf4-0",
> +			       "gpf4-1", "gpf4-2", "gpf4-3", "gpf4-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	eth0_pps_out: eth0_pps_out {
> +		samsung,pins = "gpf3-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	eth1_mdc_mdio: eth1_mdc_mdio {
> +		samsung,pins = "gpf6-5", "gpf6-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	eth1_rgmii: eth1_rgmii {
> +		samsung,pins = "gpf5-1", "gpf5-2", "gpf5-3", "gpf5-4",
> +			       "gpf5-5", "gpf5-6", "gpf5-7", "gpf6-0",
> +			       "gpf6-1", "gpf6-2", "gpf6-3", "gpf6-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +	};
> +
> +	eth1_pps_out: eth1_pps_out {
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
> +	pwm_tout0: pwm-tout0 {
> +		samsung,pins = "gpg0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	pwm_tout1: pwm-tout1 {
> +		samsung,pins = "gpg0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	pwm_tout2: pwm-tout2 {
> +		samsung,pins = "gpg0-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	pwm_tout3: pwm-tout3 {
> +		samsung,pins = "gpg0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI00  */
> +	hsi2c0_bus: hsi2c0-bus {
> +		samsung,pins = "gpp0-0", "gpp0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI00_I2C */
> +	hsi2c1_bus: hsi2c1-bus {
> +		samsung,pins = "gpp0-2", "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI01 */
> +	hsi2c2_bus: hsi2c2-bus {
> +		samsung,pins = "gpp0-4", "gpp0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI01_I2C */
> +	hsi2c3_bus: hsi2c3-bus {
> +		samsung,pins = "gpp0-6", "gpp0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI02 */
> +	hsi2c4_bus: hsi2c4-bus {
> +		samsung,pins = "gpp1-0", "gpp1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI02_I2C */
> +	hsi2c5_bus: hsi2c5-bus {
> +		samsung,pins = "gpp1-2", "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI03 */
> +	hsi2c6_bus: hsi2c6-bus {
> +		samsung,pins = "gpp1-4", "gpp1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI03_I2C */
> +	hsi2c7_bus: hsi2c7-bus {
> +		samsung,pins = "gpp1-6", "gpp1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI04 */
> +	hsi2c8_bus: hsi2c8-bus {
> +		samsung,pins = "gpp2-0", "gpp2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI04_I2C */
> +	hsi2c9_bus: hsi2c9-bus {
> +		samsung,pins = "gpp2-2", "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI05 */
> +	hsi2c10_bus: hsi2c10-bus {
> +		samsung,pins = "gpp2-4", "gpp2-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI05_I2C */
> +	hsi2c11_bus: hsi2c11-bus {
> +		samsung,pins = "gpp2-6", "gpp2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* SPI USI_PERIC0_USI00_SPI */
> +	spi0_bus: spi0-bus {
> +		samsung,pins = "gpp0-2", "gpp0-1", "gpp0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi0_cs: spi0-cs {
> +		samsung,pins = "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi0_cs_func: spi0-cs-func {
> +		samsung,pins = "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI01_SPI */
> +	spi1_bus: spi1-bus {
> +		samsung,pins = "gpp0-6", "gpp0-5", "gpp0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi1_cs: spi1-cs {
> +		samsung,pins = "gpp0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi1_cs_func: spi1-cs-func {
> +		samsung,pins = "gpp0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI02_SPI */
> +	spi2_bus: spi2-bus {
> +		samsung,pins = "gpp1-2", "gpp1-1", "gpp1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi2_cs: spi2-cs {
> +		samsung,pins = "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi2_cs_func: spi2-cs-func {
> +		samsung,pins = "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI03_SPI */
> +	spi3_bus: spi3-bus {
> +		samsung,pins = "gpp1-6", "gpp1-5", "gpp1-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi3_cs: spi3-cs {
> +		samsung,pins = "gpp1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi3_cs_func: spi3-cs-func {
> +		samsung,pins = "gpp1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI04_SPI */
> +	spi4_bus: spi4-bus {
> +		samsung,pins = "gpp2-2", "gpp2-1", "gpp2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi4_cs: spi4-cs {
> +		samsung,pins = "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi4_cs_func: spi4-cs-func {
> +		samsung,pins = "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* PERIC0 USI05_SPI */
> +	spi5_bus: spi5-bus {
> +		samsung,pins = "gpp2-6", "gpp2-5", "gpp2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi5_cs: spi5-cs {
> +		samsung,pins = "gpp2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	spi5_cs_func: spi5-cs-func {
> +		samsung,pins = "gpp2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI00_UART */
> +	uart0_bus_single: uart0-bus {
> +		samsung,pins = "gpp0-0", "gpp0-1", "gpp0-2", "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart0_bus_dual: uart0-bus-dual {
> +		samsung,pins = "gpp0-0", "gpp0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI01_UART */
> +	uart1_bus_single: uart1-bus {
> +		samsung,pins = "gpp0-4", "gpp0-5", "gpp0-6", "gpp0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart1_bus_dual: uart1-bus-dual {
> +		samsung,pins = "gpp0-4", "gpp0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI02_UART */
> +	uart2_bus_single: uart2-bus {
> +		samsung,pins = "gpp1-0", "gpp1-1", "gpp1-2", "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart2_bus_dual: uart2-bus-dual {
> +		samsung,pins = "gpp1-0", "gpp1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI03_UART */
> +	uart3_bus_single: uart3-bus {
> +		samsung,pins = "gpp1-4", "gpp1-5", "gpp1-6", "gpp1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart3_bus_dual: uart3-bus-dual {
> +		samsung,pins = "gpp1-4", "gpp1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI04_UART */
> +	uart4_bus_single: uart4-bus {
> +		samsung,pins = "gpp2-0", "gpp2-1", "gpp2-2", "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart4_bus_dual: uart4-bus-dual {
> +		samsung,pins = "gpp2-0", "gpp2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC0_USI05_UART */
> +	uart5_bus_single: uart5-bus {
> +		samsung,pins = "gpp2-4", "gpp2-5", "gpp2-6", "gpp2-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart5_bus_dual: uart5-bus-dual {
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
> +	hsi2c12_bus: hsi2c12-bus {
> +		samsung,pins = "gpp3-0", "gpp3-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI06_I2C */
> +	hsi2c13_bus: hsi2c13-bus {
> +		samsung,pins = "gpp3-2", "gpp3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI07 */
> +	hsi2c14_bus: hsi2c14-bus {
> +		samsung,pins = "gpp3-4", "gpp3-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI07_I2C */
> +	hsi2c15_bus: hsi2c15-bus {
> +		samsung,pins = "gpp3-6", "gpp3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI08 */
> +	hsi2c16_bus: hsi2c16-bus {
> +		samsung,pins = "gpp4-0", "gpp4-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI08_I2C */
> +	hsi2c17_bus: hsi2c17-bus {
> +		samsung,pins = "gpp4-2", "gpp4-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI09 */
> +	hsi2c18_bus: hsi2c18-bus {
> +		samsung,pins = "gpp4-4", "gpp4-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI09_I2C */
> +	hsi2c19_bus: hsi2c19-bus {
> +		samsung,pins = "gpp4-6", "gpp4-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI10 */
> +	hsi2c20_bus: hsi2c20-bus {
> +		samsung,pins = "gpp5-0", "gpp5-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI10_I2C */
> +	hsi2c21_bus: hsi2c21-bus {
> +		samsung,pins = "gpp5-2", "gpp5-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI11 */
> +	hsi2c22_bus: hsi2c22-bus {
> +		samsung,pins = "gpp5-4", "gpp5-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI11_I2C */
> +	hsi2c23_bus: hsi2c23-bus {
> +		samsung,pins = "gpp5-6", "gpp5-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI06_SPI */
> +	spi6_bus: spi6-bus {
> +		samsung,pins = "gpp3-2", "gpp3-1", "gpp3-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi6_cs: spi6-cs {
> +		samsung,pins = "gpp3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi6_cs_func: spi6-cs-func {
> +		samsung,pins = "gpp3-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI07_SPI */
> +	spi7_bus: spi7-bus {
> +		samsung,pins = "gpp3-6", "gpp3-5", "gpp3-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi7_cs: spi7-cs {
> +		samsung,pins = "gpp3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi7_cs_func: spi7-cs-func {
> +		samsung,pins = "gpp3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI08_SPI */
> +	spi8_bus: spi8-bus {
> +		samsung,pins = "gpp4-2", "gpp4-1", "gpp4-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi8_cs: spi8-cs {
> +		samsung,pins = "gpp4-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi8_cs_func: spi8-cs-func {
> +		samsung,pins = "gpp4-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI09_SPI */
> +	spi9_bus: spi9-bus {
> +		samsung,pins = "gpp4-6", "gpp4-5", "gpp4-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi9_cs: spi9-cs {
> +		samsung,pins = "gpp4-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi9_cs_func: spi9-cs-func {
> +		samsung,pins = "gpp4-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI10_SPI */
> +	spi10_bus: spi10-bus {
> +		samsung,pins = "gpp5-2", "gpp5-1", "gpp5-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi10_cs: spi10-cs {
> +		samsung,pins = "gpp5-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi10_cs_func: spi10-cs-func {
> +		samsung,pins = "gpp5-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* PERIC1 USI11_SPI */
> +	spi11_bus: spi11-bus {
> +		samsung,pins = "gpp3-6", "gpp3-5", "gpp3-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi11_cs: spi11-cs {
> +		samsung,pins = "gpp3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	spi11_cs_func: spi11-cs-func {
> +		samsung,pins = "gpp3-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	/* USI_PERIC1_USI06_UART */
> +	uart6_bus_single: uart6-bus {
> +		samsung,pins = "gpp3-3", "gpp3-2", "gpp3-1", "gpp3-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart6_bus_dual: uart6-bus-dual {
> +		samsung,pins = "gpp3-0", "gpp3-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC1_USI07_UART */
> +	uart7_bus_single: uart7-bus {
> +		samsung,pins = "gpp3-7", "gpp3-6", "gpp3-5", "gpp3-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart7_bus_dual: uart7-bus-dual {
> +		samsung,pins = "gpp3-4", "gpp3-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC1_USI08_UART */
> +	uart8_bus_single: uart8-bus {
> +		samsung,pins = "gpp4-3", "gpp4-2", "gpp4-1", "gpp4-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart8_bus_dual: uart8-bus-dual {
> +		samsung,pins = "gpp4-0", "gpp4-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC1_USI09_UART */
> +	uart9_bus_single: uart9-bus {
> +		samsung,pins = "gpp4-7", "gpp4-6", "gpp4-5", "gpp4-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart9_bus_dual: uart9-bus-dual {
> +		samsung,pins = "gpp4-4", "gpp4-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC1_USI10_UART */
> +	uart10_bus_single: uart10-bus {
> +		samsung,pins = "gpp5-3", "gpp5-2", "gpp5-1", "gpp5-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart10_bus_dual: uart10-bus-dual {
> +		samsung,pins = "gpp5-0", "gpp5-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_PERIC1_USI11_UART */
> +	uart11_bus_single: uart11-bus {
> +		samsung,pins = "gpp5-7", "gpp5-6", "gpp5-5", "gpp5-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart11_bus_dual: uart11-bus-dual {
> +		samsung,pins = "gpp5-4", "gpp5-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	pm_wrsti: pm-wrsti {
> +		samsung,pins = "gpg2-3";
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> new file mode 100644
> index 000000000000..a74fb7785bb3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's ExynosAuto9 SoC device tree source
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "samsung,exynosautov9";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		pinctrl0 = &pinctrl_alive;
> +		pinctrl1 = &pinctrl_aud;
> +		pinctrl2 = &pinctrl_fsys0;
> +		pinctrl3 = &pinctrl_fsys1;
> +		pinctrl4 = &pinctrl_fsys2;
> +		pinctrl5 = &pinctrl_peric0;
> +		pinctrl6 = &pinctrl_peric1;
> +	};
> +
> +	arm-pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> +				     <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +				core2 {
> +					cpu = <&cpu6>;
> +				};
> +				core3 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@000000 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";

Compatible is not specific enough. It's valid only for SW models. You
must define here proper Cortex or some other type.

> +			reg = <0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@000100 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@000200 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@000300 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu4: cpu@10000 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x10000>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu5: cpu@10100 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x10100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu6: cpu@10200 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x10200>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu7: cpu@10300 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x10300>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +		cpu_suspend = <0xC4000001>;
> +		cpu_off = <0x84000002>;
> +		cpu_on = <0xC4000003>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x20000000>;
> +
> +		gic: interrupt-controller@11001000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0x10101000 0x1000>,
> +			      <0x10102000 0x2000>,
> +			      <0x10104000 0x2000>,
> +			      <0x10106000 0x2000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
> +						 IRQ_TYPE_LEVEL_HIGH)>;
> +		};
> +
> +		pinctrl_alive: pinctrl@10450000 {
> +			compatible = "samsung,exynosautov9-pinctrl";
> +			reg = <0x10450000 0x1000>;
> +
> +			wakeup-interrupt-controller {
> +				compatible = "samsung,exynos7-wakeup-eint";
> +			};
> +		};
> +
> +		pinctrl_aud: pinctrl@19C60000{

Some of the addresses (unit address and reg) have uppercase hex, some
lowercase. Please unify to lowercase.

> +			compatible = "samsung,exynosautov9-pinctrl";
> +			reg = <0x19C60000 0x1000>;
> +		};
> +
> +		pinctrl_fsys0: pinctrl@17740000 {
> +			compatible = "samsung,exynosautov9-pinctrl";
> +			reg = <0x17740000 0x1000>;
> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_fsys1: pinctrl@17060000 {
> +			compatible = "samsung,exynosautov9-pinctrl";
> +			reg = <0x17060000 0x1000>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_fsys2: pinctrl@17C30000 {
> +			compatible = "samsung,exynosautov9-pinctrl";
> +			reg = <0x17C30000 0x1000>;
> +			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_peric0: pinctrl@10230000 {
> +			compatible = "samsung,exynosautov9-pinctrl";
> +			reg = <0x10230000 0x1000>;
> +			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_peric1: pinctrl@10830000 {
> +			compatible = "samsung,exynosautov9-pinctrl";
> +			reg = <0x10830000 0x1000>;
> +			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pmu_system_controller: system-controller@10460000 {
> +			compatible = "syscon", "simple-mfd";

You need also SoC-specific compatible (plus document it). Extend
existing exynos-pmu, so you can get rid of simple-mfd.

> +			reg = <0x10460000 0x10000>;
> +		};
> +
> +		syscon_fsys2: syscon@17c20000 {
> +			compatible = "syscon";

This should not pass the schema. You need to use SoC-compatible (add new).

Please run dtbs_check and fix all errors.

> +			reg = <0x17c20000 0x1000>;
> +		};
> +
> +		fixed-rate-clocks {
> +			oscclk: oscclk {

This won't pass dtbs W=1, I think. Anyway, this is external clock so
please put it outside of soc@0 (same as Exynos5433), could be under the
fixed-rate-clocks node if you have more than one.

Generic node name, so just "clock".

> +				compatible = "fixed-clock";
> +				#clock-cells = <0>;
> +				clock-frequency = <26000000>;
> +			};
> +
> +			uart_clock: uart-clock {
> +				compatible = "fixed-clock";

These look like workarounds for missing clock driver. Please add a
comment to both of them that they are temporary workarounds.


> +				#clock-cells = <0>;
> +				clock-frequency = <133250000>;
> +				clock-output-names = "uart";
> +			};
> +
> +			ufs_core_clock: uart-core-clock {
> +				compatible = "fixed-clock";
> +				#clock-cells = <0>;
> +				clock-frequency = <166562500>;
> +			};
> +		};
> +
> +		/* USI: UART */
> +		serial_0: uart@103000000 {
> +			compatible = "samsung,exynos850-uart";
> +			reg = <0x10300000 0x100>;
> +			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&uart0_bus_dual>;
> +			clocks = <&uart_clock>, <&uart_clock>;
> +			clock-names = "uart", "clk_uart_baud0";
> +			status = "disabled";
> +		};
> +
> +		ufs_0_phy: ufs0-phy@17e04000 {
> +			compatible = "samsung,exynosautov9-ufs-phy";
> +			reg = <0x17e04000 0xc00>;
> +			reg-names = "phy-pma";
> +			samsung,pmu-syscon = <&pmu_system_controller>;
> +			#phy-cells = <0>;
> +			clocks = <&oscclk>;
> +			clock-names = "ref_clk";
> +			status = "disabled";
> +		};
> +
> +		ufs_0: ufs0@17e00000 {
> +			compatible ="samsung,exynosautov9-ufs";
> +
> +			reg = <0x17e00000 0x100>,  /* 0: HCI standard */
> +				<0x17e01100 0x410>,  /* 1: Vendor-specific */
> +				<0x17e80000 0x8000>,  /* 2: UNIPRO */
> +				<0x17dc0000 0x2200>;  /* 3: UFS protector */
> +			reg-names = "hci", "vs_hci", "unipro", "ufsp";
> +			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ufs_core_clock>,
> +				<&ufs_core_clock>;
> +			clock-names = "core_clk", "sclk_unipro_main";
> +			freq-table-hz = <0 0>, <0 0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
> +			phys = <&ufs_0_phy>;
> +			phy-names = "ufs-phy";
> +			samsung,sysreg = <&syscon_fsys2>;
> +			samsung,ufs-shareability-reg-offset = <0x710>;
> +			status = "disabled";
> +		};
> +	};
> +};
> +
> +#include "exynosautov9-pinctrl.dtsi"
> 


Best regards,
Krzysztof
