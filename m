Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1381CC43217
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 27 Nov 2022 15:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiK0PnZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 27 Nov 2022 10:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiK0PnX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 27 Nov 2022 10:43:23 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED1ADE8E
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Nov 2022 07:43:19 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id q1so7838445pgl.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Nov 2022 07:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QoqD+yoK4iUhwEviRcvAZ4p8z1xcTui7U2heAF5a4zQ=;
        b=pW8oiV8k3BxvlYxvnp4Q2jio964NAuVqZNES+q7gkoqqg/8FcDZUrfghpnrhWQiLo0
         qaGB96VmwMXaq9m8zR9gacxtVxmFPRNF+/RaRPP6CQwK9ZD8YxOgzB6Z/iTkgSaq08au
         kv5R7Q9I72MfrCb+GXpOQkEGOvszZR2tWfKuBbgUKk12LE8Als8QTG7M2I0sZwgb2o2x
         jaPRcMKjtyq9dtMvmCUifsOOgIns4i7lTbDllqLaQPOqaSZV2TOSHsuGLc90anGfqSaL
         27wX8zF1m4geYBLpjHtsmHBaXqe0StL+KoIabRwu2eEh8DsfBJ2EuA8PI4fCjwJ8JrzV
         uGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoqD+yoK4iUhwEviRcvAZ4p8z1xcTui7U2heAF5a4zQ=;
        b=KeVzuvHm1/uoENi3i2F3ry+pOqmizl5oQxldjgkccGXJvwJJUhTlAQHxkI0kROixe4
         5XD0q1pPWKO5+quMBK0mmgWycR6l9toPKkC+bTHpLAz6ZeDvdKN1xaoO4XUm5hZvW+4e
         w8Rmlqr/rgswa0A25yfvOxLj63N5VNSCZQUSM1CYHcKW3hEnAEsWAhkSvYqhdO/8Ub/P
         cdelUdyXbeartd4/YtAph/mTNUjlyOZ8+Kd6GcZbFMSz9hanaBcRQZbf722Zh9kt1uIJ
         fQ6L7ebikXASecFZZeFVC0oT0xLSEdMfa08s45KJz8i8+R7+fxK5+2APcPXFmysBvbEB
         Yjnw==
X-Gm-Message-State: ANoB5pn97ztv8gWIBaCq+bJ5c9pG9vQbqwqv2MC4jvTxb/uGBkcgaxDz
        HNOVFeWvu8mmidfq2Ts4rXNrOjhPlYaKp7+R5Lgb1w==
X-Google-Smtp-Source: AA0mqf6gFiXOwgh2CpDtU8yGb8UYkH6A8+wiyF5d0XjCWNcAnB42vY5fd/NpoZvaRmCfEOHRZScmoX1Aw0Jtrj8y5eg=
X-Received: by 2002:aa7:854d:0:b0:56d:6e51:60ee with SMTP id
 y13-20020aa7854d000000b0056d6e5160eemr27439275pfn.25.1669563799458; Sun, 27
 Nov 2022 07:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20221127123259.20339-1-krzysztof.kozlowski@linaro.org> <20221127123259.20339-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127123259.20339-4-krzysztof.kozlowski@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 27 Nov 2022 09:43:07 -0600
Message-ID: <CAPLW+4=B=xx3gUsv7gj_AhDG44zyurFzaHvws8eCV+efcEdV_Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: soc: samsung: exynos-sysreg: add
 clocks for Exynos850
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 27 Nov 2022 at 06:33, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Exynos850 has dedicated clock for accessing SYSREGs.  Allow it, even
> though Linux currently does not enable them and relies on bootloader.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Changes since v1:
> 1. Make clocks required on Exynos850.
> 2. Due to above change, do not add Rb tags.
>
> Cc: Sriranjani P <sriranjani.p@samsung.com>
> Cc: Chanho Park <chanho61.park@samsung.com>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../soc/samsung/samsung,exynos-sysreg.yaml      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 42357466005e..9f3fc6406d9d 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -36,10 +36,27 @@ properties:
>    reg:
>      maxItems: 1
>
> +  clocks:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos850-sysreg
> +    then:
> +      required:
> +        - clocks
> +    else:
> +      properties:
> +        clocks: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.34.1
>
