Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCA7C55179
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 15:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E56F12242A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 15:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PitcG0uA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731313AbgKDPyd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 10:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731111AbgKDPyb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 10:54:31 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D00C0613D4
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2020 07:54:31 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id g19so10281211otp.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2020 07:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y5iSM0n3L7+OTVROVCVTwu3uWAzU5mN6qUkDTEIh4do=;
        b=PitcG0uAHrmeOMZWf07+5nFovh7kr7Adgn3pV0IjFTvWK31RX96qNAX9Ks5Dh/x/M1
         BTJhllHwgJtYkqu+DoGQVr+zvfuKEAes8E2EKiqu7lnWd/wgVh9ipY9g1P/exu8Ll0XH
         MlM5Nev4kEpw3fiAkWDQeeOa/AbBbn0nfEjrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y5iSM0n3L7+OTVROVCVTwu3uWAzU5mN6qUkDTEIh4do=;
        b=SPVyBgmIx7C8YhYZL2oonMQNMW8D2YM4KrU0yCO3kZXYcmVc9NaFbQBMo38BbutUEj
         mU8Y21JTXAPgyF9a7urxj015HbNf83dzKGPVK7Kh2zXAb3NOVDdesO4FxCnTM57W+1qD
         v7VaCNCvYoWAbSEz1rrONQNH2hZABivSb8SUQzC8gihPxIX7lNL3oB2T3zm2h1/477VG
         jwKzlythe9uXBLdR5vd42xfz+G3wD3WyrdkaEVALy7pjQzIZWCyMrNiStWq7u/SPj+ud
         iGaBuL6Tp/2fp1FCHQxiX3pMF86HHjFHP6U+cy0UjCuD5fowM3ckJGN+3gDkfm9GN+sI
         Labw==
X-Gm-Message-State: AOAM530MOk5H8ZK2VoUVcg0CW/fb7MZR9HzCLzRI9q1Jh3jJoUoO9rH1
        mZcGQLN+60vBLsgyvzMXfJ3YPBDP51x4O3KKaa8kiA==
X-Google-Smtp-Source: ABdhPJwFTZ6h8d4LZSz0ZdASZtc67ts9b22F6yGqx4swNCRA+uz1tGrz0fV1z6m2B8vN3lXuyoPJEYkFgolkB9M18jE=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr18846565otf.188.1604505270511;
 Wed, 04 Nov 2020 07:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch> <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com> <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com> <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
 <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com> <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
In-Reply-To: <20201104140023.GQ36674@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 4 Nov 2020 16:54:19 +0100
Message-ID: <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
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

On Wed, Nov 4, 2020 at 3:00 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Sun, Nov 01, 2020 at 11:50:39PM +0100, Daniel Vetter wrote:
>
> > It's not device drivers, but everyone else. At least my understanding
> > is that VM_IO | VM_PFNMAP means "even if it happens to be backed by a
> > struct page, do not treat it like normal memory". And gup/pup_fast
> > happily break that. I tried to chase the history of that test, didn't
> > turn up anything I understood much:
>
> VM_IO isn't suppose do thave struct pages, so how can gup_fast return
> them?
>
> I thought some magic in the PTE flags excluded this?

I don't really have a box here, but dma_mmap_attrs() and friends to
mmap dma_alloc_coherent memory is set up as VM_IO | VM_PFNMAP (it's
actually enforced since underneath it uses remap_pfn_range), and
usually (except if it's pre-cma carveout) that's just normal struct
page backed memory. Sometimes from a cma region (so will be caught by
the cma page check), but if you have an iommu to make it
device-contiguous, that's not needed.

I think only some architectures have a special io pte flag, and those
are only used for real mmio access. And I think the popular ones all
don't. But that stuff is really not my expertise, just some drive-by
reading I've done to understand how the pci mmap stuff works (which is
special in yet other ways I think).

So probably I'm missing something, but I'm not seeing anything that
prevents this from coming out of a  pup/gup_fast.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
