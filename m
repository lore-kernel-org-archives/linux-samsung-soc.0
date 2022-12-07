Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9DFC47089
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Dec 2022 10:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiLGKNi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Dec 2022 05:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiLGKNg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Dec 2022 05:13:36 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3A0F023
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Dec 2022 02:13:35 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id s8so27937659lfc.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Dec 2022 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EfzRINXvTujbfGexnmXcZib+yfVoupZmsTbefxlDJnw=;
        b=Go0DCB4+6QM2Lz8HnEfnjEpYF04o+zaCU7giFE1dNJHPtFZR5dW2o8AD9bJh6xS56M
         /FQa5LGWbUAyDnAozVwWajxACvIDzprJP50Pd4jaGNkLi4BbZhIZT1UI07AH5K1qCypS
         RafclyjEf7X7t06AEtXF3LtrqAaloeMTBbfIdL7lkba1TP5oi2eJjr9474OsrIDssan8
         bkAxZo4ORF5q7zjsJN3QbCUMc2owtn6hCIkXP5yY2inq/43m/k8zaDpyDNqycQ1eDHyQ
         RfQlxRbzQMBzzZWxcI3CZL/AlilnzwC6TyH57ElK/uzlnKcKfltQlVPu1hroedcj+CCP
         FXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EfzRINXvTujbfGexnmXcZib+yfVoupZmsTbefxlDJnw=;
        b=fT4IkQSPdyB+mELvQR7ZUlXvrgQAvChis1Xc4rbIGXUnLKH4+D/3W55l5OI9Yo7RO6
         q+V3RWo9qVvPsYhUC/22nbMEnsOjOi8/TiUaennY5faEARtrvmqJ7PNTARxhW1jlQS/q
         7tME5hoTQsdNQgVgJDG3vTx/VKwmKFFc6ozh2T14G/6bKneDZ9rmCndzBh/AQUT3iPba
         ePVsIUCceA4Ll0XQw1jCrBj0cns9xFJiiAdR00YQexFzDgfKfVziLYOmaWZhKXcrhaBl
         aNo2ccQgvaQ2mQM2//FTutiAyTQGJW+nHxXYuf9my3+Pixd/q1+zUEbSh0PzoZjA1ySK
         pWfg==
X-Gm-Message-State: ANoB5plXShViKIR+pynuRT2W7Vw3hQng3t1XAo3JGaYvyggfj9b1RP8U
        gk6EQ+LVHpwPJ7ZuVKs3APiyjg==
X-Google-Smtp-Source: AA0mqf7hsCAj+w8XCvjyZUfiTkBTV5WU3JxoUzeIJmMqZ0pP8HJxm1PyMERjuSoo3lfnPbIlTSY2KA==
X-Received: by 2002:a05:6512:2520:b0:4a2:6907:98d8 with SMTP id be32-20020a056512252000b004a2690798d8mr25290485lfb.28.1670408013714;
        Wed, 07 Dec 2022 02:13:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m16-20020a056512359000b004b57d186aaasm840449lfr.249.2022.12.07.02.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 02:13:33 -0800 (PST)
Message-ID: <13a7ac60-c9a2-aa60-f8ba-640d9e99ab44@linaro.org>
Date:   Wed, 7 Dec 2022 11:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynosautov9
Content-Language: en-US
To:     Sriranjani P <sriranjani.p@samsung.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        alim.akhtar@samsung.com, pankaj.dubey@samsung.com,
        ravi.patel@samsung.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20221207085832.86909-1-sriranjani.p@samsung.com>
 <CGME20221207085852epcas5p3de090e5b0abec213c1b5511e1da3eeff@epcas5p3.samsung.com>
 <20221207085832.86909-4-sriranjani.p@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207085832.86909-4-sriranjani.p@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/12/2022 09:58, Sriranjani P wrote:
> Exynosautov9 has several different SYSREGs, so use dedicated compatibles
> for them and deprecate usage of generic Exynosautov9 compatible alone.
> 
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---
>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index f57bc7c194a1..b6105d261b47 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -17,7 +17,6 @@ properties:
>                - samsung,exynos3-sysreg
>                - samsung,exynos4-sysreg
>                - samsung,exynos5-sysreg
> -              - samsung,exynosautov9-sysreg
>                - tesla,fsd-cam-sysreg
>                - tesla,fsd-fsys0-sysreg
>                - tesla,fsd-fsys1-sysreg
> @@ -45,6 +44,17 @@ properties:
>            - const: samsung,exynos850-sysreg
>            - const: syscon
>          deprecated: true
> +      - items:
> +          - enum:
> +              - samsung,exynosautov9-fsys2-sysreg
> +              - samsung,exynosautov9-peric0-sysreg
> +              - samsung,exynosautov9-peric1-sysreg
> +          - const: samsung,exynosautov9-sysreg
> +          - const: syscon
> +      - items:
> +          - const: samsung,exynosautov9-sysreg
> +          - const: syscon

Same comment here - let's make it part of enums which are deprecated (so
together with 5433 and 850)

Best regards,
Krzysztof

