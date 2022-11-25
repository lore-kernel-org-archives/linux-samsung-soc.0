Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C15C43219
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiKYOi1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 09:38:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbiKYOi0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 09:38:26 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E169C1D64F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:38:24 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so7909180pjk.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y7OdG/1AA7A8QO7ro/ae7lGZ6Xn5O4xI1Yx+62qUlgI=;
        b=M/JUFv4TwAnM5AARdXkediVBXdwVJP0TZ4+dJWIlpplhA98UWj5UbbdEw6ynLsjdZ/
         NATKK04icg9VRpWi9irytspzY9ps04YjskE+wsdAK0VDfX4/e/4N0LLKtTklsZRwTmTT
         yx5NeUWukFm3jzVnia9Lt8y8u7eH9U/A87tdyWO5G+8JhfKR7fONtH/+PiyIO1QrYCg2
         t/TbdbycUMR1Gpi0x3A8XwnrrnXKxiC4Q17r/ikf3+CSQfsV96yJoUTmkkiHNXwA+uDP
         wFYBtS5MhlCT45cmUmzy5JsPXL7yrPS6BFdCQGE4WepFrUcwllDUB+0Suoj/aoz+n4sI
         qdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7OdG/1AA7A8QO7ro/ae7lGZ6Xn5O4xI1Yx+62qUlgI=;
        b=AqDE/EEZzQpzkcaqsg/E29SGPK1reSf5athRG9heGIlDA0YDofXJQZYkwygvuYCSI0
         MB4YAcDBOsly0j/7ZOsQgVraJKeDP6Jmg8W54dg0ioaM8tFCpCYDXz/2Ws7Kr6ARWqtX
         ZYbr4+9TCoWH1s0i0VvyzqPC2ZBgPDE+plXcMQghGFEHA3rwS6Ylcv4LQVT4E3fUKPGw
         56HSZDSdxUQGNwtVQfcJ2rkro1d7rW3xTTDO5jqlQF0IN4jytaZlJlSM4j7GhYEo4EiC
         dT6zY5SCWU9NoibtoX/fYFBUX6oWbv70aEc+HdxpeBNy0WQYRw9aTxMMssNwB/VSMWHw
         dmfA==
X-Gm-Message-State: ANoB5pn5g2p1k5k52sn+WNDHNF3rTsM+TxS71yN57XwdKCcQIuALOUv3
        6Wv++ew49w+qJ186pU//FGx/83HndJzUCq3TWKPcXQ==
X-Google-Smtp-Source: AA0mqf5svRfmeY2K5liUXPqUGrovG9g0sMIM0rFvMMjpbLa8YX7W0LsZEF2fl4jRS44moGYBeSxAtt4kDZ9DK0PHzBM=
X-Received: by 2002:a17:90a:4615:b0:218:8f4:bad5 with SMTP id
 w21-20020a17090a461500b0021808f4bad5mr47415639pjg.55.1669387104386; Fri, 25
 Nov 2022 06:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org> <20221125112201.240178-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125112201.240178-4-krzysztof.kozlowski@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 25 Nov 2022 08:38:11 -0600
Message-ID: <CAPLW+4nSLP4ZpnzYrOfMu0uOQ0OYnWsnZ=sUppxts6O_3-yYZg@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: soc: samsung: exynos-sysreg: add clocks
 for Exynos850
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

On Fri, 25 Nov 2022 at 05:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Exynos850 has dedicated clock for accessing SYSREGs.  Allow it, even
> though Linux currently does not enable them and relies on bootloader.
>

Not sure if this description is correct. Of course, there is no driver
for "samsung,exynos850-sysreg" compatible at the moment, so the next
compatible from the list ("syscon") is used for Exynos850. And
"syscon" driver (drivers/mfd/syscon.c) actually does control the
clocks. I remember adding "clocks" property to Exynos850 dts to fix
actual problem. Also, the "clocks" property is not described in
Documentation/devicetree/bindings/mfd/syscon.yaml, didn't really check
if it's ok or it's just missing.

Other than that comment:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Sriranjani P <sriranjani.p@samsung.com>
> Cc: Chanho Park <chanho61.park@samsung.com>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../soc/samsung/samsung,exynos-sysreg.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 42357466005e..27cea934a286 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -36,10 +36,25 @@ properties:
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
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - samsung,exynos850-sysreg
> +    then:
> +      properties:
> +        clocks: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.34.1
>
