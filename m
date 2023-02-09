Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34603C636D6
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Feb 2023 14:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjBIOXc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Feb 2023 09:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjBIOXa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 09:23:30 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E9925940
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Feb 2023 06:23:27 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a2so1930097wrd.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2023 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AaeFwDtGgsiJbC0QTZeuI5q7NDTwTp278cldLgwfac=;
        b=vSt7aNDoWSfjIgrViM6B4VY/+XFxgyEMsaZleT91wpKO7/dqn5YcVbOk1IGp9tY4zT
         xlxw1jYHXf92U5xl0BnRer2u8AcNT0DWfMJoH5KjxZbp9YG9aG1KWwW1cyyIhkSCffGC
         1AUMs53Ej7JklXcXWMaIcgUIe67hR7NOd2powaGjka9DZ23UjRAS2JXHdh1vGCOW/xKw
         mhAxvxmnHNH8pWHAFewTpFnSEe/sr95llNpzXSNoWHmVMNE4sS+SqNnyNnfADAuupG5g
         PaJRommS/p+5ndzqULeuSOWTKq0Sjhyv1+Sem5RwA8a1dZS9VRl4tTwbRZbKAZI5+9J1
         pkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AaeFwDtGgsiJbC0QTZeuI5q7NDTwTp278cldLgwfac=;
        b=HeN/wM82IgyJbx22FDl8O5cFqOPLVyqwkLPW1zdXzHJ5Gvna7gDjDO4BicqGKp2ZfY
         dillI0n2ZGcJixX6nozWgE6ooVjzuLZevBiLrbefXedqGc5+L8xrdtzdgGHfsjm6/CM8
         wBz99q2/mepi0A+C92cT0v92ITIsSeHeKUhO1/V4WudcgJGceRVsc89dmQ6AZxtM2OH9
         gpEP9rXsIn2z95qbYvGBe1VlSVKcOzJ3CK2ELb64oAe+kh8DV7HfyYZUtPUW8yNwIzdi
         EyAXQgYQq1NuVQ9YP5rN7BnXsK+dAxUBZCq2/7/yK912V+3uSdhw91gsnaZA+lb+Y9r1
         hDnQ==
X-Gm-Message-State: AO0yUKXk2bAwMfJEhKcWSjs42pCaCgYaJfTJIdgpTfBI/ouRGU0JRuQK
        1pUayXQLDPBpEg7wbVpBsKJrSg==
X-Google-Smtp-Source: AK7set/zIQgNCvI0NgV6LI0l0/eN2Kv8XajaYfnqYSl6iIgopnqcYNooxoPE3JWlBjVwcWq/6NAHJg==
X-Received: by 2002:a05:6000:18ca:b0:2c3:db9e:4b06 with SMTP id w10-20020a05600018ca00b002c3db9e4b06mr10707805wrq.45.1675952605632;
        Thu, 09 Feb 2023 06:23:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y1-20020a5d4ac1000000b002c3be6ae0b1sm1353515wrs.65.2023.02.09.06.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 06:23:25 -0800 (PST)
Message-ID: <99a17d21-2cf9-a573-29cb-827568c9709b@linaro.org>
Date:   Thu, 9 Feb 2023 15:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos: add mmc aliases
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        m.szyprowski@samsung.com, jenneron@protonmail.com,
        markuss.broks@gmail.com, martin.juecker@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Valentine Iourine <iourine@iourine.msk.su>
References: <20230128133151.29471-1-henrik@grimler.se>
 <20230128133151.29471-3-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128133151.29471-3-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/01/2023 14:31, Henrik Grimler wrote:
> Add aliases for eMMC, SD card and WiFi where applicable, so that
> assigned mmcblk numbers are always the same.
> 
> Co-developed-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> [ Tested on exynos5800-peach-pi ]
> Tested-by: Valentine Iourine <iourine@iourine.msk.su>
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
>  arch/arm/boot/dts/exynos3250-artik5-eval.dts        | 5 +++++
>  arch/arm/boot/dts/exynos3250-artik5.dtsi            | 5 +++++
>  arch/arm/boot/dts/exynos3250-monk.dts               | 1 +
>  arch/arm/boot/dts/exynos3250-rinato.dts             | 2 ++
>  arch/arm/boot/dts/exynos4210-i9100.dts              | 6 ++++++
>  arch/arm/boot/dts/exynos4210-origen.dts             | 5 +++++
>  arch/arm/boot/dts/exynos4210-smdkv310.dts           | 4 ++++
>  arch/arm/boot/dts/exynos4210-trats.dts              | 6 ++++++
>  arch/arm/boot/dts/exynos4210-universal_c210.dts     | 6 ++++++
>  arch/arm/boot/dts/exynos4412-itop-elite.dts         | 5 +++++
>  arch/arm/boot/dts/exynos4412-midas.dtsi             | 3 +++
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi     | 5 +++++
>  arch/arm/boot/dts/exynos4412-origen.dts             | 5 +++++
>  arch/arm/boot/dts/exynos4412-p4note.dtsi            | 6 ++++++
>  arch/arm/boot/dts/exynos4412-smdk4412.dts           | 4 ++++
>  arch/arm/boot/dts/exynos4412-tiny4412.dts           | 4 ++++
>  arch/arm/boot/dts/exynos5250-arndale.dts            | 5 +++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts           | 2 ++
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi       | 3 +++
>  arch/arm/boot/dts/exynos5250-spring.dts             | 5 +++++
>  arch/arm/boot/dts/exynos5260-xyref5260.dts          | 5 +++++
>  arch/arm/boot/dts/exynos5410-odroidxu.dts           | 2 ++
>  arch/arm/boot/dts/exynos5410-smdk5410.dts           | 5 +++++
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts       | 5 +++++
>  arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts          | 3 +++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts           | 5 +++++
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi       | 5 +++++
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi  | 4 ++++
>  arch/arm/boot/dts/exynos5422-samsung-k3g.dts        | 4 ++++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts           | 3 +++
>  31 files changed, 133 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250-artik5-eval.dts b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
> index a1e22f630638..83266a66124b 100644
> --- a/arch/arm/boot/dts/exynos3250-artik5-eval.dts
> +++ b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
> @@ -16,6 +16,11 @@ / {
>  	model = "Samsung ARTIK5 evaluation board";
>  	compatible = "samsung,artik5-eval", "samsung,artik5",
>  			"samsung,exynos3250", "samsung,exynos3";
> +
> +	aliases {
> +		mmc2 = &mshc_2;
> +	};
> +
>  };
>  
>  &mshc_2 {
> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> index 0ac3f284fbb8..a6e2f46917a8 100644
> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> @@ -17,6 +17,11 @@
>  / {
>  	compatible = "samsung,artik5", "samsung,exynos3250", "samsung,exynos3";
>  
> +	aliases {
> +		mmc0 = &mshc_0;
> +		mmc1 = &mshc_1;
> +	};
> +
>  	chosen {
>  		stdout-path = &serial_2;
>  	};
> diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
> index 80d90fe7fad1..a68e5f81404c 100644
> --- a/arch/arm/boot/dts/exynos3250-monk.dts
> +++ b/arch/arm/boot/dts/exynos3250-monk.dts
> @@ -22,6 +22,7 @@ / {
>  
>  	aliases {
>  		i2c7 = &i2c_max77836;
> +		mmc0 = &mshc_0;
>  	};
>  
>  	memory@40000000 {
> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
> index 1f9cba0607e1..f0fb6890e4a8 100644
> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> @@ -23,6 +23,8 @@ / {
>  
>  	aliases {
>  		i2c7 = &i2c_max77836;
> +		mmc0 = &mshc_0;
> +		mmc1 = &mshc_1;
>  	};
>  
>  	chosen {
> diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
> index bba85011ecc9..7051e2c4b391 100644
> --- a/arch/arm/boot/dts/exynos4210-i9100.dts
> +++ b/arch/arm/boot/dts/exynos4210-i9100.dts
> @@ -25,6 +25,12 @@ memory@40000000 {
>  		reg = <0x40000000 0x40000000>;
>  	};
>  
> +	aliases {
> +		mmc0 = &sdhci_0;
> +		mmc2 = &sdhci_2;
> +		mmc3 = &sdhci_3;

1. Is this actually correct? Since mmc1 was disabled, sdhci_2 had mmc1
index but now will have mmc2.

2. I tested Odroid U3 and the ID changed. emmc went from 1 to 0. Any
idea why? Both patches should be transparent.

3. Patchset does not look bisectable, so both patches should be squashed.

4. Your patch has several whitespace issues:
patch:264: trailing whitespace.

patch:279: trailing whitespace.

patch:461: trailing whitespace.



Best regards,
Krzysztof

