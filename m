Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C1BC43381
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 18:44:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89DEC64E74
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 18:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhBHSnb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:43:31 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:38824 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235879AbhBHSnP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 13:43:15 -0500
Received: by mail-ed1-f51.google.com with SMTP id s11so19860158edd.5;
        Mon, 08 Feb 2021 10:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o0MO6kYhDlukwe2FztGhJY4JOmsuVtg2OPvSn78DT4o=;
        b=dAdHxwPFGIMoqa/lBmCRcIfp5CNpz6JNqivt5dX9nKDVtEltyRYdJ8/Ov7E9u6c4Hw
         dCfcX1jGYFGTS0D0TiloDu/ZeP5eXC93kjCz+5NxUmqgsuj9aV9sF46/LqBHnIs1J6HX
         deORHajAKcVXymltgZbh815MonPcoln1rfQDF/Fa9eJZfUySZ8bc8a0+99kstly0xJGr
         GSnObmyz4oPQg/0btEs26NgC0elnTp8zgufFHiZZ8sLgSQpQtBhVLBgpQuaXmJHdviPY
         wIwLux93IBgKNyiXOgKxYowullCVPK3bDtPUAR2VmcJaRAO+sTXUw6GTWSDItFNWhDr4
         iyOg==
X-Gm-Message-State: AOAM532EkZFUsNgr0alikqmD6chf/3rvkGYXUXN2zZOAgyIwkTEY2y5B
        uNNZ+wtD6wzQ6s71fw6r3V8=
X-Google-Smtp-Source: ABdhPJxPQoDmwOFtcSLnMjYpNRs+iVkrhj4hV31wgmf6XJ1MLpWB5omO8uuafc7Bk011dYwog3NnRA==
X-Received: by 2002:a05:6402:22ce:: with SMTP id dm14mr13185754edb.256.1612809753077;
        Mon, 08 Feb 2021 10:42:33 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id hy24sm8682518ejc.40.2021.02.08.10.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:42:31 -0800 (PST)
Date:   Mon, 8 Feb 2021 19:42:30 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
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
        Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <20210208184230.onhlioflyylkx6xo@kozik-lap>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCGBIvRfoP0BeyrP@builder.lan>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Feb 08, 2021 at 12:21:22PM -0600, Bjorn Andersson wrote:
> On Sat 06 Feb 13:47 CST 2021, Geert Uytterhoeven wrote:
> 
> > Hi Arnd,
> > 
> > On Sat, Feb 6, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > That said, I'm still not happy about the patch we discussed in the
> > > other email thread[1] and I'd like to handle it a little more strictly in
> > > the future, but I agree this wasn't obvious and we have been rather
> > > inconsistent about it in the past, with some platform maintainers
> > > handling it way more strictly than others.
> > >
> > > I've added the devicetree maintainers and a few other platform
> > > maintainers to Cc here, maybe they can provide some further
> > > opinions on the topic so we can come to an approach that
> > > works for everyone.
> > >
> > > My summary of the thread in [1] is there was a driver bug that
> > > required a DT binding change. Krzysztof and the other involved
> > > parties made sure the driver handles it in a backward-compatible
> > > way (an old dtb file will still run into the bug but keep working
> > > with new kernels), but decided that they did not need to worry
> > > about the opposite case (running an old kernel with an updated
> > > dtb). I noticed the compatibility break and said that I would
> > > prefer this to be done in a way that is compatible both ways,
> > > or at the minimum be alerted about the binding break in the
> > > pull request, with an explanation about why this had to be done,
> > > even when we don't think anyone is going to be affected.
> > >
> > > What do others think about this? Should we generally assume
> > > that breaking old kernels with new dtbs is acceptable, or should
> > > we try to avoid it if possible, the same way we try to avoid
> > > breaking new kernels with old dtbs? Should this be a platform
> > > specific policy or should we try to handle all platforms the same
> > > way?
> > 
> > For Renesas SoCs, we typically only consider compatibility of new
> > kernels with old DTBs, not the other way around.
> > However, most DTB updates are due to new hardware support, so using the
> > new DTB with an old kernel usually just means no newly documented
> > hardware, or new feature, is being used by the old kernel.
> > 
> 
> This is the case for the Qualcomm tree as well, it's expected that a new
> kernel should work with older DT. But, while we don't actively try to
> break it, there are plenty of examples where we don't/can't give the
> promise in the other direction.

Thanks everyone for comments.

Let me steer the discussion to original topic - it's about old kernel
and new DTB, assuming that mainline kernel bisectability is not
affected.

Flow looks like this:

0. You have existing bidings and drivers.
1. Patch changing bindings (with new compatible) and drivers gets
   accepted by maintainer.
2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
3. Patch changing in-tree DTS to new compatible gets accepted by
   maintainer and it is sent as v5.12-rc1 material to SoC maintainers.

So again: old kernel, using old bindings, new DTB.

Another case is where out-of-tree user of bindings, e.g. FreeBSD, takes
new DTS (at point of #3 above or later) but did not take the bindings.
Such system would be broken but it's their fault - they took DTS without
taking the bindings (which were there already for one release!).

Best regards,
Krzysztof
