Return-Path: <SRS0=0bY/=EH=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA402C55178
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  1 Nov 2020 10:31:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A535920709
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  1 Nov 2020 10:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PXdr311j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgKAKbH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 1 Nov 2020 05:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgKAKbC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 1 Nov 2020 05:31:02 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A95C061A48
        for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Nov 2020 02:31:01 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id i18so5129459ots.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Nov 2020 02:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cMohUdqA3mHu1aHkJyF+q3c+LPomnH+bJbyOS5Pjj34=;
        b=PXdr311jw4o1TK1cA/6mrlvkDVtMBlyy1XYbMpIt3vJC7ClXj7DZJYo+vKllfO49H/
         YgcjzcGc1VpCnfRMFbloI4quCQ5ndPF+idmxEJoWrUJWkpgS76TUc1DHlMSxRDqofJvd
         l2sKUL2WW0wKA2NYOf2SZx1Y6sFEl/LXBFDeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cMohUdqA3mHu1aHkJyF+q3c+LPomnH+bJbyOS5Pjj34=;
        b=BobR1zD3GMgbcqMZrp9L0hl4t5AcbdR1UnMzbJMf/ZdURDVBy5ruKEYkIJbxt7/DoB
         pL5EGyeIRUOI77Yx0TVGfh2bn1b3oSusnMBwodUjnZLwvNrvbBlrrC3GTh62GrB0Lkzs
         jPMW0TS6G/BqfGjxbLiwp+uSV3tinW5SO4AmHknUeOiHtNezLrDIq0AL1w3zeF4daWCT
         1+Tvof6WFkO2Y7kU6ShzGSQgHr8ikvaE9KVtweLoOYKb6ZWNmE9uUr9re1+6JmdktZf3
         0z6Tl0sk8jePDtU8sZ6b9cpodPVlVtG8JIp9B7nRcnapSnWxOwlVqDuZPFuE+yVpGOG5
         G8sw==
X-Gm-Message-State: AOAM5325D94BfSgmTe0qYGhxyIpJDtkxSesZIB1ixCiKgEt7nYhBQJEl
        NwyXEpFix72M8TNJAutPXZZgxJ9MOtpuDNYEYZ89JA==
X-Google-Smtp-Source: ABdhPJxxfl/j7Y56O7SvvjDInbgd1Huz0SnDjNzTDNqX3oHxJ8qJKEvsr7nAV6GfCrUUP0r8bqY++IYBOL0aDpBKvjo=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr8739299otr.281.1604226660644;
 Sun, 01 Nov 2020 02:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch> <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com> <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
In-Reply-To: <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sun, 1 Nov 2020 11:30:49 +0100
Message-ID: <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
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

On Sun, Nov 1, 2020 at 6:22 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 10/31/20 7:45 AM, Daniel Vetter wrote:
> > On Sat, Oct 31, 2020 at 3:55 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >> On 10/30/20 3:08 AM, Daniel Vetter wrote:
> ...
> >> By removing this check from this location, and changing from
> >> pin_user_pages_locked() to pin_user_pages_fast(), I *think* we end up
> >> losing the check entirely. Is that intended? If so it could use a comment
> >> somewhere to explain why.
> >
> > Yeah this wasn't intentional. I think I needed to drop the _locked
> > version to prep for FOLL_LONGTERM, and figured _fast is always better.
> > But I didn't realize that _fast doesn't have the vma checks, gup.c got
> > me a bit confused.
>
> Actually, I thought that the change to _fast was a very nice touch, btw.
>
> >
> > I'll remedy this in all the patches where this applies (because a
> > VM_IO | VM_PFNMAP can point at struct page backed memory, and that
> > exact use-case is what we want to stop with the unsafe_follow_pfn work
> > since it wreaks things like cma or security).
> >
> > Aside: I do wonder whether the lack for that check isn't a problem.
> > VM_IO | VM_PFNMAP generally means driver managed, which means the
> > driver isn't going to consult the page pin count or anything like that
> > (at least not necessarily) when revoking or moving that memory, since
> > we're assuming it's totally under driver control. So if pup_fast can
> > get into such a mapping, we might have a problem.
> > -Daniel
> >
>
> Yes. I don't know why that check is missing from the _fast path.
> Probably just an oversight, seeing as how it's in the slow path. Maybe
> the appropriate response here is to add a separate patch that adds the
> check.
>
> I wonder if I'm overlooking something, but it certainly seems correct to
> do that.

You'll need the mmap_sem to get at the vma to be able to do this
check. If you add that to _fast, you made it as fast as the slow one.
Plus there's _fast_only due to locking recurion issues in fast-paths
(I assume, I didn't check all the callers).

I'm just wondering whether we have a bug somewhere with device
drivers. For CMA regions we always check in try_grab_page, but for dax
I'm not seeing where the checks in the _fast fastpaths are, and that
all still leaves random device driver mappings behind which aren't
backed by CMA but still point to something with a struct page behind
it. I'm probably just missing something, but no idea what.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
