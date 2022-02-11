Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887F6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Feb 2022 18:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiBKSql (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Feb 2022 13:46:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiBKSqk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Feb 2022 13:46:40 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA51334
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 10:46:38 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id e18so10221753vsq.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGzEnxcEEJBItkLvm908OZgOUF/bpGsxAyLCbIgSN18=;
        b=Qm1kB1q1h9+UE7rWQk/Vj+7KFeLmVi6kvurff0SEHTX89SWZ/Z6VNtgJd0punbm0ka
         3cVDODze7YEll7dPaeXMUxalRgbgJkcvzXlEr9mKKe+iiCc4ph3hd1kq0t7OLrxYAXig
         QcQKltEn5cUrRJ9GO60f/zBb4Sg8QDHrVZUBLHlSHY7S3HUCBx11exCehkMawjfpeXc0
         cmrKnvavnYr+QlwwHkoWzUrv9MKwRA8i+4Jhk1TaOH/trrKacV9adEtTFoGVrVdSAeAZ
         rmJlDsycRqn7LzeOgn6b3qvcaG/xRtZ4nWsiBePNqMRq8wjnrT0cJgKxGzUes+WqjA45
         0fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGzEnxcEEJBItkLvm908OZgOUF/bpGsxAyLCbIgSN18=;
        b=f74iP7RXRJ15XZFIyfSS7UKhXbYh+hnCB+rYj+kZoRYksuuLsvasPP2d6xZkkjthKW
         4LykBTQ7/Wrjd/8BRPVvup69+YBEZT3ages8MtipvWX8Lq8CNlxH12O6MU2YmeTd4SDY
         dxvBXsCXNXBmb+JuuGQMqjarfWZGJj4Y8VJoYoBWJu4x98rCcoGQ+uXNZhlCSjBvD/jm
         BSblB7KwHWX6gUK8IQ6hgExuZF4KAnHkJd55cbmOFceYXb5wfv+scqSgJ/v0QaIq6eui
         4jDuiUO5FDnIJEuFaNwhlydUFZssl7HWpTGQfA9yFtFDt0nUXjqhE2IGM4eZirwHkw6r
         SzzA==
X-Gm-Message-State: AOAM530PYHmBsXcL5jEY5IXJHmQfuUP19+mWeTVOyFSyLde6kRo1bH3p
        XmyjMe5J/gSW7NflqwwvKwoSd+Wu4rMhzxK1dEENug==
X-Google-Smtp-Source: ABdhPJzQaCXfowUgoTps/aDsF9udVr66a7ww5AZbBipuAmwwwu+hPtXGefPD67zj5K1i7Xsv76oDUlBzwrRECxRLPIs=
X-Received: by 2002:a67:df83:: with SMTP id x3mr1003966vsk.86.1644605197315;
 Fri, 11 Feb 2022 10:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20220211164716.120880-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220211164716.120880-1-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 11 Feb 2022 20:46:26 +0200
Message-ID: <CAPLW+4kcm06SCpPoZm5PnsFF3AeWSp5bk6KKyMihSNmfvJ758Q@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: soc: samsung: usi: refer to dtschema for children
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 11 Feb 2022 at 18:47, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Explicitly reference the dtschema for USI children implementing specific
> serial protocol (I2C, SPI, UART).  The SPI schema is not yet accepted,
> so it will be provided later.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> ---
>
> Changes since v1:
> 1. Drop entire paragraph about USI nodes.
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/soc/samsung/exynos-usi.yaml      | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index 58f2e9d8bb0e..a98ed66d092e 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -17,13 +17,6 @@ description: |
>    child nodes, each representing a serial sub-node device. The mode setting
>    selects which particular function will be used.
>
> -  Refer to next bindings documentation for information on protocol subnodes that
> -  can exist under USI node:
> -
> -  [1] Documentation/devicetree/bindings/serial/samsung_uart.yaml
> -  [2] Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> -  [3] Documentation/devicetree/bindings/spi/spi-samsung.txt
> -
>  properties:
>    $nodename:
>      pattern: "^usi@[0-9a-f]+$"
> @@ -75,10 +68,17 @@ properties:
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
