Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CE2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Dec 2021 18:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240100AbhLGS36 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Dec 2021 13:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhLGS36 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 13:29:58 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D702C061574
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Dec 2021 10:26:27 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id f7so9912121vkf.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Dec 2021 10:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KOYSjdHYBV8TKUHkuO1ISt5K4kTgwN/3GjP4cOdaJ+0=;
        b=clfFHliTJzuituvKR96ulQ6OK3kqWSIrEqQOR4zM4aV/baQUI0RFYnullFv8E8Ym9Y
         G9a5fzk+HtbFCGHBzytGaPwOp/Y5HaPhwRrVCXiE5K7YMbp78l7K0Er0oAghrv2rPMlf
         bOi/o19luqrfxeLNJq9DjCzvQ2R8NoU2w4fh7oPqs4LAkPE8c/ydOEeJv4b0m7Mm26aq
         +MtXlJygLTj8zF1+VoYDEDOrVmgkStgRkKvfF/lUwuZa6MW1vRjAFPvIDkYiWN8e+53F
         CH1U7NAb2Kdszv9cDSv45b/Z7avucxb+enHJ/n//Xh09cinZBY3g+vWzBIEYn7824Rl5
         ETaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KOYSjdHYBV8TKUHkuO1ISt5K4kTgwN/3GjP4cOdaJ+0=;
        b=MoTmkHv/hQAs2VbTGysUuILmW9hhpj1XsoD3dwBizD8ZUYlu2UfUP1SejZlTkVNw8z
         rUrsPE1/ajeny/uqMKOTFRfN5fneFF81QawbrQwi/Tuhfw+8VYxiKWg+ltuMCykz9JL7
         lAqf//G8Z3HGZP9O4jTZlT4ldUQFCDCUy4mtG32ck5h+aItkfg83174sEWv5nRyjAEhi
         0MRhTr4sjYSu39USgSXqR+aLOu0f2215by5UQ6bI/RI+3Rg6d3bqXcBlYRWHEqIFEnRY
         ulAeZVd2XeAM5Vuul6G6JOQ+nT/BwQ522c1ol7KvhQEXhljXfzYHsCxmcKXmABvSVJWP
         z0eA==
X-Gm-Message-State: AOAM531FxF3jjjSBXax9LwYWT5EbjquvSYMl2qZxaXmkD7wx5jJMQHyw
        koil9rcdVGvog4X8QCIgBcm/AsKJy/FJc45eDqsZxQ==
X-Google-Smtp-Source: ABdhPJzPkEALntqueRozx/btL2H3rZpdzbM0gxwcBKNAOihMH/NPP8Ud2tf8oC0uIvhCZKEuVTx5xEOXRUx7xNH5JnA=
X-Received: by 2002:a05:6122:ca6:: with SMTP id ba38mr55043958vkb.14.1638901586564;
 Tue, 07 Dec 2021 10:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20211206153124.427102-1-virag.david003@gmail.com> <20211206153124.427102-4-virag.david003@gmail.com>
In-Reply-To: <20211206153124.427102-4-virag.david003@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 7 Dec 2021 20:26:14 +0200
Message-ID: <CAPLW+4nVPE=RCwhLe7wLFR1aWOHh4ZmrA56uiNPYXij7rPkOag@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: arm: samsung: document jackpotlte
 board binding
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Dec 2021 at 17:32, David Virag <virag.david003@gmail.com> wrote:
>
> Add binding for the jackpotlte board (Samsung Galaxy A8 (2018)).
>
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> Changes in v2:
>   - Nothing
>
> Changes in v3:
>   - Nothing
>
> Changes in v4:
>   - Nothing
>
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index ef6dc14be4b5..d88571202713 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -199,6 +199,12 @@ properties:
>                - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
>            - const: samsung,exynos7
>
> +      - description: Exynos7885 based boards
> +        items:
> +          - enum:
> +              - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
> +          - const: samsung,exynos7885
> +
>        - description: Exynos Auto v9 based boards
>          items:
>            - enum:
> --
> 2.34.1
>
