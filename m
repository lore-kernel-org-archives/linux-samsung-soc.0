Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19A0C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 11:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95B2F615E4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 11:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbhJELuc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234437AbhJELua (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 07:50:30 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42779C061755
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 04:48:40 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id i8so14631138uae.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 04:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w65gTJxFbz04XwSU8/KjiORdSOZVddCyDuIADwGWUVo=;
        b=pVpIu+3+mS7gUHBUVpY693C3LuXW04O+gYVeyHbFPmO1aG6RSZTvqlaQ0v/3SGtMX5
         fju5Vba9+it7sm7o8WdycLWAuF0te34boZFUYC74pmygqBhqkJd26jdWqQ+s87Fl0H1O
         CRZ6JsLSqGL9N+GSXIfrMsOo8BWF2/njuMRD6VMJYcDVKueyzYTugNk+daStm2CxRTqG
         zBP7PUDwwyYDSR2HWqvxGHcpyK+zWpos/zPG4L3MNANOPe2eYBYJ/29pJewVBCeV8sOx
         7n7XbtL7JhEnTA6xakQWQGCoqhjXRY3RmE0b9yGrU48IS4Pa173eGCke1uQkUdKWeZg5
         CA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w65gTJxFbz04XwSU8/KjiORdSOZVddCyDuIADwGWUVo=;
        b=lV/Cdannji1mJg98Mp+XSll8VbcZgbel9q5grjUgsclaVHXk97eS4uN+iWs58OjxGd
         J9HIT/g9NhDfAGZNER18pLFWbVULqZf+UbQLJdGZ9kHSCDxb8q2uKK4AfGKlSJpkKjjb
         UATKQsglXwGWta9897icJ7kgA/JVnGvHsKel0i+kPJ5Yc37XNBnG+IqQZQ9mc2yWKMMu
         dXwuSWEEj1qvxHOxVKIglxpIdu2MSsqsrJF0Dj/it+vHVkMyXSZ7TUtD4jfFJ9xi80v6
         2MKDzUWi5mAdxvUmoZnWcatoiTAj0+WjzHqrJoye616Bp9+xteVhAXc1ftM8l0FbD1KJ
         9yDw==
X-Gm-Message-State: AOAM531LGy0RXlPNbtjkYtQwZH9z18ELOqXWslqVKBjmPTx9KAvFndwx
        poQ326yv6sP8iJZNEQVKVV8L5Hd5vTLvm9fmhe3Uyg==
X-Google-Smtp-Source: ABdhPJw/I5mt3Hf/TSbz237Lk4ZVdt2chbbjsovFphVnPIQOclGA3DiQ//ElU7McIxpgXpURCPqlh/fpctCt1JhFbQk=
X-Received: by 2002:ab0:208b:: with SMTP id r11mr1074086uak.104.1633434519318;
 Tue, 05 Oct 2021 04:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-6-semen.protsenko@linaro.org> <b7fd881e-b027-fb87-3740-69cf00f795c0@canonical.com>
In-Reply-To: <b7fd881e-b027-fb87-3740-69cf00f795c0@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 5 Oct 2021 14:48:27 +0300
Message-ID: <CAPLW+4nSSQ3uR+ojzd=Ab6qQzXLxdLvBdwLgSHynXCLat30rvg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: clock: Document Exynos850 CMU bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 15 Sept 2021 at 11:28, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 14/09/2021 17:56, Sam Protsenko wrote:
> > Provide dt-schema documentation for Exynos850 SoC clock controller.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  .../clock/samsung,exynos850-clock.yaml        | 190 ++++++++++++++++++
> >  1 file changed, 190 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> > new file mode 100644
> > index 000000000000..b69ba4125421
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> > @@ -0,0 +1,190 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/samsung,exynos850-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung Exynos850 SoC clock controller
> > +
> > +maintainers:
> > +  - Sam Protsenko <semen.protsenko@linaro.org>
> > +  - Chanwoo Choi <cw00.choi@samsung.com>
> > +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> > +  - Tomasz Figa <tomasz.figa@gmail.com>
> > +
> > +description: |
> > +  Exynos850 clock controller is comprised of several CMU units, generating
> > +  clocks for different domains. Those CMU units are modeled as separate device
> > +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> > +  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
> > +  clocks must be defined as fixed-rate clocks in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> > +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this identifier
> > +  to specify the clock which they consume. All clocks that available for usage
> > +  in clock consumer nodes are defined as preprocessor macros in
> > +  'dt-bindings/clock/exynos850.h' header.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - samsung,exynos850-cmu-top
> > +      - samsung,exynos850-cmu-core
> > +      - samsung,exynos850-cmu-hsi
> > +      - samsung,exynos850-cmu-peri
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 5
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 5
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynos850-cmu-top
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (26 MHz)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynos850-cmu-core
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (26 MHz)
> > +            - description: CMU_CORE bus clock (from CMU_TOP)
> > +            - description: CCI clock (from CMU_TOP)
> > +            - description: eMMC clock (from CMU_TOP)
> > +            - description: SSS clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: dout_core_bus
> > +            - const: dout_core_cci
> > +            - const: dout_core_mmc_embd
> > +            - const: dout_core_sss
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynos850-cmu-hsi
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (26 MHz)
> > +            - description: External RTC clock (32768 Hz)
> > +            - description: CMU_HSI bus clock (from CMU_TOP)
> > +            - description: SD card clock (from CMU_TOP)
> > +            - description: "USB 2.0 DRD clock (from CMU_TOP)"
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: rtcclk
> > +            - const: dout_hsi_bus
> > +            - const: dout_hsi_mmc_card
> > +            - const: dout_hsi_usb20drd
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynos850-cmu-peri
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (26 MHz)
> > +            - description: CMU_PERI bus clock (from CMU_TOP)
> > +            - description: UART clock (from CMU_TOP)
> > +            - description: Parent clock for HSI2C and SPI (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: dout_peri_bus
> > +            - const: dout_peri_uart
> > +            - const: dout_peri_ip
> > +
> > +required:
> > +  - compatible
> > +  - "#clock-cells"
> > +  - clocks
> > +  - clock-names
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # Clock controller node for CMU_PERI
> > +  - |
> > +    #include <dt-bindings/clock/exynos850.h>
> > +
> > +    cmu_peri: clock-controller@10030000 {
> > +        compatible = "samsung,exynos850-cmu-peri";
> > +        reg = <0x10030000 0x8000>;
> > +        #clock-cells = <1>;
> > +
> > +        clocks = <&oscclk>, <&cmu_top DOUT_PERI_BUS>,
> > +                 <&cmu_top DOUT_PERI_UART>,
> > +                 <&cmu_top DOUT_PERI_IP>;
> > +        clock-names = "oscclk", "dout_peri_bus",
> > +                      "dout_peri_uart", "dout_peri_ip";
> > +    };
> > +
> > +  # External reference clock (should be provided in particular board DTS)
> > +  - |
> > +    oscclk: clock-oscclk {
> > +        compatible = "fixed-clock";
> > +        #clock-cells = <0>;
> > +        clock-output-names = "oscclk";
> > +        clock-frequency = <26000000>;
> > +    };
>
> Skip ossclk - it's trivial and not related to these bindings.
>
> > +
> > +  # UART controller node that consumes the clock generated by CMU_PERI
> > +  - |
> > +    #include <dt-bindings/clock/exynos850.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    serial_0: serial@13820000 {
> > +        compatible = "samsung,exynos850-uart";
> > +        reg = <0x13820000 0x100>;
> > +        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&uart0_pins>;
> > +        clocks = <&cmu_peri GOUT_UART_PCLK>, <&cmu_peri GOUT_UART_IPCLK>;
> > +        clock-names = "uart", "clk_uart_baud0";
>
> The same, skip it because it is trivial and common with all clock providers.
>

Sure, will do in v2.

> Also Rob's robot checker complains about it.
>
> Best regards,
> Krzysztof
