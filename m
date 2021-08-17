Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5096C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AFBB61104
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhHQUS2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:18:28 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37615 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234605AbhHQURC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 16:17:02 -0400
Received: by mail-oi1-f170.google.com with SMTP id u10so947032oiw.4;
        Tue, 17 Aug 2021 13:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TYwFvXBY4WG4kLTC4yAUxw0DO9WXwIG/O90PS5u/hQo=;
        b=QB+silyiZEx+oFDxqwwLuqUmd08yY+cuKnaB1D7QFFm5uC5X/QXN4W+3mL3wen8xq2
         k/zLnKrQYKrmSpZn2jvGQcTJP8Ids9QeXxvdIQUkFEelMsZz1PAI19BYe6ooCabqLBHo
         gf9KFTQEjDtnLYPqPIOM/++q92Ywsskmo2cGb6CGpjFmxNMg56kuvfALuzVJaDFJ3SC8
         C5hf1CxfGX39SeQJrjVRQD1CyJwoQ/HK9FIjCE/JLIFuKlcb6XKMj/rSXiE6s4wRnTxU
         PC8KtpIxa7SWgVVhrd8I1Zvt5iSgtZ2mttymnmPeeKF2WHibXHplBHR63U2MFxD44hjv
         rIgw==
X-Gm-Message-State: AOAM5336mThqfqQVB8LX226Z7qG5JSPHypAIgCC0eTDWcNa+hSXNfVww
        dnsKRWs1CrGDY7KfpRnk8g==
X-Google-Smtp-Source: ABdhPJwMhdSyZjrMueXAleLXMIQ6atf+3kiyHC3LZVGyblyQPtwV6vU7ep6cNLxMzAhknOrbIQeiGQ==
X-Received: by 2002:a05:6808:494:: with SMTP id z20mr3882271oid.103.1629231388824;
        Tue, 17 Aug 2021 13:16:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m25sm598062otp.41.2021.08.17.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:16:28 -0700 (PDT)
Received: (nullmailer pid 768217 invoked by uid 1000);
        Tue, 17 Aug 2021 20:16:27 -0000
Date:   Tue, 17 Aug 2021 15:16:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: samsung: convert Exynos5250
 to dtschema
Message-ID: <YRwZG1uerWt+NAQH@robh.at.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810093145.26153-2-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Aug 10, 2021 at 11:31:38AM +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos5250 clock controller bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/clock/exynos5250-clock.txt       | 41 ----------------
>  .../bindings/clock/samsung,exynos-clock.yaml  | 48 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 49 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos5250-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> deleted file mode 100644
> index aff266a12eeb..000000000000
> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -* Samsung Exynos5250 Clock Controller
> -
> -The Exynos5250 clock controller generates and supplies clock to various
> -controllers within the Exynos5250 SoC.
> -
> -Required Properties:
> -
> -- compatible: should be one of the following.
> -  - "samsung,exynos5250-clock" - controller compatible with Exynos5250 SoC.
> -
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -
> -- #clock-cells: should be 1.
> -
> -Each clock is assigned an identifier and client nodes can use this identifier
> -to specify the clock which they consume.
> -
> -All available clocks are defined as preprocessor macros in
> -dt-bindings/clock/exynos5250.h header and can be used in device
> -tree sources.
> -
> -Example 1: An example of a clock controller node is listed below.
> -
> -	clock: clock-controller@10010000 {
> -		compatible = "samsung,exynos5250-clock";
> -		reg = <0x10010000 0x30000>;
> -		#clock-cells = <1>;
> -	};
> -
> -Example 2: UART controller node that consumes the clock generated by the clock
> -	   controller. Refer to the standard clock bindings for information
> -	   about 'clocks' and 'clock-names' property.
> -
> -	serial@13820000 {
> -		compatible = "samsung,exynos4210-uart";
> -		reg = <0x13820000 0x100>;
> -		interrupts = <0 54 0>;
> -		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
> -		clock-names = "uart", "clk_uart_baud0";
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
> new file mode 100644
> index 000000000000..cd6567bd8cc7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynos-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC clock controller
> +
> +maintainers:
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>
> +
> +description: |
> +  All available clocks are defined as preprocessor macros in
> +  dt-bindings/clock/ headers.
> +
> +properties:
> +  compatible:
> +    const: samsung,exynos5250-clock
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

These can be dropped. They are always allowed if 'clocks' is present.

> +  clocks: true

This needs to define how many.

> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/exynos5250.h>
> +    clock: clock-controller@10010000 {
> +        compatible = "samsung,exynos5250-clock";
> +        reg = <0x10010000 0x30000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36aee8517ab0..2dbacacac3f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16491,6 +16491,7 @@ L:	linux-samsung-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
>  F:	Documentation/devicetree/bindings/clock/exynos*.txt
> +F:	Documentation/devicetree/bindings/clock/samsung,*.yaml
>  F:	Documentation/devicetree/bindings/clock/samsung,s3c*
>  F:	Documentation/devicetree/bindings/clock/samsung,s5p*
>  F:	drivers/clk/samsung/
> -- 
> 2.30.2
> 
> 
