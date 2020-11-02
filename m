Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820FDC388F2
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 13:01:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27046223C6
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 13:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ir3GR39Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgKBNBS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 08:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728339AbgKBNBS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 08:01:18 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D85C061A48
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2020 05:01:17 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id b18so11303607qkc.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2020 05:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ywfiDbg6XCEWmoBx9eC29OtR/MyEWOW93XTelnAXaBk=;
        b=ir3GR39YhTRDVVIubqbd2b6fYJQqoYzGlGzQhJGPgx/IpIwERjn3x6j0FKgwPju8tJ
         K346RwtLd1HrF6IYofhsCSTJj3QK+10oMg2YllJh/KpA3n62CbFQnKL6ivWZ5KZSOniq
         QwLvLlA6x1j/aJc2hKzXChvGjpbbw6GWq/KNk/8R9NhESFTt0yrJ0KQKjkdmTuloLwW/
         Zwps2gbtqPniuVum2Pfu8S68SKxWxd0HMyfFBAbv4qCeVCCuOZxQnUab9RNI4DYrsJao
         v2N/I2zDZif6Md4+OJsi4IvpXjI5tOvsKPLa0IKjhrcIMk4ZoUB68GDdMIbIvaBwF1NM
         /xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ywfiDbg6XCEWmoBx9eC29OtR/MyEWOW93XTelnAXaBk=;
        b=ZVlVpCjX7WZfwuZJfcNMRVRc+TkHUwiexdO+5kTylNmPZVR3Qiq0ybuF5gfWER1dUk
         +P2eMQLPAVtBvQH4hSLjOHwvG0odVQ9bdvNyG/jpBlzsBbKyXwuhKvWW/TSmotNSRw6b
         25g+r41RAH2YysFKhwNwB68TwjTXLXMYadNJelSTWAW/eAL6bwECT9LZVM5ZlvetaRpn
         PbUMlOdpSKjbBWhVpEfWbgrXiFGOeygGrnTGHdUzZRCn5aldfAmSQ93+RKrqcVskMMP6
         jS3MQzFmngzfAAeZ6vDTj/rxRMxmdWX47JyLmvgohk/sWD6b+in6T2djKMq0WpodtKBE
         5LRw==
X-Gm-Message-State: AOAM530CeWd8H7uxDShcjtXInMjffBVuWDj3SEQUo8Xf/DBTfsSvCx8V
        iOcncYp2f4PMzsiSb5/emVFPtQ==
X-Google-Smtp-Source: ABdhPJzRrsH3Zfgny2Ycg3bBy2Q+SuhdpwI09cYL0ZnBVzwrgv7GmXDFxfx3kiLU2YMRfbo6u8i3PQ==
X-Received: by 2002:a37:8c41:: with SMTP id o62mr13561782qkd.240.1604322076971;
        Mon, 02 Nov 2020 05:01:16 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id b8sm7742829qkn.133.2020.11.02.05.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 05:01:16 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kZZSV-00EvRo-QJ; Mon, 02 Nov 2020 09:01:15 -0400
Date:   Mon, 2 Nov 2020 09:01:15 -0400
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
Message-ID: <20201102130115.GC36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 02, 2020 at 01:56:10PM +0100, Daniel Vetter wrote:
> On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > > that by drivers/modules is together with an mmu_notifier, and that's
> > > all _GPL stuff.
> >
> > I also think it also needs to be renamed to explicitly break any existing
> > users out of tree or int the submission queue.
> 
> Ok I looked at the mmu notifier locking again and noticed that
> mm->subscriptions has its own spinlock. Since there usually shouldn't
> be a huge pile of these I think it's feasible to check for the mmu
> notifier in follow_pfn. And that would stuff this gap for good. I'll
> throw that on top as a final patch and see what people think.

Probably the simplest is to just check mm_has_notifiers() when in
lockdep or something very simple like that

Jason
