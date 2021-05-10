Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16176C43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 May 2021 15:22:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E605161107
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 May 2021 15:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236487AbhEJPXk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 May 2021 11:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235024AbhEJPXX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 May 2021 11:23:23 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2143C046853
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 07:55:50 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id d21so15996583oic.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AS9nf1QYyUIyVs6RoQO80MpiosKSnnivAT6Yx1y7KWk=;
        b=hmsr1/zRUNvK9mnHaZO5y60A+AHPfdNmIzBpb36meUCTFqPyF8BCSJoWzz+dwjMUBf
         sOjdtYrpYb+U2KZI8AgQCSNXM2B/sYEWnAXVW22VgufrTpS6Oub6U+k8pKNHLR9od9pY
         2JvWfGFLyMOvQgqNRMzpvCJTe8mmXm86mDSsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AS9nf1QYyUIyVs6RoQO80MpiosKSnnivAT6Yx1y7KWk=;
        b=m/GfCTmFnQRQiipNP+dWl+kknEd8M9gV0omQ4Vje8+ZCxGD03fyg6igSj23mFfMK5a
         vruXgnKfSID5wGjnRnTwSwQwOdfOEV9GTXnUUzRKIrq3I/CL5ongMZBWyx2h5joqZiG/
         WE/1EJrPxAM7XfYI7tOXmlSiGn/Hrs1P4CAsuYIjuyttVRwdRGLceULQQGuE7JNqnaMC
         JIzUyKYnJ66xBY9vy+cTAa2fetuNmL2bF3b9yJgjXGhgA52HJRTisN0K1HI4VzY3nfeX
         HtktcpDs6Yw5ka/XFxVxImc4cYHI8Y/SiG571QwMXrVtezxdaCayXEVhfjmPbWtCllA4
         GjaA==
X-Gm-Message-State: AOAM532p9eP8+hQZgksQik5XzY0KQ74BlzSBXeXLXKHJS87bTsB9ML7x
        CoyVPf+e9azc7Snq6V7zJaL68pck3vegJ2CLbd3m+w==
X-Google-Smtp-Source: ABdhPJwfEDQZPJA0WzNIzsQAkshxoJAbrMEAjUNsMGt80dwxzz47vaaAr7fiCJX7iaqPc8WdsMULsSopfEIfRAdTCGQ=
X-Received: by 2002:aca:df87:: with SMTP id w129mr18413978oig.128.1620658550366;
 Mon, 10 May 2021 07:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local> <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local> <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
In-Reply-To: <20210510135031.GF2047089@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 10 May 2021 16:55:39 +0200
Message-ID: <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, May 10, 2021 at 3:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Sat, May 08, 2021 at 09:46:41AM -0700, Linus Torvalds wrote:
>
> > I think follow_pfn() is ok for the actual "this is not a 'struct page'
> > backed area", and disabling that case is wrong even going forward.
>
> Every place we've audited using follow_pfn() has been shown to have
> some use-after-free bugs like Daniel describes, and a failure to check
> permissions bug too.
>
> All the other follow_pfn() users were moved to follow_pte() to fix the
> permissions check and this shifts the use-after-free bug away from
> being inside an MM API and into the caller mis-using the API by, say,
> extracting and using the PFN outside the pte lock.
>
> eg look at how VFIO wrongly uses follow_pte():
>
> static int follow_fault_pfn()
>         ret = follow_pte(vma->vm_mm, vaddr, &ptep, &ptl);
>                 *pfn = pte_pfn(*ptep);
>         pte_unmap_unlock(ptep, ptl);
>
>         // no protection that pte_pfn() is still valid!
>         use_pfn(*pfn)
>
> v4l is the only user that still has the missing permissions check
> security bug too - so there is no outcome that should keep
> follow_pfn() in the tree.
>
> At worst v4l should change to follow_pte() and use it wrongly like
> VFIO. At best we should delete all the v4l stuff.

yeah vfio is still broken for the case I care about. I think there's
also some questions open still about whether kvm really uses
mmu_notifier in all cases correctly, but iirc the one exception was
s390, which didn't have pci mmap and that's how it gets away with that
specific problem.

> Daniel I suppose we missed this relation to follow_pte(), so I agree
> that keeping a unsafe_follow_pfn() around is not good.

tbh I never really got the additional issue with the missing write
checks. That users of follow_pfn (or well follow_pte + immediate lock
dropping like vfio) don't subscribe to the pte updates in general is
the bug I'm seeing. That v4l also glosses over the read/write access
stuff is kinda just the icing on the cake :-) It's pretty well broken
even if it would check that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
