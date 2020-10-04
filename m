Return-Path: <SRS0=DmnW=DL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54CBC4363C
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Oct 2020 16:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 410BE2067D
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Oct 2020 16:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="RjQVWoci"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgJDQJm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Oct 2020 12:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgJDQJl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Oct 2020 12:09:41 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817C7C0613D0
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Oct 2020 09:09:41 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id x62so1919475oix.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Oct 2020 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GOTUKnVU3itRBVmgEpNxeJsDdURcvTFw9TlNBbu70B8=;
        b=RjQVWociZc18kuI7qAnBTKARmkT/mLLw8LxYZfs47cFvcduVoCEYDEszZHSm3DILp3
         12erHUrCIHd+qofrGC6EBSBsPlSnIsKESM1BNtr+gPSKiX1KznnyLcFV2UQYtqQgcIm/
         r78PvYntGqD3isT9Sfhut4qKDFJ3FJ5bs6M4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GOTUKnVU3itRBVmgEpNxeJsDdURcvTFw9TlNBbu70B8=;
        b=DBW0GipuLRxKcCrXZDbc9A9YCy+1dll/m+5sLcUGZykbAMf5ud4zeMEB6m3EZyMh6P
         uSq53201cW5lyYbnwHaEFXm/v2/xCQTH/q+kXkhOdiKf2Y3HqPPOFpOukQdzSyCvy72l
         SZcHwuCLYXe0fi1vFmZUALU7wPyVsPoNCyY9jIemUdFJ8M5oXTWzH18vT2P1a6iVCFuJ
         PwqjJkAoIeoFtDf7RKfhyhBncY2ENc6PS0ZdscN6DTDyNq3mVpR7CN/K8eRa8P83ALoX
         AJn+fiN5MqHPyGlNS4ic8MGI5W4oR+LoFVnYGz8UdIvi0RuMRpjemTPw0sF6Hn+Q+UYo
         F/Dg==
X-Gm-Message-State: AOAM532Kxxg/UGUQJcZCS0M5Xq5RLJOzVnaarEB9bZpf9O3z4qXK8fah
        EJ4+TcLVe3DXzYTFlJq+fig4ToAEtWgopQYxCzMM0Q==
X-Google-Smtp-Source: ABdhPJzdfqkWkuYL7n4fDIIpl1SUMymwaZrdS/bll2UpQKzwL/q1RfjS5bz/mQjsvb0ZsYrSTWSr4/UovkHzDZkrMWw=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr6372776oie.128.1601827780607;
 Sun, 04 Oct 2020 09:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca> <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
In-Reply-To: <20201004125059.GP9916@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sun, 4 Oct 2020 18:09:29 +0200
Message-ID: <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
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
        Marek Szyprowski <m.szyprowski@samsung.com>,
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

On Sun, Oct 4, 2020 at 2:51 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Sat, Oct 03, 2020 at 11:40:22AM +0200, Daniel Vetter wrote:
>
> > > That leaves the only interesting places as vb2_dc_get_userptr() and
> > > vb2_vmalloc_get_userptr() which both completely fail to follow the
> > > REQUIRED behavior in the function's comment about checking PTEs. It
> > > just DMA maps them. Badly broken.
> > >
> > > Guessing this hackery is for some embedded P2P DMA transfer?
> >
> > Yeah, see also the follow_pfn trickery in
> > videobuf_dma_contig_user_get(), I think this is fully intentional and
> > userspace abi we can't break :-/
>
> We don't need to break uABI, it just needs to work properly in the
> kernel:
>
>   vma = find_vma_intersection()
>   dma_buf = dma_buf_get_from_vma(vma)
>   sg = dma_buf_p2p_dma_map(dma_buf)
>   [.. do dma ..]
>   dma_buf_unmap(sg)
>   dma_buf_put(dma_buf)
>
> It is as we discussed before, dma buf needs to be discoverable from a
> VMA, at least for users doing this kind of stuff.

I'm not a big fan of magic behaviour like this, there's more to
dma-buf buffer sharing than just "how do I get at the backing
storage". Thus far we've done everything rather explicitly. Plus with
exynos and habanalabs converted there's only v4l left over, and that
has a proper dma-buf import path already.

> > Yup this should be done with dma_buf instead, and v4l has that. But
> > old uapi and all that. This is why I said we might need a new
> > VM_DYNAMIC_PFNMAP or so, to make follow_pfn not resolve this in the
> > case where the driver manages the underlying iomem range (or whatever
> > it is) dynamically and moves buffer objects around, like drm drivers
> > do. But I looked, and we've run out of vma->vm_flags :-(
>
> A VM flag doesn't help - we need to introduce some kind of lifetime,
> and that has to be derived from the VMA. It needs data not just a flag

I don't want to make it work, I just want to make it fail. Rough idea
I have in mind is to add a follow_pfn_longterm, for all callers which
aren't either synchronized through mmap_sem or an mmu_notifier. If
this really breaks anyone's use-case we can add a tainting kernel
option which re-enables this (we've done something similar for
phys_addr_t based buffer sharing in fbdev, entirely unfixable since
the other driver has to just blindly trust that what userspace passes
around is legit). This here isn't unfixable, but if v4l people want to
keep it without a big "security hole here" sticker, they should do the
work, not me :-)

> > The other problem is that I also have no real working clue about all
> > the VM_* flags and what they all mean, and whether drm drivers set the
> > right ones in all cases (they probably don't, but oh well).
> > Documentation for this stuff in headers is a bit thin at times.
>
> Yah, I don't really know either :\
>
> The comment above vm_normal_page() is a bit helpful. Don't know what
> VM_IO/VM_PFNMAP mean in their 3 combinations
>
> There are very few places that set VM_PFNMAP without VM_IO..

Best I could find is:
- mk68 seems to outright reject pagefaults on VM_IO vma
- some places set VM_IO together with VM_MIXEDMAP instead of
VM_PFNMAP. There's some comments that this makes cow possible, but I
guess that's for the old pfn remap vma (remap_file_pages, which is
removed now). But really no clue.

VM_IO | VM_MIXEDMAP kinda makes me wonder whether follow_pfn gets the
page refcounting all right or horribly wrong in some cases ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
