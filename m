Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75320C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 Nov 2021 08:57:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C7A861AF0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 Nov 2021 08:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234502AbhKSJA4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 19 Nov 2021 04:00:56 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39246
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234476AbhKSJAz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 04:00:55 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7F2CD4001F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Nov 2021 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637312273;
        bh=Q2Xq+lz5R/zlPr5E9PhfPrpqfALjDZ550sxUN46fIkA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ajczkAhxmtPh01kCJPAg7qWo/V+5zbsy0HXo0+lZmgSKJPrseWPkwPLft6cimDQwt
         2EGFtKgBfQZ08IhH6eHcjsDZawbjNzM/l9O9Y1rWvlZLiCkbaxorvFDyQ+cD6ehf78
         4QRi8S8ZcCv9WwVtqfXUo0ucF2MigUYroCI49/WENNXL+2TuSLOLfpV16deUOGJloE
         iwBXclxVS71tib6sj/LNxoLEiPuhnYwWW7jFCufH3ZFS5M2nv0jKrwJ2maREwfgf9j
         33LQEmE6SoQK3IccHb9tmPStRcGXE6q9IuDbcX7nO7YS+QFBEJVdcIqESYvsrIqUEj
         MHsjpz5LgclnA==
Received: by mail-lf1-f72.google.com with SMTP id k5-20020a05651210c500b0040934a07fbdso6122170lfg.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q2Xq+lz5R/zlPr5E9PhfPrpqfALjDZ550sxUN46fIkA=;
        b=446j/HwxjZWb9tkzm9iu8MyRrbuL55DNaeoBxpOfFkMX/bP1eJ94zJUmj+4TNgKtcj
         t/QFR+67vsgniYOkweCTyCETLJSNuCUqh913aI8+KVllTQxRBzV/76XnGqSmVw8pWcFt
         tHoRsIsMgPwI+8NYuHFEQ2nPgDZrWpOcV9A8bUc9q2fbas0dvso7Uv7CoE0S8WW5c79Y
         rHWlKcnStBLY720p3/xRDRe7uUqgcWwn1JdOR6DT/VMAY3fzDvFoJF6b9jo+/MvxvYAr
         +JsnjnDqMkkpWQ2NghRmHD9D/5tgO29SkCtjAbeuLsCUG0XEHN+sTMLkdmfLzhwnHwLR
         yF5Q==
X-Gm-Message-State: AOAM53244uzMJmW8guA0TM2Rl2VKmVmmGiegx5whxovT2mtP2fPKQY0K
        9fR/Py61Pjx1nwhU04F0bY96DqwitzXmv4QymP7JQhqCdyvYunmDLcIyMLsr4xM6hWMXY+pe9oH
        MI+PYhAuW37HIKJK0u+TGIv6s9iu8xRTRBLon6+RSja1k1KM9
X-Received: by 2002:a2e:9a09:: with SMTP id o9mr24529360lji.21.1637312272782;
        Fri, 19 Nov 2021 00:57:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlLab4GnUpev9rIdVitfS5kqSKRDOwtirMnZsL11xiqoH898mmLHs7m3hFj0tATN8s62/2+A==
X-Received: by 2002:a2e:9a09:: with SMTP id o9mr24529318lji.21.1637312272447;
        Fri, 19 Nov 2021 00:57:52 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id t7sm300122lfg.115.2021.11.19.00.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 00:57:51 -0800 (PST)
Message-ID: <589dbb7f-4f7c-0ae0-e899-04107accf23c@canonical.com>
Date:   Fri, 19 Nov 2021 09:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: exynos5: add exynosautov9-hsi2c
 compatible
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20211112010137.149174-1-jaewon02.kim@samsung.com>
 <CGME20211112010603epcas2p26c076e65e0cb286cb53f06053165ef60@epcas2p2.samsung.com>
 <20211112010137.149174-2-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211112010137.149174-2-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/11/2021 02:01, Jaewon Kim wrote:
> This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thanks Jaewon for your patch. After more discussions and remarks from
David, I think we should go with dedicated USI driver instead of using
sysreg/syscon in every I2C/UART/SPI.

Therefore I want to remove my reviewed-by and instead ask to work on
dedicated USI driver (option 1 from Chanho's email).

It's not that this solution is anything bad, just it won't be flexible
to support USIv1. It will also lead to duplicated - and possibly
conflicting - USI configuration in each of drivers (I2C/UART/SPI).

> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> index 2dbc0b62daa6..39f4067d9d1f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> @@ -14,6 +14,8 @@ Required properties:
>  				on Exynos5260 SoCs.
>  	-> "samsung,exynos7-hsi2c", for i2c compatible with HSI2C available
>  				on Exynos7 SoCs.
> +	-> "samsung,exynosautov9-hsi2c", for i2c compatible with HSI2C available
> +				on ExynosAutov9 SoCs.
>  
>    - reg: physical base address of the controller and length of memory mapped
>      region.
> @@ -31,6 +33,11 @@ Optional properties:
>         at 100khz.
>      -> If specified, the bus operates in high-speed mode only if the
>         clock-frequency is >= 1Mhz.
> +  - samsung,sysreg : system registers controller phandle to control USI.
> +    -> If I2C integrated to USI(Universal Serial Interface), this property
> +       is required. When using Exynos USI block, it needs to select which type
> +       of Serial IPs(UART, SPI, I2C) to use with system register. So, it
> +       requires samsung,sysreg phandle and offset value of system register.
>  
>  Example:
>  
> 


Best regards,
Krzysztof
