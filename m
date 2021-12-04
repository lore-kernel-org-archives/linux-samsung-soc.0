Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E093C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  4 Dec 2021 21:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbhLDV7l (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 4 Dec 2021 16:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhLDV7k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Dec 2021 16:59:40 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA10C0613F8
        for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Dec 2021 13:56:14 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id y5so12302569ual.7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Dec 2021 13:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jlijFLhR6+r3JWz4tB9M0GrHy0Uv9AN2XW/u7IjaJz4=;
        b=wjG+3jcOw/Ii65JEa/rYFx9TMVQhQJ3CIrllOz4LyD2mn5+Xb+d4dF+1stcABP/Qzc
         D73RL8cLFle/UdOXSu1fJVZK99PUJpFY3WEpnfQ9eEG3URZjcRSO/3eteDzG8dmwjZwb
         zqG3bIdWv9EqAITrgYb5W00Nl8w6GNVHBHKfTXxGdrioEwPzna1FyzaOkXQja+xd/A8a
         amFfpGn/S2kSqVQQTkSzakSr9MTKw7W7k7s2t1lhzpPeT60xGND0Xg1dTos8xnKVf+/L
         zg7lmk/uCFZQodVHYzOAMN8n6QxdaHjQhcu6DkCxcQ6U2wxX0BdgbPIyJgMebwIYQF8j
         CZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jlijFLhR6+r3JWz4tB9M0GrHy0Uv9AN2XW/u7IjaJz4=;
        b=lsDsTR5+wrAOxX2VZcGxTDABOGj0OCXPCAqOBX9JtgHS+ROL+JnFxRNopa04y9iU2/
         51W6w7ehCff4H0h+YjmY86ZY+eFMgYz0t9xNc8bXEeshUX8M/5/ntg1nWcGKCOTcALYB
         R/iZlrmbhrrEifCLX8U0HwGDmtDJcvMpvX8+xucUV7NdVDsQhe5mDI267JAFPdvoochI
         GYQH9krj5o1PRAQRB7O1FvsMj4c4BkJzZIHvHjLCdu5jLFSlb3kk56H/sXE7ycaTxSKE
         dWRe5G1hF1cmN4VvWohkNFmBbVjTdhNbMRmIQXTzQBuBtPoU49FYzmJqOLQdpD1JSv2P
         IlZA==
X-Gm-Message-State: AOAM533vTt5n7UNgWk9L/3/8EQ+W4KmBkTRQQpNjyjrQYKWzbfYLi41Y
        GGBVmi1kwz/4kLlk6jDvWOriNSmIZVoHcbvmZeLTUA==
X-Google-Smtp-Source: ABdhPJxQvasWODGaqUZ7EeyZGO6L8kopH0JrCYBINCwP6VYNXPK/+UTqRmEnkYjFr7bMySk+qdqfzDUITYM07uj/2v8=
X-Received: by 2002:a67:be0f:: with SMTP id x15mr28248414vsq.86.1638654973600;
 Sat, 04 Dec 2021 13:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20211204215033.5134-1-semen.protsenko@linaro.org>
In-Reply-To: <20211204215033.5134-1-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sat, 4 Dec 2021 23:56:02 +0200
Message-ID: <CAPLW+4mqqk0XfdvsyGLeUdqQssQss3-C4BB4iMRMVSSm8dOa4A@mail.gmail.com>
Subject: Re: From a5f512cb01e48f5bfcdef800dd477c8b04a4cacf Mon Sep 17 00:00:00 2001
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 4 Dec 2021 at 23:50, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> Modern ARM64 Samsung Exynos SoCs (like Exynos Auto V9 and Exynos850) use
> pretty much the same High-Speed I2C controller supported in i2c-exynos5
> driver ("samsung,exynos7-hsi2c" variant), but with some differences:
> - timings are now calculated and configured a bit differently
> - two clocks are now provided to HSI2C controller (and must be
> asserted during I2C operation and register access)
>
> This patch series implements these changes, making it possible to use
> HSI2C driver on modern Exynos SoCs.
>
> Another change in mentioned SoCs is that HSI2C controller is now a part
> of USIv2 IP-core. But no USI modifications are needed in HSI2C driver,
> as all USI related configuration is done in USI driver independently.
> USI driver is added in [1] series (or its later revision, if available).
> To make HSI2C functional, both patch series (this one and [1]) have to
> be applied, but those can be applied independently.
>
> Changes in v2:
> - Added new patches renaming "hsi2c@*" nodes to "i2c@*" for Exynos
> dts's
> - Added R-b tags from v1 review
> - Fixed and improved i2c-exynos5 dt-bindings
>
> [1] https://patchwork.kernel.org/project/linux-samsung-soc/cover/20211204195757.8600-1-semen.protsenko@linaro.org/
>
> Jaewon Kim (2):
>   dt-bindings: i2c: exynos5: Add exynosautov9-hsi2c compatible
>   i2c: exynos5: Add support for ExynosAutoV9 SoC
>
> Sam Protsenko (6):
>   dt-bindings: i2c: exynos5: Convert to dtschema
>   dt-bindings: i2c: exynos5: Add bus clock
>   i2c: exynos5: Add bus clock support
>   i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
>   arm: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260
>   arm64: dts: exynos: Rename hsi2c nodes to i2c for Exynos5433 and
>     Exynos7
>
>  .../devicetree/bindings/i2c/i2c-exynos5.txt   |  53 -------
>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 133 ++++++++++++++++++
>  arch/arm/boot/dts/exynos5260.dtsi             |   8 +-
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  24 ++--
>  arch/arm64/boot/dts/exynos/exynos7.dtsi       |  24 ++--
>  drivers/i2c/busses/Kconfig                    |   2 +-
>  drivers/i2c/busses/i2c-exynos5.c              | 108 +++++++++++---
>  7 files changed, 253 insertions(+), 99 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>
> --

Please ignore this series, patch 0/8 was malformed for some reason.
I'll resend it soon, with [PATCH v2 RESEND] prefix.

> 2.30.2
>
