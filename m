Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1A6C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 09:46:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EB0161078
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 09:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhKBJsn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 05:48:43 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60242
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230511AbhKBJsm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 05:48:42 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 69B143F1A6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635846366;
        bh=AIE9FAySoNRsrP7PrL6ZA4sX/6rA6VP1KSokv/7FLdQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=iMxqROzVM8xBNf+M8akn9ynW+el17BQvEtDkn//gaBeQtWUk9PBjWU2TYLEtG+87V
         2u0FkWA5OtgWsQb72kfh4kiL3OryjL52eTGXvUaQWnh2UDxas8A0FIhOepvfcZexW9
         2Qu7V3HZCeuD93jxUImPvXG0+YSBJXimuI6LowVnWXCcrK+8kjrXcjlCOT7H1rcPOa
         yX5VoXtRxNf6nEmR9D1olDkZ0zt6EIpaID845ikWLyQC6/2Fiui8h9FlqOhVnIlP0J
         pmhpAj0ksusCH0XKNP5HszW8xzzlpKCSmbt4sfoY7XFXMkOlhCd3FI3ZNMmPCUIuvu
         U/cBmoWlQvTtA==
Received: by mail-lf1-f69.google.com with SMTP id t17-20020a056512031100b004000d31b4d5so2091398lfp.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 02:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AIE9FAySoNRsrP7PrL6ZA4sX/6rA6VP1KSokv/7FLdQ=;
        b=a9JzfgcdW/+mqqrBgQq1PgeeikUyjxlMfMYUe30sn+W4AjSLItpjKODuI2ZUf5zmyk
         hqwAT9WQmCeqC/c3n7g0Da009FKoYK1aAMZL7IhLk67gOu1aPXICbL8Qhbdp6dSP2aA/
         Fp8j5UBbdncaCvJarAC69VoDWGiO5uBa9NJjnROTtJ2ZMkdUOfwQ/pSLHH42SUZV3zgO
         lqcaFuLaamnlMm/I3WI24OtbFvPfYi2z2Lm/iv/Sgkn6c7cS9ighiLzchzjKnU3LlYOF
         rPQf7nAO0phUrfoRmXX1B77kt85ottaN2fFrKfgwPTkZkQSPODUlIXxHGhAj1c1RMGoX
         Wo8Q==
X-Gm-Message-State: AOAM530ykIBN3BcCPad1Gyn2pc5jNhFaBX55lqYDX4cZ6gdOnUmx6Gz+
        4xM9V5oPi2CwJLeyrZlnwirz4lgB9extABlyu9E/6zSJReMHqf17WQwXt+5UuKE+vh0lqCRH44l
        c/POQ6KVor8jwKvTMs37R37CYvkP/xz5B946+FCiF8/HQHwb5
X-Received: by 2002:a05:651c:158e:: with SMTP id h14mr2640499ljq.401.1635846365875;
        Tue, 02 Nov 2021 02:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw341bie4LqR7uIAJM+FCfENRp0QNBPgOqp2JCB6H+SjqSWv2AkkbKW3S3/KlpYJAuR7O6XxQ==
X-Received: by 2002:a05:651c:158e:: with SMTP id h14mr2640474ljq.401.1635846365566;
        Tue, 02 Nov 2021 02:46:05 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y19sm1637963lfa.123.2021.11.02.02.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 02:46:05 -0700 (PDT)
Message-ID: <ab1d3a57-37fb-2329-33a4-8fe40a472518@canonical.com>
Date:   Tue, 2 Nov 2021 10:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 02/12] dt-bindings: watchdog: Document Exynos850
 watchdog bindings
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> Exynos850 SoC has two CPU clusters:
>   - cluster 0: contains CPUs #0, #1, #2, #3
>   - cluster 1: contains CPUs #4, #5, #6, #7
> 
> Each cluster has its own dedicated watchdog timer. Those WDT instances
> are controlled using different bits in PMU registers, new
> "samsung,index" property is added to tell the driver which bits to use
> for defined watchdog node.
> 
> Also on Exynos850 the peripheral clock and the source clock are two
> different clocks. Provide a way to specify two clocks in watchdog device
> tree node.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Stated explicitly that Exynos850 driver requires 2 clocks
>   - Used single compatible for Exynos850
>   - Added "index" property to specify CPU cluster index
>   - Fixed a typo in commit message: dedicater -> dedicated
> 
>  .../bindings/watchdog/samsung-wdt.yaml        | 44 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 93cd77a6e92c..f29d0ca4eced 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -22,25 +22,32 @@ properties:
>        - samsung,exynos5250-wdt                # for Exynos5250
>        - samsung,exynos5420-wdt                # for Exynos5420
>        - samsung,exynos7-wdt                   # for Exynos7
> +      - samsung,exynos850-wdt                 # for Exynos850
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    clock-names:
> -    items:
> -      - const: watchdog
> +    minItems: 1
> +    maxItems: 2
>  
>    interrupts:
>      maxItems: 1
>  
> +  samsung,index:

Slightly more descriptive, e.g.:
samsung,cluster-index

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Index of CPU cluster on which watchdog is running (in case of Exynos850)
> +
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420 and Exynos7).
> +      Exynos5420, Exynos7 and Exynos850).
>  
>  required:
>    - compatible
> @@ -59,9 +66,38 @@ allOf:
>                - samsung,exynos5250-wdt
>                - samsung,exynos5420-wdt
>                - samsung,exynos7-wdt
> +              - samsung,exynos850-wdt
>      then:
>        required:
>          - samsung,syscon-phandle
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos850-wdt
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, used for register interface
> +            - description: Source clock (driving watchdog counter)
> +        clock-names:
> +          items:
> +            - const: watchdog
> +            - const: watchdog_src
> +        samsung,index:
> +          enum: [0, 1]
> +      required:
> +        - samsung,index
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, which is also a source clock
> +        clock-names:
> +          items:
> +            - const: watchdog

Also under this else:
   samsung,cluster-index: false

>  
>  unevaluatedProperties: false
>  
> 


Best regards,
Krzysztof
