Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BA0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  7 Jan 2022 08:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345420AbiAGIGB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 7 Jan 2022 03:06:01 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:45200
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345401AbiAGIGA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Jan 2022 03:06:00 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AF20C3FFD2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Jan 2022 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641542759;
        bh=zGOp6WmlrpEr64FvotHvBG2RkgYGeePAZ958XvM930s=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VQKPoyK6e17XzvtRqOb2poXuwH5sQCT0HFOZdONo3Pv4zRVqKZAN7avxVQ19r2YTx
         xeqDrFrM9aUVvX1Na+MCbGEIE958fNIea8t0d/4PuJwnq26AbUKNi7pLlmYyn5hdiv
         sVsT/6WjpoMFpwIKXHcKnR3jbzISzwlGQYgouJSk3U/aT8r+wgSXEH1vWmdS8EcPPP
         3rlaL8brYHvpprXu3BHbzRyS976h+rgPbPS2x9njPGhjZwAoQR1t9USTWqDDiOl8v9
         HQulQrbRdKeZo99dmDt9KsyaH2xWu9O2bFFXmQAKMULdCFRWlQKhp5c1dJaJgG+CkZ
         tsP0FZR63XcPA==
Received: by mail-ed1-f70.google.com with SMTP id o20-20020a056402439400b003f83cf1e472so4010298edc.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Jan 2022 00:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zGOp6WmlrpEr64FvotHvBG2RkgYGeePAZ958XvM930s=;
        b=aDCClBJcBcpFYKn2V4+t3gE1PNDHwVt2pA30vxLjmJxavN5eqtVe/3FfWdINvcdTxR
         vOPquBoRJhN7TjLVVSF/ZmamCfD/R4HUR5C4bwoYDR7AFooYLZCkcxXVavYX1Nown216
         GGtBQ9gEDKJpRXYtxTX6u8KIidGbIIREtRMg7oKFpWN7a5zo7QpaLGIFBdm1YNyVXVKg
         rmr67nH3bGeQitZVvzCWfBUfqPCKekUXZgz1SU7TRYf/Ti9MmOBnlYFVAbYFj/XhgZ0j
         8pP5OlNvDVwbKGGQS7OBxL+OpMPQK+kdUTFGWsR1TJTnxetsh8fSHMaT6NnApd5tky/e
         HB7g==
X-Gm-Message-State: AOAM532FlEpKwnKTrwZONndYXrvkrSMB5uSeX56FN8IoLBk7Lr/jxdRc
        xKurfWH7dUtdQngpIfIFeHwFq7twv2W8PY9vWpbWysKV3bcU8bj9EvDQNpNO2qKBCjFSqvDLpsh
        ZSiCHJJjBGqEMRrt3ixgI7Z3RbqGVPIblZbo7mvjwlg76Rq20
X-Received: by 2002:a17:906:2a41:: with SMTP id k1mr47222570eje.512.1641542758379;
        Fri, 07 Jan 2022 00:05:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNsuAsV/2E7XwAZfUqi0RQvqIFw/qSqhNDfyVmGDc8/zcZUu7ZNzCHaqAUKZ4J+sqQvYVsOw==
X-Received: by 2002:a17:906:2a41:: with SMTP id k1mr47222563eje.512.1641542758223;
        Fri, 07 Jan 2022 00:05:58 -0800 (PST)
Received: from [192.168.1.126] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id sd39sm1197043ejc.14.2022.01.07.00.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 00:05:57 -0800 (PST)
Message-ID: <b40fedf8-73d7-6f4e-d26e-2f274b15228a@canonical.com>
Date:   Fri, 7 Jan 2022 09:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] arm64: dts: exynos: Add missing gpm6 and gpm7 nodes to
 Exynos850
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220103181826.2136-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220103181826.2136-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/01/2022 19:18, Sam Protsenko wrote:
> gpm6 and gpm7 nodes are missing in Exynos850 device tree. Next errors
> are reported because of that:
> 
>     Missing node for bank gpm6 - invalid DTB
>     Missing node for bank gpm7 - invalid DTB
> 
> Add missing nodes to make those available to use, and to fix boot
> errors.
> 
> Fixes: e3493220fd3e ("arm64: dts: exynos: Add initial Exynos850 SoC support")
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> NOTES:
>   - Recommend to apply this patch after "arm64: dts: exynos: align
>     pinctrl with dtschema in Exynos850"
>   - This patch also brings back two interrupts removed in "arm64:
>     dts: exynos: drop incorrectly placed wakeup interrupts in Exynos850"

I'll take it after the merge window and apply it before my series (so
without -gpio-bank suffix).

> 
>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> index a71acf358d2d..f43e4a206282 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> @@ -194,6 +194,26 @@ gpm5: gpm5-gpio-bank {
>  		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> +	gpm6: gpm6-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpm7: gpm7-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
>  	/* USI_CMGP0: HSI2C function */
>  	hsi2c3_pins: hsi2c3-pins {
>  		samsung,pins = "gpm0-0", "gpm1-0";
> 


Best regards,
Krzysztof
