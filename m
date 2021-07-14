Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD00C47E48
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Jul 2021 22:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB2CB613C9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Jul 2021 22:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbhGNXCG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Jul 2021 19:02:06 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:41654 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhGNXCE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 19:02:04 -0400
Received: by mail-io1-f42.google.com with SMTP id z9so4118751iob.8;
        Wed, 14 Jul 2021 15:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KbmmvJeOdCwoGDuIj5l12VzKcZvZF1mWFuwkSqXYzIU=;
        b=uWxDdo7XmoH3pXS4Z0JawwMC8Aua6PU1A8wABjcPdagOvgNo+TXzbQHPU3wOLtAkKA
         kgbpS/h/87vmDkzQGKYmocYEaESmp65tozGlXydaD+RcIWhtHY5LBrH7JYUTwUOFyp7c
         pD1s5gfZk9qoEsK+0SWmk9jN9OF1pTn1qiGsmoL2BXlONbBqMCoV7aAxQwx9UHGOlEJ9
         lDIu/7qug/U4obJn6qGp1odBBfE6wDXw8B48ictCWI4XNCeAqR43RAmZUM8BQygkr8UO
         4netThIjBc/UEL5SmR7svWK+OuPOHUgAB3JiS+wqW6svA+Q5Rva+TLhMN6X3XsLKZFCX
         tzqg==
X-Gm-Message-State: AOAM533rX8j36MlEO7TWqlObIuJQfyjLhBGUiBjXWkFGE7im3j2YKVse
        /Vp57z6hUT9orrmgUAQS2w==
X-Google-Smtp-Source: ABdhPJwwXy+4iyS+HLc4HV+QnkK5rCaaq570TtPqkCjQuhoTLFUejfe6LH7FZkoFaPiq9IW/aXVh9A==
X-Received: by 2002:a05:6602:2285:: with SMTP id d5mr391182iod.24.1626303552011;
        Wed, 14 Jul 2021 15:59:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g15sm744716ild.29.2021.07.14.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 15:59:11 -0700 (PDT)
Received: (nullmailer pid 3697302 invoked by uid 1000);
        Wed, 14 Jul 2021 22:59:08 -0000
Date:   Wed, 14 Jul 2021 16:59:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: [RFC PATCH 12/17] dt-bindings: display: bridge:
 samsung,mipi-dsim: Add i.MX8MM support
Message-ID: <20210714225908.GA3694990@robh.at.kernel.org>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-13-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704090230.26489-13-jagan@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Jul 04, 2021 at 02:32:25PM +0530, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.
> 
> Add dt-bingings for it.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 84 ++++++++++++++++++-
>  1 file changed, 83 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> index b2970734ffd7..bd12d5706291 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -26,6 +26,7 @@ properties:
>        - samsung,exynos5410-mipi-dsi
>        - samsung,exynos5422-mipi-dsi
>        - samsung,exynos5433-mipi-dsi
> +      - fsl,imx8mm-mipi-dsim
>  
>    reg:
>      maxItems: 1
> @@ -39,6 +40,10 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true
> +  assigned-clocks: true

You don't need these. They are always allowed if 'clocks' is present.

> +
>    clocks:
>      minItems: 2
>      maxItems: 5
> @@ -102,7 +107,7 @@ properties:
>          properties:
>            endpoint@0:
>              $ref: /schemas/graph.yaml#/properties/endpoint
> -            description: sub-node describing the input from MIC
> +            description: sub-node describing the input from MIC or LCDIF
>  
>          unevaluatedProperties: false
>  
> @@ -128,6 +133,30 @@ required:
>  
>  allOf:
>    - $ref: ../dsi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mm-mipi-dsim
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: bus_clk
> +            - const: sclk_mipi
> +
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +
> +      required:
> +        - ports
> +
>    - if:
>        properties:
>          compatible:
> @@ -221,6 +250,59 @@ additionalProperties:
>    type: object
>  
>  examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +    #include <dt-bindings/power/imx8mm-power.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dsi@32e10000 {
> +       compatible = "fsl,imx8mm-mipi-dsim";
> +       reg = <0x32e10000 0x400>;
> +       clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +                <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +       clock-names = "bus_clk", "sclk_mipi";
> +       assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +                         <&clk IMX8MM_VIDEO_PLL1_OUT>,
> +                         <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +       assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> +                         <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> +                         <&clk IMX8MM_VIDEO_PLL1_OUT>;
> +       assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> +       interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +       phys = <&mipi_phy 0>;
> +       phy-names = "dsim";
> +       power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DSI>;
> +       samsung,burst-clock-frequency = <891000000>;
> +       samsung,esc-clock-frequency = <54000000>;
> +       samsung,pll-clock-frequency = <27000000>;
> +       status = "disabled";
> +
> +       ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +             reg = <0>;
> +             #address-cells = <1>;
> +             #size-cells = <0>;
> +
> +             dsi_in_lcdif: endpoint@0 {
> +                reg = <0>;
> +                remote-endpoint = <&lcdif_out_dsi>;
> +             };
> +          };
> +
> +          port@1 {
> +             reg = <1>;
> +
> +             dsi_out_panel: endpoint {
> +                remote-endpoint = <&panel_in_dsi>;
> +             };
> +          };
> +       };
> +    };
> +
>    - |
>      #include <dt-bindings/clock/exynos5433.h>
>      #include <dt-bindings/gpio/gpio.h>
> -- 
> 2.25.1
> 
> 
