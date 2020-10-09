Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88985C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 14:25:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58CBB222C3
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 14:25:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="YLM0g/4o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388822AbgJIOY7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 10:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388338AbgJIOY6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 10:24:58 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F9CC0613D7
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 07:24:57 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x62so10342466oix.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4j8VU4wpGDl6YV4vbFDWVWHEZCZz4TBGhbt0uuUGdBg=;
        b=YLM0g/4oQLD0hu/Oa87scm3scHf+vbiPkLbDqUAnyXk3ER+QRam40zaijXvFBD6PRA
         nzSbXcW7hn805lQbe6AX68hG76VYbA+coTzGsCT/QWJIzeeROcYpI8QHsxV9QNKX8ew0
         Dn833fe+dPzpkngPWmhP7pgAZbKyHIAe+x52Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4j8VU4wpGDl6YV4vbFDWVWHEZCZz4TBGhbt0uuUGdBg=;
        b=AC+L1zwm0NWvdwTz8m/sb2v2E+xqy9rPdBWkpdu9Tx6Hujs/gnW1QxtoOqAD8IBx2R
         RPsf4ploI7DXmNCIe+40nnnj/LlquAMF0KYo+oERPgt7W0CS2yc1NDOuo3M0eqoZkI1l
         HdOP9Dpw0wY+f6Ei4bvjBUFty9CSdyuw9BKSW+wF6d5pexhaILOBGdv19+E/BbhZV1fr
         4w7BjYJSeWq7laVDbT4XvUUjrBbsdXvS243pEZ0Ub+7C4joy/lOKQXY+3m0GroLSgabg
         CNkrgUoYfWR3qpdPakGO+zd2Dz0ydok330v6fZocuzCY4Y0nvN35QyS3NBSgXXSd9We9
         01Zg==
X-Gm-Message-State: AOAM533BGLoX7SaLgQ1F26TiUsFBmHyDKxxTPb4KT5JbKHa74ZNfdoCk
        nlaXwsth0JaoUwz79gA17CIWraoUk+GjOnN/d4RJIQ==
X-Google-Smtp-Source: ABdhPJyHxT/6NZr88G54H2j+X8AAqjyafUNpDVmVkQQPYeZ/EXQjiOmXOOdqJRKMWvSSWVU71sVuY9YK0QkcwCetmpo=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2688783oib.14.1602253497033;
 Fri, 09 Oct 2020 07:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch> <20201009123109.GO5177@ziepe.ca>
In-Reply-To: <20201009123109.GO5177@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 9 Oct 2020 16:24:45 +0200
Message-ID: <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource framework
To:     Jason Gunthorpe <jgg@ziepe.ca>
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
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
>
> > +struct address_space *iomem_get_mapping(void)
> > +{
> > +     return iomem_inode->i_mapping;
>
> This should pair an acquire with the release below
>
> > +     /*
> > +      * Publish /dev/mem initialized.
> > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > +      */
> > +     smp_store_release(&iomem_inode, inode);
>
> However, this seems abnormal, initcalls rarely do this kind of stuff
> with global data..
>
> The kernel crashes if this fs_initcall is raced with
> iomem_get_mapping() due to the unconditional dereference, so I think
> it can be safely switched to a simple assignment.

Ah yes I checked this all, but forgot to correctly annotate the
iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
Add missing memory barriers for devmem_inode").

The reasons for the annotations is that iomem requests can happen
fairly early, way before fs_initcalls happen. That means revoke_iomem
needs to check for that and bail out if we race - nothing bad can
happen since userspace isn't running at this point anyway. And
apparently it needs to be a full acquire fence since we don't just
write a value, but need a barrier for the struct stuff.

Now iomem_get_mapping otoh can only be called after userspace is up &
running, so way after all the fs_initcalls are guaranteed to have
fininshed. Hence we don't really need anything there. But I expect the
kernel race checker thing to complain, plus that then gives me a good
spot to explain why we can't race and don't have to check for a NULL
iomem_inode.

I'll add that in v3.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
