Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316B4C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 16 Oct 2022 15:14:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiJPPOO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Oct 2022 11:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiJPPOK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 11:14:10 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD8843604
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 08:14:04 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id l19so6161454qvu.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DspOqI6hz1WLm7j7CT74yx9oCWpDom4lXqndSWVe65o=;
        b=vKviUKik+NtbN8d+7cD8EEEU0D6LG8XTdYhXVq6aOJezwwYZOYx2EjVdFPII3ADqkI
         aQvkba1pJvH+d5GFuTCb8bazjIRA31ofQ86tX93GSJgqW7dIhzVJHXFs3M4HwqQ1mud1
         Q61yQK0ytFn0rVfuh5E/lNzf9wj+8TpL9zC/nbycqQKMOVBXPmOhNAum6I/M09J/efuJ
         YB7wGp/bU4Oz0oEyYYDyE9tcYZEgBuExiJblVxUhaH/LrgscEOlyL9d9lTMSmzLu5aNU
         FPnwU5Zkkd/ffVO1arPH6eS8PmIC9fFZ1ctudD3QUFIkNxRKP5Zsv/4B4tM9iY7cUqXj
         oVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DspOqI6hz1WLm7j7CT74yx9oCWpDom4lXqndSWVe65o=;
        b=11suSGk0aJJSLhcsabhEJ9925gU9NhbQY+FympqJ+ASsoPPwRwrVEotDF9NEd36u0/
         fJJA36Ehfakse/MIlrX2mUJYFj+g0Ixckgaxf1qDhjTcpYBUIxsk6UHWth7/7XarbvMN
         eh56cMEfI25xH/TXKhAEPqLPbCkfFU/o6grlAZY1hVmeum+1rB3h4gcnil7FwvbCtnL+
         r2ekrbIDrq6/ftaGWh8kOIlkzy7bwbH5UVsXp12ghfMcImqIbrAiuEICvDZGuKeZd2xT
         YYfZr2pqp17i0xytDSO+brUhwWpcvsLi4tEU7QFMEgALmRfNJ9r7O9qQTpXTI/bm40IS
         W/xg==
X-Gm-Message-State: ACrzQf1roQPhAIJoeoMLwFePZ9x3ah7IzkvfwdURiQ0MAC2UU8KUXl80
        pE6c8UHlz+W5XA6IBRlFf6XmqA==
X-Google-Smtp-Source: AMsMyM4UTeOjEM4QLiZGPdKafjQN8x9XSIZC4D7aRxQF/zyPAl1f7s/nq7gXSsvhB1qw3J0xSWKOlQ==
X-Received: by 2002:a05:6214:250c:b0:4b1:a1e7:1d89 with SMTP id gf12-20020a056214250c00b004b1a1e71d89mr5378511qvb.1.1665933243673;
        Sun, 16 Oct 2022 08:14:03 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id cn4-20020a05622a248400b00304fe5247bfsm6037943qtb.36.2022.10.16.08.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 08:14:02 -0700 (PDT)
Message-ID: <c11f92be-1d86-17e4-e3bb-05e7b17d5fc8@linaro.org>
Date:   Sun, 16 Oct 2022 11:14:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 5/6] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
Content-Language: en-US
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        perex@perex.cz, tiwai@suse.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, rcsekar@samsung.com,
        aswani.reddy@samsung.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104911epcas5p394100ff6ed53be32c4d64c7e23e48833@epcas5p3.samsung.com>
 <20221014102151.108539-6-p.rajanbabu@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014102151.108539-6-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/10/2022 06:21, Padmanabhan Rajanbabu wrote:
> Add device tree node for I2S0 and I2S1 CPU DAI instances for Tesla
> FSD board
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  8 +++++
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 14 ++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi         | 38 ++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 1db6ddf03f01..c0a4509499ab 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -41,3 +41,11 @@
>  &ufs {
>  	status = "okay";
>  };
> +
> +&tdm_0 {

Alphabetical order against other label-overrides.

> +	status = "okay";
> +};
> +
> +&tdm_1 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> index e3852c946352..ff6f5d4b16dd 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> @@ -339,6 +339,20 @@
>  		samsung,pin-pud = <FSD_PIN_PULL_UP>;
>  		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
>  	};
> +
> +	i2s0_bus: i2s0-bus {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

> +		samsung,pins = "gpd1-0", "gpd1-1", "gpd1-2", "gpd1-3", "gpd1-4";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> +	};
> +
> +	i2s1_bus: i2s1-bus {
> +		samsung,pins = "gpd2-0", "gpd2-1", "gpd2-2", "gpd2-3", "gpd2-4";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> +	};
>  };
>  
>  &pinctrl_pmu {
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
> index f35bc5a288c2..5decad45a1b6 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -32,6 +32,8 @@
>  		spi0 = &spi_0;
>  		spi1 = &spi_1;
>  		spi2 = &spi_2;
> +		tdm0 = &tdm_0;
> +		tdm1 = &tdm_1;

Why?

>  	};
>  
>  	cpus {
> @@ -809,6 +811,42 @@
>  			status = "disabled";
>  		};
>  
> +		tdm_0: tdm@140e0000 {

Node names should be generic, so this looks like i2s.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "samsung,exynos7-i2s";
> +			reg = <0x0 0x140E0000 0x0 0x100>;
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&pdma1 14>, <&pdma1 13>, <&pdma1 12>;
> +			dma-names = "tx", "rx", "tx-sec";
> +			#clock-cells = <1>;
> +			#sound-dai-cells = <1>;
> +			clocks = <&clock_peric PERIC_HCLK_TDM0>,
> +				 <&clock_peric PERIC_HCLK_TDM0>,
> +				 <&clock_peric PERIC_PCLK_TDM0>;
> +			clock-names = "i2s_opclk0", "i2s_opclk1", "iis";

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Best regards,
Krzysztof

