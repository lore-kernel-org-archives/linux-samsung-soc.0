Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33C7C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 09:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbiF3JSd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 05:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbiF3JSC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 05:18:02 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EB03FDB8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 02:16:47 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-31bf3656517so82015527b3.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y2VcWUn76owMkahIiSpe6u3dmJvIJ7O7/SunZB5ovaY=;
        b=EIZ5mBcgizaSwAGmq8RVN4Ev0EgefBfQ1Zkam3vTcFZbuOMtG8vnYJWocqRzbgnrqp
         Hyzh/VH2EDFZWQs5uN738AesOeGyPhc5e45LDg+anBaRy2a/EN28QLRuUcxDG6InguBL
         pOALxDvaFC8nD2KIw6whHPam9YQAA4HbTu7zN9ag0BnhNxbWZDVQCAlBupiGGjRkroZc
         zqCG8/QOEmVkq9Rxpb7H/Uk7/vbJqADBHWAqo0UNOxAROQET3/nNxpJmgENWPr6uP2am
         q0DOqGm9kzthmJVC+WO1GuLwK1cWU7dKrDuHI4ShAORa95YMl1DfAI6HD9Z5WInpN8nO
         TWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y2VcWUn76owMkahIiSpe6u3dmJvIJ7O7/SunZB5ovaY=;
        b=Bgep38M93FQYHp0NdIRAl+AWGzRtccRhgpkUSd19yvW/HHR7j97RS0F1txDtbduA0V
         CPHuehKRHkkegIVvQ6VYsaLsxvypzqvXwabrbMmJrBz3eXmTXJt7yvRXev7T1pOrTszU
         4lVXJftRUqqdcFvC1v9aPptrfu4HczY9tlXqwmWimHbW0Kj7Xjc25yid1AAOluL47e/O
         1b6rZlO6y/5rgxyZcH8IYWPv+RUfijZPh+v+2JLNf2XTmHYUe3Rp+g1AIcHhD3IB4hr9
         e0/Yv89nizNJGUaNty1FcP0rPRPKaurxl6SNFo6VrxWTHUrNm4OqLkHYxQA+dKApNvH9
         hayA==
X-Gm-Message-State: AJIora80HtGO3NOb7lCSyTN2UXfZMVs48+CUAmTGhakrUrV8bibn3m6b
        PJ11JV85wi+iGSgfR4wWF1dpTInnObsUBQX5hN70ejLvUblLJQ==
X-Google-Smtp-Source: AGRyM1tjLZ153j7Np3XGNGpSK5G64rKc8JOpc+/Fc3g7HcwAIDXbcAmIMxNFbsul/0N0Bx967t8Cyw5rxHBJe9cOL4w=
X-Received: by 2002:a81:71c6:0:b0:318:38d5:37f3 with SMTP id
 m189-20020a8171c6000000b0031838d537f3mr9507316ywc.268.1656580607004; Thu, 30
 Jun 2022 02:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220629102527epcas2p42e99f44d529d215623bd0e12a082d1dd@epcas2p4.samsung.com>
 <20220629102304.65712-1-chanho61.park@samsung.com> <20220629102304.65712-3-chanho61.park@samsung.com>
In-Reply-To: <20220629102304.65712-3-chanho61.park@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Jun 2022 11:16:35 +0200
Message-ID: <CACRpkdagXnR0jjHNOVgGkh_ZntfzF0h4D_+DX85jNy7q=6DNEw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] spi: s3c64xx: support custom value of internal
 clock divider
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jun 29, 2022 at 12:27 PM Chanho Park <chanho61.park@samsung.com> wrote:

> Modern exynos SoCs such as Exynos Auto v9 have different internal clock
> divider, for example "4". To support this internal value, this adds
> clk_div of the s3c64xx_spi_port_config and assign "2" as the default
> value to existing s3c64xx_spi_port_config.
>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

While this gives a way to set up the default clock divider (which is
fair) I think
you should probably go the extra mile and make this clock divider a proper
clock abstraction, so the driver can respect the DT standard property
spi-max-frequency
from Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml

This actually isn't very hard: look for example in the PL111 driver,
a hardware block that contains a similar internal clock divider:
drivers/gpu/drm/pl111/pl111_display.c
check how we define a clock from pl111_clk_div_ops.
in pl111_init_clock_divider().

Then the driver probe() just grabs that clock and sets the frequency.
The algorithms should be pretty much copy/paste.

Yours,
Linus Walleij
