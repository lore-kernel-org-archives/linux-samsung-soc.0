Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFB5C55179
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 15:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48B812225B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 15:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hqSP56nc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgKBPxB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 10:53:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgKBPxA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 10:53:00 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97685C061A04
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2020 07:52:58 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id d1so5706940qvl.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2020 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f4bAkyYQ5JW+w3wAB0B3Wuqs9gDAq+dCKVKb1szgdTE=;
        b=hqSP56ncN1Xesc0LR+LCBrLcoSGV6TopG9RG3GGTAjXZawK07x4FedOxx8+KwVozhh
         yTaXjjMacA7HSrB+GRFpwykUXEgHjYuiJRUfTBK6bxwzQkDVZZxpNeA6oR5zy06hcsRr
         +OWzKfZs32d+rXtNU6sG16vNSbBVRNjen0md3oJEh5m3qEuLJBFDAZd22drwYUhFMUM8
         jihAo1Zpdxicjpm3k0zP51jRIixb81HpWfJ8CKClqtFak5XKxto5Xo7s7pUz3s+srShN
         1BUfFqWebwl5tOah1zDSpMj6M1bL9GXyO8wQDz9s59OVdbT9CJgBaBWOD1bIDFUY/B+7
         N2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f4bAkyYQ5JW+w3wAB0B3Wuqs9gDAq+dCKVKb1szgdTE=;
        b=cozE6a0f3/c+c+4EkHYiAkcSckL36Bx+73oKkLSHnuXkd+QIAHUP9mK0o3pidBPGv6
         PjOTM4NKV5zjR0QmFvL0ZJxRxzn/huzKaH3bhE6OPXpybfMMtqGjUsxb4bvHdx8C7B6h
         oY8gC8u9sDhib4+mqWA5nvPBKtlCN5q5JLSuFLwHerzPnsXXkZT1sQKGd8nTdXwy/hLv
         12FJERZh/t0XPXO1FRckYDEFEP1+RxnWZGmQ/s4bWDlpUs5FhXqfrxEQH/U7C/bdF43H
         nwafZqSz2z/lAhZBV4/R6aXmXAA47vxVrdKY0SFjeBSoA0S9ynbcmBpjKIkSSqPvaVuQ
         aXfg==
X-Gm-Message-State: AOAM5318qgubK10OG7CSasGGUst9tIbp4wanf78tuXHMAY4doI+iQcTV
        UBNo7Fsm3GxbqdpFk8kQY8+RYQ==
X-Google-Smtp-Source: ABdhPJywaNhw5aFpN/pYIk6/MJ/bkf/gh0tZ3udL0VlE8QqDUlZAs/BeSFGHSpJn56VGOhuQYMqcFg==
X-Received: by 2002:a0c:a261:: with SMTP id f88mr23351432qva.56.1604332377746;
        Mon, 02 Nov 2020 07:52:57 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id v92sm8169357qte.33.2020.11.02.07.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 07:52:56 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kZc8e-00F975-6s; Mon, 02 Nov 2020 11:52:56 -0400
Date:   Mon, 2 Nov 2020 11:52:56 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        J??r??me Glisse <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
Message-ID: <20201102155256.GG36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
 <20201102130115.GC36674@ziepe.ca>
 <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 02, 2020 at 02:23:58PM +0100, Daniel Vetter wrote:
> On Mon, Nov 2, 2020 at 2:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Nov 02, 2020 at 01:56:10PM +0100, Daniel Vetter wrote:
> > > On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > >
> > > > On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > > > > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > > > > that by drivers/modules is together with an mmu_notifier, and that's
> > > > > all _GPL stuff.
> > > >
> > > > I also think it also needs to be renamed to explicitly break any existing
> > > > users out of tree or int the submission queue.
> > >
> > > Ok I looked at the mmu notifier locking again and noticed that
> > > mm->subscriptions has its own spinlock. Since there usually shouldn't
> > > be a huge pile of these I think it's feasible to check for the mmu
> > > notifier in follow_pfn. And that would stuff this gap for good. I'll
> > > throw that on top as a final patch and see what people think.
> >
> > Probably the simplest is to just check mm_has_notifiers() when in
> > lockdep or something very simple like that
> 
> lockdep feels wrong, was locking more at CONFIG_DEBUG_VM. And since
> generally you only have 1 mmu notifier (especially for kvm) I think we
> can also pay the 2nd cacheline miss and actually check the right mmu
> notifier is registered.

Need to hold the lock to check that and there are two ways to register
notifiers these days, so it feels to expensive to me.

CH's 'export symbol only for kvm' really does seem the most robust way
to handle this though.

Jason
