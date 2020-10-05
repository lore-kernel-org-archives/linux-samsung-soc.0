Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D9EC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 18:37:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD17420853
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 18:37:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="eN0A5e22"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbgJEShH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 14:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbgJEShH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 14:37:07 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182F5C0613A8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 11:37:07 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id c62so13125121qke.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2020 11:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u3J6AKxubCllq2Ls7jrnfIH9wJzGGs2W2keKyCoQZ+g=;
        b=eN0A5e22fGI+9D7L6SnBKQWwDKTGT6A2sP8lBv5ySLpbcmf3PfBbHF2iMutUZFpPlh
         w3htf6sVN26BUBiEQwMJl/9SKhV9wenSbaw0Ngblhz/K+BWlCmn4PDdP71seEGgKDhJn
         EI05euYmWOHnzyl0KxDqo544jd74Rcgi6WhiyS+2C4ZGYV3/oydMjKLmzfnF7Key+1Xw
         Ma93hb6+RGildfaRFvy5Y2VJL2Rc7rtFtIO56w2vrpHgDx7Atids/vghgSE0VBGyimgQ
         uvvUuJzw4EU0nPQywaCcIxKzFxDpSAFENlo/i0BFbsFA+61tMShgDjlQrWvTN2JFip4Q
         P6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u3J6AKxubCllq2Ls7jrnfIH9wJzGGs2W2keKyCoQZ+g=;
        b=mnoWPwWRVYdRNFwQG9ZJaTh/b8eLFntrFTr5GRVRZs8Q188/9pfYwGUDlDUDq12loN
         BHsBBGoSyKkyzzJ1O8xmqyl0MXSs8e55UenSEDWqv2OVQJ6cofsNMd4Gaug8IfzJpHSE
         41GEqOLGOmCu9Chm16J3wIX5IT+b9CraSIK9Y8d9D+FJtvsCW6ctM0eji2vLm9SM8Q3y
         84q41acDLamhnBO4pg5jJdey1aeBL2f1MEcPqNxS4KH6gkpLMSQJngDrA+dTynl3FJFz
         s35GHOaPhjlNPlKpOaKQmxI5TCbcQgJq6m3cz3ylELLfipibyaX/I6B4fUymYgHn9cvF
         /v6A==
X-Gm-Message-State: AOAM532XhBx8xoDHrFKpQC6hnwre4PnfErcNycxuefsrrTgE9iNKW14s
        PbvfZFvF03Qf/8xjkH5tWjOauA==
X-Google-Smtp-Source: ABdhPJyiYyJ6QGbYxkNE1y766DNr8LNQurJWOP4L2+ndFQuLZsD7R3NQL8Vs0Mi8tA3m1+v8usWh/w==
X-Received: by 2002:a05:620a:1266:: with SMTP id b6mr1396650qkl.371.1601923026236;
        Mon, 05 Oct 2020 11:37:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id d21sm387410qtp.97.2020.10.05.11.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 11:37:05 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kPVM8-0008jm-C7; Mon, 05 Oct 2020 15:37:04 -0300
Date:   Mon, 5 Oct 2020 15:37:04 -0300
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
Message-ID: <20201005183704.GC5177@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 05, 2020 at 08:16:33PM +0200, Daniel Vetter wrote:

> > kvm is some similar hack added for P2P DMA, see commit
> > add6a0cd1c5ba51b201e1361b05a5df817083618. It might be protected by notifiers..
> 
> Yeah my thinking is that kvm (and I think also vfio, also seems to
> have mmu notifier nearby) are ok because of the mmu notiifer. Assuming
> that one works correctly.

vfio doesn't have a notifier, Alex was looking to add a vfio private
scheme in the vma->private_data:

https://lore.kernel.org/kvm/159017449210.18853.15037950701494323009.stgit@gimli.home/

Guess it never happened.

> > So, the answer really is that s390 and media need fixing, and this API
> > should go away (or become kvm specific)
> 
> I'm still not clear how you want fo fix this, since your vma->dma_buf
> idea is kinda a decade long plan and so just not going to happen:

Well, it doesn't mean we have to change every part of dma_buf to
participate in this. Just the bits media cares about. Or maybe it is
some higher level varient on top of dma_buf.

Or don't use dma_buf for this, add a new object that just provides
refcounts and P2P DMA connection for IO pfn ranges..

Jason
