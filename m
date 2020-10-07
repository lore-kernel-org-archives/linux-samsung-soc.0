Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FAEC47420
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 18:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 975D82176B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 18:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="lyjVFBq/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbgJGSOW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 14:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbgJGSOT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 14:14:19 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A744CC0613D5
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 11:14:17 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id c4so850993oou.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cQRYAtP+xjx5WuekS6OE0CV7kqmxj7BYflzO3gWdvvE=;
        b=lyjVFBq/8C4cx1xV9ChTXnV40ihqdqpwLDP0hKiWG7wMCAY1kcUxadTiFEkVrngi/w
         V9y6TiR2NUPQYfn7qatcnS2KH2rC4iURG1Imt+VcjCPG3gMt13p5HinunxSiaAfYb6mn
         oHrygbKnexw8amjrZlMfKtPR5lb/S9ssQU4cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cQRYAtP+xjx5WuekS6OE0CV7kqmxj7BYflzO3gWdvvE=;
        b=sXzsKH61Oe+Tq+4mklBzB6uaunXuYCgKl6WHN7agOta01xXl+dSMS8Z4FKhMOjavPM
         mmAS4l8/AqG2/CxxgSGDuMr9T+xj25esmiRk31JveDKZmtrVUP5hsFwRb7rlJbbYVyxD
         Dg0P/5ggKtNuxgu9MVW4JcBB43/wKJvI0JIe0prTwQqsKcW9GK1mkhjq1ZcFZaX5j8Zw
         hdP+KRGIuycdaJMTMyGFELa4va9bSREEOcltqzeqPRI+lgJFtl22VH8fGf/GgGYyHDn/
         RQiI7bKus/qA6e4Pjl0GU0/YzJ/g3CZl3vatc9ethnVgJFq1e4igpX3/cQCMFY09pCYs
         p+RQ==
X-Gm-Message-State: AOAM530dE6LFa8Sm14KVCcrbJN9FFzSoPI8RaYqSAu00zQvXXysirrmk
        tC06CnXTDzK/d/U3wS3w5vWiQSt3fPc7XZAEXKlcnA==
X-Google-Smtp-Source: ABdhPJzjOjAMzRbSVSt+lqfvvsdq1EBjj80477iZlPA7zPuN7ej1AyuyFSKWwEDM91Ycyft1zzLM1yCXh0Q5piW4a7o=
X-Received: by 2002:a4a:e592:: with SMTP id o18mr2831112oov.28.1602094456975;
 Wed, 07 Oct 2020 11:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-14-daniel.vetter@ffwll.ch> <20201007173911.GX5177@ziepe.ca>
In-Reply-To: <20201007173911.GX5177@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 20:14:06 +0200
Message-ID: <CAKMK7uEbAAJPPmv1yM_-V24Xg=S=NWxs2Yhi51kb-4AZLbFTTg@mail.gmail.com>
Subject: Re: [PATCH 13/13] vfio/type1: Mark follow_pfn as unsafe
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 7, 2020 at 7:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 07, 2020 at 06:44:26PM +0200, Daniel Vetter wrote:
> > The code seems to stuff these pfns into iommu pts (or something like
> > that, I didn't follow), but there's no mmu_notifier to ensure that
> > access is synchronized with pte updates.
> >
> > Hence mark these as unsafe. This means that with
> > CONFIG_STRICT_FOLLOW_PFN, these will be rejected.
> >
> > Real fix is to wire up an mmu_notifier ... somehow. Probably means any
> > invalidate is a fatal fault for this vfio device, but then this
> > shouldn't ever happen if userspace is reasonable.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: Cornelia Huck <cohuck@redhat.com>
> > Cc: kvm@vger.kernel.org
> > ---
> >  drivers/vfio/vfio_iommu_type1.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_=
type1.c
> > index 5fbf0c1f7433..a4d53f3d0a35 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -421,7 +421,7 @@ static int follow_fault_pfn(struct vm_area_struct *=
vma, struct mm_struct *mm,
> >  {
> >       int ret;
> >
> > -     ret =3D follow_pfn(vma, vaddr, pfn);
> > +     ret =3D unsafe_follow_pfn(vma, vaddr, pfn);
> >       if (ret) {
> >               bool unlocked =3D false;
> >
> > @@ -435,7 +435,7 @@ static int follow_fault_pfn(struct vm_area_struct *=
vma, struct mm_struct *mm,
> >               if (ret)
> >                       return ret;
> >
> > -             ret =3D follow_pfn(vma, vaddr, pfn);
> > +             ret =3D unsafe_follow_pfn(vma, vaddr, pfn);
> >       }
>
> This is actually being commonly used, so it needs fixing.
>
> When I talked to Alex about this last we had worked out a patch series
> that adds a test on vm_ops that the vma came from vfio in the first
> place. The VMA's created by VFIO are 'safe' as the PTEs are never changed=
.

Hm, but wouldn't need that the semi-nasty vma_open trick to make sure
that vma doesn't untimely disappear? Or is the idea to look up the
underlying vfio object, and refcount that directly?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
