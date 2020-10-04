Return-Path: <SRS0=DmnW=DL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953C7C4363C
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Oct 2020 12:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F67120759
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Oct 2020 12:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="W9fKhhT9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgJDMvC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Oct 2020 08:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgJDMvC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Oct 2020 08:51:02 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A57C0613CE
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Oct 2020 05:51:02 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id db4so4310401qvb.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Oct 2020 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UGbXQ0m+bhJCTErRPquTM6BteOTMiFqzd2EWO2s4mFY=;
        b=W9fKhhT9gZPcLblKAmPnfnimQd8ftf00/a+144bKPFTEsVyurYJ7UddnCfhpXYHyp7
         W6zQWz2EGYx9I5z3YLpofo7PF0pbpROUQF+LTjn9ADPVpuQdRTPWTQ/f8WO4ZsOQSrXT
         KABDUKUgPFWiqJXqRLAKwbuysocQ7zyJzNbPGVnGZAdQTjXQHGXgDuACQlMKrRM3JqQB
         zKGtw4NJG10hTUnjpBpn/YOm2rbi2HVPtHishpuDuBxjziPpR1p/4ifk4VbMan1Z6ZZr
         K8NmhM1NL7g46JQIPx7kmCQzRw0OkwO9xlDTAULE1eLpvxp5rFfeR+MYjcEU39Ue7bCd
         d1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UGbXQ0m+bhJCTErRPquTM6BteOTMiFqzd2EWO2s4mFY=;
        b=bi68AA2xRG3NkHSGcVReUcjTcTKeVtndoKBa/SLBFCsm/oApwwi7TrhhNFryMStbxJ
         cgJ6mkvaOuFRGHwoFbyI1fwFwXB8r61zWIL7Qny77nm5RWrHV4NCb/NhNf38myUb/LOU
         bZv4kZbuC0gROb6LM67LBTKfUWKwlXe2szqspX9fhMLp2g0XOlJj83YUmyRoIn2fChss
         dL5rBPzBLqRQ4t5zXfOZrwgET4GhG+uz4q3ELPFHFZEMBeklxmOB4MIEJ0oeKORZnc+b
         OWQ1Ed5qOM1c61+dlJnJ9URYAkf/6d6EFo/tw+bdiEenwSfQLz/JpOswjzhr1rYjeXoA
         RTag==
X-Gm-Message-State: AOAM531VuesPUY/WQiyVtKo51Vouixk1LMCo8gC032MZfmRxlhp3Atfx
        g4bi2v7c1oksM9eVUMM3Jklmdg==
X-Google-Smtp-Source: ABdhPJy8Yfds4NEUHCufWQMM3OiOFZaJGgKnGPYb9qLMVbqTTnA5dMcD8m9CgoMS4BHgfwkh5pPdXA==
X-Received: by 2002:ad4:4af4:: with SMTP id cp20mr10200433qvb.40.1601815861241;
        Sun, 04 Oct 2020 05:51:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id n11sm5205534qkk.105.2020.10.04.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 05:51:00 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kP3Tf-007HEC-QI; Sun, 04 Oct 2020 09:50:59 -0300
Date:   Sun, 4 Oct 2020 09:50:59 -0300
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
Message-ID: <20201004125059.GP9916@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Oct 03, 2020 at 11:40:22AM +0200, Daniel Vetter wrote:

> > That leaves the only interesting places as vb2_dc_get_userptr() and
> > vb2_vmalloc_get_userptr() which both completely fail to follow the
> > REQUIRED behavior in the function's comment about checking PTEs. It
> > just DMA maps them. Badly broken.
> >
> > Guessing this hackery is for some embedded P2P DMA transfer?
> 
> Yeah, see also the follow_pfn trickery in
> videobuf_dma_contig_user_get(), I think this is fully intentional and
> userspace abi we can't break :-/

We don't need to break uABI, it just needs to work properly in the
kernel:

  vma = find_vma_intersection()
  dma_buf = dma_buf_get_from_vma(vma)
  sg = dma_buf_p2p_dma_map(dma_buf)
  [.. do dma ..]
  dma_buf_unmap(sg)
  dma_buf_put(dma_buf)

It is as we discussed before, dma buf needs to be discoverable from a
VMA, at least for users doing this kind of stuff.

> Yup this should be done with dma_buf instead, and v4l has that. But
> old uapi and all that. This is why I said we might need a new
> VM_DYNAMIC_PFNMAP or so, to make follow_pfn not resolve this in the
> case where the driver manages the underlying iomem range (or whatever
> it is) dynamically and moves buffer objects around, like drm drivers
> do. But I looked, and we've run out of vma->vm_flags :-(

A VM flag doesn't help - we need to introduce some kind of lifetime,
and that has to be derived from the VMA. It needs data not just a flag

> The other problem is that I also have no real working clue about all
> the VM_* flags and what they all mean, and whether drm drivers set the
> right ones in all cases (they probably don't, but oh well).
> Documentation for this stuff in headers is a bit thin at times.

Yah, I don't really know either :\

The comment above vm_normal_page() is a bit helpful. Don't know what
VM_IO/VM_PFNMAP mean in their 3 combinations

There are very few places that set VM_PFNMAP without VM_IO..

Jason
