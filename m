Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301BBC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Feb 2022 15:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351885AbiBCPg2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Feb 2022 10:36:28 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41404
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351880AbiBCPg1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 10:36:27 -0500
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4B82E40039
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Feb 2022 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643902586;
        bh=0PbrYUBCm7YsogxgvzFxegtO4WGK61hGVIm8dEbT1U0=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=ZQM40CT5dxovVxQDRjD0JEQPbv+6ShonXkvs2yWVfgSkMGWsj9JpkuAG3DhvRdwvl
         IbNjplBkFGqX0W+D8/CFr3npouxwutH0G/b1v+QAv4VnwqTjv0vbgwnEAnChrfTJY/
         XZMPNLeMH87oMkJ3Iq0qbNU5oJ672zScnNQrhLXt38ixpCoUtZkUZbSSBROQMGhI7t
         4s/1aIL0+sAqhCHfjf3HXnHtNuNbZkeviMt0g4VTCMuoxLbV3QMzCTHroJM9MCEoez
         uHREDeAPRR+OghsBuWqSqCr8slTRuwMTQmzrqNFMWHvcjSJPntI/j43BjbXPHlHKUE
         v0mB4AtpAljKg==
Received: by mail-ej1-f70.google.com with SMTP id o4-20020a170906768400b006a981625756so1364789ejm.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Feb 2022 07:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0PbrYUBCm7YsogxgvzFxegtO4WGK61hGVIm8dEbT1U0=;
        b=zzZElD2b4qpQWg7YFGTVpG0ZybqN7anUVTTtm9FQ2Gp3TIVP+bfBt4MhFjiE4hkHn5
         orzZcCL7ZRfKwXYNKyC5vMhe+/cd2/UT+yIu+knBd2mcPCxZtWprqwjMqzMyQjPdQ1ce
         vS+BUZ3D09R/pyrcPz3QDhHvUZgUdopos5Ts8Gdr1dEgCOPYQPpJ1FvZ87Be4M6mkK/F
         KtPLliUL1hhVdiGfFbdQ4m7GwnKehIGUibbzHzigZlJT3HAORVmVSdDJQhdcqkVnGoQk
         uYkpjUQYWZNVNL8SYl1dOYlnbuiVW5t498u0Meqy0AaguCd6mTDjL4B1s2wd/kuyM+g0
         AcSg==
X-Gm-Message-State: AOAM5306eaR9UJRHz9HVZ8ET6tJyuDXh26nymQeUdPp4dfFVD4BfEYbr
        T9VfbpCQ/L8oD7Dj4i3Q1+Jw9d5gAS6vIL7XUye2rtcF+KJ8rOgA1JM1BFxOOTAY0Rs9vE3DkjA
        KgB0YQ97XZ4Dm0kGlmvvcGv3XcANduI+u6NuM5cdpEmtsblvv
X-Received: by 2002:a05:6402:7d7:: with SMTP id u23mr14268962edy.451.1643902585515;
        Thu, 03 Feb 2022 07:36:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxCBPYj3hXFA54L4u4Byd3GvnXIPuGZ5/7CTht1imE1hR5HwgP9k3njjsYkCMpIYeyISx5Sw==
X-Received: by 2002:a05:6402:7d7:: with SMTP id u23mr14268948edy.451.1643902585375;
        Thu, 03 Feb 2022 07:36:25 -0800 (PST)
Received: from [192.168.0.81] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 5sm23446951edx.32.2022.02.03.07.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 07:36:24 -0800 (PST)
Message-ID: <787b0060-266e-0efd-1bbb-43c33abcbb24@canonical.com>
Date:   Thu, 3 Feb 2022 16:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] ARM: dts: exynos: add simple battery to p4note
Content-Language: en-US
To:     =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5d15937b6a7c4ae82a8f0d164fa28a4d4ad46325.1643757744.git.martin.juecker@gmail.com>
 <9436c417fc542eaa74011046369e089a68eea39e.1643757744.git.martin.juecker@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <9436c417fc542eaa74011046369e089a68eea39e.1643757744.git.martin.juecker@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/02/2022 17:34, Martin Jücker wrote:
> Add a simple battery node to the p4note device tree to set the missing
> values for the charger to work properly.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4412-p4note.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> index 63459db653ea..fcd75cceb877 100644
> --- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> @@ -115,6 +115,17 @@ wlan_pwrseq: sdhci3-pwrseq {
>  		clock-names = "ext_clock";
>  	};
>  
> +	battery_cell: battery-cell {
> +		compatible = "simple-battery";
> +		device-chemistry = "lithium-ion";
> +		constant-charge-current-max-microamp = <2200000>;
> +		precharge-current-microamp = <250000>;
> +		charge-term-current-microamp = <250000>;
> +		constant-charge-voltage-max-microvolt = <4200000>;
> +
> +		power-supplies = <&power_supply>;
> +	};
> +
>  	i2c-gpio-1 {
>  		compatible = "i2c-gpio";
>  		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> @@ -193,7 +204,7 @@ i2c-gpio-4 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		charger@6 {
> +		power_supply: charger@6 {

Squash this change with the previous patch. No need to add a line and
immediately change it in next patch.

>  			compatible = "summit,smb347";
>  			reg = <0x6>;
>  			summit,enable-usb-charging;
> @@ -201,6 +212,8 @@ charger@6 {
>  			summit,fast-voltage-threshold-microvolt = <2600000>;
>  			summit,chip-temperature-threshold-celsius = <130>;
>  			summit,usb-current-limit-microamp = <1800000>;
> +
> +			monitored-battery = <&battery_cell>;
>  		};
>  	};
>  


Best regards,
Krzysztof
