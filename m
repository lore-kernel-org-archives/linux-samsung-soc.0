Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E879C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Feb 2021 15:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07DDD64E22
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Feb 2021 15:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhBFPHm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 6 Feb 2021 10:07:42 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:38216 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhBFPHl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 6 Feb 2021 10:07:41 -0500
Received: by mail-wr1-f46.google.com with SMTP id b3so11231585wrj.5;
        Sat, 06 Feb 2021 07:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fzMdGIncwXZccKuwFCYwYE/wDOhe7aap4KiSx77Zgp0=;
        b=pdIcz/W1PBqtbpw0wgkx/6ZcXy3IDO/kagpnwpimr7pWfgeC9YThEosPh2SuyAhFrw
         h0yUc63uM9JUgsN1/0az2lfL81Ih+f0P8rW+g6RPJjLvAWjyXQDBpfMe20hDaPnAZ6wP
         +aJkR4RggzRjY1rq1DrrmfeF7eLMZvfRvvqPAsVMmyNPqHY5Ua8Wc1rROKvIXHB4b1AZ
         fpvp3d6nZDdpHGcv3bsXH/kjdjfpYNn41gOAjdQw7yRIw8uktCCyVBcSo5jCVIpEJSHx
         benLwJL97qXd/rSbJkOrz+RVIKhRXqRATh6iKPDA3FbahhRPRMfkuBmBgT8nPrJ8+/Vf
         Yz7A==
X-Gm-Message-State: AOAM53081ObSexktDeuuqp3QLYG/uNW8Ed4HHLRTegYgAivcSJzzKFv2
        hTfseM2Kuva8v8lrW5m/OWk=
X-Google-Smtp-Source: ABdhPJwbJn9PaV7uVVeptZSLdmOkDPGrrad13AK38DSA0rKn7zNGSVqVrGkydECDJ0UubdHLvPkEqQ==
X-Received: by 2002:adf:cc8e:: with SMTP id p14mr10271797wrj.270.1612624019973;
        Sat, 06 Feb 2021 07:06:59 -0800 (PST)
Received: from kozik-lap (194-95-143-94.dyn.cable.fcom.ch. [94.143.95.194])
        by smtp.googlemail.com with ESMTPSA id n9sm16781833wrq.41.2021.02.06.07.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 07:06:58 -0800 (PST)
Date:   Sat, 6 Feb 2021 16:06:55 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <20210206150655.nq2m4usyzg4rgvtt@kozik-lap>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Feb 06, 2021 at 03:35:54PM +0100, Arnd Bergmann wrote:
> On Sat, Feb 6, 2021 at 2:45 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Mon, Jan 25, 2021 at 08:12:39PM +0100, Krzysztof Kozlowski wrote:
> > >
> > > ----------------------------------------------------------------
> > > Samsung DTS ARM changes for v5.12
> > >
> > > 1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
> > >    it suspend/resume cycle.
> > > 2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
> > > 3. Correct the voltages of Samsung GT-I9100 charger and add top-off
> > >    charger.
> > >
> >
> > Hi everyone,
> >
> > Any progress or new comments about this pull request?
> 
> Hi Krzysztof,
> 
> Sorry for not getting back to you on this earlier. I discussed this with
> Olof the other day and we decided to merge this, I just haven't
> gone through the pull requests over the past few days. My plan is
> to do the next round on Monday.
> 
> That said, I'm still not happy about the patch we discussed in the
> other email thread[1] and I'd like to handle it a little more strictly in
> the future, but I agree this wasn't obvious and we have been rather
> inconsistent about it in the past, with some platform maintainers
> handling it way more strictly than others.

Thank you for explanation. I would love to receive kind of guidance,
best practices, guide for future patches. I will them write it down and
try to follow during my review. However it made me a sad that a patch,
adhering in my mind to all rules, was postponing the pull request.

> 
> I've added the devicetree maintainers and a few other platform
> maintainers to Cc here, maybe they can provide some further
> opinions on the topic so we can come to an approach that
> works for everyone.
> 
> My summary of the thread in [1] is there was a driver bug that
> required a DT binding change. Krzysztof and the other involved
> parties made sure the driver handles it in a backward-compatible
> way (an old dtb file will still run into the bug but keep working
> with new kernels), but decided that they did not need to worry
> about the opposite case (running an old kernel with an updated
> dtb). I noticed the compatibility break and said that I would
> prefer this to be done in a way that is compatible both ways,
> or at the minimum be alerted about the binding break in the
> pull request, with an explanation about why this had to be done,
> even when we don't think anyone is going to be affected.
> 
> What do others think about this? Should we generally assume
> that breaking old kernels with new dtbs is acceptable, or should
> we try to avoid it if possible, the same way we try to avoid
> breaking new kernels with old dtbs? Should this be a platform
> specific policy or should we try to handle all platforms the same
> way?

Good summary, thanks Arnd. I would like to add that the discussed change
was bringing a new compatible. It was saying: hey, this hardware so far we
treated as old one, but it's not, sorry, it is different, so here you
have a new compatible with a change in few properties as well (and new
bindings which appeared a release earlier).

Best regards,
Krzysztof


> 
>           Arnd
> 
> [1] https://lore.kernel.org/lkml/20210130143949.aamac2724esupt7v@kozik-lap/
