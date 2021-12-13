Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95617C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Dec 2021 11:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhLMLeN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Dec 2021 06:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhLMLeM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:34:12 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA94C061748
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:34:12 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id l24so28633203uak.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tnFB07hsK5XkvGHZi6hdhLjHnaUmhTQUEDOX0Dxmz2U=;
        b=V/QCekDXUtFDeJWc3Guqj5CwaRI2nanjmmMtONMvKfAxaUyZ2xiSUuDlZR+hIh9m8U
         tpW01QKi23Ft4LchnK7hy11trVzF3SneZIIE0DCPswXNFNC4yVjiYSqsQtwB+me7wS0G
         l7P32s5eThSknoErOznlfKMahbrWnMfjmuATIuBiNBqhcjzBvdaQEbCRzZy98r9RcC4z
         exp3bN4g8fTpPCrL/NHoxaxKR/1bR3PxoOvH5gl1yBv1X8nN9nMIotShYqHa28/Vg4/F
         YZSXzszFBk2ouC2Z0cTV9dU6sbth8A1qeyLA5yUnRni7JEhSiRIWoHda1xMBKUFqRQEF
         rrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tnFB07hsK5XkvGHZi6hdhLjHnaUmhTQUEDOX0Dxmz2U=;
        b=nj0EbMpX2lmxxGkDLsx8dGhM06zQLItql8qhHMMXab2zTu7xprZrUTRTqQGHyjUUp7
         dAXfSYBlhywp+9IeLJrBdzBsqNYGNkFgktRrdLwBvqOMWcysvOGV3xW53nQ8p35ce+Xl
         K57ogF79QmtXD/+/kxJ3zlRlDlslDRe0i2QKhsN5TQFgnClbNusmLaOHgWJSBPXD3pnD
         Rij4+8FCJMFQlvThu+b0V7aOItWtGyULy9UKdjwyicOdJs42VUz2Ujy1UwFOODsVhLzj
         Bvs1/YF3qBUZN8eGEscsaV/5HSwaFO+fPFGf6BMWI0D1XBSXtvnFlNmwGCpmh8YvCCPo
         Uouw==
X-Gm-Message-State: AOAM531Y5eeXwGdT2wOUmcsQ9MxbBO8SGAiMq6aQIXbIyKvFYKlhk757
        7oOYubIl6XoH4dyThs9DwWZVRSIdzdgVlTbDJeChmw==
X-Google-Smtp-Source: ABdhPJxCmFmaMKXhDCuUVHqkAQcSk0dJ1iili+sh1nfn+0rIG4S16VR6sZgNFjlIIn3wZYDvexK2Ml8HOrTPbSFdggQ=
X-Received: by 2002:a05:6102:f10:: with SMTP id v16mr27816759vss.86.1639395251610;
 Mon, 13 Dec 2021 03:34:11 -0800 (PST)
MIME-Version: 1.0
References: <20211213112057.16709-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211213112057.16709-1-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 13 Dec 2021 13:34:00 +0200
Message-ID: <CAPLW+4kKu9Fh2cNJaiFEbeMYBMbZeDy_JEYHK+tAF5NJTW5OLA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: samsung: keep SoC driver bindings together
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 13 Dec 2021 at 13:21, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Recently added Samsung Exynos USI driver devicetree bindings were added
> under ../bindings/soc/samsung/exynos-usi.yaml, so move there also two
> other bindings for Exynos SoC drivers: the PMU and ChipID.
>
> Update Samsung Exynos MAINTAINERS entry to include this new path.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/{arm => soc}/samsung/exynos-chipid.yaml | 2 +-
>  .../{arm/samsung/pmu.yaml => soc/samsung/exynos-pmu.yaml}       | 2 +-
>  MAINTAINERS                                                     | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/{arm => soc}/samsung/exynos-chipid.yaml (93%)
>  rename Documentation/devicetree/bindings/{arm/samsung/pmu.yaml => soc/samsung/exynos-pmu.yaml} (97%)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-chipid.yaml
> similarity index 93%
> rename from Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
> rename to Documentation/devicetree/bindings/soc/samsung/exynos-chipid.yaml
> index bfc352a2fdd6..4bb8efb83ac1 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-chipid.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/arm/samsung/exynos-chipid.yaml#
> +$id: http://devicetree.org/schemas/soc/samsung/exynos-chipid.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: Samsung Exynos SoC series Chipid driver
> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> similarity index 97%
> rename from Documentation/devicetree/bindings/arm/samsung/pmu.yaml
> rename to Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 0bbd89265b28..c30a6437030d 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/arm/samsung/pmu.yaml#
> +$id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: Samsung Exynos SoC series Power Management Unit (PMU)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 79ef55bf2ca7..8926b925514d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2554,6 +2554,7 @@ Q:        https://patchwork.kernel.org/project/linux-samsung-soc/list/
>  F:     Documentation/arm/samsung/
>  F:     Documentation/devicetree/bindings/arm/samsung/
>  F:     Documentation/devicetree/bindings/power/pd-samsung.yaml
> +F:     Documentation/devicetree/bindings/soc/samsung/
>  F:     arch/arm/boot/dts/exynos*
>  F:     arch/arm/boot/dts/s3c*
>  F:     arch/arm/boot/dts/s5p*
> --
> 2.32.0
>
