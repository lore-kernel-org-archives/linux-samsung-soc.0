Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3414C43219
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbiKYOPU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 09:15:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbiKYOPS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 09:15:18 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6936218B8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:15:17 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 6so4063201pgm.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/617BJR3AxAjX3NPAcECKk88uzgNNQZ7+/ymtVAJWc=;
        b=DPX8gA6Ixvj1sHraj9uVz4imnR0p5it1SKCFly7A8rT/+jeI8P++q7KgmKFvAl7wsB
         k+cxZ+AUlBupu11cyAcf9ic+7nTqhXcYXVKqEhnD8J6ald4lh+JZcxap/Ky7CYsVpx75
         XY1sFYO6ERrlamhK1IO+ptAEhN3Yg0upfb9eN4pu31I/uwZ1CMliBYpWeuMvygLljbVb
         86qdzpcU27r5dcl7m1+sRWizykhPaRWFDzl+EPClI1j8gsimqtOytP4MF+VNPtQFwBWE
         zJEK8ew9VJCjeDrYp6aPEMTbZ46JR0D19flwOfINlpPc7S8Z2ubksjJciIERsgfr5RFl
         ZIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/617BJR3AxAjX3NPAcECKk88uzgNNQZ7+/ymtVAJWc=;
        b=vXh08jC7dtVBal562sCQH5Ky2GcZsNOgcI1q1/wdC8fZO6GO1i41EM18MIL6ysrCNQ
         bhhaOhZUVey2yGhkTHm7UAIrIrPeTqzsqOnq7nmm9dGCXLeCG/arwyRM5PqRjsfZs8mX
         2bbGKAPqEu/FUwF+q41ZuvE4CFiCOS2Z+LdIFhSpt5bocHXQp6uDL8VmRrGKRltnXP0z
         SvwncC+HySwfxh3/qwwGjPKyejfDeIZlRS0JEeA4HnZY3H8fE695RmCylq/hBBmaBbXr
         LDbGdEb8F+FgPyrLA+kmXZAED74T90+kC3ISYZL0ONzp7JrzGEc1TErkgYk9e7SCsUT3
         iQfA==
X-Gm-Message-State: ANoB5pnnqrOXdPv7XUXx1tPwLlwvnBgpYZR6AVquHnv/RhuvBLMTtbYW
        IY1ScgpWECzlnaKOkcyz+gdtvKYdF5RYNP7B9do0hQ==
X-Google-Smtp-Source: AA0mqf6So6cRie6HhEzWSdJFgpZqNm19ZkFCQzm+lGVQCAAKnnMaxEf1S6OPjfhwzgUBpH8Z/S6USXAk+TjUuigh+DA=
X-Received: by 2002:aa7:854d:0:b0:56d:6e51:60ee with SMTP id
 y13-20020aa7854d000000b0056d6e5160eemr18571535pfn.25.1669385717125; Fri, 25
 Nov 2022 06:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org> <20221125112201.240178-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125112201.240178-2-krzysztof.kozlowski@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 25 Nov 2022 08:15:04 -0600
Message-ID: <CAPLW+4keg-bxpMs0HZmy8W7V9rZHeaTUc_GQvyvhNx5JcqE8YQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: soc: samsung: exynos-sysreg: split from syscon
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
> Split Samsung Exynos SoC SYSREG bindings to own file to narrow the
> bindings and do not allow other parts of syscon.yaml.  This allows
> further customization of Samsung SoC bindings.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Sriranjani P <sriranjani.p@samsung.com>
> Cc: Chanho Park <chanho61.park@samsung.com>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/mfd/syscon.yaml       |  6 ---
>  .../soc/samsung/samsung,exynos-sysreg.yaml    | 39 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 1b01bd010431..b73ba1ea08f7 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -64,12 +64,6 @@ properties:
>                - rockchip,rk3568-qos
>                - rockchip,rk3588-qos
>                - rockchip,rv1126-qos
> -              - samsung,exynos3-sysreg
> -              - samsung,exynos4-sysreg
> -              - samsung,exynos5-sysreg
> -              - samsung,exynos5433-sysreg
> -              - samsung,exynos850-sysreg
> -              - samsung,exynosautov9-sysreg
>
>            - const: syscon
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> new file mode 100644
> index 000000000000..68064a5e339c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos-sysreg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC series System Registers (SYSREG)
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - samsung,exynos3-sysreg
> +              - samsung,exynos4-sysreg
> +              - samsung,exynos5-sysreg
> +              - samsung,exynos5433-sysreg
> +              - samsung,exynos850-sysreg
> +              - samsung,exynosautov9-sysreg
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    system-controller@10010000 {
> +        compatible = "samsung,exynos4-sysreg", "syscon";
> +        reg = <0x10010000 0x400>;
> +    };
> --
> 2.34.1
>
