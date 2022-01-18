Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9C9C43219
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 16:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiARQIp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 11:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346547AbiARQIW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 11:08:22 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E69DC06176C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 08:08:15 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id t4-20020a05683022e400b00591aaf48277so24807342otc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mEXlFWe/RRxSBawapRn9SDXx9+/QLY02dhjgwIQqPyM=;
        b=iQFGf5IOoRW7z7O5Gn10aLK3jkjcFhIBlN2bJPhOgZ+rXrcW3DQWw39VBj12wBQy+r
         bzrKzMosk7DN9UDljbad1JW7aC+LW0uO39Td7dydEVEm9OYafnvWtFVtmF/U73yNfaOI
         DTYD2meRHvyT3fyz/Yx91ByNwWmuiev8ETpwagQKKVXAOi/O3H/YabzjSUxLaX6xD/VQ
         hmSWz/pnPvTJJiiSwDA4iUkvdf8XsYl2DG/Dxj+ha6Ip9a+9F6LwTTSTHxtnPxS6ACwc
         1MVX/8Q9OYQpj/AKwumngKdrGrCgYf0fuTcJLo1HTllAQKDAJ4iPYDhhXowZuiaM9FWF
         gJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mEXlFWe/RRxSBawapRn9SDXx9+/QLY02dhjgwIQqPyM=;
        b=CWU1UKPEeVLjCLDeTxHxHP3EU0/4/1EunWINS0a6mUb4jCuBinpxA4yoDp0Pl+tHWq
         Xoq/I24RRU9svcLeWxwMISYQUmwulL0mvoZPRcrl7v9uQClbI5FWtEzbiTwWmPTnXkB9
         c/Fx7n9hHs0kAhyPU7/l+vvYQAIipPiLlpcDyLBl/9cpSZlcChb798pgmu+2xnPRCZjz
         vEXBLBAcZzp/sDKJ5Lwj5xdfwWkkEdcHhvAE4p2Geue4f56l8Hf7wuQz2JiyzZGw0Awf
         Yia/cgtfdfv77a+E86fVJOOVumNgzB3LH+2CuEP62ZFOymu+uoVgNaHs49WBBwgQ/VN+
         Iu2A==
X-Gm-Message-State: AOAM533HwhADAhBOJCeyp1Zo96iJIIJtT5xfvTZxJKQ5UUYkkajg1Kip
        XVB1BKG5pWrbaq582ccuydHDhnEemVWUlVy/yZNZ4g==
X-Google-Smtp-Source: ABdhPJw8GHcOEwEgXiJD4Ev84MPeeZxU0LFHDrAesZxnYaGJYwkd9eLiPxv9sEzfXEOPQwgLnB+/PWrQeUdHaHQYwEc=
X-Received: by 2002:a9d:465:: with SMTP id 92mr20889618otc.35.1642522094495;
 Tue, 18 Jan 2022 08:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20220118110928.120640-1-linus.walleij@linaro.org>
 <20220118110928.120640-3-linus.walleij@linaro.org> <CAPLW+4kNbC2BNcC54evJL_9tYoY_S3hcski81KHUPughs3f0ag@mail.gmail.com>
In-Reply-To: <CAPLW+4kNbC2BNcC54evJL_9tYoY_S3hcski81KHUPughs3f0ag@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Jan 2022 17:08:02 +0100
Message-ID: <CACRpkdaL3RFU-cJNW2e40RiHGP06BfunnmU73FK_6U=Syvx_Wg@mail.gmail.com>
Subject: Re: [PATCH 3/3 v2] spi: s3c64xx: Convert to use GPIO descriptors
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jan 18, 2022 at 4:27 PM Sam Protsenko
<semen.protsenko@linaro.org> wrote:

> > +       if (!cs)
> > +               return 0;
>
> Shouldn't some error code be returned in that case? Or is it normal case?

No, because it just means the platform didn't define any fb_delay.

> >         /* Configure feedback delay */
> >         writel(cs->fb_delay & 0x3, sdd->regs + S3C64XX_SPI_FB_CLK);

But maybe I should always write 0 into this then.

> > - * This is per SPI-Slave Chipselect information.
> > + * This is per SPI-Slave FB delay information.
>
> Not sure if this change is needed: this comments will be incorrect if
> some new fields are added in future. For example, downstream trees
> like [1] have more fields there, not only feedback delay one.

OK I fix

> Other than minor comments above:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>
> Btw, this SPI driver is used in Exynos850 SoC, which I'm working on
> right now. It's the shame I didn't enable it yet on my board, so I
> can't test the code. But I'm happy to see it's being modernized, kudos
> for doing that!

Yeah I saw it being used in the Tesla SoC and also Exynos850 so as
I now know this is not going away any time soon we might as well just
fix it up.

Yours,
Linus Walleij
