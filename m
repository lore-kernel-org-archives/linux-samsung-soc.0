Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA6DC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 002B8600AA
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236622AbhHQUVx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:21:53 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:35726 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235006AbhHQUVl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 16:21:41 -0400
Received: by mail-ot1-f53.google.com with SMTP id f16-20020a056830205000b00519b99d3dcbso5397694otp.2;
        Tue, 17 Aug 2021 13:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9rcu62ZUjY23UyPHPuWY2ja8ZDzCwiHPaMQu9Gu8AQw=;
        b=MdqS0xeCksCi8a7ukxyygXYsumoJZBbGCdNI94ycoSAObXF+OJ++nZcPGRqYeHpZdR
         H5Sxhdd8EpalkIAmCR3i5eYleiPlQfxJcyTYtTmdRuJ4n3U5Hz8y/7nccV5Az6u+C2P3
         LIdvAwS/kVWPg+KaEPGWOpNrEu8+rJi3yvQ66/p34ACQs/k0qSrcqzqdWgn2kshwYWxh
         xcJSnB7qOTdrIb/rGjwMLJOvyji4vIrwy2w/TT/tHMVkVemeEF7WElJVuY+0NYRsUhRE
         UGKn277aGnU7uyysbT/WIwk5cKkL1jBLwyIQfoeduUFixfapd96x+LFfR2UU6j1rXNb9
         F50g==
X-Gm-Message-State: AOAM532rq7Edi0cBiUaRvjsGyHd1Pm7RlKxsQSolHQ401pdZ3syPbQHC
        PLtiuQgy4GK8P+rz+pUWDw==
X-Google-Smtp-Source: ABdhPJwDF7VZshGzB7zpbrJRXA4sDG/zNtRqlGQe9iowflMQ6DCTi42LUL2+IiS3ynyh8q4ZO4edvA==
X-Received: by 2002:a05:6830:929:: with SMTP id v41mr3871170ott.16.1629231666988;
        Tue, 17 Aug 2021 13:21:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y12sm697101oiv.55.2021.08.17.13.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:21:06 -0700 (PDT)
Received: (nullmailer pid 774464 invoked by uid 1000);
        Tue, 17 Aug 2021 20:21:05 -0000
Date:   Tue, 17 Aug 2021 15:21:05 -0500
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
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: samsung: convert Exynos542x
 to dtschema
Message-ID: <YRwaMWChKoasAFYh@robh.at.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810093145.26153-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Aug 10, 2021 at 11:31:40AM +0200, Krzysztof Kozlowski wrote:
> Merge Exynos542x clock controller bindings to existing DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/clock/exynos5420-clock.txt       | 42 -------------------
>  .../bindings/clock/samsung,exynos-clock.yaml  | 11 ++++-
>  2 files changed, 10 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> deleted file mode 100644
> index 717a7b1531c7..000000000000
> --- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -* Samsung Exynos5420 Clock Controller
> -
> -The Exynos5420 clock controller generates and supplies clock to various
> -controllers within the Exynos5420 SoC and for the Exynos5800 SoC.
> -
> -Required Properties:
> -
> -- compatible: should be one of the following.
> -  - "samsung,exynos5420-clock" - controller compatible with Exynos5420 SoC.
> -  - "samsung,exynos5800-clock" - controller compatible with Exynos5800 SoC.
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
> -dt-bindings/clock/exynos5420.h header and can be used in device
> -tree sources.
> -
> -Example 1: An example of a clock controller node is listed below.
> -
> -	clock: clock-controller@10010000 {
> -		compatible = "samsung,exynos5420-clock";
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
> index cd6567bd8cc7..b0f58a1cf6cb 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
> @@ -18,7 +18,16 @@ description: |
>  
>  properties:
>    compatible:
> -    const: samsung,exynos5250-clock
> +    oneOf:
> +      - enum:
> +          - samsung,exynos5250-clock
> +          - samsung,exynos5420-clock
> +          - samsung,exynos5800-clock
> +      - items:
> +          - enum:
> +              - samsung,exynos5420-clock
> +              - samsung,exynos5800-clock

Is there a reason these are supported with or without 'syscon'?

> +          - const: syscon
>  
>    assigned-clocks: true
>    assigned-clock-parents: true
> -- 
> 2.30.2
> 
> 
