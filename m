Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B64CC41604
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 17:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2ED521924
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 17:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XywxnLHw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgJGRMh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727353AbgJGRMg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 13:12:36 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6529C0613D3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 10:12:36 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id t15so2967476otk.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ds2b6pt8mpuSnK1WqusZcK5IPcMpzyRXiJsNhW5qyYM=;
        b=XywxnLHwupjUJptE/EVD6sBBvmwp1LZdLWVQN7sGbbfMYl92hBOlZr7ZFS4X+E/amg
         opzvB15wo+wkKlQcyzXYRqNCcc6ZTwDvf0ncSkJzjaY9dJ7cef2oaD3bBKharNZqlUDk
         SK2SYwy12YuTYhWzjRrLHd7+bMmqCT/EcoV/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ds2b6pt8mpuSnK1WqusZcK5IPcMpzyRXiJsNhW5qyYM=;
        b=gTDgexqHs3rP6trHt6zsWujBPpDog82o32ON9W8c9jvERlZVb5NxZI+mHpGFqGEIi+
         bpdnVDqmoT9O8oyf9J3sglEmzouylBKBOEHMBlVNYvFxXRXEEVBUsX5sEpCBUUoHqc6V
         hP0okc3PLcQNNA+WVyhWVOGIhMLHEDqjDLtuxCsBjc5ikIX/5Dp1KnUW6O+L4KEWwcnB
         xuW+ral9TNLo/ElFo+magKE++F7xTWHZL81ms8584UwFJ4FPYC4F/iwhvHOH39+yI7pS
         fIh5W/jpIp7fRGzlYwPSwoH6HG38t0UehDPVVmGl3IRGfXlIp17YcEmh0To5t9EAcgkj
         RA0g==
X-Gm-Message-State: AOAM530bxrt609JqqTY7bujZLzpg7QslB47lsoqFJZww+TNn6EasbDNH
        qyDjqtiEXEHn2/YYK4a3kBqo+Brtc27B8JOprBZ/nw==
X-Google-Smtp-Source: ABdhPJzTO+z2ObbheXgto8t7rJhDCsKMuOtKVLpylgXo93WqdqDznkfE8ic3+XhZYxCrctCNbkyO32BPlJ+tqH+Wfoo=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id f28mr2639345ote.188.1602090755973;
 Wed, 07 Oct 2020 10:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-6-daniel.vetter@ffwll.ch> <20201007165316.GT5177@ziepe.ca>
In-Reply-To: <20201007165316.GT5177@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 19:12:24 +0200
Message-ID: <CAKMK7uGTpZcHwrBNQOXwzDAzyfSgoLSt_Dae_3hMRE2xwGx+GA@mail.gmail.com>
Subject: Re: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 7, 2020 at 6:53 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 07, 2020 at 06:44:18PM +0200, Daniel Vetter wrote:
> >
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
> > -             vec->got_ref = true;
> > -             vec->is_pfns = false;
> > -             ret = pin_user_pages_locked(start, nr_frames,
> > -                     gup_flags, (struct page **)(vec->ptrs), &locked);
> > -             goto out;
> > -     }
>
> The vm_flags still need to be checked before going into the while
> loop. If the break is taken then nothing would check vm_flags

Hm right that's a bin inconsistent. follow_pfn also checks for this,
so I think we can just ditch this entirely both here and in the do {}
while () check, simplifying the latter to just while (vma). Well, just
make it a real loop with less confusing control flow probably.

Or prefer I keep this and touch the code less?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
