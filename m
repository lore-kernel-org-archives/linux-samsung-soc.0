Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E202C55178
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 17:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB2FE21D91
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 17:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OzpU9SvL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgKBRQn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 12:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgKBRQm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 12:16:42 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C866C061A48
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2020 09:16:41 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id r7so12162730qkf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2020 09:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nOooqOL2HAfCzA3WbZS617x/HCXK3f8ujSR4To+U+xs=;
        b=OzpU9SvL4LQMiSZU+/wC8SOY7Kd5nwVlGSTQjG9d88TeMJ4WpFyipjmaUdp1TxOYVn
         7vidwyiSRCZj33RSLCqu0pXEDxMU/dAAoukKMfQfZuIAjtLdwwP4N2zY3W8B92Z6AwFE
         OTED+BMjliDXrbRWrDsPovc1pCXjBe20TOvquBC1aoMM7tLd9pJLJZOtf/olLrbdulv4
         wmYRU9+3HhHbwX4F5ELPi2SPcx5nfQMbB/P20GVamTcL6w1vdCvhRKxx/L/E22ILoMnS
         rmp9SSiTbFRAYQDj9HHFQ8bEOTeAHdVsxV9Tfe2mGZkEyeAYsnLrRuqy6EC2kl3h/BMa
         5ZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nOooqOL2HAfCzA3WbZS617x/HCXK3f8ujSR4To+U+xs=;
        b=kPylm/nssAmagmJg6LAcWcBF7NyLozKq+8oeLdrePDC8lL9s28yaLTYQGUSsP5rbF4
         Colep2Tf1f9Fla+Nl8l07+Greqq07pHBPYjtbIT8ZJETpd45wKojISo3CcGmGX2tISU3
         FygV0mSYYu3qfpEzq+yxYnz8afe6BFzplpDaCAbV9DlEOoiuhHuYlAGccwqQ4bjbp3zy
         JIZtupRPO6GQsUgd47u7wGLbIFwLSVJWEum7sVHwfMFQi+b+qqy7w3kIMrY2BwY/4Or4
         nsPyf7l1dtgvXgG+qKe5S27U1OS3hR2CYy+DwwmJmCkDnEIU4IJ6VwpKeZRE4eoPXO0l
         81xw==
X-Gm-Message-State: AOAM532KLqYH5OCJ/UdeHcV5KVHmHvP7LRtKYKnRuHAxOgsarkdb+dad
        zu2SymBUjpgtOv0DoYJVtCaFAw==
X-Google-Smtp-Source: ABdhPJzKAXEdRCm0W3ToJIDRDSewKlEjp6I2L8WD4tRBCiFlVxj0ALakWiSn3a8Exau8avpdo4ShfA==
X-Received: by 2002:a37:f503:: with SMTP id l3mr6457698qkk.160.1604337400730;
        Mon, 02 Nov 2020 09:16:40 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id c76sm8677260qkb.20.2020.11.02.09.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 09:16:40 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kZdRf-00FI9F-Az; Mon, 02 Nov 2020 13:16:39 -0400
Date:   Mon, 2 Nov 2020 13:16:39 -0400
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
Message-ID: <20201102171639.GH36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
 <20201102130115.GC36674@ziepe.ca>
 <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
 <20201102155256.GG36674@ziepe.ca>
 <CAKMK7uFqkieBAXEmoeoBfnJBXcuHaNwrsaVyPsLQaXnrJo=scg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFqkieBAXEmoeoBfnJBXcuHaNwrsaVyPsLQaXnrJo=scg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 02, 2020 at 05:42:20PM +0100, Daniel Vetter wrote:
> > Need to hold the lock to check that and there are two ways to register
> > notifiers these days, so it feels to expensive to me.
> 
> Uh I mixed stuff up all along, struct mmu_notifier *subcription that
> all the mmu notifier users use has the ->mm pointer we want right
> there. That's good enough I think.

Yah, if you can pass in one of those instead of the raw mm it would be
fine

Jason
