Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1859CC55179
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 08:06:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B228D20829
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 08:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Xy9/3e57"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508672AbgJ0IGz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 04:06:55 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:42952 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894389AbgJ0IFP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 04:05:15 -0400
Received: by mail-oo1-f68.google.com with SMTP id l26so114740oop.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 01:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iRVTkxIJnHwaBLHokGGgZRE0TJVDnrQ64zJBBqMFGs0=;
        b=Xy9/3e579FMjjTLWAuxWgipn5uXab1XIWYf2dD59Ue8ydsa3nziuf3dnpX6I3eKQXi
         LX0Fhct8zwQ9LPuwvLWtj2sHUJJ3/cbghGd13edFhR4n655CEK2nlwMk9XgeGlojhrCH
         MtcfG6S4mtBZzrOUEzua2bUtpL2rn4D1Bjj1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iRVTkxIJnHwaBLHokGGgZRE0TJVDnrQ64zJBBqMFGs0=;
        b=KcixMx76Gs5YRoN0dl7awYt+oIfuicDt56VrbcTMKMlzxtEhUzvQhhhANJQ8sdqyDY
         vlf1CaHVRNMNfeD9FS1hjwDe5ouJiwLHAirgF26Fd7VXwXtt/cacQIyC4L6ODvSSP6Kp
         HgNTaLzFdo5zwVdFeRwyI4QMqIWxWeoPVsk64bvOGmyrgpOsY574t5M+VumLlrmGApFv
         ThuOwwEU5KhjmWXKUUJM7JRHX7/GUJkwyU65AkCwDal8yDE1RyQqoaThSYPfClaqcxWD
         SHwPts1O/dmKQxBObydCavWSrdfkrpD4JaPQgR04npArlr8hHG2VZpMR2IkD2SjR+F8j
         iKiA==
X-Gm-Message-State: AOAM532gT+MtmhFlalnCLK7WTtwN+CUGI5d1OT4Cj/39FvlbtpODQnq/
        HseylzHNNZ8jSESWaUATWA+WVmTKXCVk+ZpDa6IAYw==
X-Google-Smtp-Source: ABdhPJwUquARZelitGIpZLDuhwl8Qo3TUgFyzzaUCWDMIxNpoISTQyK7JTuU9JW1uR1xbLdlZOvSwHCimNolpOBBW1c=
X-Received: by 2002:a4a:b503:: with SMTP id r3mr809275ooo.28.1603785913727;
 Tue, 27 Oct 2020 01:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-6-daniel.vetter@ffwll.ch> <20201026221520.GC2802004@chromium.org>
In-Reply-To: <20201026221520.GC2802004@chromium.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 27 Oct 2020 09:05:01 +0100
Message-ID: <CAKMK7uG4f_7=9VgdQ9AE876gzLTNsszicMD9pKqeqvQybDSDpQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] mm/frame-vector: Use FOLL_LONGTERM
To:     Tomasz Figa <tfiga@chromium.org>
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
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 26, 2020 at 11:15 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Daniel,
>
> On Mon, Oct 26, 2020 at 11:58:08AM +0100, Daniel Vetter wrote:
> > This is used by media/videbuf2 for persistent dma mappings, not just
> > for a single dma operation and then freed again, so needs
> > FOLL_LONGTERM.
> >
> > Unfortunately current pup_locked doesn't support FOLL_LONGTERM due to
> > locking issues. Rework the code to pull the pup path out from the
> > mmap_sem critical section as suggested by Jason.
> >
> > By relying entirely on the vma checks in pin_user_pages and follow_pfn
> > (for vm_flags and vma_is_fsdax) we can also streamline the code a lot.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Pawel Osciak <pawel@osciak.com>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Tomasz Figa <tfiga@chromium.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > --
> > v2: Streamline the code and further simplify the loop checks (Jason)
> > ---
> >  mm/frame_vector.c | 50 ++++++++++++++---------------------------------
> >  1 file changed, 15 insertions(+), 35 deletions(-)
> >
>
> Thank you for the patch. Please see my comments inline.
>
> > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > index 10f82d5643b6..d44779e56313 100644
> > --- a/mm/frame_vector.c
> > +++ b/mm/frame_vector.c
> > @@ -38,7 +38,6 @@ int get_vaddr_frames(unsigned long start, unsigned in=
t nr_frames,
> >       struct vm_area_struct *vma;
> >       int ret =3D 0;
> >       int err;
> > -     int locked;
> >
> >       if (nr_frames =3D=3D 0)
> >               return 0;
> > @@ -48,40 +47,25 @@ int get_vaddr_frames(unsigned long start, unsigned =
int nr_frames,
> >
> >       start =3D untagged_addr(start);
> >
> > -     mmap_read_lock(mm);
> > -     locked =3D 1;
> > -     vma =3D find_vma_intersection(mm, start, start + 1);
> > -     if (!vma) {
> > -             ret =3D -EFAULT;
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
> > -             ret =3D -EOPNOTSUPP;
> > -             goto out;
> > -     }
> > -
> > -     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > +     ret =3D pin_user_pages_fast(start, nr_frames,
> > +                               FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM=
,
> > +                               (struct page **)(vec->ptrs));
> > +     if (ret > 0) {
> >               vec->got_ref =3D true;
> >               vec->is_pfns =3D false;
> > -             ret =3D pin_user_pages_locked(start, nr_frames,
> > -                     gup_flags, (struct page **)(vec->ptrs), &locked);
>
> Should we drop the gup_flags argument, since it's ignored now?

Hm right I think an earlier version even had that, but then I moved to
inlining the functionality in all the places it's used.

I'll drop the gup flag.

> > -             goto out;
> > +             goto out_unlocked;
> >       }
> >
>
> Should we initialize ret with 0 here, since pin_user_pages_fast() can
> return a negative error code, but below we use it as a counter for the
> looked up frames?

Indeed, that's a bug. Will fix for v5.
-Daniel

> Best regards,
> Tomasz
>
> > +     mmap_read_lock(mm);
> >       vec->got_ref =3D false;
> >       vec->is_pfns =3D true;
> >       do {
> >               unsigned long *nums =3D frame_vector_pfns(vec);
> >
> > +             vma =3D find_vma_intersection(mm, start, start + 1);
> > +             if (!vma)
> > +                     break;
> > +
> >               while (ret < nr_frames && start + PAGE_SIZE <=3D vma->vm_=
end) {
> >                       err =3D follow_pfn(vma, start, &nums[ret]);
> >                       if (err) {
> > @@ -92,17 +76,13 @@ int get_vaddr_frames(unsigned long start, unsigned =
int nr_frames,
> >                       start +=3D PAGE_SIZE;
> >                       ret++;
> >               }
> > -             /*
> > -              * We stop if we have enough pages or if VMA doesn't comp=
letely
> > -              * cover the tail page.
> > -              */
> > -             if (ret >=3D nr_frames || start < vma->vm_end)
> > +             /* Bail out if VMA doesn't completely cover the tail page=
. */
> > +             if (start < vma->vm_end)
> >                       break;
> > -             vma =3D find_vma_intersection(mm, start, start + 1);
> > -     } while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> > +     } while (ret < nr_frames);
> >  out:
> > -     if (locked)
> > -             mmap_read_unlock(mm);
> > +     mmap_read_unlock(mm);
> > +out_unlocked:
> >       if (!ret)
> >               ret =3D -EFAULT;
> >       if (ret > 0)
> > --
> > 2.28.0
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
