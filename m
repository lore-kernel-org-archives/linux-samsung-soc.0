Return-Path: <SRS0=6p2y=DJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE57C35257
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 23:31:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A206920796
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 23:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oxHLH0ae"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgJBXbV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 2 Oct 2020 19:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgJBXbV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 19:31:21 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFB7C0613E2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2020 16:31:20 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id 19so3892198qtp.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2020 16:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4xcf1grYkzZ40GImhx9ArjPi8z+FDDNH4w+3GYnxAtI=;
        b=oxHLH0aecKU6ZSFsu+X6/4TNPdu3StE5pXI9qUV9DxRCuE184dpQ0MXwZ2wsQgyi3A
         BeHgomu0MRxtT5tovamRjwv1gaXqsOWdiwq6Dr2SNj7+SnXMMFYW59kRSG36fAnlptpk
         O1kfWov3RjPY+68hJ8aXdbVaGLlcaS5XsFm5ZfF28+QrLZeec1Fw6RuQckr7wHViAeEX
         v0TDZuYP0EStRRFiUDRssnUNiOyS+C3zOJ5pOM1FpDYuQaVip0Yr8WBhbFusi6cTAy9T
         cMp8FvYTN8uds+SM3jPEA3efMzFvwUaz0cYsP1idFX0xfhGK5JJw8mPvicmyBimhGr/a
         PEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4xcf1grYkzZ40GImhx9ArjPi8z+FDDNH4w+3GYnxAtI=;
        b=N2wJsChQ00GjdQnSM3KzDuXhsR8iSQ+dX7XyFaspOSQ49S5jrE+dycUZNAQRF3CDsD
         GsIUhxbjdJw2okMeE+C9HUixp44rwiwuO87tz9HF+emtLiMrBe4A5KGrWeL5kgxufPtD
         SrvrnypDRYYBBXWVv7Clrn0eAwgafUK49b3ROVDF9uTozehDs/lDBTfF/+LMpwKz52fd
         fCTnjzIoWZv3Ck+h7LIt2RwrYMVQoKgpwWI5pcdDhCQ4wspfithp5NuqH7XDekHvo9xS
         JGvY31JyXEKkCmWZwaNcgcfzQAzPMfl5EmlApkRaf6MYpOWo4lgnekVmg+w+sF7jd+zd
         Bl8A==
X-Gm-Message-State: AOAM5327luVbeYHWR5lbTvLArf07pnssmlcL2sieci7U7HArdNC6j/eH
        fp6ajX9OoCw7nBCjAWgB3kgb7Q==
X-Google-Smtp-Source: ABdhPJwkYFALi12g4/iJsGmcUFAforjHcaKkRzvToN1BiZXvElpblbnhTQ5Y1FCPdg5berfLazc8AQ==
X-Received: by 2002:aed:2794:: with SMTP id a20mr4738490qtd.387.1601681479925;
        Fri, 02 Oct 2020 16:31:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id d12sm2127103qka.34.2020.10.02.16.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 16:31:19 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kOUWE-006Mau-Ig; Fri, 02 Oct 2020 20:31:18 -0300
Date:   Fri, 2 Oct 2020 20:31:18 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
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
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201002233118.GM9916@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 02, 2020 at 08:16:48PM +0200, Daniel Vetter wrote:
> On Fri, Oct 2, 2020 at 8:06 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Fri, Oct 02, 2020 at 07:53:03PM +0200, Daniel Vetter wrote:
> > > For $reasons I've stumbled over this code and I'm not sure the change
> > > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > > convert get_user_pages() --> pin_user_pages()") was entirely correct.
> > >
> > > This here is used for long term buffers (not just quick I/O) like
> > > RDMA, and John notes this in his patch. But I thought the rule for
> > > these is that they need to add FOLL_LONGTERM, which John's patch
> > > didn't do.
> > >
> > > There is already a dax specific check (added in b7f0554a56f2 ("mm:
> > > fail get_vaddr_frames() for filesystem-dax mappings")), so this seems
> > > like the prudent thing to do.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > Cc: Jérôme Glisse <jglisse@redhat.com>
> > > Cc: Jan Kara <jack@suse.cz>
> > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-samsung-soc@vger.kernel.org
> > > Cc: linux-media@vger.kernel.org
> > > Hi all,
> > >
> > > I stumbled over this and figured typing this patch can't hurt. Really
> > > just to maybe learn a few things about how gup/pup is supposed to be
> > > used (we have a bit of that in drivers/gpu), this here isn't really
> > > ralated to anything I'm doing.
> >
> > FOLL_FORCE is a pretty big clue it should be FOLL_LONGTERM, IMHO
> 
> Since you're here ... I've noticed that ib sets FOLL_FORCE when the ib
> verb access mode indicates possible writes. I'm not really clear on
> why FOLL_WRITE isn't enough any why you need to be able to write
> through a vma that's write protected currently.

Ah, FOLL_FORCE | FOLL_WRITE means *read* confusingly enough, and the
only reason you'd want this version for read is if you are doing
longterm stuff. I wrote about this recently:

https://lore.kernel.org/linux-mm/20200928235739.GU9916@ziepe.ca/

> > Since every driver does this wrong anything that uses this is creating
> > terrifying security issues.
> >
> > IMHO this whole API should be deleted :(
> 
> Yeah that part I just tried to conveniently ignore. I guess this dates
> back to a time when ioremaps where at best fixed, and there wasn't
> anything like a gpu driver dynamically managing vram around, resulting
> in random entirely unrelated things possibly being mapped to that set
> of pfns.

No, it was always wrong. Prior to GPU like cases the lifetime of the
PTE was tied to the vma and when the vma becomes free the driver can
move the things in the PTEs to 'free'. Easy to trigger use-after-free
issues and devices like RDMA have security contexts attached to these
PTEs so it becomes a serious security bug to do something like this.

> The underlying follow_pfn is also used in other places within
> drivers/media, so this doesn't seem to be an accident, but actually
> intentional.

Looking closely, there are very few users, most *seem* pointless, but
maybe there is a crazy reason?

The sequence 
  get_vaddr_frames(); 
  frame_vector_to_pages();
  sg_alloc_table_from_pages(); 

Should be written
  pin_user_pages_fast(FOLL_LONGTERM); 
  sg_alloc_table_from_pages()

There is some 'special' code in frame_vector_to_pages() that tries to
get a struct page for things from a VM_IO or VM_PFNMAP...

Oh snap, that is *completely* broken! If the first VMA is IO|PFNMAP
then get_vaddr_frames() iterates over all VMAs in the range, of any
kind and extracts the PTEs then blindly references them! This means it
can be used to use after free normal RAM struct pages!! Gah!

Wow. Okay. That has to go.

So, I *think* we can assume there is no sane cases where
frame_vector_to_pages() succeeds but pin_user_pages() wasn't called.

That means the users here:
 - habanalabs:  Hey Oded can you fix this up?

 - gpu/exynos: Daniel can you get someone there to stop using it?

 - media/videobuf via vb2_dma_sg_get_userptr()

Should all be switched to the standard pin_user_pages sequence
above.

That leaves the only interesting places as vb2_dc_get_userptr() and
vb2_vmalloc_get_userptr() which both completely fail to follow the
REQUIRED behavior in the function's comment about checking PTEs. It
just DMA maps them. Badly broken.

Guessing this hackery is for some embedded P2P DMA transfer?

After he three places above should use pin_user_pages_fast(), then
this whole broken API should be moved into videobuf2-memops.c and a
big fat "THIS DOESN'T WORK" stuck on it.

videobuf2 should probably use P2P DMA buf for this instead.

Jason
