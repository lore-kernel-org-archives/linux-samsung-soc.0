Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED8BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 15:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC7F96115A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 15:13:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238917AbhKHPQG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Nov 2021 10:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237670AbhKHPPw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 10:15:52 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A07DC061208
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Nov 2021 07:12:58 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id s13so16578076uaj.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2021 07:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9UlUS6saUywHZK/umS0DUBOD5AkBYetajHFNSpyoE4w=;
        b=DOcAXZ4Mw2ea+GyAjENB23bTtsIuOKuEdvjP+XRgtsReT5UUBjNtxggSSHvwj6MdR8
         V1+45UigKcj1QpVD+lmvp+U5Ibx93g+Eg1cvWvUM+mbtLBoTKvCS/9CMdFiN0mXO0mlz
         5FmGehJD++jz8ghPFbjeJp+omeR8ITegBIet9Hx6WXG9x3lox7s/1+Jn3C/FUm38gOrH
         z8Aq/5yqJWPYvOtpapyknlpcmGVFkA+aQhwhcO3MP6FIbH0LWdNE14hlOJb6V7zlZjLE
         4P0N1a5gsR40AhaMiXjGk9HkIfCkgYHI3HOh/ioR5P3Fj+Pt4D1+LQrlK92yfLcYdqLs
         xLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UlUS6saUywHZK/umS0DUBOD5AkBYetajHFNSpyoE4w=;
        b=et+B4DboNaEr4qcXAR7e6NXkILkTHq9UWIHRu7ndLf5XApkfuhUjL4Xo6j674+2enx
         ptdRM9v1ilgDO/gY6WQGo1z3bW6MM2xjQTjn3u0JJU/pedmF+EkAK0jH+cN9UzTpX9/h
         Dp8Xhuqa/zoF3jN57XZJujPut14tvlBTr1jKeGwH36M2C96My+LUVHNOrgtcSfV8bd1y
         mrHhpNFNs+27h6UILN+SwTfIamDYgbJVP1xurHIZijx06UXSLFDq5Z5QkTGZkTvb/KnQ
         dHDi36QGl4tHHbFUrIcaG26Jhmlkq95kHkgoDJDwL6Nfrqox/pTvmrOiAwAvgyxO+Hc4
         FPXw==
X-Gm-Message-State: AOAM533zrN7ICI2952hWQ24ebTh6WLzPaabw10lz0w1rHa1YYa14RidS
        H3vdkj9SRXLlHOwUH4C9m9pxOqw5258cekwcnbQPyA==
X-Google-Smtp-Source: ABdhPJxGuRiXWJL0tUJhvhSH15xu8O6PSly0XUSVcpnNraXIznd7K+XJ1EfcXrgS3fbjV/7ZTx1T0mHyGs+pQ/qL0zs=
X-Received: by 2002:a05:6102:3ece:: with SMTP id n14mr108075vsv.55.1636384376768;
 Mon, 08 Nov 2021 07:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20211108134901.20490-1-semen.protsenko@linaro.org>
 <20211108134901.20490-2-semen.protsenko@linaro.org> <433f2d77-90d0-53d9-2e04-a8c5feb16349@canonical.com>
In-Reply-To: <433f2d77-90d0-53d9-2e04-a8c5feb16349@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 8 Nov 2021 17:12:44 +0200
Message-ID: <CAPLW+4=RMfTmLnOiC+=rAB1c0+rTqpqDpc-1UO+0BOmP3+0Z_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Samsung I2C driver
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 8 Nov 2021 at 16:18, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 08/11/2021 14:49, Sam Protsenko wrote:
> > i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
>
> Hm, that's a little bit unexpected. I thought you will be also using the
> HSI2C driver (where Jaewon is adding USI support).
>

Thought you'd ask :) Exynos850 has both I2C and HSI2C blocks:
  - I2C is a regular I2C, and uses s3c2410-i2c driver
  - whilst HSI2C is a high-speed I2C (used for example for cameras),
and uses exynos5-hsi2c driver

I'll look into HSI2C enablement on Exynos850 soon as well, so Jaewon's
patches might be helpful for my case too -- didn't check that yet.

> Best regards,
> Krzysztof
