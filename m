Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A644C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 11:16:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbiECLTv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbiECLTt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:19:49 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F51201B8
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 04:16:17 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id k23so32802582ejd.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 May 2022 04:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8J2yMJ9K1/9ujEJIupfjuuHbcAKYifOZEPki4KCtyfE=;
        b=neZk2GmRzqPSbXjNeWDKqcNZHtTLoaazYtbp0qig46WhI3LkIkcsZXLEj1wpXZSj/m
         o+lS+YLN2CV9ZPifGqAc83fF+Jlx8bUDXIwyGakO2dfgyRf+jat8ipBGuRM/rFxWY2hN
         QwRvQqg940MCUtewP0Svs4oncY9UJRb0KK8SCa0+gcVDPaCMrAMa+qE986h3Cdz7W2CZ
         EDfqi/vZOdCijtTmH/kTmBnSt6Hq5WIcrXCEMD5UCpHLDiBLHAQvJs7rfedTUQ7NdWJb
         t6QpcZZ5q9+SnC+mg4Z7tR6bbYRC6qhyKzUnk8nMEenebGPi6F+s+P+faICQNAArJIxs
         J7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8J2yMJ9K1/9ujEJIupfjuuHbcAKYifOZEPki4KCtyfE=;
        b=k652ZedeG/M9kEqbTHoHjwGP60hg/yUg2BOqeM2aJ/dzNv02TfQ6rKH3RUlEGhylYE
         GjI7F4WJDoXLE1ANsgNUUnUlSAEcZJLZm4dH/mn+wdDX3u6pwp4j4K0wYKn6WcuIQ+Aa
         he4PVge9npOr/tF2DTaJtqni9ZIbMzJjbToZ8T8yhWzleAHcIO8Iukg+z9mE0JfANJmY
         ihNm0jiXiEKdlF4VxZbiJyK9LB+62gKTcNpSUnbfQUTPlBfSK8fadyLK/yc0FLFWqWwy
         lYxEA0AOr1SIHMLCuQsPQeOPRjidrbEQqJr1i/wMAdgYYmF36NIlO52cnNmKAX6aHF7g
         qbwQ==
X-Gm-Message-State: AOAM530vgYCWj/pUWxblsb68LrT339mSySARx1heB7rv++z7Hx93EdKX
        Zin/SIW8QCDilnXGgZX4Wdh2aA==
X-Google-Smtp-Source: ABdhPJz3TKSsGsroCIIcVbGGppywqTex0MNHy4mS/wYFvr2iDkZHsulmYBYc9r8/00B0TyN6lp18aA==
X-Received: by 2002:a17:906:5d09:b0:6f4:4407:a422 with SMTP id g9-20020a1709065d0900b006f44407a422mr9263014ejt.576.1651576575863;
        Tue, 03 May 2022 04:16:15 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w2-20020a170907270200b006f3ef214da6sm4582540ejk.12.2022.05.03.04.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 04:16:15 -0700 (PDT)
Message-ID: <9f71aebf-d30d-9ecd-0e24-3f504bbaa705@linaro.org>
Date:   Tue, 3 May 2022 13:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 02/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
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
References: <20220503105914.117625-1-chanho61.park@samsung.com>
 <CGME20220503105729epcas2p357a7bfae9731010d7fda00ba78cf8b97@epcas2p3.samsung.com>
 <20220503105914.117625-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503105914.117625-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/05/2022 12:59, Chanho Park wrote:
> Add dt-schema for Exynos Auto v9 SoC clock controller.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../clock/samsung,exynosautov9-clock.yaml     | 219 ++++++++++++++++++
>  1 file changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> new file mode 100644
> index 000000000000..9f9cd8606728
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> @@ -0,0 +1,219 @@
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

The path is still wrong (and not full).


Best regards,
Krzysztof
