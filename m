Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930ABC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Feb 2022 16:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349803AbiBKQEX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Feb 2022 11:04:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238240AbiBKQEX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Feb 2022 11:04:23 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6097D1CF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 08:04:20 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id r20so10860978vsn.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 08:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2177MDBPIZL1asiHVf/tsGcpg3hhljXk+Tm8j7/No3k=;
        b=sA4/Wf+0wntyZPQ6IiqwzByik6CHGmnB7P2zQ8y8/xKYxL226mqIzNt4u7P56H4KIw
         I3cuY8rCvRlQCeEXc68tbz9TzLj3ZbPH/fUQXnAROZzhEuWOyBd7VtG8AsHR0rAPZ+JT
         Ngh/w4wAST9XeVQkPNeoMu4FiOQ89EH7W2oUZdA1Ce+iBw9qLOKVZBjEfteK7I1YjUQ5
         asTzjX2XTf8NG3mJpGQOdbCz+5SXw3h6Mor50ul3uOyqdm0nfK+wWbEt6TJlEKHF4dR/
         e6pop0pJpiX5Nv82BkrMTivpZUdt5plBXCg9L+inBFXHCFDXaXvrRNkig7q2nlXw7tVI
         bxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2177MDBPIZL1asiHVf/tsGcpg3hhljXk+Tm8j7/No3k=;
        b=R3irfkWuv+GtbYe/nOcxbo/ZcVkqEbErMlVKocuIN0MP6FxvPo5bzASSdZG7fsIIPZ
         NhcAE7mUzbkh6+DEUofNcQFB3inN4w6hO0Sm5tDGb7+2pwsUYAGa8bRZUyCjIZIH2pJF
         QAhxeFJoTrqjo1zu1XaYWdnVAQF2mBJLii3PrJYjpHPYaJw16fZ+DDt4XuAwCSxyJpKg
         xxx3dMlcVa1Tvv0AMV/OxdkDs72A/8MKbNssQCDeKLQvpzuiJp+bBhy1gKcWNmyXW309
         4i2gWAnSVyhwq7XmTcfaU0mdxgtBme3RoeniU5QI+8p62aaeAQo4XeAUwF4xsyihE3do
         AuUA==
X-Gm-Message-State: AOAM531fBpSl2gN4EXAmVaOST4C9beqOHmqFSxHM0xlSnLho9Wk1qfRL
        3PD/FMnOdDNWpKX4VvpEx7xrm5E9kh9/04GZWX3K2w==
X-Google-Smtp-Source: ABdhPJxFr2f3s+JC21d1a2/JiNCmvQEsxYrX2tqBKFp8IZsQA6946pHfR8OjMZf27/Y9k04rLB1h6uS7cwBpRlJa+O0=
X-Received: by 2002:a05:6102:ac8:: with SMTP id m8mr738550vsh.6.1644595459512;
 Fri, 11 Feb 2022 08:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20220208194119.46022-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220208194119.46022-1-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 11 Feb 2022 18:04:08 +0200
Message-ID: <CAPLW+4m9u4yFz84dQaMxNqCPauW6JTsOWRo5iJrkexHXOOsahw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: samsung: usi: refer to dtschema for children
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 8 Feb 2022 at 21:41, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Explicitly reference the dtschema for USI children implementing specific
> serial protocol (I2C, SPI, UART).  The SPI schema is not yet accepted,
> so it will be provided later.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/soc/samsung/exynos-usi.yaml      | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index 58f2e9d8bb0e..f3aae7e0e2e6 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -18,11 +18,7 @@ description: |
>    selects which particular function will be used.
>
>    Refer to next bindings documentation for information on protocol subnodes that
> -  can exist under USI node:

This whole paragraph doesn't make much sense now, because the doc
links it refers to are removed in this patch. Maybe it's better to
just remove the whole paragraph?

> -
> -  [1] Documentation/devicetree/bindings/serial/samsung_uart.yaml
> -  [2] Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> -  [3] Documentation/devicetree/bindings/spi/spi-samsung.txt
> +  can exist under USI node.
>
>  properties:
>    $nodename:
> @@ -75,10 +71,17 @@ properties:
>        This property is optional.
>
>  patternProperties:
> -  # All other properties should be child nodes
> -  "^(serial|spi|i2c)@[0-9a-f]+$":
> +  "^i2c@[0-9a-f]+$":
> +    $ref: /schemas/i2c/i2c-exynos5.yaml
> +    description: Child node describing underlying I2C
> +
> +  "^serial@[0-9a-f]+$":
> +    $ref: /schemas/serial/samsung_uart.yaml
> +    description: Child node describing underlying UART/serial
> +
> +  "^spi@[0-9a-f]+$":
>      type: object
> -    description: Child node describing underlying USI serial protocol
> +    description: Child node describing underlying SPI
>
>  required:
>    - compatible
> --
> 2.32.0
>
