Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5351C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:24:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE8EE61053
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:24:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhHQUY5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:24:57 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:38881 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236664AbhHQUYh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 16:24:37 -0400
Received: by mail-oi1-f181.google.com with SMTP id u25so974555oiv.5;
        Tue, 17 Aug 2021 13:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kZ4GZU+7fyfl0KjYQjgxvk/LHWAzaoUQh7K2ehczNG0=;
        b=LBRXpt383QwipPrLIBt+m5UBvbM42rhQj5StYx9viCmA60hu05iDCM3WrmAKi0rt8E
         PGoK8H8ee9KKIuhf6zYmSMx/Ley2mYxRmNCk5tS4854gCU4SweZNLjoeSdvxUBz69WUs
         YA/hSvxsqXEZhBLTyX67Jw33dlBitEBghEZQJc8DLlrKaoGO1xRj99OF+3rpUY/q3S7K
         CRPexHjVDILNzFaqNz2Vv0FdPbY+G3V5q6dMsSTAdMlnXLe7p7jaxdrYPFS0XgWEqSrl
         8uREGmrGO06FHS0K/CoEGjjXYImmAdLVedi562H4phSnw1pnsVjywBXsRwaj0qIpePEo
         CcUw==
X-Gm-Message-State: AOAM533KUte5oUkA74kypUQ3SWYlBF8xmH/5N6SDo37pFZeYSFdgZ5f2
        UsraZf9TXpT767tDHS8Pdg==
X-Google-Smtp-Source: ABdhPJybcy6MgzZnE9b6nosYrtUwTU+EsEhZGVJhbk10LQsFqFEyaImQjLIYd41gT+F/8e25SmJFPg==
X-Received: by 2002:a05:6808:2084:: with SMTP id s4mr3971943oiw.31.1629231843416;
        Tue, 17 Aug 2021 13:24:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l3sm566105otd.79.2021.08.17.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:24:02 -0700 (PDT)
Received: (nullmailer pid 778441 invoked by uid 1000);
        Tue, 17 Aug 2021 20:24:01 -0000
Date:   Tue, 17 Aug 2021 15:24:01 -0500
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
Subject: Re: [PATCH v2 5/8] dt-bindings: clock: samsung: convert Exynos4 to
 dtschema
Message-ID: <YRwa4ehkBUNwJi+I@robh.at.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810093145.26153-6-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Aug 10, 2021 at 11:31:42AM +0200, Krzysztof Kozlowski wrote:
> Merge Exynos4210 and Exynos4412 clock controller bindings to existing DT
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/clock/exynos4-clock.txt          | 86 -------------------
>  .../bindings/clock/samsung,exynos-clock.yaml  | 29 ++++++-
>  2 files changed, 28 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
> deleted file mode 100644
> index 17bb11365354..000000000000
> --- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -* Samsung Exynos4 Clock Controller
> -
> -The Exynos4 clock controller generates and supplies clock to various controllers
> -within the Exynos4 SoC. The clock binding described here is applicable to all
> -SoC's in the Exynos4 family.
> -
> -Required Properties:
> -
> -- compatible: should be one of the following.
> -  - "samsung,exynos4210-clock" - controller compatible with Exynos4210 SoC.
> -  - "samsung,exynos4412-clock" - controller compatible with Exynos4412 SoC.
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
> -dt-bindings/clock/exynos4.h header and can be used in device
> -tree sources.
> -
> -Example 1: An example of a clock controller node is listed below.
> -
> -	clock: clock-controller@10030000 {
> -		compatible = "samsung,exynos4210-clock";
> -		reg = <0x10030000 0x20000>;
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
> -
> -Exynos4412 SoC contains some additional clocks for FIMC-ISP (Camera ISP)
> -subsystem. Registers for those clocks are located in the ISP power domain.
> -Because those registers are also located in a different memory region than
> -the main clock controller, a separate clock controller has to be defined for
> -handling them.
> -
> -Required Properties:
> -
> -- compatible: should be "samsung,exynos4412-isp-clock".
> -
> -- reg: physical base address of the ISP clock controller and length of memory
> -  mapped region.
> -
> -- #clock-cells: should be 1.
> -
> -- clocks: list of the clock controller input clock identifiers,
> -  from common clock bindings, should point to CLK_ACLK200 and
> -  CLK_ACLK400_MCUISP clocks from the main clock controller.
> -
> -- clock-names: list of the clock controller input clock names,
> -  as described in clock-bindings.txt, should be "aclk200" and
> -  "aclk400_mcuisp".
> -
> -- power-domains: a phandle to ISP power domain node as described by
> -  generic PM domain bindings.
> -
> -Example 3: The clock controllers bindings for Exynos4412 SoCs.
> -
> -	clock: clock-controller@10030000 {
> -		compatible = "samsung,exynos4412-clock";
> -		reg = <0x10030000 0x18000>;
> -		#clock-cells = <1>;
> -	};
> -
> -	isp_clock: clock-controller@10048000 {
> -		compatible = "samsung,exynos4412-isp-clock";
> -		reg = <0x10048000 0x1000>;
> -		#clock-cells = <1>;
> -		power-domains = <&pd_isp>;
> -		clocks = <&clock CLK_ACLK200>, <&clock CLK_ACLK400_MCUISP>;
> -		clock-names = "aclk200", "aclk400_mcuisp";
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
> index c7b07fcd3fa1..ea73201f259b 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
> @@ -23,6 +23,9 @@ properties:
>            - samsung,exynos3250-cmu
>            - samsung,exynos3250-cmu-dmc
>            - samsung,exynos3250-cmu-isp
> +          - samsung,exynos4210-clock
> +          - samsung,exynos4412-clock
> +          - samsung,exynos4412-isp-clock
>            - samsung,exynos5250-clock
>            - samsung,exynos5420-clock
>            - samsung,exynos5800-clock
> @@ -35,11 +38,18 @@ properties:
>    assigned-clocks: true
>    assigned-clock-parents: true
>    assigned-clock-rates: true
> -  clocks: true
> +  clocks:
> +    description: |
> +      For samsung,exynos4412-isp-clock, the input clocks should be CLK_ACLK200
> +      and CLK_ACLK400_MCUISP from the main clock controller.
> +
> +  clock-names: true
>  
>    "#clock-cells":
>      const: 1
>  
> +  power-domains: true
> +

How many?

Now all the flavors can have a power domain? Maybe this should be a 
separate binding given this and the if/then below.

>    reg:
>      maxItems: 1
>  
> @@ -50,6 +60,23 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos4412-isp-clock
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: aclk200
> +            - const: aclk400_mcuisp
> +      required:
> +        - clocks
> +        - clock-names
> +        - power-domains
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/exynos5250.h>
> -- 
> 2.30.2
> 
> 
