Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A98C001DC
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 09:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjGSJTk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 05:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjGSJTj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 05:19:39 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A77106
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 02:19:38 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9924ac01f98so915658466b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689758376; x=1692350376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UCTb0CeiLFm4PY3y7pzoV9K1yjymvqhL/I91kkBD0gk=;
        b=GWSvjEvsOf2B2KiLJDpvNGT6CecvzOd5fdjr0x22h4rhHISTdqQ3Uv83iIh7woXUDN
         gEMh+Dulw6y8+6B1g0wGto1ed2p8BQ2o69pXeYaUD0maQ52Ch6KBvqK7zqQnzv7oT89w
         F9Tg4S9+16YeOFiKDtO1JCwHl1oO/x8+kCX7hsNRJQbtYeSZdxL0gNz4crRXG/NslkK+
         TZ7uOrnmTRr1KJ7qgzOuNnm8bBSVWrZHX3romchdnlsCE3v4c2s+GPPTHJ/7t1Glpocu
         UuZO89iOHm5l2O9PLhaFNLlym5rIEgee0SrYhzk7qiTFDTZemLJ8t5SzzWeNGmDy9ADJ
         l0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689758376; x=1692350376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCTb0CeiLFm4PY3y7pzoV9K1yjymvqhL/I91kkBD0gk=;
        b=gZ2zogeii8ftgAYQp+anB08Ndr186gQ5KaSfhdV6M/vZy9yyA0dmNbmksJqWX4q3rq
         xxxbkugw6Nrhzr7yqTkkMsucHkjKbCoeVG1HPfoIB6tkaX5HTO1hz8eOjl/zDE3sN07K
         eHPm9BDmkbHypRfkquoWmVGO/iAml1tG12qAXy9EuYAz0wN5l5aqykS1euDMg14FSt8B
         r4QrJc0dGHkQU9Yy1t5ziptCusAwsom1nOzN0/s+C81ZXTZLP4VkBeEenYiUQHSvIHJ0
         gC2dygtsd2GC69MPgkyuBIwYHsnT3zQDdX2f/0MsqmorZEIW3ppkz1IYa5RI/womu2oy
         aWaA==
X-Gm-Message-State: ABy/qLZV3GmIz3iND4XhL/HRtX8FJ3wLDmlAEPRiFqFYxUnUnde74Rui
        HfbZi0oD3jCEwYfFeJGUrlAqng==
X-Google-Smtp-Source: APBJJlEuanYoSn4+AGZxQuKVURtBEky1XwbGnKUFmzYTrx1uRuShWIo9iE/YUUZPDtMFtY0Lvpj90A==
X-Received: by 2002:a17:906:db:b0:994:1eb4:6898 with SMTP id 27-20020a17090600db00b009941eb46898mr2154381eji.9.1689758376500;
        Wed, 19 Jul 2023 02:19:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id ks20-20020a170906f85400b009929c09abdfsm2108209ejb.70.2023.07.19.02.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 02:19:36 -0700 (PDT)
Message-ID: <b03be798-6fd6-71ea-7546-9f1dab9b65cb@linaro.org>
Date:   Wed, 19 Jul 2023 11:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/7] ARM: dts: exynos: k3g: Add display support
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230716220644.22158-1-markuss.broks@gmail.com>
 <20230716220644.22158-9-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230716220644.22158-9-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/07/2023 00:05, Markuss Broks wrote:
> This device has Samsung S6E3FA2 DSI display installed,

Full stop.

> this adds the device-tree bindings for it but two things

Please do not use "This commit/patch", but imperative mood. See longer
explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> prevent it from being fully usable: one is a bug in Exynos5
> DSI subsystem, which I believe is not tested properly;

Full stop.

> the bug occurs randomly regardless of any variables, but it
> seems to occur less if the Exynos DRM kernel module is loaded
> later in the kernel boot process (the bug concludes in display
> filling with static) ; another issue is that efforts

Full stop.

> to support the S6E3FA2 panel are still going on, and the driver
> for the panel is not in the kernel tree yet.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5422-samsung-k3g.dts | 41 ++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-samsung-k3g.dts b/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
> index e019b630db94..954de392afbf 100644
> --- a/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
> +++ b/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
> @@ -203,6 +203,42 @@ &cpu4 {
>  	cpu-supply = <&buck6_reg>;
>  };
>  
> +&mixer {
> +	status = "okay";
> +};
> +
> +&fimd {

Mixed order.

> +	status = "okay";
> +	samsung,invert-vclk;
> +};
> +
> +&dsi {
> +	status = "okay";
> +
> +	samsung,pll-clock-frequency = <24000000>;
> +	samsung,burst-clock-frequency = <500000000>;
> +	samsung,esc-clock-frequency = <16000000>;
> +
> +	vddcore-supply = <&ldo8_reg>;
> +	vddio-supply = <&ldo10_reg>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	panel@0 {
> +		reg = <0>;
> +		compatible = "samsung,s6e3fa2";

Compatible is always the first property. Second is reg.



Best regards,
Krzysztof

