Return-Path: <SRS0=/9gS=DK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3064BC41604
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 23:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6ABF206B6
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 23:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Wt75KKGY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbgJCXYo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 3 Oct 2020 19:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgJCXYo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 3 Oct 2020 19:24:44 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0400DC0613D0
        for <linux-samsung-soc@vger.kernel.org>; Sat,  3 Oct 2020 16:24:44 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id r8so6080764qtp.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 03 Oct 2020 16:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g/bWRDC83HBwg01UsDzSfM2jl4/c+/+0WDuMbz3L3vY=;
        b=Wt75KKGYlyB3SVZh+R6kN1ac9Vs1rLb3FsriPknSZPm+rurem+iWpgZgJn4OjhxTGZ
         9UwOdbqn0IcWxz+SXlFiwb4+rjtb+FIwhhqFqQCCHCvfa+S2U6Kl8NLkXIpYAhA/a10W
         r/rLG3s+ms3GT5JJgD+ISxGasTSiyNYlo6eShkO1GzrSNpTK/YeaG5lgDrFWf6poASEm
         HB67uKceG7Zv3GOVEaWOpYkegB/R/AxePvPSKebeq4LE2/szG8/0SQsD2yphB471fLtE
         A3BPhFHCM7s2bOPhwoXpknrKjY/J2CP+KFTRaSIylcr9nsqahczax8dmHfThNO+XSHbg
         6rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g/bWRDC83HBwg01UsDzSfM2jl4/c+/+0WDuMbz3L3vY=;
        b=rNvLuf3oROtY4KeBibDe+7OCybqmmsC+fPsdS8obJMNxsOy+n/rdvdAQpiKU2RB6BC
         lBu9dlTlngcC/V5Z1rezWU9Pzr/Yq1i8sUZQHoH/aPQOsCf5BIM4S33qaHbfK5kIaOQp
         //67DUOvAJ+g9zojgCHlwENqZ2dUcdozjJXfml+8SSde+bary9NykGdG+HQqPfzz9fJX
         0xuAKWbKA9BBegKqCHZh7gUPwLifDOBR6Wc4LRN2b7f0hV81ljkpPdfSGn1FiQ11ySKv
         rvTXD+wZjiwgP7Hv8i/n+Qd/tSxxdXuq2lW62bartjQvjuQvshArueXYDIIWLMjmpLVh
         xUkw==
X-Gm-Message-State: AOAM533IlC6JGvrvxWZt6oiDvF3OKWngRfqKdiK7bNXJsl3GW1Akox5u
        Y2YNa7SQ2NfQx63pqDhb2bjGDue5RGnVDu+Z
X-Google-Smtp-Source: ABdhPJz+EnEtdlsIy9dnMqFENsfi2yM5N7tbJ9Hj1Iht+h6SFBydHWolNKH2FPE4uwkGjBxQdXBxaQ==
X-Received: by 2002:aed:3b72:: with SMTP id q47mr2051233qte.347.1601767483069;
        Sat, 03 Oct 2020 16:24:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id a52sm4343504qtc.22.2020.10.03.16.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 16:24:42 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kOqtN-0075j4-EX; Sat, 03 Oct 2020 20:24:41 -0300
Date:   Sat, 3 Oct 2020 20:24:41 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201003232441.GO9916@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
 <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
 <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Oct 03, 2020 at 03:52:32PM -0700, John Hubbard wrote:
> On 10/3/20 2:45 AM, Daniel Vetter wrote:
> > On Sat, Oct 3, 2020 at 12:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
> > > 
> > > On 10/2/20 10:53 AM, Daniel Vetter wrote:
> > > > For $reasons I've stumbled over this code and I'm not sure the change
> > > > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > > > convert get_user_pages() --> pin_user_pages()") was entirely correct.
> > > > 
> > > > This here is used for long term buffers (not just quick I/O) like
> > > > RDMA, and John notes this in his patch. But I thought the rule for
> > > > these is that they need to add FOLL_LONGTERM, which John's patch
> > > > didn't do.
> > > 
> > > Yep. The earlier gup --> pup conversion patches were intended to not
> > > have any noticeable behavior changes, and FOLL_LONGTERM, with it's
> > > special cases and such, added some risk that I wasn't ready to take
> > > on yet. Also, FOLL_LONGTERM rules are only *recently* getting firmed
> > > up. So there was some doubt at least in my mind, about which sites
> > > should have it.
> > > 
> > > But now that we're here, I think it's really good that you've brought
> > > this up. It's definitely time to add FOLL_LONGTERM wherever it's missing.
> > 
> > So should I keep this patch, or will it collide with a series you're working on?
> 
> It doesn't collide with anything on my end yet, because I've been slow to
> pick up on the need for changing callsites to add FOLL_LONGTERM. :)
> 
> And it looks like that's actually a problem, because:
> 
> > 
> > Also with the firmed up rules, correct that I can also drop the
> > vma_is_fsdax check when the FOLL_LONGTERM flag is set?
> 
> That's the right direction to go *in general*, but I see that the
> pin_user_pages code is still a bit stuck in the past. And this patch
> won't actually work, with or without that vma_is_fsdax() check.
> Because:
> 
> get_vaddr_frames(FOLL_LONGTERM)
>    pin_user_pages_locked()
> 	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
> 		return -EINVAL;

There is no particular reason this code needs to have the mm sem at
that point.

It should call pin_user_pages_fast() and only if that fails get the mmap
lock and extract the VMA to do broken hackery.

Jason
