Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD318C352A1
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Dec 2022 10:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiLGKMj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Dec 2022 05:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiLGKMi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Dec 2022 05:12:38 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E838D83
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Dec 2022 02:12:37 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id z4so20332086ljq.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Dec 2022 02:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC/LTw1yay9XRp7UnfXbK+UoHlH+HfeWaPk0UzxZKJk=;
        b=AyAHobwLi8UQ8Y3RO7WvijzSRK4GKV+VjGhQSY0MFj/dZqZ1hQYnwMS48zLGlZgGu8
         pBMU0O3mzLgrID5x4nK1Wq/HO4C26DVdzqkjpN2acNm7j7Wxo4/B2i9L+O35IC2LH0IF
         IooyTG9pFjty+G22aC8PKNdTaWYb7kt885nOAmbyKHSOy2aovniFXCycJhDmo6Pr4/7p
         5Fcxoc+7nK2fRWXH9wbGSqAJc11/tq+/AkLpLzPvaW3INxfQQCCoGrLmOpm3076R+gWP
         liBtHETwG/fMs4NeFm3+CFokf2K//xmXloFe/3YvkzRqAiCpDtQPhBU8wIDf38c/g3jY
         vYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OC/LTw1yay9XRp7UnfXbK+UoHlH+HfeWaPk0UzxZKJk=;
        b=whSKt5wCcCcgawTv5EjbIn1bt8FkEaBzLRd7fgqhI808Ey+8jmLIZ0LQZJ4z+jSpTv
         wF7R8rSRBKhlPP1BxDp8FizBjExngpBRlhf8JBeQvV4QFdpyi7Hu2tYGXQWacTafixcb
         crsZaiFGJwB1P/TushYV/FLllbToebKL+Dq6AB0jSyr1/XoWappiskySWrmqy/wo2/vC
         PdSgzeyoM/PLVkHe+MFPo0YH1DGos2gAGu9wH9kc1BGqZWVyElZ1JEM/rH/pkndzXo2n
         BHwl2fRiQF/E/fUrPW2AchOlAMswI3CPCCClNYONYgWKXMgyPNkv4gfv4oYK4MgmPQyk
         G+xQ==
X-Gm-Message-State: ANoB5plmVcx3IFOhsrp3N9QFRg6z7AMs6teehImy8ujkoyLdowSBy5os
        ndmuV6S+VgV6xDo3NLXyBVNxJA==
X-Google-Smtp-Source: AA0mqf69CWZ3OX2KPfDh4UAI1He+Nkzx6NpNQ6qGOhkHv674OUnmjIC8peAUmlRmBQVU7KfAsW2UnQ==
X-Received: by 2002:a2e:2c15:0:b0:27a:773:7054 with SMTP id s21-20020a2e2c15000000b0027a07737054mr2978314ljs.169.1670407955487;
        Wed, 07 Dec 2022 02:12:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m5-20020a056512114500b00492ceda336fsm2782548lfg.278.2022.12.07.02.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 02:12:34 -0800 (PST)
Message-ID: <5ebd4de2-26a8-ff2b-18e4-dc43b3cdf662@linaro.org>
Date:   Wed, 7 Dec 2022 11:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynos850
Content-Language: en-US
To:     Sriranjani P <sriranjani.p@samsung.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        alim.akhtar@samsung.com, pankaj.dubey@samsung.com,
        ravi.patel@samsung.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20221207085832.86909-1-sriranjani.p@samsung.com>
 <CGME20221207085846epcas5p1d1e7fb6945752fc1d9d4aba4874b2484@epcas5p1.samsung.com>
 <20221207085832.86909-2-sriranjani.p@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207085832.86909-2-sriranjani.p@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/12/2022 09:58, Sriranjani P wrote:
> Exynos850 has two different SYSREGs, hence add dedicated compatibles for
> them and deprecate usage of generic Exynos850 compatible alone.
> 
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---
>  .../soc/samsung/samsung,exynos-sysreg.yaml        | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 4954790eda6c..f57bc7c194a1 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -17,7 +17,6 @@ properties:
>                - samsung,exynos3-sysreg
>                - samsung,exynos4-sysreg
>                - samsung,exynos5-sysreg
> -              - samsung,exynos850-sysreg
>                - samsung,exynosautov9-sysreg
>                - tesla,fsd-cam-sysreg
>                - tesla,fsd-fsys0-sysreg
> @@ -36,6 +35,16 @@ properties:
>            - const: samsung,exynos5433-sysreg
>            - const: syscon
>          deprecated: true
> +      - items:
> +          - enum:
> +              - samsung,exynos850-cmgp-sysreg
> +              - samsung,exynos850-peri-sysreg
> +          - const: samsung,exynos850-sysreg
> +          - const: syscon
> +      - items:
> +          - const: samsung,exynos850-sysreg

and this can go to existing 5433 deprecated entry (making it enum of
deprecated compatibles).

> +          - const: syscon
> +        deprecated: true
>  
>    reg:
>      maxItems: 1
> @@ -53,7 +62,9 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - samsung,exynos850-sysreg
> +              - samsung,exynos850-cmgp-sysreg
> +              - samsung,exynos850-peri-sysreg
> +            const: samsung,exynos850-sysreg

This should stay in the enum.

Best regards,
Krzysztof

