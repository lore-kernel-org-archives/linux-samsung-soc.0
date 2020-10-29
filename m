Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652D8C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D347520790
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:23:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CBZ8FpLc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgJ2JXW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 05:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ2JXW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 05:23:22 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8963AC0613D3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2020 02:23:20 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x203so2503718oia.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2020 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HErX54nBW85Mz/DisB4HfNyGdAeDZ0yXv+UudeIIMTI=;
        b=CBZ8FpLcj2jbgAT+Vmv1XK/GbFU0hZrgfjfdtoEzh/dEuH+e0mn43Y+dqqjduTTKhF
         J7T958sHQ5/KYkABUDOFL7LBDzCndG/FofSZCVsgEfa1haI/dp0rDYf3SCs2rGay/PWL
         uDxd+MKtvtWQZGFZGQv1Mt5IJ+VVaOuC4yqDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HErX54nBW85Mz/DisB4HfNyGdAeDZ0yXv+UudeIIMTI=;
        b=WUxILECqUaDW1A5s/BkjOj4GhyC3jwEesVSHk48I1k9t0CQPWVCYy9T+HF/O0rYxoL
         nVblFCq56IdvmHcZ447MhEUMbJihdyZpT+h8UdY6ehgEJo6xWxhyikhnaaPG2YKw3bfj
         FccDPg3mvF4Lua3V6KONyIPNETJ+pvOUugC5tj2aH0KGhhY6jco0byCdRNPIoIWrq3wx
         uZpi0SxyVhGHIUaTgJEY+/xuIkQxjLok/U7Uwf9Yc3QxDI6KhPTyRmxuNEoEBwzgUgMm
         f0rJ32Dz22hjbUQS+i0tO7um5s5Wb8Z0fPcq9ihCbRjmnHrFXXp2u2fz/RA/doMHBNyr
         EIrQ==
X-Gm-Message-State: AOAM5334b/BmL9j2BDD0JZ2Mjos4Bdb5ChUs4JgqBOaeOO6+50Sot9GO
        BueWkFJdFDNMS7WDA6y2SzFsgoyQUuCXwdYvweA24A==
X-Google-Smtp-Source: ABdhPJwaJb96lRFRXk+hd1pHWMNo5GqlP779ZIojTGckKr1ysWVQINo4W6Rzy8Z9dUSTdKF2aKSvZQbQvjmujgECT7Y=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2268480oig.128.1603963399942;
 Thu, 29 Oct 2020 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-9-daniel.vetter@ffwll.ch> <20201029085644.GA25658@infradead.org>
In-Reply-To: <20201029085644.GA25658@infradead.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 29 Oct 2020 10:23:09 +0100
Message-ID: <CAKMK7uGVUf9RfTHKa8fpTUgGQ5iy+5toK+tQYp0TokKU=iM8pQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] mm: Add unsafe_follow_pfn
To:     Christoph Hellwig <hch@infradead.org>
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
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        "J??r??me Glisse" <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 29, 2020 at 9:56 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> > +int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > +     unsigned long *pfn)
>
> The one tab indent here looks weird, normally tis would be two tabs
> or aligned aftetthe opening brace.
>
> > +{
> > +#ifdef CONFIG_STRICT_FOLLOW_PFN
> > +     pr_info("unsafe follow_pfn usage rejected, see CONFIG_STRICT_FOLLOW_PFN\n");
> > +     return -EINVAL;
> > +#else
> > +     WARN_ONCE(1, "unsafe follow_pfn usage\n");
> > +     add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> > +
> > +     return follow_pfn(vma, address, pfn);
> > +#endif
>
> Woudn't this be a pretty good use case of "if (IS_ENABLED(...)))"?
>
> Also I'd expect the inverse polarity of the config option, that is
> a USAFE_FOLLOW_PFN option to enable to unsafe behavior.

Was just about to send out v5, will apply your suggestions for that
using IS_ENABLED.

Wrt negative or positive Kconfig, I was following STRICT_DEVMEM symbol
as precedence. But easy to invert if there's strong feeling the other
way round, I'm not attached to either.

> > +/**
> > + * unsafe_follow_pfn - look up PFN at a user virtual address
> > + * @vma: memory mapping
> > + * @address: user virtual address
> > + * @pfn: location to store found PFN
> > + *
> > + * Only IO mappings and raw PFN mappings are allowed.
> > + *
> > + * Returns zero and the pfn at @pfn on success, -ve otherwise.
> > + */
> > +int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > +     unsigned long *pfn)
> > +{
> > +     return follow_pfn(vma, address, pfn);
> > +}
> > +EXPORT_SYMBOL(unsafe_follow_pfn);
>
> Any reason this doesn't use the warn and disable logic?

I figured without an mmu there's not much guarantees anyway. But I
guess I can put it in here too for consistency.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
