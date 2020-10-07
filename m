Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAA5C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 21:51:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73503212CC
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 21:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="RYITGyTp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgJGVvA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 17:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728702AbgJGVu7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 17:50:59 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BA1C061755
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 14:50:59 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id q136so2968543oic.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 14:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWGCIOydys/PVXDkI8D7/WYJ3+tXIlDPLmJQQeojkP4=;
        b=RYITGyTpDQrhaTy45WCQWB7S0cwfaHHh3OpiGBmEPf/5Sn9SZhBTUrfuBI5sApAVCz
         T91G4l95cIiLFkCFoy02NhuBItioeoq67OA++h3qBN6BlQdZ2cpqUetUKAyKzW4kFQ0w
         5Qtqca0SmLP0UhiDont79zDLISy/mkOvxYGHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWGCIOydys/PVXDkI8D7/WYJ3+tXIlDPLmJQQeojkP4=;
        b=Et74YgyxbMzJSuS4jcTNh1iEdS+XqIbCsbBzhr+7Nh+xmyck6BAAMq5kH9TMB/lCB/
         MBUpg/UJKLEmK0Q58m/QNzf1q2zyONOxvJ1RQhHAU/vt1ezKj3WOheiM4NRdajVH5BAJ
         On1UPYshhdD4UMzGqX3FPOl8ptF8jX6R4ck81WvoV3mU3biMM3/uS8IXhd3XegmQVA9P
         t+WkPm4fZYTdmqAIjLw0mgUJCAcHXcNJuFXPgSLnMW1+YRrT62YQv88yY9/zz7Oxk+vf
         tc7bk3AnyFNeoUmRXDkmxlGzV1VMQ5smPgGS9L2arMvzO65EbEHKYntOa3Ja67einPcS
         GY+Q==
X-Gm-Message-State: AOAM533pNUChSAwcycvzQG8ks68KfQ72FUv4r7I8zWvApRkeqWSLzp1u
        gVPDLh2dYDDh+/q0iWjoaWDqjvia6AmbQtN+QzVIzg==
X-Google-Smtp-Source: ABdhPJywVeOO6ZiDQcLcwu4Td5CgpCTJ9U8XcX1hFxhlIWItjEaKhv17whEr41y9mEAabwbRCVa0NcIfbphA+xnz5sQ=
X-Received: by 2002:aca:6083:: with SMTP id u125mr3249940oib.14.1602107459110;
 Wed, 07 Oct 2020 14:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-2-daniel.vetter@ffwll.ch> <80718789-b3de-c30a-03c5-7c8cbf41f7d9@nvidia.com>
 <CAKMK7uEuwmCkpSeKxjDgHXWrE9P-TbawLoQ4dpu0nc4MYykScA@mail.gmail.com> <895eb064-1c8f-ecfc-0a98-1fbe40cb3161@nvidia.com>
In-Reply-To: <895eb064-1c8f-ecfc-0a98-1fbe40cb3161@nvidia.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 23:50:47 +0200
Message-ID: <CAKMK7uFgPfwxr7ePng-f=e__10+3bipmDhF4hFACcyao63m-nA@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/exynos: Stop using frame_vector helpers
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 7, 2020 at 11:37 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 10/7/20 2:32 PM, Daniel Vetter wrote:
> > On Wed, Oct 7, 2020 at 10:33 PM John Hubbard <jhubbard@nvidia.com> wrote:
> >>
> >> On 10/7/20 9:44 AM, Daniel Vetter wrote:
> ...
> >>> @@ -398,15 +399,11 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
> >>>        dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
> >>>                          DMA_BIDIRECTIONAL, 0);
> >>>
> >>> -     pages = frame_vector_pages(g2d_userptr->vec);
> >>> -     if (!IS_ERR(pages)) {
> >>> -             int i;
> >>> +     for (i = 0; i < g2d_userptr->npages; i++)
> >>> +             set_page_dirty_lock(g2d_userptr->pages[i]);
> >>>
> >>> -             for (i = 0; i < frame_vector_count(g2d_userptr->vec); i++)
> >>> -                     set_page_dirty_lock(pages[i]);
> >>> -     }
> >>> -     put_vaddr_frames(g2d_userptr->vec);
> >>> -     frame_vector_destroy(g2d_userptr->vec);
> >>> +     unpin_user_pages(g2d_userptr->pages, g2d_userptr->npages);
> >>> +     kvfree(g2d_userptr->pages);
> >>
> >> You can avoid writing your own loop, and just simplify the whole thing down to
> >> two lines:
> >>
> >>          unpin_user_pages_dirty_lock(g2d_userptr->pages, g2d_userptr->npages,
> >>                                      true);
> >>          kvfree(g2d_userptr->pages);
> >
> > Oh nice, this is neat. I'll also roll it out in the habanalabs patch,
> > that has the same thing. Well almost, it only uses set_page_dirty, not
> > the _lock variant. But I have no idea whether that matters or not?
>
>
> It matters. And invariably, call sites that use set_page_dirty() instead
> of set_page_dirty_lock() were already wrong.  Which is why I never had to
> provide anything like "unpin_user_pages_dirty (not locked)".
>
> Although in habanalabs case, I just reviewed patch 3 and I think they *were*
> correctly using set_page_dirty_lock()...

Yeah I mixed that up with some other code I read, habanalabs is using
_lock. I have seen a pile of gup/pup code though that only uses
set_page_dirty. And looking around I did not really parse the comment
above set_page_dirty(). I guess just using the _lock variant shouldn't
hurt too much. I've found a comment though from the infiniband umem
notifier that it's sometimes called with the page locked, and
sometimes not, so life is complicated there. But how it avoids races I
didn't understand.
-Daniel


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
