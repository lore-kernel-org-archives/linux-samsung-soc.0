Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CD8C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 19:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFF5E23A58
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 19:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbhANTIr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jan 2021 14:08:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbhANTIr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 14:08:47 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5F3C061575
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 11:08:07 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id g4so2763859ybo.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 11:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUCOJz/ZqmpeN2p1piWt0o8HDtV5bR2P5dOvMH/Op8g=;
        b=nuhPA816/Uvl7M7reNfTzmbgo375dBusvoHBhO39d0AsqCqDxJjbfgFbm6n5qxn2Rt
         Ujucgbu+Xv2LZINyfgd1dgX4nX7Xdp7IQiLj+CCiSySFOpP5eVUb/DhIpb7e/05ossoD
         0tc54XXDjwAQMWGcYfUvHoJIi7ablXFMJUPGrH3Rol+mmx0ate1xdb7njDET4+jc1cRr
         yFbpuIcZiEzMOb+7m9Ej7kHmEu/Qz5/rNJR0BRUjiSmCQVdm6VTvelBKmEVb83GghrL0
         kHcIV7qRbPcKCDXulDfEn+8xc/vuB7LuInnYL8/QL1ykWAHx9Cmy+YWU3pMoaiTF8e1T
         c1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUCOJz/ZqmpeN2p1piWt0o8HDtV5bR2P5dOvMH/Op8g=;
        b=bCpVhx73eO6usXGSl7cRU61TE4PVHsdpdfYuOoZkdyPXpcjx8mg6LRkIp0PrR5qZmB
         euBBiBpdWAcdbYC6+XeB54hCHtXkOSurYtYvNR4f8PdlYtF/m3398rt/AM+kZKmijxJx
         sifgv3Wbu5mzw9fSByieqJCiFv973OUVkmRrOPdbMSWWujWAQQithBwRPiZXwlBSj7/B
         FKrVQjf5O/J76Pkps/qmzkasWCKMn0wwogCPoLG0nlJOYIhHI6R+N59vC5Pwdy5PIUt8
         HqRfDZwKlckxwKb8nEsf3CFzRUAkHanUm0XX6ySozu5jDWf3VjSbvQeFsuIK0pa0GEvl
         fV7Q==
X-Gm-Message-State: AOAM532U/XWKcKSLk2LksTaSGLFFb8MIRrVQhicNBPGd+voMrj6j8nLM
        kSDPlvmBIfeASZ8gRxSIA0T6m3J43wRrewG5iW5nNQ==
X-Google-Smtp-Source: ABdhPJzo3aCLs5/z0dpM579QaEyLQMQye0ID9U2++65JGzdmC3a/RHg2pnEVu4xFEJArFJTBpsfaBqWVg/ZneHH/oPg=
X-Received: by 2002:a25:77d4:: with SMTP id s203mr6760882ybc.32.1610651286115;
 Thu, 14 Jan 2021 11:08:06 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452@eucas1p1.samsung.com>
 <20210113110320.13149-1-m.szyprowski@samsung.com> <CAGETcx9wJVnBAe6mKxfi9DC9YFf6DLzAyxBC8DxhQUqpfTDR3A@mail.gmail.com>
 <58e1cfb2-cd35-badf-0238-7c62122e2d05@samsung.com>
In-Reply-To: <58e1cfb2-cd35-badf-0238-7c62122e2d05@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 14 Jan 2021 11:07:30 -0800
Message-ID: <CAGETcx_Q_FvdL7ghC9Z7p9RcoBRYHeyTB1PRYk==HMv+NzJBzw@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: pm_domains: Convert to regular platform driver
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jan 14, 2021 at 11:03 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Saravana,
>
> On 13.01.2021 21:27, Saravana Kannan wrote:
> > On Wed, Jan 13, 2021 at 3:03 AM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> When Exynos power domain driver was introduced, the only way to ensure
> >> that power domains will be instantiated before the devices which belongs
> >> to them was to initialize them early enough, before the devices are
> >> instantiated in the system. This in turn required not to use any platform
> >> device infrastructure at all, as there have been no way to ensure proper
> >> probe order between devices.
> >>
> >> This has been finally changed and patch e590474768f1 ("driver core: Set
> >> fw_devlink=on by default") ensures that each device will be probbed only
> >> when its resource providers are ready. This allows to convert Exynos
> >> power domain driver to regular platform driver.
> >>
> >> This is also required by the mentioned commit to enable probing any
> >> device which belongs to the Exynos power domains, as otherwise the core
> >> won't notice that the power domains are in fact available.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >> Some more comments are in the following thread:
> >> https://protect2.fireeye.com/v1/url?k=8ac052ac-d55b6ba4-8ac1d9e3-0cc47a31c8b4-9068b559b0fd155d&q=1&e=b393c3ff-16ba-48a4-9d72-6805d02971d5&u=https%3A%2F%2Flore.kernel.org%2Flkml%2F2556a69b-5da5-bf80-e051-df2d02fbc40f%40samsung.com%2F
> >> ---
> >> ...
> > Skimmed through this patch and at a high level, it looks good for what
> > it's trying to do. Thanks for doing this!
> >
> > Btw, I assume that this won't work with fw_devlink=off/permissive
> > (default since 5.10 or earlier)? My concern is that we might
> > temporarily set fw_devlink=permissive by default if the other
> > breakages aren't fixed in time for 5.12? How do you want to handle that?
>
> I've applied my patch on top of vanilla v5.10 and checked on my test
> boards. Surprisingly everything works fine, so something must have been
> changed during the last few years as the power domain driver in the
> current form has been written long time ago. I remember that the moment
> when platform devices are created from the of nodes has been change at
> some point, so maybe this is somehow related. Anyway, the platform
> driver for Exynos power domains registered from core_initcall works fine
> with v5.10 kernel.
>
> I have no strong opinion on the way of merging this fix. It can go via
> Samsung tree, so in the end the v5.12-rc1 will have both my fix and your
> change, but won't be fully bisectable in-between. Krzysztof, what's your
> opinion?

If it doesn't break anything without my changes, then let's try to get
it merged independent of my series. This is a good change even without
my changes.

-Saravana
