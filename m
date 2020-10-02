Return-Path: <SRS0=6p2y=DJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CD1C46466
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 18:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A980020795
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 18:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BoHELb4S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387688AbgJBSXL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 2 Oct 2020 14:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgJBSXL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 14:23:11 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72044C0613E2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2020 11:23:09 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id dn5so2644426edb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2020 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4bzPIab4VFKjJVRS8nUYS5ckBsBdN2UEpwZV//i/pfs=;
        b=BoHELb4SMe2EXLTnmM7crMW7z4e5rCSlUGYMOrIAdjXmRa3XEtuHqpDmH9BXvnlB4K
         FYNksaqBSlgCn4zswwkJWAcIh4aB3l6sw6PQ7aZlBMWf+vEZvvhTe1LzhF2w+hgsLdUs
         9CCEQOqi7ooFv0hOakm61xTH7y/mUb3L2/qlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bzPIab4VFKjJVRS8nUYS5ckBsBdN2UEpwZV//i/pfs=;
        b=cNg+ifMynPeFdDT9Mercei0/6chZcSY6FgVc0IUIx3prPloVHRZv4+V2fiUhdoOnch
         b9OrFQL9+cbZtUiG4Cz4nDn6MzfrGmlW8lmSYpSzCNlcBmyE+EAOdfN9usuXmuHnoAJe
         fPlKKziFp2ln/Ep380re4Ws7qaCXJzbdtInKV/NsPFnLc6wQH5PZekIKaUY01ky0emQV
         4Dox4AvbdoZACBp9WgAT3IkDpvC6BKX+gGP4syy0gcxmFfGVb6xBoHKHfdieJEdQtvWB
         ywAEkLLjv8STkXFNtyaa5IsfInqWcJ9xk1RTKMqPFnwllxRsuG0/ylt0ikmSTG4Fr+mx
         RhNQ==
X-Gm-Message-State: AOAM533AkYetva0YQhd/9aytqgcyKcowEPTkzgMZbavrhkjv/mMfp05X
        iPV8gl4DRjIWCpi0U9/3k/XXvuzIGRHB8g==
X-Google-Smtp-Source: ABdhPJwoC5A4LVSjOV28SbPSamEbw9pHEWalwKVKRtAQ/g0AOgqf1T3iBHgc96dJOErmGqiG54tMLA==
X-Received: by 2002:a50:fa42:: with SMTP id c2mr3991076edq.282.1601662987887;
        Fri, 02 Oct 2020 11:23:07 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id bk9sm1607796ejb.122.2020.10.02.11.23.06
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 11:23:06 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id y15so2693318wmi.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2020 11:23:06 -0700 (PDT)
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr4341034wme.127.1601662986038;
 Fri, 02 Oct 2020 11:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 2 Oct 2020 20:22:49 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AsFOau=m_3UPh2tKqwiUJaY4NH9HHrHJ17gbCLDgTNCQ@mail.gmail.com>
Message-ID: <CAAFQd5AsFOau=m_3UPh2tKqwiUJaY4NH9HHrHJ17gbCLDgTNCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/frame-vec: Drop gup_flags from get_vaddr_frames()
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 2, 2020 at 7:53 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> FOLL_WRITE | FOLL_FORCE is really the only reasonable thing to do for
> simple dma device that can't guarantee write protection. Which is also
> what all the callers are using.
>
> So just simplify this.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oded Gabbay <oded.gabbay@gmail.com>
> Cc: Omer Shpigelman <oshpigelman@habana.ai>
> Cc: Tomer Tayar <ttayar@habana.ai>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Pawel Piskorski <ppiskorski@habana.ai>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-mm@kvack.org
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c           | 3 +--
>  drivers/media/common/videobuf2/videobuf2-memops.c | 3 +--
>  drivers/misc/habanalabs/common/memory.c           | 3 +--
>  include/linux/mm.h                                | 2 +-
>  mm/frame_vector.c                                 | 4 ++--
>  5 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 967a5cdc120e..ac452842bab3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -480,8 +480,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
>                 goto err_free;
>         }
>
> -       ret = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
> -               g2d_userptr->vec);
> +       ret = get_vaddr_frames(start, npages, g2d_userptr->vec);
>         if (ret != npages) {
>                 DRM_DEV_ERROR(g2d->dev,
>                               "failed to get user pages from userptr.\n");
> diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
> index 6e9e05153f4e..9dd6c27162f4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-memops.c
> +++ b/drivers/media/common/videobuf2/videobuf2-memops.c
> @@ -40,7 +40,6 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
>         unsigned long first, last;
>         unsigned long nr;
>         struct frame_vector *vec;
> -       unsigned int flags = FOLL_FORCE | FOLL_WRITE;
>
>         first = start >> PAGE_SHIFT;
>         last = (start + length - 1) >> PAGE_SHIFT;
> @@ -48,7 +47,7 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
>         vec = frame_vector_create(nr);
>         if (!vec)
>                 return ERR_PTR(-ENOMEM);
> -       ret = get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
> +       ret = get_vaddr_frames(start & PAGE_MASK, nr, vec);
>         if (ret < 0)
>                 goto out_destroy;
>         /* We accept only complete set of PFNs */

For drivers/media/common/videobuf2/:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
