Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72148C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 07:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbiF3HNU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 03:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbiF3HNU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 03:13:20 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6821010FDB
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:13:18 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id h23so37083075ejj.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=diCMWoor2E0dwOuTJQLx2CXhKDg2BH42ErMAKmjvX+g=;
        b=NH+sAlpEBdeJO44W6SORr1DX0UzxzCmRo1A8Fj153kNXlyREfeNr2oCOnovudDClIx
         XIP5UjwCdjFUMQ5vRI8tz04uhM1yb4mikz3ez4qU7zD48m6dRFZF0a3bBIYUdDHjOLLF
         w/9zFQqzdnoh0G9q9XlKodazzgPTRYAK6HT7FanT/Yf8c78PURdKQ2oRtUnPJTCMvT2V
         v4mxBfANGE6t7Hr2MCJ2uicFtYG9bQctFM0LZ7dFFsiGUAzKiI8PFR2b/pycWE9z+MHI
         72MQdcT/1Gb33U6jf5qtxo1owfA6VXS8foNg9PxN0yRyxoK/STUfFgnNdL9QbPR1rAKC
         5XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=diCMWoor2E0dwOuTJQLx2CXhKDg2BH42ErMAKmjvX+g=;
        b=QDixsps5M/RXyQjj2g1HgfLkzArOihHCye3nPX72eatwWqrbiLPOixxSc+XeX9UHP5
         tOH+ZKZUY5IkeOkhxGCfLKFusjcrP+GKwkNcXEbVJEL6ufFE/nBAJ8VYpPR5N6ZSIpeu
         7H5tNNfwH2z+18GP21t6e7J6Xp0OMCq21QBYNls+CNKa5nU5KxyF9YM/sAkX4tToe3IG
         ydP0/Xiz9yBsk9uBcIBql6mWjAqVwU+DNjR4VyBnrk0zKDzTN0cAQS3EJMp/7SpsVeIc
         O9hdbve3TYsy68/8xRgmsbATVKLCZyvrc8u59RFU0Jbm6N0p7mIpscGX1tXxsekb6V5E
         ezyQ==
X-Gm-Message-State: AJIora9z4KK5VQudztfTaLj5ze2/yLemtgPGYS8TIh1+W+HWGODZ9v1d
        PPOolIv+XCeAcE+GSkh+C84ztA==
X-Google-Smtp-Source: AGRyM1t/jV6rWBm4iarTMf+aLPWZN1+6g5ImoCq0TPhEsQ5d5ZfDxmoozlMfl/y2VErNUFMWcYZK1g==
X-Received: by 2002:a17:906:4fcb:b0:722:e916:6bb1 with SMTP id i11-20020a1709064fcb00b00722e9166bb1mr7463592ejw.648.1656573196988;
        Thu, 30 Jun 2022 00:13:16 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i13-20020a1709061e4d00b006fef51aa566sm8654804ejj.2.2022.06.30.00.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 00:13:16 -0700 (PDT)
Message-ID: <b5c0f8cd-adcb-a3e8-b088-d8da4c7b7201@linaro.org>
Date:   Thu, 30 Jun 2022 09:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: samsung: usi: add
 exynosautov9-usi compatible
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1656554759.git.chanho61.park@samsung.com>
 <CGME20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd@epcas2p2.samsung.com>
 <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/06/2022 04:16, Chanho Park wrote:
> Add samsung,exynosautov9-uart dedicated compatible for representing
> usi of Exynos Auto v9 SoC.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index fde886a8cf43..6e806e950a36 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -22,8 +22,12 @@ properties:
>      pattern: "^usi@[0-9a-f]+$"
>  
>    compatible:
> -    enum:
> -      - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
> +    oneOf:
> +      - items:
> +          - const: samsung,exynosautov9-usi
> +          - const: samsung,exynos850-usi
> +      - enum:
> +          - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)

But now the comment is not appropriate. I can remove it while applying.
>  
>    reg: true
>  


Best regards,
Krzysztof
