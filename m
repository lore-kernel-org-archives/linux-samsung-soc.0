Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5A6C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 13:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DBF620789
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 13:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IVfaH4Or"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgJGNLt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 09:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGNLt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 09:11:49 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3A1C061755
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 06:11:48 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id ce10so2867411ejc.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JtiTAC1lCqywnD4Z2Vg4zVbVRlofQtOWuMfZmgMPCws=;
        b=IVfaH4OrbWAN6uzg0UIk/strWAow/Q6FzTRKahgOrF9EF7kqJXUGjYDmctFaBHvyOo
         FYBn0VINGYPuQRP0p46AU6UBnVUkbrZOzWZ9Ys2I27aCChyOeG+vJ8llmAULxl7kC8wj
         mqztEpzuIt/NtFC/8GqwQM3qEJxAHpZi5HRdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JtiTAC1lCqywnD4Z2Vg4zVbVRlofQtOWuMfZmgMPCws=;
        b=BSy5yMUoDlwh+0sN02675rRzV/y/OH/R9wT9EDvBM0WFm/e2YU4gzHVxaj3jVQS39N
         liyCrN0C7WfTaKZMPQVP8bN3nCg8fs9gtjkbWyxg2/KpXsnV6WQesa/TbfTp0xOO1ud3
         DnCo80nCC3GRLEwvhhpOSE3bwkXc/xkf0AravW3cEY8dPGD53b2Gu19hjbokMucHBPBx
         Ifhrw8kUSQmVhDDfJ28ibaJJO3A7YIuAdyvaKlleQ7Zm58sleBC2dDgOiWoo06wXUrsg
         ga59WJPPvt8NReGtg38OH5p6EG5iZ3+XugH2gMZKPrziVFfDhdU80IGxqyr7VgS8mp7P
         Nbig==
X-Gm-Message-State: AOAM530mgG/ufQtlkPF7pMo/VjvyPaw9bqeC0Jr4ipH/YvvdLlWH1YrO
        NdkRVbfn8RJmZNtiRf4jT1JPATpXtT/UzA==
X-Google-Smtp-Source: ABdhPJxr5TMOud8lLrDYdkZ1FU7fWJUoQN8rJyezr1oMV0hZSy3RflsxTbBi5/FBTNx2UoTejjEW0w==
X-Received: by 2002:a17:907:429f:: with SMTP id ny23mr3222612ejb.150.1602076306934;
        Wed, 07 Oct 2020 06:11:46 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a27sm1529492ejb.67.2020.10.07.06.11.46
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 06:11:46 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id d4so2235489wmd.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 06:11:46 -0700 (PDT)
X-Received: by 2002:a1c:2d85:: with SMTP id t127mr3180500wmt.22.1602075989680;
 Wed, 07 Oct 2020 06:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com> <20201002233118.GM9916@ziepe.ca>
In-Reply-To: <20201002233118.GM9916@ziepe.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 7 Oct 2020 15:06:17 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DkzxeHmHvipMR2YgDVC1uZrvVWgyWWYdyEM=yCOM7HwQ@mail.gmail.com>
Message-ID: <CAAFQd5DkzxeHmHvipMR2YgDVC1uZrvVWgyWWYdyEM=yCOM7HwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
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
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Oct 3, 2020 at 1:31 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 02, 2020 at 08:16:48PM +0200, Daniel Vetter wrote:
> > On Fri, Oct 2, 2020 at 8:06 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Fri, Oct 02, 2020 at 07:53:03PM +0200, Daniel Vetter wrote:
> > > > For $reasons I've stumbled over this code and I'm not sure the chan=
ge
> > > > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > > > convert get_user_pages() --> pin_user_pages()") was entirely correc=
t.
> > > >
> > > > This here is used for long term buffers (not just quick I/O) like
> > > > RDMA, and John notes this in his patch. But I thought the rule for
> > > > these is that they need to add FOLL_LONGTERM, which John's patch
> > > > didn't do.
> > > >
> > > > There is already a dax specific check (added in b7f0554a56f2 ("mm:
> > > > fail get_vaddr_frames() for filesystem-dax mappings")), so this see=
ms
> > > > like the prudent thing to do.
> > > >
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > > > Cc: Jan Kara <jack@suse.cz>
> > > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > > Cc: linux-mm@kvack.org
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > Cc: linux-samsung-soc@vger.kernel.org
> > > > Cc: linux-media@vger.kernel.org
> > > > Hi all,
> > > >
> > > > I stumbled over this and figured typing this patch can't hurt. Real=
ly
> > > > just to maybe learn a few things about how gup/pup is supposed to b=
e
> > > > used (we have a bit of that in drivers/gpu), this here isn't really
> > > > ralated to anything I'm doing.
> > >
> > > FOLL_FORCE is a pretty big clue it should be FOLL_LONGTERM, IMHO
> >
> > Since you're here ... I've noticed that ib sets FOLL_FORCE when the ib
> > verb access mode indicates possible writes. I'm not really clear on
> > why FOLL_WRITE isn't enough any why you need to be able to write
> > through a vma that's write protected currently.
>
> Ah, FOLL_FORCE | FOLL_WRITE means *read* confusingly enough, and the
> only reason you'd want this version for read is if you are doing
> longterm stuff. I wrote about this recently:
>
> https://lore.kernel.org/linux-mm/20200928235739.GU9916@ziepe.ca/
>
> > > Since every driver does this wrong anything that uses this is creatin=
g
> > > terrifying security issues.
> > >
> > > IMHO this whole API should be deleted :(
> >
> > Yeah that part I just tried to conveniently ignore. I guess this dates
> > back to a time when ioremaps where at best fixed, and there wasn't
> > anything like a gpu driver dynamically managing vram around, resulting
> > in random entirely unrelated things possibly being mapped to that set
> > of pfns.
>
> No, it was always wrong. Prior to GPU like cases the lifetime of the
> PTE was tied to the vma and when the vma becomes free the driver can
> move the things in the PTEs to 'free'. Easy to trigger use-after-free
> issues and devices like RDMA have security contexts attached to these
> PTEs so it becomes a serious security bug to do something like this.
>
> > The underlying follow_pfn is also used in other places within
> > drivers/media, so this doesn't seem to be an accident, but actually
> > intentional.
>
> Looking closely, there are very few users, most *seem* pointless, but
> maybe there is a crazy reason?
>
> The sequence
>   get_vaddr_frames();
>   frame_vector_to_pages();
>   sg_alloc_table_from_pages();
>
> Should be written
>   pin_user_pages_fast(FOLL_LONGTERM);
>   sg_alloc_table_from_pages()
>
> There is some 'special' code in frame_vector_to_pages() that tries to
> get a struct page for things from a VM_IO or VM_PFNMAP...
>
> Oh snap, that is *completely* broken! If the first VMA is IO|PFNMAP
> then get_vaddr_frames() iterates over all VMAs in the range, of any
> kind and extracts the PTEs then blindly references them! This means it
> can be used to use after free normal RAM struct pages!! Gah!
>
> Wow. Okay. That has to go.
>
> So, I *think* we can assume there is no sane cases where
> frame_vector_to_pages() succeeds but pin_user_pages() wasn't called.
>
> That means the users here:
>  - habanalabs:  Hey Oded can you fix this up?
>
>  - gpu/exynos: Daniel can you get someone there to stop using it?
>
>  - media/videobuf via vb2_dma_sg_get_userptr()
>
> Should all be switched to the standard pin_user_pages sequence
> above.
>
> That leaves the only interesting places as vb2_dc_get_userptr() and
> vb2_vmalloc_get_userptr() which both completely fail to follow the
> REQUIRED behavior in the function's comment about checking PTEs. It
> just DMA maps them. Badly broken.

Note that vb2_vmalloc is only used for in-kernel CPU usage, e.g. the
contents being copied by the driver between vb2 buffers and some
hardware FIFO or other dedicated buffers. The memory does not go to
any hardware DMA.

Could you elaborate on what "the REQUIRED behavior is"? I can see that
both follow the get_vaddr_frames() -> frame_vector_to_pages() flow, as
you mentioned. Perhaps the only change needed is switching to
pin_user_pages after all?

>
> Guessing this hackery is for some embedded P2P DMA transfer?
>

That's not the case. There are two usage scenarios:

1) Regular user pointer support, i.e. using malloc()ed memory as a
video input or output buffer. This is deemed to be deprecated, but
still used quite widely by various applications. Quite common for
video decoder input and video encoder output, because the other side
of the pipeline is CPU, e.g. network stack.

2) Sharing carveout buffers (without struct pages attached) between
two devices. I believe this predates DMA-buf and CMA (which enabled
carveouts with struct pages) and I'm not sure how commonly it is used
these days.

> After he three places above should use pin_user_pages_fast(), then
> this whole broken API should be moved into videobuf2-memops.c and a
> big fat "THIS DOESN'T WORK" stuck on it.
>
> videobuf2 should probably use P2P DMA buf for this instead.

See above.

Best regards,
Tomasz
