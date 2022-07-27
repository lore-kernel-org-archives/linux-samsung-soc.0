Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E5FC19F29
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 07:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiG0HkF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 03:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiG0HkF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 03:40:05 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A04340BE2;
        Wed, 27 Jul 2022 00:40:04 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id x24-20020a17090ab01800b001f21556cf48so1328236pjq.4;
        Wed, 27 Jul 2022 00:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DMr8ohB9GMxypuuneNucOv/iX+4thNIVbtdVJ66OpZA=;
        b=IFLdVpWR3toJw+egjrSqoL0NW92V5EOhllTRxt2bJnwpWlNNGGtBfAG0QI5kmxty9w
         K0QMlqbLox7wD93mmZCORLyMWolrETpEWaEgwfgj8EMd8e2e44AtRCbYMAoRIH2plnRc
         fFuYgEud+zS3C6xI5Wy/kJ++WhQStDR8nU/YF1ON3xQBpcj8pWl5Cx56ww26FcXDQzTJ
         CLgpCjuMiysFP01SqPHcrwm75TiAXaf6tEw6e6EGtcJBt+DSA0Dw5FsW5lVdh7ZVGhiI
         CKRNhbvNNXomlnqCtSeevA/KPwJal5Y/JbrV+D8uQbkffWLD+p7zOFU01968GJ7R+cyL
         6Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DMr8ohB9GMxypuuneNucOv/iX+4thNIVbtdVJ66OpZA=;
        b=FLmhRN2CEq+xIQu+KQeaCd9s4poWxvukoGpc3BS3nz4Zu1ryUkWWGoWRkH85DVb523
         s+wXUy81vnJYtZASIL4wSFq09ztbvAgAAX81JpRtSrClERYh0ZRxfyVD+AqlifB86tIh
         fXsH+udIo8Ap0fCouMatp6MZxrmQvBHiLa8N60QxILwYTkbkk/KXGjPAj2qfmyIrC1Wi
         uQqGIEGF3X0osZ5urkdEjd6WPBgePmiwqRpvebbujGzhEoLJjEtcu/4kGURkqpD1Ld5K
         P4uIR1hrLXirNwp/CnVDzVqrYfZD2/kTRuBbJNwGm67Y+Hf8TwYbjePUC5B85gVfg+Ga
         byFg==
X-Gm-Message-State: AJIora9KuzfIowy7nag7nLC4G/92T6sBcqaje3WUtWQo6pqZHRWCCh4q
        Yvbl9+rbJwHeE/5TnwFC3HI=
X-Google-Smtp-Source: AGRyM1suNsh4DVU3LyOPEOrZkuaTMHCqIydCmGnTH3XvhM+YS2HKVC+RlydgOiYe0a7Fh09rJW6c1g==
X-Received: by 2002:a17:902:d504:b0:16d:69ef:d193 with SMTP id b4-20020a170902d50400b0016d69efd193mr14885717plg.140.1658907603826;
        Wed, 27 Jul 2022 00:40:03 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id u16-20020a170902e5d000b0015e8d4eb219sm13097812plf.99.2022.07.27.00.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:39:58 -0700 (PDT)
Message-ID: <e602ce3a-4b45-a4f1-35bf-aeb9f5c8f662@gmail.com>
Date:   Wed, 27 Jul 2022 16:39:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] dt-bindings: clock: exynosautov9: add schema for
 cmu_fsys0/1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p4b844ea92fe11c302337a320b222947d3@epcas2p4.samsung.com>
 <20220727060146.9228-4-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220727060146.9228-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 7. 27. 15:01, Chanho Park wrote:
> Add "samsung,exynosautov9-cmu-fsys0/1" compatibles to illustrate
> cmu_fsys0 and fsys1 for Exynos Auto v9 SoC.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../clock/samsung,exynosautov9-clock.yaml     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> index eafc715d2d02..2ab4642679c0 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> @@ -35,6 +35,8 @@ properties:
>        - samsung,exynosautov9-cmu-top
>        - samsung,exynosautov9-cmu-busmc
>        - samsung,exynosautov9-cmu-core
> +      - samsung,exynosautov9-cmu-fsys0
> +      - samsung,exynosautov9-cmu-fsys1
>        - samsung,exynosautov9-cmu-fsys2
>        - samsung,exynosautov9-cmu-peric0
>        - samsung,exynosautov9-cmu-peric1
> @@ -107,6 +109,48 @@ allOf:
>              - const: oscclk
>              - const: dout_clkcmu_core_bus
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov9-cmu-fsys0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_FSYS0 bus clock (from CMU_TOP)
> +            - description: CMU_FSYS0 pcie clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_fsys0_bus
> +            - const: dout_clkcmu_fsys0_pcie
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov9-cmu-fsys1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_FSYS1 bus clock (from CMU_TOP)
> +            - description: CMU_FSYS1 mmc card clock (from CMU_TOP)
> +            - description: CMU_FSYS1 usb clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_fsys1_bus
> +            - const: dout_clkcmu_fsys1_mmc_card
> +            - const: dout_clkcmu_fsys1_usbdrd
> +
>    - if:
>        properties:
>          compatible:


Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
