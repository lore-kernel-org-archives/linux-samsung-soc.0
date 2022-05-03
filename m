Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D206BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 09:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbiECJKs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 05:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbiECJKr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:10:47 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F0336175
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 02:07:15 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id a21so19143941edb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 May 2022 02:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0DOQZSI+2jySOppXzUIGAxMuNHx5Ge1HN5BtN2gjyGU=;
        b=P3jvv5JsIU3wkRIzFn0MPxELWwSr8XJXbSpJtiSgmJtGitnbRqDi/Px6HBzj23LRST
         SnnarFjpZNDKXow0ixUmfo9lLvRTJt1mMBzDyZz/fvytvf1l2a57Qulg2hHxB99RGR+H
         D7HclP+NhMpYyW0+j0js2Ca8nGP9peDcnHzDf2jY/VW4Rv1sgC0coXi9JrpKCWmtLNb6
         pUOg3czqdSo4VoegvGfts6Qd4SblqhvQnlNinZZODou1c8TeDkR/MgAMuLFSC9Dx8HG5
         DgdOQpkxEi1gfP2ojGfBB+LhyDktmbzuwCqGBw1a3sWO51N+NlPRlzMoBqZmThPKdH7v
         n1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0DOQZSI+2jySOppXzUIGAxMuNHx5Ge1HN5BtN2gjyGU=;
        b=XmUh9jeREn+tBYYPnoYxocEg/rzCYix0plJ+py2kyXhZdVLOaTbhpmlb3HFnVvPzGE
         ZoHhc20f3nz/kbW+qirwBFBGdvQuSO84pEcEQO9Gvw5SNeQLTB4uGZF4y9ZeWwFVQb7M
         Oa7uYchEZ+RyZC4XtVTNQvSc6DvJCc2p49TJtiNlhlHsIOH5db5B5rcOuR/YKlkrnrsa
         7WtnrBUOi3j0N1lEvtrlQO65k8IVzMnYOBsc933eXwFgkM6wrZFYsUJHEegLxSJdGVWs
         bgcEgTgTBzrD3He9cPmoesvcp6pslqd9g/T45qOVedeiT0pRZyzqbFhk62qKjRN7sqUt
         pvjg==
X-Gm-Message-State: AOAM531uWK+LHbuI2L6GOJUtVyo0OWTDhADjGHtYdwhz+PTC86RsWfGF
        zH0yIbY7fn/vGQLhnyW8Vamwzg==
X-Google-Smtp-Source: ABdhPJyJeMmXdRBpbxfTfFAN28c4gZnl/RtIqFb4dMtgsV5j/MNYKHNHHhsz0uTRyMNm64RNuaDuDg==
X-Received: by 2002:a05:6402:1e8b:b0:41c:59f6:2c26 with SMTP id f11-20020a0564021e8b00b0041c59f62c26mr17214142edf.156.1651568833847;
        Tue, 03 May 2022 02:07:13 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id eo9-20020a1709069b0900b006f3ef214e00sm4401022ejc.102.2022.05.03.02.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 02:07:13 -0700 (PDT)
Message-ID: <5bad039d-be2f-b967-4a64-0414b4880b45@linaro.org>
Date:   Tue, 3 May 2022 11:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 01/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220502090230.12853-1-chanho61.park@samsung.com>
 <CGME20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234@epcas2p4.samsung.com>
 <20220502090230.12853-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/05/2022 11:02, Chanho Park wrote:
> Add dt-schema for Exynos Auto v9 SoC clock controller.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../clock/samsung,exynosautov9-clock.yaml     | 217 ++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> new file mode 100644
> index 000000000000..e2a01f50db6c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> @@ -0,0 +1,217 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynosautov9-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Auto v9 SoC clock controller
> +
> +maintainers:
> +  - Chanho Park <chanho61.park@samsung.com>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>
> +
> +description: |
> +  Exynos Auto v9 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> +  two external clocks:: OSCCLK/XTCXO (26 MHz) and RTCCLK/XrtcXTI (32768 Hz).
> +  Those external clocks must be defined as fixed-rate clocks in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other clocks of function blocks (other CMUs) are usually
> +  derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'dt-bindings/clock/exynosautov9.h' header.

I know this follows Exynos850 pattern, but I would prefer to move towards:
1. vendor,device: samsung,exynosautov9.h
2. put here full path, so include/dt-bindings ....

> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynosautov9-cmu-top
> +      - samsung,exynosautov9-cmu-busmc
> +      - samsung,exynosautov9-cmu-core
> +      - samsung,exynosautov9-cmu-fsys2
> +      - samsung,exynosautov9-cmu-peric0
> +      - samsung,exynosautov9-cmu-peric1
> +      - samsung,exynosautov9-cmu-peris
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
> +            const: samsung,exynosautov9-cmu-top
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
> +            const: samsung,exynosautov9-cmu-busmc
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_BUSMC bus clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_busmc_bus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov9-cmu-core
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_CORE bus clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_core_bus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov9-cmu-fsys2
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_FSYS2 bus clock (from CMU_TOP)
> +            - description: UFS clock (from CMU_TOP)
> +            - description: Ethernet clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_fsys2_bus
> +            - const: dout_fsys2_clkcmu_ufs_embd
> +            - const: dout_fsys2_clkcmu_ethernet
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov9-cmu-peric0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERIC0 bus clock (from CMU_TOP)
> +            - description: PERIC0 IP clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_peric0_bus
> +            - const: dout_clkcmu_peric0_ip
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov9-cmu-peric1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERIC1 bus clock (from CMU_TOP)
> +            - description: PERIC1 IP clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_peric1_bus
> +            - const: dout_clkcmu_peric1_ip
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov9-cmu-peris
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERIS bus clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_peris_bus
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
> +  # Clock controller node for CMU_FSYS2
> +  - |
> +    #include <dt-bindings/clock/exynosautov9.h>
> +
> +    cmu_fsys2: clock-controller@17c00000 {
> +        compatible = "samsung,exynosautov9-cmu-fsys2";
> +        reg = <0x17c00000 0x8000>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_FSYS2_BUS>,
> +                 <&cmu_top DOUT_CLKCMU_FSYS2_UFS_EMBD>,
> +                 <&cmu_top DOUT_CLKCMU_FSYS2_ETHERNET>;

Let's put each item in its own line, so line break after every clock
here and in the clock-names.

Rest looks good.

Best regards,
Krzysztof
