Return-Path: <SRS0=kOvG=D4=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCACC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 21 Oct 2020 13:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A53E02177B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 21 Oct 2020 13:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Zy8jQTBl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411513AbgJUN4g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 21 Oct 2020 09:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406831AbgJUN4f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 09:56:35 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF1FC0613D5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2020 06:56:35 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id f19so558731oot.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2020 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Kl9QoUs/s2cbTR+FmSfk48r32CM/2qV2pwhju+ujgqs=;
        b=Zy8jQTBlNs5TQa4PO6+FLGvNQo2yMvMWMuHBmJ+fNQEWt0uMnr71ZMI2bpycNRIRQ3
         KB/443iCclBVyREB3SmlS+YWdLKGHcc7IIZT4YKgogh2jrhpVHfuxxMo4sF0KXYOxqn9
         T98EDFVto3adCqdupGjGINQypIKb7P4JxqzsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Kl9QoUs/s2cbTR+FmSfk48r32CM/2qV2pwhju+ujgqs=;
        b=CHS+72fOFFsmOQJJQithCLeeoLLm9Rz+blbnMr8JnjQE+VuRlA6m951DcDUOIswAa0
         zUYdaGurTLCVt9wZKdoA21EhdJKtSehsYTM5uHQHOln0HJ8TXmOLSNIRIByev88vqTX5
         jEUPztYsaV8EtgZRU8Gtdz+Gu7FX0kA39Xrr+p2EuGPo6CkUjWPHO4s7wU1GL+X4D2CO
         otD+u5qCac4Bga5/TnfrpxlHP9sdBt8oJycX28frCxvLuNJaIeTX+Vf9Yrw7IIowEsEs
         OXi98I3udwS7JgDV40WonM08WZD89ob2CnWBCLUwQ5Pi0y9R+mnD+76YTEEIousCibAI
         UvWw==
X-Gm-Message-State: AOAM531KdQUFVTG7HxEvC+BVWVR/+w3AvWhRvqo45cMxHIPvoni/n+ha
        PDn03MPX4iMkfN/3aQoIt1TUWOx/FTCS2yG9w/eHOw==
X-Google-Smtp-Source: ABdhPJx73JOBFoAP2CVJQE/fpi2znYbj8Bpg/x5C+PPasilswqQzkmytZ9f5UvJqWOkdysL0kT2eE/qyk/y3R7xEcws=
X-Received: by 2002:a4a:95cb:: with SMTP id p11mr2640699ooi.89.1603288594554;
 Wed, 21 Oct 2020 06:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-9-daniel.vetter@ffwll.ch> <07557af4-32b5-7610-292c-9fd3bbfe9229@linux.ibm.com>
In-Reply-To: <07557af4-32b5-7610-292c-9fd3bbfe9229@linux.ibm.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 21 Oct 2020 15:56:23 +0200
Message-ID: <CAKMK7uEBv9y1mLAyo8ypV=bW=TMNky-QvhCTxcMe4O65WtmMZQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] s390/pci: Remove races against pte updates
To:     Niklas Schnelle <schnelle@linux.ibm.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 21, 2020 at 11:38 AM Niklas Schnelle <schnelle@linux.ibm.com> w=
rote:
>
>
>
> On 10/21/20 10:56 AM, Daniel Vetter wrote:
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
> > iomem region when CONFIG_IO_STRICT_DEVMEM is set, see commit
> > 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims the
> > region")
> >
> > Accessing pfns obtained from ptes without holding all the locks is
> > therefore no longer a good idea. Fix this.
> >
> > Since zpci_memcpy_from|toio seems to not do anything nefarious with
> > locks we just need to open code get_pfn and follow_pfn and make sure
> > we drop the locks only after we're done. The write function also needs
> > the copy_from_user move, since we can't take userspace faults while
> > holding the mmap sem.
> >
> > v2: Move VM_IO | VM_PFNMAP checks around so they keep returning EINVAL
> > like before (Gerard)
> >
> > v3: Polish commit message (Niklas)
> >
> > Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> > Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> > Cc: linux-s390@vger.kernel.org
> > Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
>                                                    ^^^^
> This should be ".ch", but since this is clearly a typo and you also send =
from @ffwll.ch,
> I took the liberty and fixed it for this commit and applied your patch to=
 our internal
> branch, Heiko or Vasily will then pick it up for the s390 tree.

Uh yes, and I've copypasted this to all patches :-/

Thanks for picking this up, I'll drop it here from my series.

Cheers, Daniel

>
> Thanks!
>
> > ---
> >  arch/s390/pci/pci_mmio.c | 98 +++++++++++++++++++++++-----------------
> >  1 file changed, 57 insertions(+), 41 deletions(-)
> >
> > diff --git a/arch/s390/pci/pci_mmio.c b/arch/s390/pci/pci_mmio.c
> > index 401cf670a243..1a6adbc68ee8 100644
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
> > +     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> > +             goto out_unlock_mmap;
> > +     ret =3D -EACCES;
> > +     if (!(vma->vm_flags & VM_WRITE))
> > +             goto out_unlock_mmap;
> > +
> > +     ret =3D follow_pte_pmd(vma->vm_mm, mmio_addr, NULL, &ptep, NULL, =
&ptl);
> >       if (ret)
> > -             goto out;
> > -     io_addr =3D (void __iomem *)((pfn << PAGE_SHIFT) |
> > +             goto out_unlock_mmap;
> > +
> > +     io_addr =3D (void __iomem *)((pte_pfn(*ptep) << PAGE_SHIFT) |
> >                       (mmio_addr & ~PAGE_MASK));
> >
> > -     ret =3D -EFAULT;
> >       if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE)
> > -             goto out;
> > -
> > -     if (copy_from_user(buf, user_buffer, length))
> > -             goto out;
> > +             goto out_unlock_pt;
> >
> >       ret =3D zpci_memcpy_toio(io_addr, buf, length);
> > -out:
> > +out_unlock_pt:
> > +     pte_unmap_unlock(ptep, ptl);
> > +out_unlock_mmap:
> > +     mmap_read_unlock(current->mm);
> > +out_free:
> >       if (buf !=3D local_buf)
> >               kfree(buf);
> >       return ret;
> > @@ -274,7 +272,9 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, =
mmio_addr,
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
> > @@ -287,7 +287,7 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, =
mmio_addr,
> >        * We only support read access to MIO capable devices if we are o=
n
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
> > +     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> > +             goto out_unlock_mmap;
> > +     ret =3D -EACCES;
> > +     if (!(vma->vm_flags & VM_WRITE))
> > +             goto out_unlock_mmap;
> > +
> > +     ret =3D follow_pte_pmd(vma->vm_mm, mmio_addr, NULL, &ptep, NULL, =
&ptl);
> >       if (ret)
> > -             goto out;
> > -     io_addr =3D (void __iomem *)((pfn << PAGE_SHIFT) | (mmio_addr & ~=
PAGE_MASK));
> > +             goto out_unlock_mmap;
> > +
> > +     io_addr =3D (void __iomem *)((pte_pfn(*ptep) << PAGE_SHIFT) |
> > +                     (mmio_addr & ~PAGE_MASK));
> >
> >       if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE) {
> >               ret =3D -EFAULT;
> > -             goto out;
> > +             goto out_unlock_pt;
> >       }
> >       ret =3D zpci_memcpy_fromio(buf, io_addr, length);
> > -     if (ret)
> > -             goto out;
> > -     if (copy_to_user(user_buffer, buf, length))
> > +
> > +out_unlock_pt:
> > +     pte_unmap_unlock(ptep, ptl);
> > +out_unlock_mmap:
> > +     mmap_read_unlock(current->mm);
> > +
> > +     if (!ret && copy_to_user(user_buffer, buf, length))
> >               ret =3D -EFAULT;
> >
> > -out:
> >       if (buf !=3D local_buf)
> >               kfree(buf);
> >       return ret;
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
