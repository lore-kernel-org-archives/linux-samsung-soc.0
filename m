Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999F1C0015E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Jul 2023 05:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjGQF7Y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Jul 2023 01:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbjGQF7W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 01:59:22 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A60E7B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 22:59:16 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52173d4e9f9so2704649a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 22:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689573555; x=1692165555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTShB1X2n5VhDKZ8eIE5fT73BCWMdXdQgyxXwGp9Bxk=;
        b=RIm/UKCgozgf97FfffB4X9yQ9AciaGmjy4eZ5nUxa9+JRtntAb0JyrwMGbET4hCvcV
         xrJRf9KXISfrYAgnejuyv7IaGZ1MrNLe3Rf96beEqzq+gutRHkeDrsxaVSSxJ+nR0Unx
         96bJ49et0jthkOKTqQ2dnd2ZJupDafAjiZhosqKy9OQq8OBEszQblFm131o4oBnjm6+/
         qOjF/6fNNt41aCqNlQ6g59+xH9FzA2z6TP33bQx3m+KPA4sB6iueu4pSLCoOJOLciotP
         iuZm6zgeyai+/zxtauhIikv14SD+B1HAc1fBI1cjJbcwTuLDzrWzY6ltFoOssV9TvAdo
         mXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689573555; x=1692165555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTShB1X2n5VhDKZ8eIE5fT73BCWMdXdQgyxXwGp9Bxk=;
        b=Lnzlhjg2dqsXo/RIEzl6I0JtMj9JZC4ZFGcFHTChbHV2BY3XmAUd+t+1cOwQPsAbmW
         o977k7aU/0S7wIWxAOTCVFpLa3S1aKqhuhR0LcIHYNn5MJ4oSOYCcrY/LK6MBM1zXnGm
         cinXe1+BRTkArApGbzMSF++masvnAzWNfHQZLcDPhfxFj4aPFgSmbTHA4/xtkzkKbuoF
         stpONxO17kjxJ9BUDzRZt3rpwVH7CxjCg7FAVXcfprQ7JsGmo6axRRk7LHMyrfIUqrGi
         YaPreKj+KSjosAHZFH0Plj6PXb5Gpgym1D2S6BfAzoW4V62WuYUNLuZS+k4K8kcUS/uc
         VuVg==
X-Gm-Message-State: ABy/qLY8IxYvqCgSABxuLiJvyffuqAnpQNTT1/elZmvBrQIOb7qy40im
        GFBAo5qnA1UZQB0Tm4N+2+NoTw==
X-Google-Smtp-Source: APBJJlEMq/uyDSRtZ6GeEX2thMhf5az8CaCQMcrSGtBpX5M1jcWTIyVM805InHm+Uf7UwpTLilKo5A==
X-Received: by 2002:a17:906:6a1e:b0:973:d1ce:dbe8 with SMTP id qw30-20020a1709066a1e00b00973d1cedbe8mr10850157ejc.46.1689573555359;
        Sun, 16 Jul 2023 22:59:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f8-20020a170906138800b0098654d3c270sm8688094ejc.52.2023.07.16.22.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 22:59:14 -0700 (PDT)
Message-ID: <7a368187-8c16-1868-72c2-f0ba68eb0c4e@linaro.org>
Date:   Mon, 17 Jul 2023 07:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: samsung: add exynosautov9
 compatible
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
References: <20230714100929.94563-1-jaewon02.kim@samsung.com>
 <CGME20230714101434epcas2p1e0788544f244e59861f45b10e450075c@epcas2p1.samsung.com>
 <20230714100929.94563-2-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714100929.94563-2-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/07/2023 12:09, Jaewon Kim wrote:
> Add samsung,exynosautov9-pwm compatible string to binding document.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
> index fe603fb1b2cc..39a471083016 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
> @@ -26,6 +26,7 @@ properties:
>        - samsung,s5p6440-pwm             # 32-bit, S5P64x0
>        - samsung,s5pc100-pwm             # 32-bit, S5PC100, S5PV210, Exynos4210 rev0 SoCs
>        - samsung,exynos4210-pwm          # 32-bit, Exynos
> +      - samsung,exynosautov9-pwm        # 32-bit, ExynosAutov9


This does not express compatibility properly.

Best regards,
Krzysztof

