Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA7EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B397161209
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhIOIaK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 04:30:10 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53036
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232307AbhIOIaJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 04:30:09 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 918BB40285
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631694530;
        bh=/IRBxu7nqqQwWukLDNF8mXTbZavrvfbLU6FhnLGRjL4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=CtXMyFBbOe859X8h3Tg6LP1kpMcaKJWIyMOM66EoHBvWE3uESfbtalASMuZqzLEub
         lWWy8EJhIt3mGVOaxmGRwZiBLP6uGs25iUs2rcMhRsd9cXffckL0Kt25SU5sEqbSXO
         QwiU8YQyWTTL/dxlOlSTFD+8vPLgglwI4xhez5IDxpsh5Vb25ee8dbaNa4oiqI4rKM
         l4mkJAhLbuF5HE/otkF6R4tDran/9Noe7o/2IbWgEAXWjB0REjBlSTuieJS+XHOpGo
         REPrvkhSaH/OLkQKiEkGdzX/A3KjcJJ11mHrkSlAiOKGGnp3ibpdr41of0ZX+yZ8Pr
         OEccKx4hSUXbg==
Received: by mail-ed1-f71.google.com with SMTP id s12-20020a05640217cc00b003cde58450f1so1173391edy.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 01:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/IRBxu7nqqQwWukLDNF8mXTbZavrvfbLU6FhnLGRjL4=;
        b=HpFmOZT2ZKW4JUJmYL++pk0DsZi34chitIFuTFyP8SS+HGo+tUudI56ge7Pm97T5Gb
         IJHBqyIZkq/XhSxH3utMiwuC2HqL7kE06Is8iDVEitgaEzHH4ziIui+/pr8JG4LPqZoG
         GGo5F3+xaw0q8PDiCy4uNwVYa5dcCXEHHT7XrY03fKnTuZUlih6M7o9TgWkedhPPcSHq
         jQd1R9kfEQQutl8u6UGh4C2mDr9VaJnN1LpfLehUyN+X6QIqrHn9c5TyQMPsmjiBQSFf
         6b76Peh+FV6o73vqFaRYr8qDeaa/DmtfKIujx0byxRlqEe96A/Y3wyTAkE+kp9ogUkar
         CZRA==
X-Gm-Message-State: AOAM532bd4Xa4JxvIxET5KYwnJFSmgvu+SJFc+8ttGcsrWI0IChmsN1K
        oW6wUZbvm4+u9ieOA8rYXE0cUvvwW8ciSrSqRZUgfPKUhfcR4el8K4pS5pPY2hWs91jgTLjY0Eo
        vo1TZGBZkxMJTXSyxjl2XFpeLoN+rSsduimmQQzDNArc9GazQ
X-Received: by 2002:a05:6402:2048:: with SMTP id bc8mr24440073edb.114.1631694529618;
        Wed, 15 Sep 2021 01:28:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFE7KpqwtgPjFHqZtwqDPFpM2l1Rj+AfEANN6cyfGTPrR0kyY4r2TwAFv44S4jcixEb1XdIg==
X-Received: by 2002:a05:6402:2048:: with SMTP id bc8mr24440045edb.114.1631694529404;
        Wed, 15 Sep 2021 01:28:49 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id q11sm6717919edv.73.2021.09.15.01.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:28:48 -0700 (PDT)
Subject: Re: [PATCH 5/6] dt-bindings: clock: Document Exynos850 CMU bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b7fd881e-b027-fb87-3740-69cf00f795c0@canonical.com>
Date:   Wed, 15 Sep 2021 10:28:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/09/2021 17:56, Sam Protsenko wrote:
> Provide dt-schema documentation for Exynos850 SoC clock controller.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../clock/samsung,exynos850-clock.yaml        | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> new file mode 100644
> index 000000000000..b69ba4125421
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynos850-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos850 SoC clock controller
> +
> +maintainers:
> +  - Sam Protsenko <semen.protsenko@linaro.org>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>
> +
> +description: |
> +  Exynos850 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> +  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
> +  clocks must be defined as fixed-rate clocks in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks that available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'dt-bindings/clock/exynos850.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos850-cmu-top
> +      - samsung,exynos850-cmu-core
> +      - samsung,exynos850-cmu-hsi
> +      - samsung,exynos850-cmu-peri
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-cmu-top
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-cmu-core
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_CORE bus clock (from CMU_TOP)
> +            - description: CCI clock (from CMU_TOP)
> +            - description: eMMC clock (from CMU_TOP)
> +            - description: SSS clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_core_bus
> +            - const: dout_core_cci
> +            - const: dout_core_mmc_embd
> +            - const: dout_core_sss
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-cmu-hsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: External RTC clock (32768 Hz)
> +            - description: CMU_HSI bus clock (from CMU_TOP)
> +            - description: SD card clock (from CMU_TOP)
> +            - description: "USB 2.0 DRD clock (from CMU_TOP)"
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: rtcclk
> +            - const: dout_hsi_bus
> +            - const: dout_hsi_mmc_card
> +            - const: dout_hsi_usb20drd
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-cmu-peri
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERI bus clock (from CMU_TOP)
> +            - description: UART clock (from CMU_TOP)
> +            - description: Parent clock for HSI2C and SPI (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_peri_bus
> +            - const: dout_peri_uart
> +            - const: dout_peri_ip
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock controller node for CMU_PERI
> +  - |
> +    #include <dt-bindings/clock/exynos850.h>
> +
> +    cmu_peri: clock-controller@10030000 {
> +        compatible = "samsung,exynos850-cmu-peri";
> +        reg = <0x10030000 0x8000>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&oscclk>, <&cmu_top DOUT_PERI_BUS>,
> +                 <&cmu_top DOUT_PERI_UART>,
> +                 <&cmu_top DOUT_PERI_IP>;
> +        clock-names = "oscclk", "dout_peri_bus",
> +                      "dout_peri_uart", "dout_peri_ip";
> +    };
> +
> +  # External reference clock (should be provided in particular board DTS)
> +  - |
> +    oscclk: clock-oscclk {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-output-names = "oscclk";
> +        clock-frequency = <26000000>;
> +    };

Skip ossclk - it's trivial and not related to these bindings.

> +
> +  # UART controller node that consumes the clock generated by CMU_PERI
> +  - |
> +    #include <dt-bindings/clock/exynos850.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    serial_0: serial@13820000 {
> +        compatible = "samsung,exynos850-uart";
> +        reg = <0x13820000 0x100>;
> +        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&uart0_pins>;
> +        clocks = <&cmu_peri GOUT_UART_PCLK>, <&cmu_peri GOUT_UART_IPCLK>;
> +        clock-names = "uart", "clk_uart_baud0";

The same, skip it because it is trivial and common with all clock providers.

Also Rob's robot checker complains about it.

Best regards,
Krzysztof
