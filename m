Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC65C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 07:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbiF3HOT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 03:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbiF3HOS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 03:14:18 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA35C19C38
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:14:17 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id ej4so25311402edb.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vWv1/RhTGmvZqzuMvWkm4r/5XuXugXwYoRBYDM790fY=;
        b=cObN1fokxp2C7e7xrkSLiKy9iXHOTpGXO14PwXc0MrrvXvZXBVsiDkTwWDwAnXGHs3
         g0f+q0G6RxIi4N+5HsjkzjVNpzV7GIED3PFWpuQN0O5xfx+TZ5OlE+WNz2hXQ/YRdlvi
         kqbvGkXtpCW9THkFL9HY6BZCAaw1mtOZQEir4UftOKfya+ZM2gAhkiXFtoOeuxo9IJpV
         MGvuYEzHAqKlnlVzYEm4v3+A0Q8eYeIrbI0+/bTm4WuzdlLU6oim0DXt7QBLW1rkm7r2
         7CQjLW1dmnZI89G7x25Eo6UM3m+l+a1uF+E1hjB/KXve2itjMOQEgmdcx1fCk9PQ0Aoy
         cNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vWv1/RhTGmvZqzuMvWkm4r/5XuXugXwYoRBYDM790fY=;
        b=CnIVWmaMbhZAaM5jj1JZj9KuKqjBBCoeVNIbJijLOZ/EIlOwcZHwFHVQ+MJ23OLc2g
         QShARY4spPcTBtAJgDpMgIW1XvhfX+rFG9o7pNT6lrgbQLA9QwSktAqYLNB3dnvwZDg3
         YUmJYFteHncn+/x9YFoN/Lc6JMRiVw1LsQzLwKK+OWEF/XIYw8sl17onIj0nECJRZeCX
         OVgtMJSmRePQuZv5F4iyrydcMs9hxzOLDBKHn7ass0A6xFV+o7T8Y7s1rv+trqEyAbPY
         xHU1W158FY7vzi9rO1RH2c4zs/gEQF3hQe73CCRbLZcwYiBrdsFRHhCqm3c5zOLgm4Lz
         edrQ==
X-Gm-Message-State: AJIora/8SL4cLt4l2nrdlMINjsPJEQ4tOU2mPuHOw6owhwyOn0ly06fi
        ofkO3R4P9qFdlJOxySrUceuDYw==
X-Google-Smtp-Source: AGRyM1trzN2TrQB7LIcwceaTpUR2YVlegmf4frrzVDxVMr/6GlD0J4RjOqk1d4eE+U7uQ94qt3S9RQ==
X-Received: by 2002:aa7:d709:0:b0:435:6ae6:5fb8 with SMTP id t9-20020aa7d709000000b004356ae65fb8mr9337425edq.161.1656573256319;
        Thu, 30 Jun 2022 00:14:16 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bk8-20020a170906b0c800b0071c6dc728b2sm8585804ejb.86.2022.06.30.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 00:14:15 -0700 (PDT)
Message-ID: <7e6ec956-b679-de68-1a4f-61105e3898cf@linaro.org>
Date:   Thu, 30 Jun 2022 09:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/4] arm64: dts: exynosautov9: add usi device tree
 nodes
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1656554759.git.chanho61.park@samsung.com>
 <CGME20220630021951epcas2p27f839eead168052d03039c2e3efa3460@epcas2p2.samsung.com>
 <0588d46af06f9d932f4a526c3b04601079b4fde1.1656554759.git.chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0588d46af06f9d932f4a526c3b04601079b4fde1.1656554759.git.chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/06/2022 04:16, Chanho Park wrote:
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
>  .../boot/dts/exynos/exynosautov9-sadk.dts     |    2 +
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 1077 ++++++++++++++++-
>  2 files changed, 1074 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> index 2b30a7458297..eec3192c0631 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> @@ -50,6 +50,7 @@ ufs_1_fixed_vcc_reg: regulator-1 {
>  };
>  
>  &serial_0 {
> +	pinctrl-0 = <&uart0_bus_dual>;
>  	status = "okay";
>  };
>  
> @@ -74,6 +75,7 @@ &ufs_1 {
>  };
>  
>  &usi_0 {
> +	samsung,clkreq-on; /* needed for UART mode */
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index c4cfa93e4c2e..2013718532f3 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -351,12 +351,17 @@ syscon_peric0: syscon@10220000 {
>  			reg = <0x10220000 0x2000>;
>  		};
>  
> +		syscon_peric1: syscon@10820000 {
> +			compatible = "samsung,exynosautov9-sysreg", "syscon";
> +			reg = <0x10820000 0x2000>;
> +		};
> +
>  		usi_0: usi@103000c0 {
> -			compatible = "samsung,exynos850-usi";
> +			compatible = "samsung,exynosautov9-usi",
> +				     "samsung,exynos850-usi";

This change should be separate.

>  			reg = <0x103000c0 0x20>;
>  			samsung,sysreg = <&syscon_peric0 0x1000>;
>  			samsung,mode = <USI_V2_UART>;
> -			samsung,clkreq-on; /* needed for UART mode */
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges;
> @@ -365,16 +370,1078 @@ usi_0: usi@103000c0 {
>  			clock-names = "pclk", "ipclk";
>  			status = "disabled";
>  
> -			/* USI: UART */
>  			serial_0: serial@10300000 {
> -				compatible = "samsung,exynos850-uart";
> +				compatible = "samsung,exynosautov9-uart",
> +					     "samsung,exynos850-uart";
>  				reg = <0x10300000 0xc0>;

As well.

Best regards,
Krzysztof
