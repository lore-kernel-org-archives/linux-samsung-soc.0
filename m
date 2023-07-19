Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45104C001DE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 09:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbjGSJRc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 05:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbjGSJRb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 05:17:31 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F7D10B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 02:17:30 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51ff0e3d8c1so9026445a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689758248; x=1692350248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbFAUTqn4J/1uXGDz1Y+p40GpYX5buZBByhfIvb+XTw=;
        b=pWC6FgUMIYeP779sWAqgtzO3nU1XJ6nhP75SPD12kn5z7GaOdQUHJSr1oj+fpvsMzu
         1olNjVI5wRWrn45bUPuYJyc5Bco8Iwi76p6mGXk8gdDHJ8p+VfH0Y9Ob/M/hmJowz1Gc
         J+pNlH0r5n+VARIHACKHBpFtJ+fkdhK77/Ra2Fb2lW0F96NuMi3yPmIb8SIxEbJT+vJ4
         NbT2hiKo+epWuNBHDFljYudEOU8wGGY0fV8Na+/YoGH0+S92GxieXHMoNGOhVnIdlO7o
         mBmS3hhhglibp+4T6hBrbrEi0hI9yP9Rr6ZhyVA0T7CkDbC5e5ZxaRjLFEr2TUPH/EFx
         M6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689758248; x=1692350248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbFAUTqn4J/1uXGDz1Y+p40GpYX5buZBByhfIvb+XTw=;
        b=SzmIucM+Lu3WFXK8R3X0LAbGrEd7ClA/3pwjQDOrvCLxNmzK9/vvsjECQcSwjR+6Mx
         ldPZlDaz5ziY4n0qnHbhpiHikHitX9y4la6X//If6Ul8w+QZxA9RgL6AxnqzeLTLQAi4
         wUrosSy6LSNetyoHh+FGJjUn3wkveLd8txe7vKZcWqgRYr9EZzl5ZiqTTz4AocK2wHYx
         YrGEGviQP8p+xHdm8ofz4NsI79l2A3kzH+dXER8aQkDBHmz3QGcLWpsk8yHSvSYvZ6ZF
         Guluz0KDpnY05HQcQqkQ3J3aWzAz4iqejZsvnQAtvVKNgFVpcHVYY7J08FkE8OBH7CIu
         qNrw==
X-Gm-Message-State: ABy/qLb/6p56a/qp10RejA3njBNZX8Rnkjs8vH8X8eXZC85cJT6m+zF8
        L4KmTZTdWn/x6u/bXyoaicHuaeLsbJ9YEEUdbWU6sw==
X-Google-Smtp-Source: APBJJlEa4+3uhs2sYS9ftR+O+4gIJ5VpENZ++c6LZlxKhiuUtFmEJV/gmWJNZ1CJFLaGAPqoWDTMng==
X-Received: by 2002:aa7:d384:0:b0:51b:ec86:b49a with SMTP id x4-20020aa7d384000000b0051bec86b49amr2063330edq.7.1689758248587;
        Wed, 19 Jul 2023 02:17:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k26-20020a056402049a00b0051e186a6fb0sm2422099edv.33.2023.07.19.02.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 02:17:28 -0700 (PDT)
Message-ID: <3c291f6a-7e9a-b863-9c34-c486647edbf7@linaro.org>
Date:   Wed, 19 Jul 2023 11:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/7] ARM: dts: exynos: k3g: Add notification LED support
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230716220644.22158-1-markuss.broks@gmail.com>
 <20230716220644.22158-7-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230716220644.22158-7-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/07/2023 00:05, Markuss Broks wrote:
> This device has a Texas Instruments LP5562 LED controller
> which controls the LEDs which are used as notification lights.
> It has three colors which can be combined, supports pulse mode
> and other various features.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5422-samsung-k3g.dts | 47 ++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-samsung-k3g.dts b/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
> index b3576a745054..813dbf0438de 100644
> --- a/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
> +++ b/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>  #include "exynos5800.dtsi"
>  #include "exynos5422-cpus.dtsi"
>  
> @@ -131,6 +132,52 @@ touchkey@20 {
>  		};
>  	};
>  
> +	i2c-led {
> +		compatible = "i2c-gpio";
> +
> +		sda-gpios = <&gpy3 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&gpy3 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <2>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		lp5562@30 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Most likely this is led-controller



Best regards,
Krzysztof

