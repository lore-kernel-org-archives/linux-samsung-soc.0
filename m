Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D01C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Nov 2021 00:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B234E6115B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Nov 2021 00:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350480AbhKPAbr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 19:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345573AbhKOT2m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 14:28:42 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C56C0AFD78
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 10:56:23 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id az37so37000089uab.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 10:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wjFytYa62TwsRDtT9P+lI6l+ZPmY9Qu38r4fj9pXQeI=;
        b=Et3mLJfVVa31pUjIiX3D9ldtHtwfS2Ty0ZDCKaDhjnrACzXviF+n5avqkd0wi52RbJ
         x8B6+Y/Mrdqx7qBEUU7AMThPC/tfboVqIHcexrDStDQG4F6OuXJm7QybGYb4/PIefpiP
         qdNa5kCUzqv+9tlXAWjZjq6k46+nKkyyj3ca3AJq+z73CvIReKUOSUP7yH7sAHD0khTj
         ponfVix4Wzw1TnM2ady5uBFwE4d33Bo1+bZknSVPKjD4HedtWQClz32AwYdNZFtHh5Z7
         BHVTOvFvAyl4pxfoavUjBnxwV1aP9Hb7IvY06fkY2g0G/yNZCGfX2Bpe1C2YWYlrYcEV
         uNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wjFytYa62TwsRDtT9P+lI6l+ZPmY9Qu38r4fj9pXQeI=;
        b=wHzdZl5iWQiVmSxpOr2QOxayZKVjXbR7rt3GME5CXlqW+VKIhiv4OVlg1+0a9E0xDy
         gZ5adSnze9O2of9gU0FF2u8pWFlbrFrR1fyiVQtWeFElxLz1ZEaN/93Zobabrh15ENYE
         G0SCA633zKuXzZJuHOdmd+1nXibO6Avx4NhFPGrm5cf1wrh02mjLbj2BmwCSPfkS17W4
         t71Nuy0nJ3rHQmdp0Xt30ITp/7uEJfDYI4RqvmoYssGoKT6LtD5cG0JluFJED9RYBJ2r
         xZNDBYqtNltdPf3CMlFsN9GvyO80weGas3TUO266wUs8zaRHMLNZl6/k78Ys51idTnsh
         PhBw==
X-Gm-Message-State: AOAM5309faCGmpO+PcmCHhycirA2hAuuQ8LFn56H9oNgfN3wypesfFHv
        x2Q8H8UYvE8CPB35bOd+QGzLlEpRNbTGXqm33JOrWw==
X-Google-Smtp-Source: ABdhPJylv9Dsbu7ZOrf0qTkvNNEqYiy+MbBLGYCd80FkaWunLT9ncwO+I1KUfsKqM53IfBUg2/slkF2dFCSNflVEqho=
X-Received: by 2002:a67:d893:: with SMTP id f19mr45783283vsj.39.1637002581757;
 Mon, 15 Nov 2021 10:56:21 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211112010603epcas2p26c076e65e0cb286cb53f06053165ef60@epcas2p2.samsung.com>
 <20211112010137.149174-1-jaewon02.kim@samsung.com> <20211112010137.149174-2-jaewon02.kim@samsung.com>
In-Reply-To: <20211112010137.149174-2-jaewon02.kim@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 15 Nov 2021 20:56:10 +0200
Message-ID: <CAPLW+4=QoTLzZsHHxM_E+WhzhYKsfEisFe_berH=i9G=TSb0ng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: exynos5: add exynosautov9-hsi2c compatible
To:     Jaewon Kim <jaewon02.kim@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 12 Nov 2021 at 03:06, Jaewon Kim <jaewon02.kim@samsung.com> wrote:
>
> This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
>
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> index 2dbc0b62daa6..39f4067d9d1f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> @@ -14,6 +14,8 @@ Required properties:
>                                 on Exynos5260 SoCs.
>         -> "samsung,exynos7-hsi2c", for i2c compatible with HSI2C available
>                                 on Exynos7 SoCs.
> +       -> "samsung,exynosautov9-hsi2c", for i2c compatible with HSI2C available
> +                               on ExynosAutov9 SoCs.
>
>    - reg: physical base address of the controller and length of memory mapped
>      region.
> @@ -31,6 +33,11 @@ Optional properties:
>         at 100khz.
>      -> If specified, the bus operates in high-speed mode only if the
>         clock-frequency is >= 1Mhz.
> +  - samsung,sysreg : system registers controller phandle to control USI.
> +    -> If I2C integrated to USI(Universal Serial Interface), this property
> +       is required. When using Exynos USI block, it needs to select which type
> +       of Serial IPs(UART, SPI, I2C) to use with system register. So, it
> +       requires samsung,sysreg phandle and offset value of system register.
>
>  Example:
>
> --
> 2.33.1
>
