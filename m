Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EB4C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Jan 2021 15:16:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE7BB23884
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Jan 2021 15:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732152AbhAOPQH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:16:07 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:38207 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730136AbhAOPQF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 10:16:05 -0500
Received: by mail-wm1-f43.google.com with SMTP id y187so7917960wmd.3;
        Fri, 15 Jan 2021 07:15:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=euDAszylF/ga+ziDscAVs0cSlmh+mJLUqDd+OrH+iq4=;
        b=iti7b1AtIxmQLGyges4XcHNyfGe6jCSyW4ku4yqYezqJO/tpZ0wD09RzV0cUSwchxJ
         AYrEFpV/MfZjqhcZnqrlQnCmVig6R+M+tfRXOB0AC6SD0Z5SAybtyualgdw/cWPCOX1g
         f68HYmRaS4hXuypXC+T+vKKV4/R9nHNP2LUltPcmBtFf7NwZ20UptoIZ/sZKdTkzagDO
         +jIuUgMMYwMbm+OpSle0Ag1a87f/y94j+hRDL8JHNCcfPkfbId0L6XxFwKajpqyTwjBE
         zepQpKiM6OJV7ysICSwg1mxTCb6W2IYxk55zTVFN0Ms/FIoQ6gcK8UssmR7UCZm4RStD
         XgpA==
X-Gm-Message-State: AOAM533zr7oARGwnBp7TcxxK5svTKkk7S74Ac71hN65xZ1iuxQv1A8K0
        Rn1u6vw3lcDukkr5kcvTC0E=
X-Google-Smtp-Source: ABdhPJwqRU7rsnknKCUNz6a1Xv7V6y3ZTg7CJUZpCOk4twBGjvRFV4/51R4z7epuQoNSw1eZq+cm0g==
X-Received: by 2002:a7b:c18d:: with SMTP id y13mr1369845wmi.22.1610723723238;
        Fri, 15 Jan 2021 07:15:23 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id p15sm15309614wrt.15.2021.01.15.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:15:22 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:15:20 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] soc: samsung: pm_domains: Convert to regular platform
 driver
Message-ID: <20210115151520.GA43049@kozik-lap>
References: <CGME20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452@eucas1p1.samsung.com>
 <20210113110320.13149-1-m.szyprowski@samsung.com>
 <CAGETcx9wJVnBAe6mKxfi9DC9YFf6DLzAyxBC8DxhQUqpfTDR3A@mail.gmail.com>
 <58e1cfb2-cd35-badf-0238-7c62122e2d05@samsung.com>
 <CAGETcx_Q_FvdL7ghC9Z7p9RcoBRYHeyTB1PRYk==HMv+NzJBzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGETcx_Q_FvdL7ghC9Z7p9RcoBRYHeyTB1PRYk==HMv+NzJBzw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jan 14, 2021 at 11:07:30AM -0800, Saravana Kannan wrote:
> On Thu, Jan 14, 2021 at 11:03 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > Hi Saravana,
> >
> > On 13.01.2021 21:27, Saravana Kannan wrote:
> > > On Wed, Jan 13, 2021 at 3:03 AM Marek Szyprowski
> > > <m.szyprowski@samsung.com> wrote:
> > >> When Exynos power domain driver was introduced, the only way to ensure
> > >> that power domains will be instantiated before the devices which belongs
> > >> to them was to initialize them early enough, before the devices are
> > >> instantiated in the system. This in turn required not to use any platform
> > >> device infrastructure at all, as there have been no way to ensure proper
> > >> probe order between devices.
> > >>
> > >> This has been finally changed and patch e590474768f1 ("driver core: Set
> > >> fw_devlink=on by default") ensures that each device will be probbed only
> > >> when its resource providers are ready. This allows to convert Exynos
> > >> power domain driver to regular platform driver.
> > >>
> > >> This is also required by the mentioned commit to enable probing any
> > >> device which belongs to the Exynos power domains, as otherwise the core
> > >> won't notice that the power domains are in fact available.
> > >>
> > >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > >> ---
> > >> Some more comments are in the following thread:
> > >> https://protect2.fireeye.com/v1/url?k=8ac052ac-d55b6ba4-8ac1d9e3-0cc47a31c8b4-9068b559b0fd155d&q=1&e=b393c3ff-16ba-48a4-9d72-6805d02971d5&u=https%3A%2F%2Flore.kernel.org%2Flkml%2F2556a69b-5da5-bf80-e051-df2d02fbc40f%40samsung.com%2F
> > >> ---
> > >> ...
> > > Skimmed through this patch and at a high level, it looks good for what
> > > it's trying to do. Thanks for doing this!
> > >
> > > Btw, I assume that this won't work with fw_devlink=off/permissive
> > > (default since 5.10 or earlier)? My concern is that we might
> > > temporarily set fw_devlink=permissive by default if the other
> > > breakages aren't fixed in time for 5.12? How do you want to handle that?
> >
> > I've applied my patch on top of vanilla v5.10 and checked on my test
> > boards. Surprisingly everything works fine, so something must have been
> > changed during the last few years as the power domain driver in the
> > current form has been written long time ago. I remember that the moment
> > when platform devices are created from the of nodes has been change at
> > some point, so maybe this is somehow related. Anyway, the platform
> > driver for Exynos power domains registered from core_initcall works fine
> > with v5.10 kernel.
> >
> > I have no strong opinion on the way of merging this fix. It can go via
> > Samsung tree, so in the end the v5.12-rc1 will have both my fix and your
> > change, but won't be fully bisectable in-between. Krzysztof, what's your
> > opinion?
> 
> If it doesn't break anything without my changes, then let's try to get
> it merged independent of my series. This is a good change even without
> my changes.

I agree, I'll take it via Samsung SoC. It's not the perfect solution -
as Marek said, the tree won't be bisectable. Have in mind that some
other boards/architectures might be broken where no one reported it yet,
so fw_devlink=off/permissive might still be good choice for v5.12.

Best regards,
Krzysztof

