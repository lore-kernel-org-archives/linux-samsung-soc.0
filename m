Return-Path: <SRS0=SlmQ=DX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4DFC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Oct 2020 08:03:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A51A3207F7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Oct 2020 08:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PYscHGEN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404999AbgJPIDy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Oct 2020 04:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404920AbgJPIDw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 04:03:52 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2ECC0613D4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Oct 2020 01:03:52 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id l85so1459634oih.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Oct 2020 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INEWr2CP3X204G2+3BdRku1fQyrBAx5gcE6UKT3OyOY=;
        b=PYscHGENn896fSGfivBibPnplvLtnL/b2OJMTMD4dpMHQHxNw+64iWRis9sD2nvJ3L
         GOV/hMMVbuuc/Dh9AKUrk63GN8LOY99ye984UM1brrmBjSpje4c9K1cdtapwwULr3uYK
         5a7sZUI60W2i8WwwI8UzzVDb5t1NNMYrEKGHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INEWr2CP3X204G2+3BdRku1fQyrBAx5gcE6UKT3OyOY=;
        b=R/BBhQhSn5M9rC0WforG/Wx1Bx9zqn8iqkhC/ovEl6r++egdHGyZeHuR3RqJf1I9nK
         H/76peO073VCZV8FfB+3L5O7W9sdyCfK+jjA+W/SU/76Z6zAtbDuHUAmjNYD4rIGUVWC
         PmOIqOqcznzW+C9dmgIB8jX+Q4jfDIhyJREYbagYk47V/ripOLu1Cm9ODkfcWyttAJkz
         tiVtkT9LuJGQtKZ52aphbvGzDCds7egZhPhulhugBcjxh1toGeaphFH3qAWNspfo0GHz
         hpnbidu6Tf7jfRo38NdpFvjTU+4rPJplzkC2RZUnJ7HU5gtgERbtdSOgiYWMZkzuZbHK
         JfdA==
X-Gm-Message-State: AOAM531ggT8N/xfHQVpDJ9xSyW/UDPM32faTV8w7tnmXfZDbz9/EWr1+
        pBP36tGOWRZyK2ReHW81UiJ1Ym88toKFFw7hoDFAoQ==
X-Google-Smtp-Source: ABdhPJyggtVpJqRzRZN6iIJJ0+C7Hddh3AOv25V3h7tJwuwrOe4WsT5egHelZJkzdhhjjawKTJeCGzwdsP8tFNIJ4dY=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr1679690oig.128.1602835431410;
 Fri, 16 Oct 2020 01:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-6-daniel.vetter@ffwll.ch> <4685181e-8306-0d96-8be6-592b3c563cbf@nvidia.com>
In-Reply-To: <4685181e-8306-0d96-8be6-592b3c563cbf@nvidia.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 16 Oct 2020 10:03:40 +0200
Message-ID: <CAKMK7uEoM3vM9X-R6dAHPAqdKryMtj2BOoBbJwJR9mCwNSpQ1g@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] mm/frame-vector: Use FOLL_LONGTERM
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 16, 2020 at 9:54 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 10/9/20 12:59 AM, Daniel Vetter wrote:
> ...
> > @@ -48,40 +47,25 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> >
> >       start = untagged_addr(start);
> >
> > -     mmap_read_lock(mm);
> > -     locked = 1;
> > -     vma = find_vma_intersection(mm, start, start + 1);
> > -     if (!vma) {
> > -             ret = -EFAULT;
> > -             goto out;
> > -     }
> > -
> > -     /*
> > -      * While get_vaddr_frames() could be used for transient (kernel
> > -      * controlled lifetime) pinning of memory pages all current
> > -      * users establish long term (userspace controlled lifetime)
> > -      * page pinning. Treat get_vaddr_frames() like
> > -      * get_user_pages_longterm() and disallow it for filesystem-dax
> > -      * mappings.
> > -      */
> > -     if (vma_is_fsdax(vma)) {
> > -             ret = -EOPNOTSUPP;
> > -             goto out;
> > -     }
> > -
> > -     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > +     ret = pin_user_pages_fast(start, nr_frames,
> > +                               FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> > +                               (struct page **)(vec->ptrs));
> > +     if (ret > 0) {
>
> None of the callers that we have today will accept anything less than
> ret == nr_frames. And the whole partially pinned region idea turns out
> to be just not useful for almost everyone, from what I recall of the gup/pup
> call sites. So I wonder if we should just have get_vaddr_frames do the
> cleanup here and return -EFAULT, if ret != nr_frames ?

Yeah I noticed that the calling convention here is a bit funny. But I
with these frame-vector helpers now being part of drivers/media it's
up to media folks if they want to clean that up, or leave it as is.

If this would be in drm I'd say we'll have the loud warning and
tainting due to CONFIG_STRICT_FOLLOW_PFN=n for 2-3 years. Then
assuming no big complaints showed up, rip it all out and just directly
call pup in each place that wants it (like I've done for habanalabs
and exynos).
-Daniel


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
