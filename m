Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2323FEB64DC
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Jul 2023 06:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjGQGmV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Jul 2023 02:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjGQGmU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 02:42:20 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25887DD
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 23:42:18 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e526e0fe4so6306815a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 23:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689576136; x=1692168136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEdIruOcJDsncB8g/cr28wY8s4d8mWPOw/5cBn7GAk8=;
        b=FbLNDLcRkUilKetuPaGaqG2bK4Nj+7NJVpXmO7ekzwM0EndEOy1t6UDB3w2ZDUaHuZ
         5qpR5yojaV5EXsg2uQHW3oaGPYOE5UMnwAElJaSoJvdMu8HCCWOZNTIYtnAow8EYoRDc
         zLzTJhB1KuO58NAG0evIQLllBeqiX+5bDzUbUAm57GFFC8AyoxWvMwuy5Y7XEDHZDCRs
         Vkt15gwmhG+OH3CSx5MrzRWEYSIOPfMhJTH8JKo6RaT1wocBDg+MkTQcJFwiyCKx8i19
         cIGzwD0dRWgTpe5BcVXtOaPzc2xAhsfEvtA2keAD73Qzq6lG5zzNxJG4drkyX5iXWp+O
         iwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689576136; x=1692168136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEdIruOcJDsncB8g/cr28wY8s4d8mWPOw/5cBn7GAk8=;
        b=XjAVIroGaM82JCBliYiX7IZ9FwyiAW8AC00iYg7KhAcfI5PqxaU58RA/5Ek0dKHm5Y
         y6rLGHFXrs/Oip6j8SJUxiIea9p8bBr8YpFT05S/IR9bCtoKWp6ZfoDNf3jxUPxK+y5T
         NViMK183AipxWwvLNVdsMFPH7DJrKk5C/w8fjLWqo7HRe3qc9hnb+p+NMaKOChakfTpu
         rud1MGw2PnMeQTpINui3XBw0ut2FdWxs2KaQ3gDXOKgAQKnhQSw+T7n7aSaDUCQe31QA
         FppLNJRAI4Wq2QbziFm1e3AUWkqOebaspc07ZyybF9HbqEkkJTFVJ5kbrprsX6sjeFU5
         f5Qw==
X-Gm-Message-State: ABy/qLYZpG0V6hM38tvmoRuAvQxgy71go5VDpcgwDpgZ2z8cdwptTnNa
        ydsuGWQB/SROkSOovIrRiDWdOQ==
X-Google-Smtp-Source: APBJJlGm2i9HqSmfDXPyydX+fQKn5BA+rsGZKTYySHXz4VdhiAJFCFzF0bHROuhr15zIqR6T5Qo5dQ==
X-Received: by 2002:a17:906:20a:b0:993:fba5:cdf1 with SMTP id 10-20020a170906020a00b00993fba5cdf1mr11783261ejd.22.1689576136579;
        Sun, 16 Jul 2023 23:42:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id ss25-20020a170907039900b0098921e1b064sm8748519ejb.181.2023.07.16.23.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 23:42:16 -0700 (PDT)
Message-ID: <67e61d59-ae53-c1ec-3325-1ea952a950e9@linaro.org>
Date:   Mon, 17 Jul 2023 08:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] arm64: dts: exynos: add pwm node for exynosautov9-sadk
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20230717063837epcas2p3780fbf0f8c12ca070aa296766d0eb5e8@epcas2p3.samsung.com>
 <20230717063319.19974-1-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717063319.19974-1-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/07/2023 08:33, Jaewon Kim wrote:
> Add pwm node to support fan on exynosautov9-sadk board.
> PWM channel 3 of ExynosAutov9 is connected to fan for SoC cooling
> in SADK board.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
> Changes in v3:
>  - removed adding compatible to driver.
> 
> Changes in v2:
>  - add compatible string to driver.
> ---
>  arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts |  6 ++++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi     | 10 ++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> index 898c2fc345ed..e717bb1cad81 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> @@ -50,6 +50,12 @@
>  	};
>  };
>  
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm_tout3>;
> +	status = "okay";
> +};
> +
>  &serial_0 {
>  	pinctrl-0 = <&uart0_bus_dual>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index d3c5cdeff47f..3b906f4db907 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -1560,6 +1560,16 @@
>  			samsung,syscon-phandle = <&pmu_system_controller>;
>  			samsung,cluster-index = <1>;
>  		};
> +
> +		pwm: pwm@103f0000 {
> +			compatible = "samsung,exynosautov9-pwm",
> +				     "samsung,exynos4210-pwm";

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Full DT schema compliance is a requirement for Samsung (since some time).

Best regards,
Krzysztof

