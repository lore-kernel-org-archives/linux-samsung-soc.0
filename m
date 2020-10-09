Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EBCC433E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 14:32:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D83342225D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 14:32:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="j3fuCopb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389064AbgJIOcl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 10:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389024AbgJIOcL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 10:32:11 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2C6C0613D2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 07:32:11 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id d20so10748131qka.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=73DpVirPZ06c1n2mkJSkENlUc+TenafPYOh6N9YsRj8=;
        b=j3fuCopb7iniyL2y53HSklILSjdWqx7XXY5J7anSdWIzVAS51yHUg1bH+xWsQqV3an
         hVaIqQtPYG5XhAZxJubl7tnA+2dzIyrb1eABP/rsrrjt9Ddzi0d1WmSuwF0UQqwD1tgr
         69SltM6wnxkhZu8y4olirPc3PCASUILXSC5ua6+ynVuzP7VwBBECaBlnoZLOtcJNGGyr
         NOkdDPv6Ux3fvUs6FlZoAKLjSdk3YJbxq2oDe3QQYv1fkcF15D+45H8TBvKAbi8SeVAg
         F1hEOalHcniDpc4tE9aqUhgdNW4MqmHYSXYkxAhz5TsGfdhszvZtn/5ZEIEGhUQjLvR4
         psaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=73DpVirPZ06c1n2mkJSkENlUc+TenafPYOh6N9YsRj8=;
        b=oUNnsfXUCBQLsnWdBpZiTRWM73L8eO+NOR5iYfBzoJPh3LFuvHH/C6ZJXCA7OCNZjU
         NXE7b9WuLuEHbwJbi7pRTc8HCmzPqS50gNZqSTjCQEN9Y/FQb8SQj8Vntp9A8g5JQhjH
         dbTkNX8eHWNg0J7/5K8MnzkpIjgFGb+KVcUL0LNUZaiQnVA6qs93bzs0vcn1vbp9bJKg
         Zjsueoch5c7Eqir1RZE2Gvh2Tvm8VdQo2tskyZ4agrAadmzlSafBX//MFZ37CwiedKbF
         Lay3uMpU6hzVVIL88hY/M1UMbZD80YRq6C7P2MO1kxB1Fl3x3TySg2I2c1SZgqFMSmaY
         oW2Q==
X-Gm-Message-State: AOAM530WPXxxnf+m1MODHCM4q0+OyqZunc8Rg6QcXUTPJK7jZAs68tG+
        Hy+Yg/EgSbwxRuVA8FEFN9/z3A==
X-Google-Smtp-Source: ABdhPJzpwYy/97Cu1hz1/nj4gs64VmTlSZ35zli/9trR97tocuoZHHYGhTwRETY7JpaxNsFSCH9jrQ==
X-Received: by 2002:a37:4d95:: with SMTP id a143mr13781409qkb.248.1602253930622;
        Fri, 09 Oct 2020 07:32:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id r64sm6400897qkf.119.2020.10.09.07.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:32:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQtRJ-001zsY-G1; Fri, 09 Oct 2020 11:32:09 -0300
Date:   Fri, 9 Oct 2020 11:32:09 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource
 framework
Message-ID: <20201009143209.GS5177@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
 <20201009123109.GO5177@ziepe.ca>
 <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 09, 2020 at 04:24:45PM +0200, Daniel Vetter wrote:
> On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
> >
> > > +struct address_space *iomem_get_mapping(void)
> > > +{
> > > +     return iomem_inode->i_mapping;
> >
> > This should pair an acquire with the release below
> >
> > > +     /*
> > > +      * Publish /dev/mem initialized.
> > > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > > +      */
> > > +     smp_store_release(&iomem_inode, inode);
> >
> > However, this seems abnormal, initcalls rarely do this kind of stuff
> > with global data..
> >
> > The kernel crashes if this fs_initcall is raced with
> > iomem_get_mapping() due to the unconditional dereference, so I think
> > it can be safely switched to a simple assignment.
> 
> Ah yes I checked this all, but forgot to correctly annotate the
> iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
> Add missing memory barriers for devmem_inode").

Oh yikes, so revoke_iomem can run concurrently during early boot,
tricky.

> The reasons for the annotations is that iomem requests can happen
> fairly early, way before fs_initcalls happen. That means revoke_iomem
> needs to check for that and bail out if we race - nothing bad can
> happen since userspace isn't running at this point anyway. And
> apparently it needs to be a full acquire fence since we don't just
> write a value, but need a barrier for the struct stuff.

Yes, if that is what is happening it release/acquire is needed.

Jason
