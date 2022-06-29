Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C3CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 08:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbiF2IkU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 04:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbiF2IkT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 04:40:19 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CC63C48B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 01:40:17 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id n8so7205521eda.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 01:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5Zy1YqcTVnUaeLVMFr3GPn9HuiXLuJsu54AXzsTgxr4=;
        b=unvaRV95jJIvRyRwcVlfq50PoSrsZSqq3V4lWI59YzPTuAn7x+kILfSmguIlBAyqzp
         LV0EnQd6oYusThDxJVOQujY2eG08076G/ZZrtb3vAlXM/l8Chl88QgQUZQTGSUJ3/mBG
         cFVKt3zGYx0yZK+27dAoVnM6wY/FWC4uu5C5Ya0lslrlee2NQj2q0wrQVGMyLnV5dtso
         KJ148XHGpBqws08R9gPzLZx8Bsudr/PbuIebw/j4AjTzaTRr3XEOaXyomqkfYk2SOQAt
         VQnzQLCEbyOls9SKrB8/Oz/uwXvBtHnjL6u/6LR60cTDYlJeGJCSBlz3H+edFTjaHQU9
         p0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5Zy1YqcTVnUaeLVMFr3GPn9HuiXLuJsu54AXzsTgxr4=;
        b=k86LCEj/vGpD1xNRiPFH/A0cSwBwp7lgrx/tKuCY4f8Z3aM7WEmW8WqQp+eLx5lBJd
         /OjtnhDMfJq/WM7E1Y0dD2mM6tSzMqqmIpbz8/963e3i6VmctU5RXPPRuBeEu3ErKQHX
         eVDdWT4wnlHftJb1DtpaEvjdn2RDBVL26cs9P3+ZRStZFZ9Q+oHTF22qVBe5YovVpPub
         j95X1q0MyvLcCL9ZMtjWuSMGjjXq8WtzPuZu65SElOxXtdAnsCzdtda/h63aOGZNTSj1
         eZ7Pv6AAZY6hWqYcc023bO9FnVVxoMnlw5GfGzdBNOBotDfdhGfAlgS7mZxG4lCpK246
         ZMjw==
X-Gm-Message-State: AJIora9G+7NOshRVkFHlWT7gfS0DhPNwKCHYDvFTf0G6rQLOebsq00b7
        U5rB/USzV8PgKFFAnIPfAUVh7Q==
X-Google-Smtp-Source: AGRyM1t1MVMfFPRWuGQq5ZKK+MdS4/jW/WsoIT+WZJzu38c4nTOPjx3qrr7SsSvnHiYyObjsWJQNqQ==
X-Received: by 2002:a05:6402:1597:b0:435:88fb:5b1d with SMTP id c23-20020a056402159700b0043588fb5b1dmr2647617edv.316.1656492016429;
        Wed, 29 Jun 2022 01:40:16 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709062ec600b00711d88ae162sm7496130eji.24.2022.06.29.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 01:40:15 -0700 (PDT)
Message-ID: <acf6fb6d-46da-48f6-f064-1a08d323b0f1@linaro.org>
Date:   Wed, 29 Jun 2022 10:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] arm64: dts: exynosautov9: add exynosautov9-usi.dtsi
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629015650.138527-1-chanho61.park@samsung.com>
 <CGME20220629015913epcas2p1dcfcc81c026aa524a1f35c8e393be4f0@epcas2p1.samsung.com>
 <20220629015650.138527-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629015650.138527-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/06/2022 03:56, Chanho Park wrote:
> Universal Serial Interface (USI) supports three types of serial interface
> such as Universal Asynchronous Receiver and Transmitter (UART), Serial
> Peripheral Interface (SPI), and Inter-Integrated Circuit (I2C).
> Each protocols can be working independently and configured as one of
> those using external configuration inputs.
> Exynos Auto v9 SoC support 12 USIs. When a USI uses two pins such as i2c
> and 3 wire uarts(RX/TX only), we can use remain two pins as i2c mode.
> So, we can define one USI node that includes serial/spi and hsi2c.
> usi_i2c nodes can be used only for i2c mode.
> 
> We can have below combinations for one USI.
> 1) The usi node is used either 4 pin uart or 4 pin spi
>  -> No usi_i2c can be used
> 2) The usi node is used 2 pin uart(RX/TX) and i2c(SDA/SCL)
>  -> usi_i2c should be enabled to use the latter i2c
> 3) The usi node is used i2c(SDA/SCL) and i2c(SDA/SCL)
>  -> usi_i2c should be enabled to use the latter i2c
> 
> By default, all USIs are initially set to uart mode by below setting.
> samsung,mode = <USI_V2_UART>;
> You can change it either USI_V2_SPI or USI_V2_I2C.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../boot/dts/exynos/exynosautov9-usi.dtsi     | 1127 +++++++++++++++++
>  1 file changed, 1127 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi

Put all this directly in exynosautov9.dtsi, because this is not a
re-usable piece among different DTSI.

> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
> new file mode 100644
> index 000000000000..0e4c6332770b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
> @@ -0,0 +1,1127 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's ExynosAutov9 SoC USI device tree source
> + *
> + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
> + *
> + * Samsung's ExynosAutov9 SoC USI(Universal Serial Interface, uart/spi/i2c)
> + * are listed as device tree nodes in this file.
> + */
> +
> +/* PERIC0 USIs */
> +&soc {
> +	syscon_peric0: syscon@10220000 {
> +		compatible = "samsung,exynosautov9-sysreg", "syscon";
> +		reg = <0x10220000 0x2000>;
> +	};
> +
> +	usi_0: usi@103000c0 {
> +		compatible = "samsung,exynos850-usi";

We should start adding dedicated compatible, so:
"samsung,exynosautov9-usi", "samsung,exynos850-usi"

> +		reg = <0x103000c0 0x20>;
> +		samsung,sysreg = <&syscon_peric0 0x1000>;
> +		samsung,mode = <USI_V2_UART>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
> +			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
> +		clock-names = "pclk", "ipclk";
> +		status = "disabled";
> +
> +		/* USI: UART */

Skip the comments, they are obvious from device node name. Long time ago
I was not advocating this, but I see it's benefits - much easier to
introduce changes to DTS or binding in case of some differences.

> +		serial_0: serial@10300000 {
> +			compatible = "samsung,exynos850-uart";

Here as well.

> +			reg = <0x10300000 0xc0>;
> +			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&uart0_bus>;
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
> +			clock-names = "uart", "clk_uart_baud0";
> +			samsung,uart-fifosize = <256>;
> +			status = "disabled";
> +		};
> +
> +		/* USI: SPI */
> +		spi_0: spi@10300000 {
> +			compatible = "samsung,exynosautov9-spi";
> +			reg = <0x10300000 0x30>;
> +			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&spi0_bus &spi0_cs_func>;
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>,
> +				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>;
> +			clock-names = "spi", "spi_busclk0", "spi_ioclk";
> +			samsung,spi-src-clk = <0>;
> +			dmas = <&pdma0 1 &pdma0 0>;

These are two separate phandles <>, not one.

> +			dma-names = "tx", "rx";
> +			num-cs = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		/* USI: I2C */
> +		hsi2c_0: hsi2c@10300000 {
> +			compatible = "samsung,exynosautov9-hsi2c";
> +			reg = <0x10300000 0xc0>;
> +			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&hsi2c0_bus>;
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>;
> +			clock-names = "hsi2c", "hsi2c_pclk";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +	};




Best regards,
Krzysztof
