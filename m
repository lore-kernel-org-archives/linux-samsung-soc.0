Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55326C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 16:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A04061216
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 16:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhIOQtW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 12:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbhIOQtO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 12:49:14 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A5EC061764;
        Wed, 15 Sep 2021 09:47:55 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id v1so1970599plo.10;
        Wed, 15 Sep 2021 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZQ7s/mGw0WG9osk+oVmS7ZV5w2QLLdwMKBMb4EfWLHw=;
        b=TvGb0ZIjsvJNRUkh8D3YL9wtOW+u+ZXYr56sNmhj8KRltUM1ZwoYaSaFFnHpPfYQ75
         dxHZV383q6cv4tntpVEQZGi1Qs3IKMA6cD3ryY3X5SH6RTCg+DQgJTUX6+GyDfCb0Ve8
         xtRE8nRR56lT6HMxDc8m4slJ8k9jHRV1AcvbCFDpoTFDz/9flwQ+U2GcPNGREqIAeHWG
         7RFpTnGx1AsZux1CpVAHrPSnEHc5AcnLjJjUbj1hlixA5vVmJ6k4UoLsfC/B81YEDjhZ
         n9i2ACniM8xerueLeSRkYg6VKbCbd7cRl3kqclfwpfO/9F/lHTGJ1FPbZm0ghmQ5+RgU
         +9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZQ7s/mGw0WG9osk+oVmS7ZV5w2QLLdwMKBMb4EfWLHw=;
        b=0Y0G1JOOokdAvjZ3fvwkvX7t5U/5iwFEgqTkCBCOQ66tSQllkPq5qm7lA7X/HwRfc6
         BmrOx7jG3PEW7BPiNJ31UFKUJNIU079n3JnNlh1bOxNoIF882Tbt7jWZioYm5An2FaP6
         Put9Kc0sR7eHqp4U85A+4RAdV31dk7VpRLDJH4Nflt0Z5Nli7kFM2+wLVbopbBVJCHuh
         jekMymGHs1CBOb5pfkNU4jO9yP/sOgUKrj7Uz07uFC8q8rMuyK/SB9/ju3MljGkhJvOJ
         A7g9O88g5ur6CG3i5UvokYbeC9KaBlFSkIw4JMUG5hopsW4MOHkntNd0PWc9+n8OjnVc
         hJoA==
X-Gm-Message-State: AOAM530ccxv3THzPQOT1odNxBckKFSE/hY/cGwmrpYXeJxtHCnJdtP1t
        EMTRvjJopDe7R1eaK8fVvHFTCzFkg+o=
X-Google-Smtp-Source: ABdhPJxpbk51N2H7PY7QrD98hfc6+sj7hlJYvutPIKDZGm7b14PYxvlX0ifacD5Yf7gUaSirfevVgw==
X-Received: by 2002:a17:90b:3901:: with SMTP id ob1mr9567585pjb.136.1631724473946;
        Wed, 15 Sep 2021 09:47:53 -0700 (PDT)
Received: from [172.30.1.2] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id e3sm425592pfi.189.2021.09.15.09.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 09:47:53 -0700 (PDT)
Subject: Re: [PATCH 5/6] dt-bindings: clock: Document Exynos850 CMU bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <f46da96e-fde4-b943-9e5f-289e28dabcbe@gmail.com>
Date:   Thu, 16 Sep 2021 01:47:47 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21. 9. 15. 오전 12:56, Sam Protsenko wrote:
> Provide dt-schema documentation for Exynos850 SoC clock controller.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   .../clock/samsung,exynos850-clock.yaml        | 190 ++++++++++++++++++
>   1 file changed, 190 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
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
> +    };
> +
> +...
> 

Looks good for very detailed description and example. Thanks.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
