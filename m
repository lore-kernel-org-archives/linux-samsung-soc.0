Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15060C5517A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 09:25:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A7E822243
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 09:25:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Pk45fCQQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgKEJZb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 04:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgKEJZa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 04:25:30 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7A9C0613D4
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 01:25:28 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c9so834382wml.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2020 01:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=6viq27xeTxIz8acrTQ2jRGDu1L7mOoiJCMIWrZFHf74=;
        b=Pk45fCQQ7XngdYs3ziaP+ymxGzpakbhoUL7YEZ1pNacSF/8myikkPFyZUaHYgYV+MI
         jUFI0zhMI1Q5QNm1leQcIJl/cJaDXfbVVx+4uWz9xdSA/Fb7U7QrV97m7ySMNgMlnXw7
         FTghP2yCD22NR5UHFnL7m1NqQXsahfUUgl95A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=6viq27xeTxIz8acrTQ2jRGDu1L7mOoiJCMIWrZFHf74=;
        b=hK/kyVEmkpt6dDXx7/OhMhyFt/3/Q40Vh+ItOUZXoc5kw/aTv3rhU/GFslevrlqVj/
         Zan9Grin5KpA5jWy5jbaB1YLvh6edi1nz7grEpiO81b27NSCf2WRv0wOSs1WBJM8aUQF
         0mB9tAOtM1WK2Wm4K93jWcIpw2bnvRgF2hS//XO/ifjaNruUArTPRmeSpRAIQnrQSnO6
         7psCaVXP5wml01Jga405oVvVHlQ8j69bVfXclnC0xeZG6PoTqTS66MKqWM2pcwi4PJrS
         T/HPHos1u97i2jwcVcjlQ4ee0S1pNRFDbhmVkb44cBLnIlu2S/erjykEGBQ9L2n/q9QJ
         9T3w==
X-Gm-Message-State: AOAM530ScaLd2YfLETaVCZNLNaVwL0CmInwE/js2hSUTLJkAfP/Nvdqn
        eikCel9t+AXNQ5TcLgTBepqTRg==
X-Google-Smtp-Source: ABdhPJy3n17GilkYmW9UEcOuB53n8WrP7NQoee5RAk40ap5hD72YnDNsNHhquJauR7fQm17EWWmhuQ==
X-Received: by 2002:a1c:497:: with SMTP id 145mr1699932wme.127.1604568327398;
        Thu, 05 Nov 2020 01:25:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d63sm209171wmd.12.2020.11.05.01.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 01:25:26 -0800 (PST)
Date:   Thu, 5 Nov 2020 10:25:24 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        J??r??me Glisse <jglisse@redhat.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        KVM list <kvm@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux MM <linux-mm@kvack.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201105092524.GQ401619@phenom.ffwll.local>
Mail-Followup-To: John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        J??r??me Glisse <jglisse@redhat.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        KVM list <kvm@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
 <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
 <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org>
 <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Nov 04, 2020 at 10:44:56AM -0800, John Hubbard wrote:
> On 11/4/20 10:17 AM, Jason Gunthorpe wrote:
> > On Wed, Nov 04, 2020 at 04:41:19PM +0000, Christoph Hellwig wrote:
> > > On Wed, Nov 04, 2020 at 04:37:58PM +0000, Christoph Hellwig wrote:
> > > > On Wed, Nov 04, 2020 at 05:26:58PM +0100, Daniel Vetter wrote:
> > > > > What we're discussing is whether gup_fast and pup_fast also obey this,
> > > > > or fall over and can give you the struct page that's backing the
> > > > > dma_mmap_* memory. Since the _fast variant doesn't check for
> > > > > vma->vm_flags, and afaict that's the only thing which closes this gap.
> > > > > And like you restate, that would be a bit a problem. So where's that
> > > > > check which Jason&me aren't spotting?
> > > > 
> > > > remap_pte_range uses pte_mkspecial to set up the PTEs, and gup_pte_range
> > > > errors out on pte_special.  Of course this only works for the
> > > > CONFIG_ARCH_HAS_PTE_SPECIAL case, for other architectures we do have
> > > > a real problem.
> > > 
> > > Except that we don't really support pte-level gup-fast without
> > > CONFIG_ARCH_HAS_PTE_SPECIAL, and in fact all architectures selecting
> > > HAVE_FAST_GUP also select ARCH_HAS_PTE_SPECIAL, so we should be fine.

Thanks for the explainer. I guess I can go back to _fast and instead
adjust the commit message to explain why that's all fine.

> > Mm, I thought it was probably the special flag..
> > 
> > Knowing that CONFIG_HAVE_FAST_GUP can't be set without
> > CONFIG_ARCH_HAS_PTE_SPECIAL is pretty insightful, can we put that in
> > the Kconfig?
> > 
> > config HAVE_FAST_GUP
> >          depends on MMU
> >          depends on ARCH_HAS_PTE_SPECIAL
> >          bool
> > 
> Well, the !CONFIG_ARCH_HAS_PTE_SPECIAL case points out in a comment that
> gup-fast is not *completely* unavailable there, so I don't think you want
> to shut it off like that:
> 
> /*
>  * If we can't determine whether or not a pte is special, then fail immediately
>  * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
>  * to be special.
>  *
>  * For a futex to be placed on a THP tail page, get_futex_key requires a
>  * get_user_pages_fast_only implementation that can pin pages. Thus it's still
>  * useful to have gup_huge_pmd even if we can't operate on ptes.
>  */

We support hugepage faults in gpu drivers since recently, and I'm not
seeing a pud_mkhugespecial anywhere. So not sure this works, but probably
just me missing something again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
