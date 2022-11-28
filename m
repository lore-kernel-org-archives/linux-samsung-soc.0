Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C073BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 28 Nov 2022 08:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbiK1I6K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Nov 2022 03:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiK1I6I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Nov 2022 03:58:08 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CEF616B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Nov 2022 00:58:07 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so23941552ejb.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Nov 2022 00:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iRo5DYRndKCx9sGSXzsZxPr88K/zqtuLTLl1O32mcFE=;
        b=XOKEpyQaMH8DtU4ghoeum5LLPSyZKKSeL9ukREYJEhE5Pet4ng53VcgxrNVIVOiN3z
         qM9BvX69vBwubqV7gI66eEPgV5zFoyHzRXj6Y/c3o1k6BVytkDV23dS8hW9lN3urO8Q7
         YycsWj1XAMOHph6L7v2J+A4VSfKO7i7WBHunk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRo5DYRndKCx9sGSXzsZxPr88K/zqtuLTLl1O32mcFE=;
        b=rLt1k2h5fkWEkmkhxmIHwE0IXE6vn67qpaI1TE2EQasqSNBtfiBxKeUZ8AGzQ9KFf3
         nUWwdLMRw91UqQV7bO9Mwkt0nw6mhXAH3rKYXcNWppTARP+pz1TVoO2zRDAVN3GzTMD3
         p6o14CmzeeFzF2OOjwaS+2DoglgyzglmfMXHPp8FhERWI9mf5abLTwUm2zEV7G1emZ0Q
         OcvrG2rH5BCb18HGlYM0Pub9t1OXR8CgE8ZFiTM8o1LX74lgWfZZJXpAckTTLDU4Zp/W
         pVMTHEKt4CzQpvrcBxcjBwfpVMhBwRuMr3dFdMOruhpaynsFwf36D5GRe+EHjVPH39lV
         SlSQ==
X-Gm-Message-State: ANoB5pm1UVHy8oVl5Rc+zqpWWKWyTJ4FspN4/b02W3J6C4B5ZaA+cqmN
        2HCb2dnpggGAns14s7NjY2xcdh1L6Fsd1w==
X-Google-Smtp-Source: AA0mqf6L/6aZn/3M9K3k1K9SpfvtopC28Mdofyh9DG7skprE4HvsxjRVXKgNaHnQEjGAqIJJSRaVHA==
X-Received: by 2002:a17:906:ad97:b0:7bc:42f6:153d with SMTP id la23-20020a170906ad9700b007bc42f6153dmr13944200ejb.204.1669625886077;
        Mon, 28 Nov 2022 00:58:06 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906311200b007c07909eb9asm543487ejx.1.2022.11.28.00.58.04
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:58:05 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id f7so14468776edc.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Nov 2022 00:58:04 -0800 (PST)
X-Received: by 2002:aa7:db98:0:b0:46a:d57:d9d0 with SMTP id
 u24-20020aa7db98000000b0046a0d57d9d0mr25216647edt.113.1669625884043; Mon, 28
 Nov 2022 00:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20221116102659.70287-1-david@redhat.com> <20221116102659.70287-17-david@redhat.com>
 <81fb0fa3-2e06-b765-56ac-a7d981194e59@redhat.com> <08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
 <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
In-Reply-To: <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 28 Nov 2022 17:57:51 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BQBsBiY48o3FxmQT7H4063=dvDDwSB4S=AyLxXbXuJeA@mail.gmail.com>
Message-ID: <CAAFQd5BQBsBiY48o3FxmQT7H4063=dvDDwSB4S=AyLxXbXuJeA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE usage
To:     David Hildenbrand <david@redhat.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Shuah Khan <shuah@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 28, 2022 at 5:19 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 28.11.22 09:17, Hans Verkuil wrote:
> > Hi David,
> >
> > On 27/11/2022 11:35, David Hildenbrand wrote:
> >> On 16.11.22 11:26, David Hildenbrand wrote:
> >>> FOLL_FORCE is really only for ptrace access. According to commit
> >>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
> >>> writable"), get_vaddr_frames() currently pins all pages writable as a
> >>> workaround for issues with read-only buffers.
> >>>
> >>> FOLL_FORCE, however, seems to be a legacy leftover as it predates
> >>> commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
> >>> always writable"). Let's just remove it.
> >>>
> >>> Once the read-only buffer issue has been resolved, FOLL_WRITE could
> >>> again be set depending on the DMA direction.
> >>>
> >>> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> >>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> >>> Cc: Tomasz Figa <tfiga@chromium.org>
> >>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> >>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>> ---
> >>>    drivers/media/common/videobuf2/frame_vector.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> >>> index 542dde9d2609..062e98148c53 100644
> >>> --- a/drivers/media/common/videobuf2/frame_vector.c
> >>> +++ b/drivers/media/common/videobuf2/frame_vector.c
> >>> @@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> >>>        start = untagged_addr(start);
> >>>          ret = pin_user_pages_fast(start, nr_frames,
> >>> -                  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> >>> +                  FOLL_WRITE | FOLL_LONGTERM,
> >>>                      (struct page **)(vec->ptrs));
> >>>        if (ret > 0) {
> >>>            vec->got_ref = true;
> >>
> >>
> >> Hi Andrew,
> >>
> >> see the discussion at [1] regarding a conflict and how to proceed with
> >> upstreaming. The conflict would be easy to resolve, however, also
> >> the patch description doesn't make sense anymore with [1].
> >
> > Might it be easier and less confusing if you post a v2 of this series
> > with my patch first? That way it is clear that 1) my patch has to come
> > first, and 2) that it is part of a single series and should be merged
> > by the mm subsystem.
> >
> > Less chances of things going wrong that way.
> >
> > Just mention in the v2 cover letter that the first patch was added to
> > make it easy to backport that fix without being hampered by merge
> > conflicts if it was added after your frame_vector.c patch.
>
> Yes, that's the way I would naturally do, it, however, Andrew prefers
> delta updates for minor changes.
>
> @Andrew, whatever you prefer!
>
> Thanks!
>

However you folks proceed with taking this patch, feel free to add my
Acked-by. Thanks!

Best regards,
Tomasz

> --
> Thanks,
>
> David / dhildenb
>
