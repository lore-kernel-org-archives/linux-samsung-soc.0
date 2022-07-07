Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5246AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jul 2022 06:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiGGGTO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Jul 2022 02:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbiGGGTN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 02:19:13 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACAE25E9A
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 23:19:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t25so29409140lfg.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 23:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hu5UjHiJ+bwaBYMGAryVawqznhB30VuU79LnyvZFUMw=;
        b=JNp0Rwnl+SSoqs6qNOAEWXREGt6UlkNQkuecqWBJLD9ZJR/ibvstoD0e45BHSrl+Xw
         YM1HAqpYoC2lXg8QaXtGlNtCgTuiHomMfowFZF+3Tmos8azDdxrp0kyxJozCvDTzOrFs
         m96/x6ff2el1Y57xpRLqrGnln1v+oercSODRBjeqpPQpIGkvoXvF0DzHL4UsvX5AB+6R
         5e61fvxg5C0Unpt2AX1/9yD3UAJ3d+/xV3q06XPS0aXmz3eKzW+lhWrXtaAbZ7eS5BMa
         /r7DPHTmt4MnHoDgf9PMRlkZO95RgxwijHedqmyDloO+D7D90qH8LQR8t6oVNGshqGf8
         OVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hu5UjHiJ+bwaBYMGAryVawqznhB30VuU79LnyvZFUMw=;
        b=oWvmSRAL5VzKtseQd4GWZKinbZ/YGgJLnU8PXRr6naTv5gRSIRjylGjKim5luakD/g
         oHjiwgPk+WdDs/qyKh3rmudz2dq8KTjEquYz98s++JyM3KBu1STOINAmFF0xUHGStoJj
         dF5l9HvUc6LlPfWi9TcRsjo5PdwyLKl85tV7MkIRbOT6S2mTBVvzq9kDTCM3ktzBFKF8
         mRrHkwo5BqJgsCtAeHUyQ9q0RvITW9HwSD+z+j4RTR8vjkc7J8IwGb1Lj2UpFy/Ubc6F
         pf65fr0o2+uH2pLGE0lZnSENLcjX9uaAk6WSHT1MHllwvKV4FjNbn7D1n1ky0ZHuKGgk
         vGeA==
X-Gm-Message-State: AJIora+fI4sReIGI1x6M0k/9+liM1t03rVOBVO0yUqDBYZrVkhZv6sQu
        9nkGz2rgxktUgKUwS0hdhGyy/g==
X-Google-Smtp-Source: AGRyM1uviZn/Ui2JM9JTF4A7nVpBIeYAn+SP8Qcua3Czg37Jnoz7oFZB26ttHQaS+IPboCj+0LM5TA==
X-Received: by 2002:ac2:4941:0:b0:485:da81:6c95 with SMTP id o1-20020ac24941000000b00485da816c95mr4851170lfi.368.1657174750665;
        Wed, 06 Jul 2022 23:19:10 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id j2-20020a056512344200b0047255d21107sm171772lfr.54.2022.07.06.23.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:19:10 -0700 (PDT)
Message-ID: <f8107455-7bf0-2bc7-2fcd-4d0bb65ffd58@linaro.org>
Date:   Thu, 7 Jul 2022 08:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: phy: samsung,ufs-phy: match clock items
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20220707005844epcas2p474d0ac5ca2d11bb37bc6353b9e7d50bc@epcas2p4.samsung.com>
 <20220707005554.98268-1-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707005554.98268-1-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/07/2022 02:55, Chanho Park wrote:
> Below error is detected from dtbs_check. exynos7-ufs-phy is required
> symbol clocks otherwise only PLL ref clock is required.
> 
> clock-names: ['ref_clk'] is too short

Thank you for your patch. There is something to discuss/improve.

> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../bindings/phy/samsung,ufs-phy.yaml         | 47 +++++++++++++++----
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> index 8da99461e817..3b04f31d9f21 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> @@ -27,18 +27,12 @@ properties:
>        - const: phy-pma
>  
>    clocks:
> -    items:
> -      - description: PLL reference clock
> -      - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
> -      - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
> -      - description: symbol clock for output symbol ( tx0 symbol clock)
> +    minItems: 1
> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: ref_clk
> -      - const: rx1_symbol_clk
> -      - const: rx0_symbol_clk
> -      - const: tx0_symbol_clk
> +    minItems: 1
> +    maxItems: 4
>  
>    samsung,pmu-syscon:
>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
> @@ -53,6 +47,39 @@ properties:
>        It can be phandle/offset pair. The second cell which can represent an
>        offset is optional.
>  
> +allOf:

The allOf block should go after "required" block.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7-ufs-phy
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: PLL reference clock
> +            - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
> +            - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
> +            - description: symbol clock for output symbol ( tx0 symbol clock)

While moving drop space after '('.

> +
> +        clock-names:
> +          items:
> +            - const: ref_clk
> +            - const: rx1_symbol_clk
> +            - const: rx0_symbol_clk
> +            - const: tx0_symbol_clk
> +
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: PLL reference clock
> +
> +        clock-names:
> +          items:
> +            - const: ref_clk
> +
>  required:
>    - "#phy-cells"
>    - compatible


Best regards,
Krzysztof
