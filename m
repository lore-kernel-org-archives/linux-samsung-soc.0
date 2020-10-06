Return-Path: <SRS0=VHj3=DN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D56C4727D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Oct 2020 12:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 882EF20760
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Oct 2020 12:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SN4g7TUI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgJFM07 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 6 Oct 2020 08:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgJFM06 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Oct 2020 08:26:58 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C621C061755
        for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Oct 2020 05:26:57 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id v123so16352527qkd.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Oct 2020 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xBjl3ijOtmAZHKFY2Q8VHDVWCHXszRzYVrHWQVZx7Tk=;
        b=SN4g7TUIcZiG8gkjZ1H/2y7nSkf/356q8TN46sZv42cMGw257ggPHqEIxcAVaP+JLI
         3COaYblkwqSkvZ3VvGo2aUITxO8n/evEej4R7WiuDd7vx54iTJcM3rODUcbY6fWaVTW4
         EVA/uoMKZADbRpGktJwSEyKjfdPmW4OZ5Pgj9gbyiUAeVG9BSCNrYKIVLMh5QYABE1hs
         w1jTd6DwqzNWx+JVVeImewGQMVDM8zVSKQkPPfvZMzsDUJL1mfqV3Q9BDqZ118Hyt26G
         gkZ1HAOD9Z0OMFKclpgVIarkGX2NI41znNb9Xowm3HI01KbpOjvjgZDdADe5bWIp/JNN
         qaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xBjl3ijOtmAZHKFY2Q8VHDVWCHXszRzYVrHWQVZx7Tk=;
        b=VWOoW9ttrWppHiw0g2vyP7A6wl/PE7O1N/NZtfRZyL32zTdI8ofiryyK3E8WcxnV+V
         N0HpwB0R70AFHS2MTr4zg56NZggGzzVTb/Ff+Q0eu3CCQKVRJW/BN+06v2SSvFdVW0jD
         AbF1Ph2RV3amfV1ToAiTg6B+aYMqCoby778mpqnhQt5SndWEJuql2Qm84nLGKEi0V3hX
         cRETHaoV71EWGxfBS+Kdu04WgMn7Gqc48FSvEMP7bP+LI0SZK7HYBK0BuXwxsAjeltMV
         waInUOMbmNrPIA0gLTQWP0wH8cNEJBphxb8nR93gpQNp4wWQzIAdM2uQXpzjwFJcJ6SK
         VF8w==
X-Gm-Message-State: AOAM533MGnj7l+G5WnYR4CllXTikswbF2PeE7l1RTJdnN+Qu9kxFjrx5
        xpR56r9/dRb/MDWQ/kfsDLj+bw==
X-Google-Smtp-Source: ABdhPJw5uBK6Jg1qFL06jjeM7TFRlowFnJJ0b29ROqLVECyy9T+v9Aj67lt6n4PC1ZTOH3f53Rrkvg==
X-Received: by 2002:a37:2c06:: with SMTP id s6mr4947152qkh.55.1601987216328;
        Tue, 06 Oct 2020 05:26:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id m67sm2358458qkf.98.2020.10.06.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 05:26:55 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kPm3T-000W9Y-2O; Tue, 06 Oct 2020 09:26:55 -0300
Date:   Tue, 6 Oct 2020 09:26:55 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201006122655.GG5177@ziepe.ca>
References: <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca>
 <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
 <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
 <20201005234104.GD5177@ziepe.ca>
 <CAKMK7uHt=kD=njZvMULy-k-bY4emn=u8__t7etQDq3_WUL7VAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHt=kD=njZvMULy-k-bY4emn=u8__t7etQDq3_WUL7VAw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 06, 2020 at 08:23:23AM +0200, Daniel Vetter wrote:
> On Tue, Oct 6, 2020 at 1:41 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Oct 06, 2020 at 12:43:31AM +0200, Daniel Vetter wrote:
> >
> > > > iow I think I can outright delete the frame vector stuff.
> > >
> > > Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
> > > which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
> > > not a carveout, we can't get the pages.
> >
> > If CMA memory has struct pages it probably should be mmap'd with
> > different flags, and the lifecycle of the CMA memory needs to respect
> > the struct page refcount?
> 
> I guess yes and no. The problem is if there's pagecache in the cma
> region, pup(FOLL_LONGTERM) needs to first migrate those pages out of
> the cma range. Because all normal page allocation in cma regions must
> be migratable at all times.

Eh? Then how are we doing follow_pfn() on this stuff and not being
completely broken?

The entire point of this framevec API is to pin the memory and
preventing it from moving around. 

Sounds like it is fundamentally incompatible with CMA. Why is
something trying to mix the two?

> This is actually worse than the gpu case I had in mind, where at most
> you can sneak access other gpu buffers. With cma you should be able to
> get at arbitrary pagecache (well anything that's GFP_MOVEABLE really).
> Nice :-(

Ah, we have a winner :\

Jason
