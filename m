Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BFBC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 18:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2092220853
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 18:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="J0+Lgox+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgJESQZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 14:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgJESQZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 14:16:25 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BEBC0613A9
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 11:16:24 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id o8so9550938otl.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2020 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2+egbzisCjaq6nT3TbPZNwblZFYsu8ELcSxPmHmJLs=;
        b=J0+Lgox+Zl9MR/XcCJjFK6iKg91x1iw1K/lYf26aRsAWa8kYykCWy7QLhvJYCZo/rI
         85l/kYnB3V0HE1AMuIcpmFW5+WsQgw3xUFa+j7WIrU1oW0leAypRqp05SrgmM9EUXOaD
         hCEkIII06FI//qIehI2esTVFpziKPwVbJXmP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2+egbzisCjaq6nT3TbPZNwblZFYsu8ELcSxPmHmJLs=;
        b=X8GJDwdUV8rx7M8+wt1QUkcSqfCx8TqeE5kxJbrK7GOuaoR/GGxgo0hLlPm2gZ7zNr
         42kSnKldrNPX808CFUYZLa6B7R3zEqSnlfocBK/Lp/KdEOCNJ79Fm4DRbevatTM96qNr
         pSP1ES0In6ZCvA07YE34kmVVMJalZBivIfrV892NKUEtHRGLvFTy9MAEbJ099bFDIJh3
         z9B6fHbYojcsaus5Y0KwXA7103aMdd0eKAdPd9faKHHrzV4gm2p//AtfhfFyfE7XVG6f
         uGBaQtt4D6Z4uurAGliYpcMrBDcF6SEQnEseYMf78ezcuvkOVCWAXxuJo3xnmjHCnUCC
         xJ3g==
X-Gm-Message-State: AOAM532Ffkep9OAFuyDPD9CDP/vEZ/Gy3whENSFK3FGprzqyEOVi54Cm
        w6yVEIS2ZfNT8Yp2qtK2j9PqazyTxXY85IHGR7qb0Q==
X-Google-Smtp-Source: ABdhPJw1WdHFszqHjMyHkkFFS0NFpEwjo9cLd/GAkbhzhWZSM2RoYOtYwo36XdXuPtVVYQY/y+MJINm3GzBdV6PWwoE=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr392769otr.281.1601921784105;
 Mon, 05 Oct 2020 11:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
 <20201005175308.GI4225@quack2.suse.cz> <20201005175746.GA4734@nvidia.com>
In-Reply-To: <20201005175746.GA4734@nvidia.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 5 Oct 2020 20:16:12 +0200
Message-ID: <CAKMK7uHom6FGgsarnYRaW25Ta4cfrap+GMKgz27Y7bRYFUnmUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Jan Kara <jack@suse.cz>, andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Mel Gorman <mgorman@suse.de>, stable <stable@vger.kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 5, 2020 at 7:58 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Oct 05, 2020 at 07:53:08PM +0200, Jan Kara wrote:
> > On Mon 05-10-20 14:38:54, Jason Gunthorpe wrote:
> > > When get_vaddr_frames() does its hacky follow_pfn() loop it should never
> > > be allowed to extract a struct page from a normal VMA. This could allow a
> > > serious use-after-free problem on any kernel memory.
> > >
> > > Restrict this to only work on VMA's with one of VM_IO | VM_PFNMAP
> > > set. This limits the use-after-free problem to only IO memory, which while
> > > still serious, is an improvement.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > >  mm/frame_vector.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > > index 10f82d5643b6de..26cb20544b6c37 100644
> > > +++ b/mm/frame_vector.c
> > > @@ -99,6 +99,10 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> > >             if (ret >= nr_frames || start < vma->vm_end)
> > >                     break;
> > >             vma = find_vma_intersection(mm, start, start + 1);
> > > +           if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > > +                   ret = -EINVAL;
> > > +                   goto out;
> > > +           }
> > >     } while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> >
> > Hum, I fail to see how this helps. If vma has no VM_IO or VM_PFNMAP flag,
> > we'd exit the loop (to out: label) anyway due to the loop termination
> > condition and why not return the frames we already have? Furthermore
> > find_vma_intersection() can return NULL which would oops in your check
> > then. What am I missing?
>
> Oh, nothing, you are right. It just didn't read naturally because
> hitting the wrong kind of VMA should be an error condition :\

Afaik these mmio maps should all be VM_DONTEXPAND (or at least the
ones in drivers/gpu are all), so not sure why we need the loop here.
But maybe there's some drivers that don't set that, or have other
funny things going on with userspace piecing the mmap together, and
I'm not going to audit them all :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
