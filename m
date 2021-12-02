Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F035C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Dec 2021 08:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356032AbhLBI2e (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Dec 2021 03:28:34 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47318
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356044AbhLBI2e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Dec 2021 03:28:34 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 549494003A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Dec 2021 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638433511;
        bh=rq4kQo+vXc9W5cZ125vb40WvISYosmc4HFLz8BRJoVE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=E2rNAOTGfdpizb6BFMiZUp1TM6sZPjimT/hJMv8jyTWI+T4A66Az7NsUCwkaVQHoK
         GW+0LQ+7G0Z95rTfqqQ1zE+tzLBsZwUXvVuN0V2v8wThquF1WKEZp4jMeB4d5arEsa
         g9dve9dBFp78u9H65g5kZgiRSDGPpYjTfVbSitLvc9m5VPdOxQqKOB5uJIHZlz78iD
         IifMm8W6ydKj0mtlRBZNFmaRnfOovWRA2oAw9bO7TpW99i1zKUBleSLLg8Ct9TKyxP
         +c2iSMkMx7q3VuKp5EQJ+gLcW8TIrVkoXuMXW/sgG8PCNAxQ3ypb+kLrBsSVN66LxH
         lEWdmnCdke+4w==
Received: by mail-lf1-f72.google.com with SMTP id 24-20020ac25f58000000b0041799ebf529so10873754lfz.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2021 00:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rq4kQo+vXc9W5cZ125vb40WvISYosmc4HFLz8BRJoVE=;
        b=eyN0Fycy/pb/ye+c5sibghXkEivb7LI4k7IxzaB12D0QPe3MM7LI9qJVsGezXpOMTC
         7grF+fuejcj/CI7vXLFMgLeUbr2H681jcDk552WmoU1ikkZdHvugU1ItLQ22e3YWY1Zz
         nuPwV33XPpZbNMrHjVp99Y8iaxiZtl/IjS9HpnQrLTkTpmhDpr8BfxvPrJw2aGzQEyoF
         QKWu6jO75/guYwn8buiunTJ9aApRML0opKI11wCD7o7mUKI6QuBLqyy5cZ49rxu9KFW2
         pmVWV5eGmkN1NMrb9gnuWH2z/LrvtyHiFQeTKRX4eeNgUPdiN9bRkKHM5G/nBWH9w9XI
         s21A==
X-Gm-Message-State: AOAM532JoMYzJdPLakcIz09Dv7H7zQEvBAG40T9DwqCVODhu+ZB7GlDG
        GdhMRSplZrHL3X3sRRRJb43rT1jNXgnfmD+F7OIld2Af+qxxCp8vlnv8fN61WFaEsyUkaixgdYH
        AmtIzsABxZ7HDtXNfah1q/gNhGpnqn0GgE0Q/p3qemnwC5wIU
X-Received: by 2002:ac2:442c:: with SMTP id w12mr10991065lfl.554.1638433510816;
        Thu, 02 Dec 2021 00:25:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeOf+QpxgrYFm1d6a5sk8CXUHe/Co/Txbe1+rCii5yOp8kswnRPQJ/L/ELgmX1saEmNDb38w==
X-Received: by 2002:ac2:442c:: with SMTP id w12mr10991013lfl.554.1638433510232;
        Thu, 02 Dec 2021 00:25:10 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w8sm256217lfe.183.2021.12.02.00.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 00:25:09 -0800 (PST)
Message-ID: <d12545a3-6fae-99aa-3851-97f3ea352bf1@canonical.com>
Date:   Thu, 2 Dec 2021 09:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/6] dt-bindings: i2c: exynos5: Add bus clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
 <20211201190455.31646-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211201190455.31646-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/12/2021 20:04, Sam Protsenko wrote:
> In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a
> part of USIv2 block, there are two clocks provided to HSI2C controller:
>   - PCLK: bus clock (APB), provides access to register interface
>   - IPCLK: operating IP-core clock; SCL is derived from this one
> 
> Both clocks have to be asserted for HSI2C to be functional in that case.
> 
> Modify bindings doc to allow specifying bus clock in addition to
> already described operating clock. Make it optional though, as older
> Exynos SoC variants only have one HSI2C clock.

I understand that it is required on newer SoCs, so you need "if:" adding
it to required properties on Autov8 or 850.

> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../devicetree/bindings/i2c/i2c-exynos5.yaml          | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> index db20e703dea0..a212c1d5e7d9 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> @@ -49,11 +49,16 @@ properties:
>        clock-frequency is >= 1MHz.
>  
>    clocks:
> -    maxItems: 1
> -    description: I2C operating clock
> +    minItems: 1
> +    items:
> +      - description: I2C operating clock
> +      - description: Bus clock (APB)
>  
>    clock-names:
> -    const: hsi2c
> +    minItems: 1
> +    items:
> +      - const: hsi2c
> +      - const: hsi2c_pclk
>  
>  required:
>    - compatible
> 


Best regards,
Krzysztof
