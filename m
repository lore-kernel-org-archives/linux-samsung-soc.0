Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2165BC4363D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 12:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 739A32083B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 12:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PyaZ/nvZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgJGMB5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgJGMB4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 08:01:56 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4808BC0613D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 05:01:56 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id m11so1858368otk.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPNKg367DCdKIY1liYpuVsKddqsM3ARJiczmrER9Tlk=;
        b=PyaZ/nvZm2QUtaJTzV68PXra5E6nusMzfq2GtX+T4KHdWVm++EJydv/8XaGh5nYPu2
         kpLCfkP523at8+kzTLYGiJF/U5HARJ4ZwyhXlTfgO1W6ZvOLzle/fawTahYRmxpmawyG
         M2mKVfCZhp95638KHshmfZX9XnDxeTLsbzpOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPNKg367DCdKIY1liYpuVsKddqsM3ARJiczmrER9Tlk=;
        b=MUIiwz9DMH497HWfA+tGjuh17ZvOLXYV5bwD6s9mi4wVeigTD6PQWOfnbQDG7g2gZG
         RdxwGxc0JCQlno7k4NvHXy/+4EGHFLJpYeoMn3D8tFJmoppiZQpG4haB0NcVK169YKmY
         dmyUTfj0ueov48BdyoTTyfGii8U6UMNUw23LtGFn3hYZ5nMDL4xiCwINw2HyEEeAtTMB
         0h7mEjtRoGR/OXzMyMZn+mWhaw4P9RWhEk8JHUGNVF7nseJIddIV/oQHve6cuyHNGnoA
         7jJhLjYdEXsoryFdkdXg4ERctK7bvUVQV67X3ZZyllBKKXCcDn6KqIwXac10qGSIh0uX
         hMpA==
X-Gm-Message-State: AOAM532aj5ISlx/4TFOOOqC7kBIULXKvHR5G3HFRXIRCQIc/x0bf8ma/
        iYeCpRjNNPnpt863HYYmuh8SWSoxlFXKIwwU87fTug==
X-Google-Smtp-Source: ABdhPJwz1+Mjs5/TsMc3YtWSj3uN1hN+EFq4HjqQKny0ZO2DNmwXaAg21800jfJ4gXIzTu9U81dtoIfG8VEkup1Khs8=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id f28mr1747283ote.188.1602072115550;
 Wed, 07 Oct 2020 05:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca> <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com> <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
In-Reply-To: <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 14:01:44 +0200
Message-ID: <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
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
        Tomasz Figa <tfiga@chromium.org>,
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

On Wed, Oct 7, 2020 at 12:47 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Daniel,
>
> On 03.10.2020 11:40, Daniel Vetter wrote:
> >> After he three places above should use pin_user_pages_fast(), then
> >> this whole broken API should be moved into videobuf2-memops.c and a
> >> big fat "THIS DOESN'T WORK" stuck on it.
> >>
> >> videobuf2 should probably use P2P DMA buf for this instead.
> > Yup this should be done with dma_buf instead, and v4l has that.
>
> Yes, V4L2 has dma_buf support NOW. That days, using so called V4L2
> USERPTR method was the only way to achieve zero copy buffer sharing
> between devices, so this is just a historical baggage. I've been
> actively involved in implementing that. I've tried to make it secure as
> much as possible assuming the limitation of that approach. With a few
> assumptions it works fine. Buffers are refcounted both by the
> vm_ops->open or by incrementing the refcount of the vm->file. This
> basically works with any sane driver, which doesn't free the mmaped
> buffer until the file is released. This is true for V4L2 and FBdev devices.

I'm not seeing any of that vm->file refcounting going on, so not
seeing anything that prevents the mmap area from being removed. Can
you pls give me some pointers about which code you're thinking of?
-Daniel

> This API is considered as deprecated in V4L2 world, so I think
> supporting this hack can be removed one day as nowadays userspace should
> use dma buf.
>
>  > ...
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
