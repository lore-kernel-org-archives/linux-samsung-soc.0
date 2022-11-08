Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426E7C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Nov 2022 04:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbiKHEqQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Nov 2022 23:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbiKHEqO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 23:46:14 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5391812AEB
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2022 20:46:13 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id kt23so35497380ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2022 20:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fra4yIWv6TZGqY5e50Ht4t7fKg9qXIteCxj5r9JD6vc=;
        b=k5nrvygDjfG84Jq8usw3TAeubZw8DjisC8BDW/Nl99poBxOVm3b4Emj6HmmfjmpRDg
         6UqJx+Zje8uwbw0492FSt+SP9nPZpSClhlI2a7jkV8gf4dZ+NQhHw/+vcVeKfiMshCy8
         l5vHZxgwLrsSFmUFQ9k9AqBdcglrJDMAIuZNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fra4yIWv6TZGqY5e50Ht4t7fKg9qXIteCxj5r9JD6vc=;
        b=sdSBtt6tKlNvlzert/JUv+5vrflJzRTPVkpPOdJZhiGFvxYP5ZzYIKfIuKTCQcSiCk
         WK6CH6VJisV8qtNx4CY4Pyti009Bktc7GKbzJWbpirb9FdHTjTBOaTg1/2/YlIEx99xW
         EPpzSbF14nHX+mIKhnSWJO9Ulh1gImI0o3eYx3VZ2VGHmbf6QHc7h/B/CzbLOOZQhtba
         x4wDgVGwBz41z8Xjxwt7Qtvwy1E8SexPASw/QgZZJPAYstz3BxYcgXYrs5GBpIp5/mOd
         UjFHb7CzHg3r7K4RXSa51a0oYhDwpAfhQccXMTMOqF/o7m6GyVmY0QoqmStKxipflSnz
         zhqg==
X-Gm-Message-State: ACrzQf0sSbAiBFJwedDbgLEsflOFwAVzDIJsNmpO1Up30WiayY/jspp8
        54vnVT4fmuMRunjNM+DJzAHk50ytHxBIhQ==
X-Google-Smtp-Source: AMsMyM4mrtUJwSARLPQhdgYFU4lAI0IZi91eHoGZKVF1v5vhpdD4WZiNQX8jxt9MxS3KVXfh4lWJZg==
X-Received: by 2002:a17:907:a0c7:b0:7ad:dc65:bf8e with SMTP id hw7-20020a170907a0c700b007addc65bf8emr39885916ejc.133.1667882771649;
        Mon, 07 Nov 2022 20:46:11 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709063d2200b007adbd01c566sm4278906ejf.146.2022.11.07.20.46.09
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 20:46:10 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id f27so35573020eje.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2022 20:46:09 -0800 (PST)
X-Received: by 2002:a17:906:ee8e:b0:730:3646:d178 with SMTP id
 wt14-20020a170906ee8e00b007303646d178mr51989213ejb.426.1667882769115; Mon, 07
 Nov 2022 20:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com> <20221107161740.144456-17-david@redhat.com>
In-Reply-To: <20221107161740.144456-17-david@redhat.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Nov 2022 13:45:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
Message-ID: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
To:     David Hildenbrand <david@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi David,

On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>
> FOLL_FORCE is really only for debugger access. According to commit
> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
> writable"), the pinned pages are always writable.

Actually that patch is only a workaround to temporarily disable
support for read-only pages as they seemed to suffer from some
corruption issues in the retrieved user pages. We expect to support
read-only pages as hardware input after. That said, FOLL_FORCE doesn't
sound like the right thing even in that case, but I don't know the
background behind it being added here in the first place. +Hans
Verkuil +Marek Szyprowski do you happen to remember anything about it?

Best regards,
Tomasz

>
> FOLL_FORCE in this case seems to be a legacy leftover. Let's just remove
> it.
>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> index 542dde9d2609..062e98148c53 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>         start = untagged_addr(start);
>
>         ret = pin_user_pages_fast(start, nr_frames,
> -                                 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +                                 FOLL_WRITE | FOLL_LONGTERM,
>                                   (struct page **)(vec->ptrs));
>         if (ret > 0) {
>                 vec->got_ref = true;
> --
> 2.38.1
>
