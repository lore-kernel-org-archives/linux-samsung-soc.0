Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC66C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 19:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BF0720704
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 19:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HhJHYDe4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgKDTC0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 14:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730386AbgKDTCR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 14:02:17 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A26BC0613D3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2020 11:02:16 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id t5so4404447qtp.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2020 11:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/UKgc10BslmqBEq+jaLxahr/MEdpryS7jFqE+Dnr3vI=;
        b=HhJHYDe4YHd+/a56BdoqnLrywV6UfuBf/DsyHbP4QvtBlGMcnvi67aThLz1LQnQ9C7
         8EemYt7CTkS9B+W9jO8pXOPnbTizt3Pe9397JG9VN2ZMIG13OJgH9kNFKGqXLgoE3Hzj
         V1vv8lw5Pa9YVxFQjZfe4EOFce5bInYTuWldtvqSVrDDdmTUopOFroR+gBfYNDg6Uuau
         3Jp2luUDv74e1JR/3SaJIovsmPrALIHM4h9v9NFcni+HQF+v8Dr91QTVCCYUEOxMud09
         LLulIis0YmYr2jolcahGS2sbLtv9wbZ7FKZV2VUnjcWsESvH7Lm4q6CoSzm/SgrhfDUT
         xwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/UKgc10BslmqBEq+jaLxahr/MEdpryS7jFqE+Dnr3vI=;
        b=TdAWbT0rq88+JhGngzsloH4M6Fg9E6fdzOt4/scLKie6TKnLJlmtsLO9y3ATCQrjP7
         keW9Rt2fYpKeEzM+hAvc/WBbszgk24b151GAiiDk4C1N1GHDLR3EB9R0wHqxjw7Rstle
         CVBxqNiCi+eM99KBc/3ih9kaZ/G+B15x4jXYygkm/b71skcltmHRBD7g4+rSDk9irAgu
         L3OdWlLlY1Zv5aRakVBJoXIxLqigbPdPhZO+pkLMLwVxRCiL7qE6OsFK+1vUSb5Eqz++
         9XuC0OgnSJXBm3okUzKKmRHRMBeEI9f/1IwIVbalGtXnIi4VVJLcXUjvUAvIVxLRVAAJ
         Pmqw==
X-Gm-Message-State: AOAM531a464DGViqM7K7VpGF6AEM8SSsx3hSQk31scU68LfEupQukKdS
        zS2CJrMuWjNNm2biCTe6O5NMJQ==
X-Google-Smtp-Source: ABdhPJx0R0pt2rE5Fh6PKobat9BHCWAKjXRAimq+VPJpufi8x0s4Mnx78kA46TVhPrgcaUAjwr3r5w==
X-Received: by 2002:ac8:5948:: with SMTP id 8mr20543496qtz.215.1604516535414;
        Wed, 04 Nov 2020 11:02:15 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id h9sm710672qth.78.2020.11.04.11.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:02:14 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kaO2w-00Gbbx-2K; Wed, 04 Nov 2020 15:02:14 -0400
Date:   Wed, 4 Nov 2020 15:02:14 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
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
Message-ID: <20201104190214.GW36674@ziepe.ca>
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
> > 
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

I saw that once and I really couldn't make sense of it..
What use is having futex's that only work on THP pages? Confused

CH said there was no case of HAVE_FAST_GUP !ARCH_HAS_PTE_SPECIAL, is
one hidden someplace then?

Jason
