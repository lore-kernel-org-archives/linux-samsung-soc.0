Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A26C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 04:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E18461A57
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 04:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242214AbhJAEye (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 1 Oct 2021 00:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351856AbhJAEyd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 00:54:33 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1A2C06176F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 21:52:49 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id h2so17854286ybi.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 21:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HSY5dUG0iWk0wmOHITmVmnD9YYtjGnNr2FW0qw66Pe4=;
        b=ERvLu10phYrVrUIUT3FzdDeg2rgbZvK7s0wbD18UwtSTLHKvY+YAMQN2Z4wvYwRRiL
         /iRsVFxQjqeYWGoJQV/Rdo+r09ydttg3pJqOhGWg3MyiGhvh/JiMTgy0TZM2cBXSmGrp
         L0ERj0n5zOOzIzH5m/U7eBBJPWYKbnOJ5JEUDDAyXqEOrDPwvMBP1Dr/RbnG6FqSxegE
         ulQ4x5AozNlp0wP1JYC8A3wJ0IXc4kgWceI+UcywptFCLQOaNgQeoq2dnO8oMLWez+UK
         c2f6pDqf7TqUq0GspOOliKauJ7YJqi+MU5ExnkpEsXJxt4ahiYH6wzRY1oLkDhkvXcx3
         yahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HSY5dUG0iWk0wmOHITmVmnD9YYtjGnNr2FW0qw66Pe4=;
        b=QHwa73zPKlkZkEramEDUtpuvtVE4YoCkpLmLBHg+0SxIVNNYzXEpNjzWauzJPzG81s
         fGUTMiBoA8+Abiqoc0wSrGoWNRixvm8MSx47ZXaERA721w4SpLHPoAbVSVO0sSselUGN
         /NpENl9zVXOEQHCBHZH/R6GOD0BO5xToj/xHXk+aZ9wVsuFW8WOzQR5kXUF7H1SpRKZm
         DnlQsQhibr+eMB0ENIXHvhTDCgD66pU3fzG+B3RolYPJeq7Q6MKeX7YhkZpfpiCYdaE5
         yqLzqlz4t09TLtbUkbDKKx7iy6dArI+1lP3dfwuiatPBEJbCj5KgQLlhNIi/6S6D/sV8
         60Ew==
X-Gm-Message-State: AOAM5314yWBGn/2CT02Bckew1DDgZl6CKeF15k+1/3MRNeA7jh/TbaQn
        9W3VyZRLKyQ3IGWE5FW11j8zYjYQuCmoY6jSpY92JQ==
X-Google-Smtp-Source: ABdhPJygycpZauu9TFmc+TzH6Xxv9d3sYB6IkEM/HcmQ8hM9+hQo2lPA+CHRH3RKW0G4hzlav9jzO/VJG+svIlgQKNg=
X-Received: by 2002:a25:4684:: with SMTP id t126mr3386461yba.476.1633063968846;
 Thu, 30 Sep 2021 21:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
 <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com>
 <YVWkxnc8wTdBgRsv@google.com> <CA+Ln22FBy2ks9gX3df=rQw-6W3iftMVoqsoqBPchGCqDDoMaLg@mail.gmail.com>
 <YVaIC8GTzvLKmZ5z@infradead.org>
In-Reply-To: <YVaIC8GTzvLKmZ5z@infradead.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 30 Sep 2021 21:52:12 -0700
Message-ID: <CAGETcx-5pBJK4y84QJfr7cTjsd_GhHyuZJfjmYZ8CN0vKXOxcw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 30, 2021 at 9:02 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Sep 30, 2021 at 09:10:31PM +0900, Tomasz Figa wrote:
> > Generally, the subsystems being mentioned here are so basic (clock,
> > pinctrl, rtc), that I really can't imagine what kind of rocket science
> > one might want to hide for competitive reasons... If it's for an
> > entire SoC, I wonder why Intel and AMD don't have similar concerns and
> > contribute support for their newest hardware far before the release.
>
> There is no reason at all, and to be honest this whole discussion with
> these bullshit arguments from the Google/Linaro/SoC vendor crowd just
> shows how on crack these people are, and shows a good example of why
> we should not support these models at all.  There is no good reason
> to "overide" uptream functionality EVER.  Stop digging yourselves into
> your ever bigger holes and just f***king contribute upstream NOW.  Just
> as we always have we should not give you more rope to shoot yoursel
> while ausing us extra overhead.

Maybe you need to read up the code of conduct again.

-Saravana
