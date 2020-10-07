Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75639C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 12:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1516A2080A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 12:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="HLP5cVy/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgJGM6u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGM6r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 08:58:47 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259FCC0613D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 05:58:45 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m11so2021172otk.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RqJhQ9wl4HnfFJba5qafgVA83HvKuODOv14/VuzQKBc=;
        b=HLP5cVy/+ivPAr8S6VW2DODWQvroNZFg7BttjeOcbezz6CNNniUIHSIARYKF8Ijk1T
         rmy9z7yE9flAapP4YSBu9HIymzY2iBki4HzaALq9rM2UBFkXQlEaW3TvVZzqH2LSayDe
         1rPcp7GgFX99YVk0vI8HYbxifKX0pBDMeSfv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RqJhQ9wl4HnfFJba5qafgVA83HvKuODOv14/VuzQKBc=;
        b=hvWhxaBEwCd06H2wT0ix/yKWqUlb42koMwh+K8JdB622AsBn+Xk+b59b6j8z4VsmLP
         1s/MtwGR96tNHA+beWE6B2ipSisQ7ni2hsAXcrkfwf3FS+VwkH+u6LiK5BvNvUAj4BYn
         YBFsSqLmEImKFTrmYoBebdXKgZQiaUEMnH/xAazowiBJUlLFwJ3BmsGx28GuzG5NB5SN
         V0Ytm9oyu5VX93q6NNGnanVp/nZXhh1i/wFLhYLJigf5SqfGYnV0UZbFks7XNx6msmgJ
         6CdWZgqCUaOK/LTW5E3Y1yDhOHWyq73VPHoMcZoIqVmbzYPk2jW5hUgMwpr1v1fOia8+
         Gzrg==
X-Gm-Message-State: AOAM531ssLkhQcD8Rk9OH3Dcw4c+YyAMiuT8qx2YFXV+BGuH/So5HV0H
        ufStOJwe7f8I01qjSFpIVwkRa9dlobQbPhfzolMGSg==
X-Google-Smtp-Source: ABdhPJwvOqDF0PtNvyjRy9NUPdpqckHeo5Pb4aBKzEFyLCyusu6A+MJ6CRQQIQu70npKdaR3NW8xVD0BDZv4+5HBzkA=
X-Received: by 2002:a05:6830:1e56:: with SMTP id e22mr1696603otj.303.1602075524433;
 Wed, 07 Oct 2020 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca> <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com> <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com> <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
In-Reply-To: <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 14:58:33 +0200
Message-ID: <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 7, 2020 at 2:48 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > > Well, it was in vb2_get_vma() function, but now I see that it has been
> > > lost in fb639eb39154 and 6690c8c78c74 some time ago...
> >
> > There is no guarentee that holding a get on the file says anthing
> > about the VMA. This needed to check that the file was some special
> > kind of file that promised the VMA layout and file lifetime are
> > connected.
> >
> > Also, cloning a VMA outside the mm world is just really bad. That
> > would screw up many assumptions the drivers make.
> >
> > If it is all obsolete I say we hide it behind a default n config
> > symbol and taint the kernel if anything uses it.
> >
> > Add a big comment above the follow_pfn to warn others away from this
> > code.
>
> Sadly it's just verbally declared as deprecated and not formally noted
> anyway. There are a lot of userspace applications relying on user
> pointer support.

userptr can stay, it's the userptr abuse for zerocpy buffer sharing
which doesn't work anymore. At least without major surgery (you'd need
an mmu notifier to zap mappings and recreate them, and that pretty
much breaks the v4l model of preallocating all buffers to make sure we
never underflow the buffer queue). And static mappings are not coming
back I think, we'll go ever more into the direction of dynamic
mappings and moving stuff around as needed.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
