Return-Path: <SRS0=JmOj=DP=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0802C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Oct 2020 17:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F88E22201
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Oct 2020 17:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="MVbqu90h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731916AbgJHRQf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Oct 2020 13:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730763AbgJHRQc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Oct 2020 13:16:32 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8911DC061755
        for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Oct 2020 10:16:31 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id t77so7098718oie.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Oct 2020 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cJwmJXmW0n/BmBUTL74IPviQIG2habiKD0MU6pN8zhU=;
        b=MVbqu90hJmyrd+sPPkFw6E75unJ8rLwKVenxZgPlZQ0sDsjzqGtKeUBv82TcScacos
         yekx36c3FkXtWDgWxhXXmugd3dPf2By3cV1JwiAspr3dL9gnVzSAVLnXNq7o/V7irYdI
         7mZVqNu2dmuv8QMF1QlWFB/Rs/OIshbHRXrbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cJwmJXmW0n/BmBUTL74IPviQIG2habiKD0MU6pN8zhU=;
        b=kE4fbFifVJZyeAYRClYKQiKj97fNtgV0MesAFAFKXgCEx/HENBVqVXZ00KxZeMnsOf
         bnnilbtZbYQoyy+6+ybGb6uwUCT1RFV5AR3NqWBNRVh6lmqufvDCKjMaRl48J23HEy6n
         Sn68gcyj1MscX88TOTPQGBldHEcXasSdNZGyy1piESnjZVhY8CIkPI9Hlj+MKAzdoFhz
         rCT9b6Gly0U5rDlJJT5qK5p2erEP/wHhH71Th8PkukUrTCM6eWFUc2iZppPzvHYwac1N
         4QLheMOMt2QFzB7P4TSdS5nxTqnSDE/t7Y7V9LT05X3zFYGlwliFrWltp1lUg4QKBedM
         vznw==
X-Gm-Message-State: AOAM532CZY4LGsAVczaKljY3UE6K4gxjCppSG8emMv+7OBfwR7BNth+x
        HZXQdokDGm0AC+8r/IyXdlp3bEqlGrlbD+NKagEfiA==
X-Google-Smtp-Source: ABdhPJzf3e2p0tuIJ1xApDWpklSlKGyjhh7bQmds7tEcm9rrUTBDyTXsYZhQ+pIZOdsswK//Z2G6wQ7JuLDsqNpcK5Y=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr5847034oie.128.1602177390724;
 Thu, 08 Oct 2020 10:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-9-daniel.vetter@ffwll.ch> <20201008184440.4c3bebed@thinkpad>
In-Reply-To: <20201008184440.4c3bebed@thinkpad>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 8 Oct 2020 19:16:19 +0200
Message-ID: <CAKMK7uFFLB0gXcRt48Da30S+Mt8R+bhx=BGwcTg-b-MMVjcFGw@mail.gmail.com>
Subject: Re: [PATCH 08/13] s390/pci: Remove races against pte updates
To:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>
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
        Dan Williams <dan.j.williams@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Niklas Schnelle <schnelle@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 8, 2020 at 6:44 PM Gerald Schaefer
<gerald.schaefer@linux.ibm.com> wrote:
>
> On Wed,  7 Oct 2020 18:44:21 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> > Way back it was a reasonable assumptions that iomem mappings never
> > change the pfn range they point at. But this has changed:
> >
> > - gpu drivers dynamically manage their memory nowadays, invalidating
> > ptes with unmap_mapping_range when buffers get moved
> >
> > - contiguous dma allocations have moved from dedicated carvetouts to
> > cma regions. This means if we miss the unmap the pfn might contain
> > pagecache or anon memory (well anything allocated with GFP_MOVEABLE)
> >
> > - even /dev/mem now invalidates mappings when the kernel requests that
> > iomem region when CONFIG_IO_STRICT_DEVMEM is set, see 3234ac664a87
> > ("/dev/mem: Revoke mappings when a driver claims the region")
> >
> > Accessing pfns obtained from ptes without holding all the locks is
> > therefore no longer a good idea. Fix this.
> >
> > Since zpci_memcpy_from|toio seems to not do anything nefarious with
> > locks we just need to open code get_pfn and follow_pfn and make sure
> > we drop the locks only after we've done. The write function also needs
> > the copy_from_user move, since we can't take userspace faults while
> > holding the mmap sem.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> > Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> > Cc: linux-s390@vger.kernel.org
> > ---
> >  arch/s390/pci/pci_mmio.c | 98 +++++++++++++++++++++++-----------------
> >  1 file changed, 57 insertions(+), 41 deletions(-)
>
> Looks good, thanks. Also survived some basic function test. Only some
> minor nitpick, see below.
>
> Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
>
> >
> > diff --git a/arch/s390/pci/pci_mmio.c b/arch/s390/pci/pci_mmio.c
> > index 401cf670a243..4d194cb09372 100644
> > --- a/arch/s390/pci/pci_mmio.c
> > +++ b/arch/s390/pci/pci_mmio.c
> > @@ -119,33 +119,15 @@ static inline int __memcpy_toio_inuser(void __iom=
em *dst,
> >       return rc;
> >  }
> >
> > -static long get_pfn(unsigned long user_addr, unsigned long access,
> > -                 unsigned long *pfn)
> > -{
> > -     struct vm_area_struct *vma;
> > -     long ret;
> > -
> > -     mmap_read_lock(current->mm);
> > -     ret =3D -EINVAL;
> > -     vma =3D find_vma(current->mm, user_addr);
> > -     if (!vma)
> > -             goto out;
> > -     ret =3D -EACCES;
> > -     if (!(vma->vm_flags & access))
> > -             goto out;
> > -     ret =3D follow_pfn(vma, user_addr, pfn);
> > -out:
> > -     mmap_read_unlock(current->mm);
> > -     return ret;
> > -}
> > -
> >  SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
> >               const void __user *, user_buffer, size_t, length)
> >  {
> >       u8 local_buf[64];
> >       void __iomem *io_addr;
> >       void *buf;
> > -     unsigned long pfn;
> > +     struct vm_area_struct *vma;
> > +     pte_t *ptep;
> > +     spinlock_t *ptl;
> >       long ret;
> >
> >       if (!zpci_is_enabled())
> > @@ -158,7 +140,7 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long,=
 mmio_addr,
> >        * We only support write access to MIO capable devices if we are =
on
> >        * a MIO enabled system. Otherwise we would have to check for eve=
ry
> >        * address if it is a special ZPCI_ADDR and would have to do
> > -      * a get_pfn() which we don't need for MIO capable devices.  Curr=
ently
> > +      * a pfn lookup which we don't need for MIO capable devices.  Cur=
rently
> >        * ISM devices are the only devices without MIO support and there=
 is no
> >        * known need for accessing these from userspace.
> >        */
> > @@ -176,21 +158,37 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned lon=
g, mmio_addr,
> >       } else
> >               buf =3D local_buf;
> >
> > -     ret =3D get_pfn(mmio_addr, VM_WRITE, &pfn);
> > +     ret =3D -EFAULT;
> > +     if (copy_from_user(buf, user_buffer, length))
> > +             goto out_free;
> > +
> > +     mmap_read_lock(current->mm);
> > +     ret =3D -EINVAL;
> > +     vma =3D find_vma(current->mm, mmio_addr);
> > +     if (!vma)
> > +             goto out_unlock_mmap;
> > +     ret =3D -EACCES;
> > +     if (!(vma->vm_flags & VM_WRITE))
> > +             goto out_unlock_mmap;
> > +     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> > +             goto out_unlock_mmap;
>
> That check for VM_IO | VM_PFNMAP was previously hidden inside follow_pfn(=
),
> and that would have returned -EINVAL in this case. With your change, we
> now return -EACCES. Not sure how important that is, but it feels wrong.
> Maybe move the VM_IO | VM_PFNMAP check up, before the ret =3D -EACCES?

I tried to keep the errno unchanged, but fumbled this. Will fix in the
next round, thanks a lot for reviewing and testing.

For merging I think this one here would be best through the s390 tree,
since it can be merged without any of the others in here.

Thanks, Daniel

>
> [...]
> > @@ -306,22 +306,38 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long=
, mmio_addr,
> >               buf =3D local_buf;
> >       }
> >
> > -     ret =3D get_pfn(mmio_addr, VM_READ, &pfn);
> > +     mmap_read_lock(current->mm);
> > +     ret =3D -EINVAL;
> > +     vma =3D find_vma(current->mm, mmio_addr);
> > +     if (!vma)
> > +             goto out_unlock_mmap;
> > +     ret =3D -EACCES;
> > +     if (!(vma->vm_flags & VM_WRITE))
> > +             goto out_unlock_mmap;
> > +     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> > +             goto out_unlock_mmap;
>
> Same here with VM_IO | VM_PFNMAP and -EINVAL.



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
