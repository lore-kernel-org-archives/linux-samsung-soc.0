Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D29CC5519F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Nov 2020 09:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8931420B1F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Nov 2020 09:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="JkicOjiQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgKYJAz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Nov 2020 04:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgKYJAy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 04:00:54 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47978C061A4E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2020 01:00:54 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id l36so1588771ota.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2020 01:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cb0IyYfwRRpwkSMXLoK5meWkqSB6m3aHpp32lgtuG5E=;
        b=JkicOjiQYuUe4qC0NCYmxG5Jf2Qdd6VpUQG0aEBdA3L/hZkGUrza6gxYa2hMmPMY/s
         ewVWRJYqWnQURjTZ+yFTAdl1Ez4sxo1/0FaXREz0psNNjo/Ewp3/C0rJLjM2dFGW9gyu
         BSTEd4SBqAlo0o+/0PsIWfkx3MMZ6g5rTd+P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cb0IyYfwRRpwkSMXLoK5meWkqSB6m3aHpp32lgtuG5E=;
        b=UhNEJfufs71g+rulUXoEVxkqtEIMsDjqlu/ORh9w2Skp/TsihoVJ273Z4Vy4wYlCcP
         rpNDa/g2iHgcag7RIRnyPtY93yVcYIoPvfizx5BEDTd3F+JAcOWPH5O7LTf+GxnsnsO8
         cWex2ZYIP9BnxSSuPiLIFZ3pCEo9bOeF+mveu4scyVA1IyfhbkGH/cZolE9Je8P+/GhL
         jvxFTZZMaJ1FsXQ+aIGadqQ7khhC44TXZQh+7WtW1Zl2IS9z3t+637ekoqiUyep3dX+l
         PMpYTfhcYm+GCvySDBBJZnelzDmTMb4+GlAbfoJ7Wsq4QWlucg+DjxN2WEBp4OR66cwh
         jgWw==
X-Gm-Message-State: AOAM530B8jLirt72Bvib9h2HRFm/wX2VFh2kBpO/gtn2kFBouzgguUzi
        rW4aNXXpouPx1AHZKNVhXCDumABSh2QUWPe6lKBfCA==
X-Google-Smtp-Source: ABdhPJzdLrBChJNmwAufHSFyRkbYFLtVRK1HD1rbwhJfrbBBuHxsolU3fINxVDwgeq07RNzsEDacWevGKQb60NxLVLQ=
X-Received: by 2002:a05:6830:3155:: with SMTP id c21mr2109430ots.281.1606294853508;
 Wed, 25 Nov 2020 01:00:53 -0800 (PST)
MIME-Version: 1.0
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-18-daniel.vetter@ffwll.ch> <20201120183029.GQ244516@ziepe.ca>
 <20201124142814.GM401619@phenom.ffwll.local> <20201124155526.GH5487@ziepe.ca>
In-Reply-To: <20201124155526.GH5487@ziepe.ca>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 25 Nov 2020 10:00:42 +0100
Message-ID: <CAKMK7uESguiML9eBonfU59T9fcfP4x18t=+nLdV8kMSc4mrs8A@mail.gmail.com>
Subject: Re: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Nov 25, 2020 at 9:13 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Nov 24, 2020 at 03:28:14PM +0100, Daniel Vetter wrote:
> > On Fri, Nov 20, 2020 at 02:30:29PM -0400, Jason Gunthorpe wrote:
> > > On Thu, Nov 19, 2020 at 03:41:46PM +0100, Daniel Vetter wrote:
> > > > @@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
> > > >   * Return: zero and the pfn at @pfn on success, -ve otherwise.
> > > >   */
> > > >  int follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > > > - unsigned long *pfn)
> > > > + unsigned long *pfn, struct mmu_notifier *subscription)
> > > >  {
> > > > - int ret = -EINVAL;
> > > > - spinlock_t *ptl;
> > > > - pte_t *ptep;
> > > > + if (WARN_ON(!subscription->mm))
> > > > +         return -EINVAL;
> > > >
> > > > + if (WARN_ON(subscription->mm != vma->vm_mm))
> > > > +         return -EINVAL;
> > >
> > > These two things are redundant right? vma->vm_mm != NULL?
> >
> > Yup, will remove.
> >
> > > BTW, why do we even have this for nommu? If the only caller is kvm,
> > > can you even compile kvm on nommu??
> >
> > Kinda makes sense, but I have no idea how to make sure with compile
> > testing this is really the case. And I didn't see any hard evidence in
> > Kconfig or Makefile that mmu notifiers requires CONFIG_MMU. So not sure
> > what to do here.
>
> It looks like only some arches have selectable CONFIG_MMU: arm,
> m68k, microblaze, riscv, sh
>
> If we look at arches that work with HAVE_KVM, I only see: arm64, mips,
> powerpc, s390, x86
>
> So my conclusion is there is no intersection between !MMU and HAVE_KVM?
>
> > Should I just remove the nommu version of follow_pfn and see what happens?
> > We can't remove it earlier since it's still used by other
> > subsystems.
>
> This is what I was thinking might work

Makes sense, I'll do that for the next round.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
