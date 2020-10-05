Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8806FC4727F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 18:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2416C21481
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 18:54:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="OPEUVmyk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728944AbgJESya (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 14:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729221AbgJESy3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 14:54:29 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18E8C0613A8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 11:54:27 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id m12so9689952otr.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2020 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=riuDo1IoXfibXlfR95ykbMPthEQRl10/UIOttc6DAlc=;
        b=OPEUVmyk+vRCYMZLowcoJCe66KrXHU7rFzOGuwvpAWzjQt85t26GeiBNJSVlLLjdvw
         IPvkPM1oH6EvZKjVxvy+zdz/tX3xjNAE+ZPS2bki4mizwYxgbHlbrh2rQasAL+fFyYAY
         b+JjR1NWVmVC0VwtGmMDFoA2fjzgOz0Zifv98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=riuDo1IoXfibXlfR95ykbMPthEQRl10/UIOttc6DAlc=;
        b=UNjSh1vcm2HmZ2fmNOzvjYOijPSskU5Ub7iUwNFxRC2hg2N3WpDKBTLybeIM9bFlr/
         pcfPPKvM9+0kdRYTie/ATUJchuUKRFLtlwLAsa9wHthHBf5NnSfgWY1NyGWBa46UFIKL
         hz2iMFnMw3CiKYdfznIIRczgyWyxqYyMOiCJWYc1u+t34TIViVDLuBs9T6DXsa4gEsIr
         vgTTQ8k74Tl2Bp5L+DyzZHp3UzAlPy8+X3sH2YosyDW53eZtCttM4m2WwEbySiF/HBnl
         1rjeFJsLtQ6jzWjApe7MAMN7PoMcD+QHfH/sVEFe4iQaLvUMyuEaJiky9c4ZZu7qh+hX
         cGqw==
X-Gm-Message-State: AOAM532iBgg55mTBw/+7ZcJjdTaqn4WK0sI8PUMy0TIhcMyuQrBhM7zD
        K1DnpTq+5F3TvkjNBuijXgrYAAIcVisUNekRQsQXrw==
X-Google-Smtp-Source: ABdhPJy2iw+CknXeuJOFUrqB9oxUe8+tYDJ+itV1cU93c0kTfuWKEYCQyo751DNTn5DqrD42UQCpOE2tQNA/FTrVskw=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr493595otr.281.1601924066976;
 Mon, 05 Oct 2020 11:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca> <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca> <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca> <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca>
In-Reply-To: <20201005183704.GC5177@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 5 Oct 2020 20:54:15 +0200
Message-ID: <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
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

On Mon, Oct 5, 2020 at 8:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Oct 05, 2020 at 08:16:33PM +0200, Daniel Vetter wrote:
>
> > > kvm is some similar hack added for P2P DMA, see commit
> > > add6a0cd1c5ba51b201e1361b05a5df817083618. It might be protected by notifiers..
> >
> > Yeah my thinking is that kvm (and I think also vfio, also seems to
> > have mmu notifier nearby) are ok because of the mmu notiifer. Assuming
> > that one works correctly.
>
> vfio doesn't have a notifier, Alex was looking to add a vfio private
> scheme in the vma->private_data:
>
> https://lore.kernel.org/kvm/159017449210.18853.15037950701494323009.stgit@gimli.home/
>
> Guess it never happened.

I was mislead by the mmu notifier in drivers/vfio/vfio.c. But looking
closer, that's only used by some drivers, I guess to make sure their
device pagetables are kept in sync with reality. And not to make sure
the vfio pfn view is kept in sync with reality.

This could get real nasty I think.

> > > So, the answer really is that s390 and media need fixing, and this API
> > > should go away (or become kvm specific)
> >
> > I'm still not clear how you want fo fix this, since your vma->dma_buf
> > idea is kinda a decade long plan and so just not going to happen:
>
> Well, it doesn't mean we have to change every part of dma_buf to
> participate in this. Just the bits media cares about. Or maybe it is
> some higher level varient on top of dma_buf.
>
> Or don't use dma_buf for this, add a new object that just provides
> refcounts and P2P DMA connection for IO pfn ranges..

So good news is, I dug some layers deeper in v4l, and there's only 2
users which do actually handle pfn and don't immediately convert to a
pages array:
- videbuf-dma-contig.c. Luckily videobuf 1 is deprecated since
forever, so I think we might get away with either just breaking this,
or at least tainting kernels and hiding it behind a nasty Kconfig.
This only uses follow_pfn, which we need to keep anyway for vfio in
the unsafe variant :-/
- videbuf2-vmalloc.c Digging through history this was added to support
import of v4l buffers from drivers that needed contig memory. And way
back before CMA, that meant carveout memory not backed by struct page
*. That should now all have struct pages and be managed by CMA (since
videbuf2-dma-contig.c just uses dma_alloc_coherent underneath), so I
think we can just switch to pin_user_pages(FOLL_LONGTERM here too).

iow I think I can outright delete the frame vector stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
