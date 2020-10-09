Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B82C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 17:52:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79A80222E8
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 17:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="L4kTmlRV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389944AbgJIRwT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 13:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389334AbgJIRwS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 13:52:18 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523E3C0613D6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 10:52:17 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id l4so9750457ota.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Chc8637Rd8yI9tLS7AREeItMweAw4M0AE06Zuj7bhU0=;
        b=L4kTmlRVcZoe/avVgvgJLaWOs03iPF87kjF+Wg5Dr1BO68grQeWij+sKeGLbjkKVnS
         uWxXV8aahQlRlzimSn7k7/L57rwPuRVe9l/HoPbmKuzL42kNzmiAubvKP93NNRPozIcb
         M7wzXGB/zvSu+un9zoWu7yVJIqeg+g4rBMVIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Chc8637Rd8yI9tLS7AREeItMweAw4M0AE06Zuj7bhU0=;
        b=HFWmz36NcQIdhFxCRDMxxfdWka8NvEpVTq07urSJ6h/Boc/81NIlmgGXLfzITVOyo0
         kyXniVD3gNr38rUlXxUc1ylh6ssulmf845V/XumOhfbEDBX0S1LRvIDeN0s5zPL+HpKU
         zdN/fP8GsV3AjkuJAaSeuGdcx2QXH2n9Hj0dTLKV/058jazkPJ4CEBYPr67gPJAlSLFo
         l/NJINrzbwMMbkb89ioS46ps0dLT7V9uftLp96q9rPHum9YBaVm27UcPGu22Z7/DFzXr
         ThMD6DmWI2Nc2RAaQDC+CbmJjfK+etlA5xKEoV3xloBjcfyUXhAwemkebAr58pFvlWW9
         f1eQ==
X-Gm-Message-State: AOAM532j0JAg1riqoeqqBCwlTwkkGg9MWNpa0MU80lsReOpq95ZAATwK
        cVeGNWojo6mD3EMaShmj3J81S4IVlFIu3t6HdmqLIQ==
X-Google-Smtp-Source: ABdhPJxFnmBLRj+lrjXy7n2SbqbKqfPXOoR4PVOcPvoZoMGu71c5Uydzax6ZExKmO8/pv5qIPQDGfl3spZzjZBbiaDw=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr10168614otr.281.1602265936612;
 Fri, 09 Oct 2020 10:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch> <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan> <20201009124850.GP5177@ziepe.ca>
In-Reply-To: <20201009124850.GP5177@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 9 Oct 2020 19:52:05 +0200
Message-ID: <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 9, 2020 at 2:48 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:
>
> > I'm not a mm/ expert, but, from what I understood from Daniel's patch
> > description is that this is unsafe *only if*  __GFP_MOVABLE is used.
>
> No, it is unconditionally unsafe. The CMA movable mappings are
> specific VMAs that will have bad issues here, but there are other
> types too.
>
> The only way to do something at a VMA level is to have a list of OK
> VMAs, eg because they were creatd via a special mmap helper from the
> media subsystem.
>
> > Well, no drivers inside the media subsystem uses such flag, although
> > they may rely on some infrastructure that could be using it behind
> > the bars.
>
> It doesn't matter, nothing prevents the user from calling media APIs
> on mmaps it gets from other subsystems.

I think a good first step would be to disable userptr of non struct
page backed storage going forward for any new hw support. Even on
existing drivers. dma-buf sharing has been around for long enough now
that this shouldn't be a problem. Unfortunately right now this doesn't
seem to exist, so the entire problem keeps getting perpetuated.

> > If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> > flag that it would be denying the core mm code to set __GFP_MOVABLE.
>
> We can't tell from the VMA these kinds of details..
>
> It has to go the other direction, evey mmap that might be used as a
> userptr here has to be found and the VMA specially created to allow
> its use. At least that is a kernel only change, but will need people
> with the HW to do this work.

I think the only reasonable way to keep this working is:
- add a struct dma_buf *vma_tryget_dma_buf(struct vm_area_struct *vma);
- add dma-buf export support to fbdev and v4l
- roll this out everywhere we still need it.

Realistically this just isn't going to happen. And anything else just
reimplements half of dma-buf, which is kinda pointless (you need
minimally refcounting and some way to get at a promise of a permanent
sg list for dma. Plus probably the vmap for kernel cpu access.

> > Please let address the issue on this way, instead of broken an
> > userspace API that it is there since 1991.
>
> It has happened before :( It took 4 years for RDMA to undo the uAPI
> breakage caused by a security fix for something that was a 15 years
> old bug.

Yeah we have a bunch of these on the drm side too. Some of them are
really just "you have to upgrade userspace", and there's no real fix
for the security nightmare without that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
