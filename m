Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6CEC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:22:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244423AbiARSWR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244384AbiARSWO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:22:14 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0D5C06161C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:22:14 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id p1so38412938uap.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7LZNzj0gVFsf/tWnnArV/oep7oH7ni2/wbESJgVeIAs=;
        b=htAigmZtm9BSSN1q9F8ZxY2Y4pj0ZFOxFKRaBA3aqDnZAtPriB9OcJcAvbVxpSFZP4
         fxMwtpcnzT+ADV5N2nP6ZBDGyPKVkm1NbKou/IOWx59zlHFUdpq2K9dtbOvPjN2jxQtD
         ToBhItewgTADtYbKJvt8IOSGhY8PtD1+jtai/KUNqfX+2cW8aGGDO2WnLByx5oW7moo0
         Bt9oLKA3KUYjA0REs4zV/GQqINWuSc30iyg/x0ZjJzRPBtL6KaRuWrGiAESUjOnPes8M
         pwOCglmHxy49vghHzE0C9l3vu+SMcPTmdnjSoChAmPih7ttDDB0/bp7g7RdEwBbMN363
         0WVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LZNzj0gVFsf/tWnnArV/oep7oH7ni2/wbESJgVeIAs=;
        b=b2dh1K2avG8WEaKtU9esgurXwK/NnmPB4PpTwOzzF8kwVM/tQYzCZqjQicsXhDecom
         NsWqxJTQZBIm1VZYXX/fzXiCTDdnah4IIqUgiP9HnieHYkkAZEd/0iTOySHDXW7pAgsH
         WuckJb87V41yyomDH4TZNBkH7LKNB0Rw3cVejq3uKpbtfmkhtgTsKDX35dW8djQthvMH
         UvL2TjX0f3hHTLEI5JmF2RhQAebrn8C+JZLK7xfQvKuwJUK6uFaNhplTuAGWS2Zs0WOL
         VapAfaCKN8N6MzoGGP9S0Hdi0XjR8eSSqgcwGw5wBM8OWl4eQxc1BjXTiHWfRL17yK1G
         HCMg==
X-Gm-Message-State: AOAM531NngNN44HPa7oEnQ+WUdEbOK0+XwrsihzIeIQMoQtPck+c5DUB
        3ur/20ClJHw0QyDi6b3FG6h3NglVt6V7UFiA+keOWw==
X-Google-Smtp-Source: ABdhPJx2W8kaHg9EtEhlusRCmaUdX8dPceh/1TYnKoK+BeABx4NYXSa1sCGd0CtVcN4dwumpeXNWaypXzZOQtdNVo48=
X-Received: by 2002:a05:6102:108c:: with SMTP id s12mr10253415vsr.20.1642530133625;
 Tue, 18 Jan 2022 10:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20220118110928.120640-1-linus.walleij@linaro.org>
 <20220118110928.120640-3-linus.walleij@linaro.org> <CAPLW+4kNbC2BNcC54evJL_9tYoY_S3hcski81KHUPughs3f0ag@mail.gmail.com>
 <CACRpkdaL3RFU-cJNW2e40RiHGP06BfunnmU73FK_6U=Syvx_Wg@mail.gmail.com>
In-Reply-To: <CACRpkdaL3RFU-cJNW2e40RiHGP06BfunnmU73FK_6U=Syvx_Wg@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 18 Jan 2022 20:22:02 +0200
Message-ID: <CAPLW+4kJHv-xhm1=igVdc9XYUhF20Zbbo_tXpORnkPGsLzuZ+A@mail.gmail.com>
Subject: Re: [PATCH 3/3 v2] spi: s3c64xx: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 18 Jan 2022 at 18:08, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jan 18, 2022 at 4:27 PM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
>
> > > +       if (!cs)
> > > +               return 0;
> >
> > Shouldn't some error code be returned in that case? Or is it normal case?
>
> No, because it just means the platform didn't define any fb_delay.
>
> > >         /* Configure feedback delay */
> > >         writel(cs->fb_delay & 0x3, sdd->regs + S3C64XX_SPI_FB_CLK);
>
> But maybe I should always write 0 into this then.
>

Yeah, probably makes sense, as some other slave node may have
configured fb_delay on the same bus / driver instance. And of course 0
is correct value, just checked in Exynos850 TRM, means "do not use
this feedback clock".

> > > - * This is per SPI-Slave Chipselect information.
> > > + * This is per SPI-Slave FB delay information.
> >
> > Not sure if this change is needed: this comments will be incorrect if
> > some new fields are added in future. For example, downstream trees
> > like [1] have more fields there, not only feedback delay one.
>
> OK I fix
>
> > Other than minor comments above:
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> >
> > Btw, this SPI driver is used in Exynos850 SoC, which I'm working on
> > right now. It's the shame I didn't enable it yet on my board, so I
> > can't test the code. But I'm happy to see it's being modernized, kudos
> > for doing that!
>
> Yeah I saw it being used in the Tesla SoC and also Exynos850 so as
> I now know this is not going away any time soon we might as well just
> fix it up.
>
> Yours,
> Linus Walleij
