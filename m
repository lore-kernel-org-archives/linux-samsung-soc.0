Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D167C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 23:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28853206CB
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 23:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WQTRkabU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgJEXlH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 19:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgJEXlH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 19:41:07 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F19DC0613A8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 16:41:07 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id de3so2562745qvb.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2020 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=leFIXUGGn9SrvRUt+tSmZlGo2xUCkAybN0CLyh7hEVg=;
        b=WQTRkabULDUNXgUOMkqWCf8k/DuyDViVSLHiUwqLBS7jFU4O4kB9U8Yezw3zLkcX+0
         N74emMID/Nf/tIrzUG3xn5IudsmLDLLSfJSFNjC86EZW2YCNxrAJ6Va1u5MyccDsjLiF
         PgIrU2vJ9V3he09nNerOKw2ijrvUXY3LxxxlUgWu78keT9R0r1XG2jEorE9lghUJYBq0
         HDLVZIOGBufu8D7pIs8xJwLhuITDMBS+p/adlJyEPM0KYtmP3MPKnG7vX+ZYICLgx/+H
         9Y3UojthIzYzht7NXCY0SCY8mLxjKGEXcgRu9Wjs6CR48TRqBN9ftH6xE+L/pIZNkLOu
         J6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=leFIXUGGn9SrvRUt+tSmZlGo2xUCkAybN0CLyh7hEVg=;
        b=lpK9+MhHdwoZJs+oxXrfg8IP8J9bg6SjW5WgCV8X5g1Tt4Iiqf2wrobZQmS+jdvkcv
         Bdoh7xAm2mFpgE3DE9WLqbHXXUWyDf0YUQwpKaY+ctZHv0EaqJHQzXsZ+pMBS8FFan/V
         Xzdzj1Vi89fZ5Zd3q+7dC8cnTM2QrztscSdvH4YvrFqWKEhuz8brFdNQW9jafs73F723
         GT6fzI0w5jgQMN6wP1R1x+0YtJJRlH7JGBV3n0trI5o7nhb2rS+wBNzBvctd9F/PTVl8
         OYTySuoKX/rVqqhplMeVsGhysIlaZoltK+oFy60I1cerXNM91KwbQ0aNUCdmNRMx+aXs
         Imlw==
X-Gm-Message-State: AOAM531XN71P9GOB9pJzhMXlZQ3LlfwwbSyM4XN7TGCWle51ZfNnfaRK
        t+BkFAe1ZiMBLPTWScahKzZu7A==
X-Google-Smtp-Source: ABdhPJyH6Hj9DkTwkBpIGRlKmZqLkjKrSkdKR0kLJjsKJY55CJeobeIMUeExf41YR/ICDJqmfiJ9Hw==
X-Received: by 2002:a05:6214:136f:: with SMTP id c15mr2074483qvw.57.1601941266028;
        Mon, 05 Oct 2020 16:41:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id v30sm1069485qtj.52.2020.10.05.16.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 16:41:05 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kPa6K-000DCJ-94; Mon, 05 Oct 2020 20:41:04 -0300
Date:   Mon, 5 Oct 2020 20:41:04 -0300
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
Message-ID: <20201005234104.GD5177@ziepe.ca>
References: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca>
 <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
 <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 06, 2020 at 12:43:31AM +0200, Daniel Vetter wrote:

> > iow I think I can outright delete the frame vector stuff.
> 
> Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
> which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
> not a carveout, we can't get the pages.

If CMA memory has struct pages it probably should be mmap'd with
different flags, and the lifecycle of the CMA memory needs to respect
the struct page refcount?

> Plus trying to move the cma pages out of cma for FOLL_LONGTERM would
> be kinda bad when they've been allocated as a contig block by
> dma_alloc_coherent :-)

Isn't holding a long term reference to a CMA page one of those really
scary use-after-free security issues I've been talking about?

I know nothing about CMA, so can't say too much, sorry

Jason
