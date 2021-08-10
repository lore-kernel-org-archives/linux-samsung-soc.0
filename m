Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0EEC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 18:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D72A6056C
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 18:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238711AbhHJSRV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Aug 2021 14:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240142AbhHJSPg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 14:15:36 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1A0C04A4D2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:51:48 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id h7so11543365vso.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ixsYQui2jeYMyfqkYaqyNfXnRwT6Ph0OTuv9xBbWMrk=;
        b=w7ECOFWudHs/4QrFGC/RhIsfTa9FFhv918ENySOnC1KvEwtP3WDQJvlq2JlCw7zf5q
         UkXjbUZnALHx0fVp7wxKF+bsO4Mpf3by64V628Wo7thD5MpCc37tqAJi7i63NEIMqdiH
         ZuU7ULEvm8KwWVYSefyzOvwCRgXw1s1FQT79i5E2FbQW5E/b1RQVNlvXx9szQDy9PbYU
         5kAy/ERGEivefdVo9SanfXAG0s7kKzyAoZ9vHbSUr7q5Q8ODaV64gZjdWIRZ0SgapaAc
         /TWFM1eY0lRyu4EsbgKxOAl2bq1R96i8dkgX/0xJ863GMaZAACxj9xt1oxEkB+Esscf0
         MxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ixsYQui2jeYMyfqkYaqyNfXnRwT6Ph0OTuv9xBbWMrk=;
        b=a1Vn0fPsAgB6BtLQdBsZQeVzApUIfk4lwzttPrgPsn9r4Au5u82FN7CggygRXk/Cja
         Pr4YDx1dsOg0aEyBC98k/edneuga2HnIIdSSJLRMtb/eWeDhN/QY40JfXjAFxVtIGqHH
         tn8sk0IZ0Uw1wJgN3EhFSL7RddPo+EQV21B8FvzPtr00mtUViOV3hCSLUKDoiVO6sS5O
         Ss0ZQwFAXdNknIUG3vGCv+isP5WmsR6O3k340/Ldw4+/pE00DRopgWqQ0GmvofYHTpnd
         cbBqAps+OOVpI5N/4ng0MyWQMVRPHz67vfVRnucFX9ntXK1wxW/LkW0pTy6S1hndOKsM
         mQTg==
X-Gm-Message-State: AOAM533n+6fu9hMnxZ9xt0kUSdsklChOZeAiThB2z8qTRwkiu66+Dnwe
        BPxr8EikEUKxvNJ5s4bd9AnedH+qiftBdnrNCRPExQ==
X-Google-Smtp-Source: ABdhPJzweNNCvyNVtNVRSwEpNxbDMRb8ENoISFvROkEAo2V1XAvxarYlKVZHy7LYOrjcViHw5Qofq2X1sLL8D87aZqI=
X-Received: by 2002:a67:c414:: with SMTP id c20mr14665309vsk.27.1628617907216;
 Tue, 10 Aug 2021 10:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com> <20210810093145.26153-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210810093145.26153-2-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 10 Aug 2021 20:51:35 +0300
Message-ID: <CAPLW+4njX-R2e66qcCz=OT_bYKTRLHTH4nFv==EEovJyjN8qAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: samsung: convert Exynos5250 to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 10 Aug 2021 at 12:32, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
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
> -       clock: clock-controller@10010000 {
> -               compatible = "samsung,exynos5250-clock";
> -               reg = <0x10010000 0x30000>;
> -               #clock-cells = <1>;
> -       };
> -
> -Example 2: UART controller node that consumes the clock generated by the clock
> -          controller. Refer to the standard clock bindings for information
> -          about 'clocks' and 'clock-names' property.
> -
> -       serial@13820000 {
> -               compatible = "samsung,exynos4210-uart";
> -               reg = <0x13820000 0x100>;
> -               interrupts = <0 54 0>;
> -               clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
> -               clock-names = "uart", "clk_uart_baud0";
> -       };
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
> +  clocks: true
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
> @@ -16491,6 +16491,7 @@ L:      linux-samsung-soc@vger.kernel.org
>  S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
>  F:     Documentation/devicetree/bindings/clock/exynos*.txt

Are there any exynos*.txt bindings actually left after this series? If
no, maybe it's worth to remove this line while at it.

> +F:     Documentation/devicetree/bindings/clock/samsung,*.yaml
>  F:     Documentation/devicetree/bindings/clock/samsung,s3c*
>  F:     Documentation/devicetree/bindings/clock/samsung,s5p*
>  F:     drivers/clk/samsung/
> --
> 2.30.2
>
