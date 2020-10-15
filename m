Return-Path: <SRS0=zMHd=DW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D42C43467
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Oct 2020 15:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CC2322273
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Oct 2020 15:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jiwyZuJU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389708AbgJOP3S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Oct 2020 11:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389697AbgJOP3R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 11:29:17 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46ACC0613D4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Oct 2020 08:29:17 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id w7so807200oow.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Oct 2020 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LJwfZvZzZbL3U3dsefi4j72Jm0TppMPnsxaVcVl6iT0=;
        b=jiwyZuJU82zqfM3xXQZkNpewO6fCkqA7igabDZ79l9dEml7MlNt9/W6KspOKdTFMBv
         l0ZZKLNyCyInH/bWkyXoNA3+A+JhbIMgDBR1thG0QOHKB4hsUrxgAlsNauv981ymHMte
         aG33qVap5atzCP8H/NRFqSDXso79lnD2nYDfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJwfZvZzZbL3U3dsefi4j72Jm0TppMPnsxaVcVl6iT0=;
        b=mMmtLKOzHaisDP7pdd46+MoUMtNax1HnCebP93olZU4lIEGCLIu1S86qCOu0U5xGy/
         o+U2hCXo8ImGK3Ii/R0exQt4bwp53rGCX/80373PrYmFop/xCX6+K7yUj3CItAYHLzpE
         M8bys24ElcctxrIXJtrpulNrclzS4aRoe7URk4U8zGYcsI2/3BSkI3pY+08thTIKNjA+
         PE7OgRZOKi8qN6+jmOX3CUGyuBP/I/0GXmLhU+0Uf1PjBFqpmJB+08Br90c9HFShFu8B
         EZx1r5U4oTiO4MHicZRP+HUmX+ypS7N3UCCrgph8BPW52QC4lYiBqaMYSsi6Y4NXHHFO
         3oDg==
X-Gm-Message-State: AOAM531xdi+9XIszsNub7qs9+Jpm73jh1mEuW+GzK3KsizWG8O7HSQtO
        MZFwBsZpSx+4ZpOnkBbeywfoXYrJ1cAH0hnWrszo8A==
X-Google-Smtp-Source: ABdhPJwHGqKFcBCVEj4Z9lD8mpPIRoQJxs6gS7mqbJLVOqKjzGL3o2Yivo5QSuS7JTOQT9EJ/KzY1r55eHOicMya4wY=
X-Received: by 2002:a4a:e1d7:: with SMTP id n23mr2788554oot.85.1602775756786;
 Thu, 15 Oct 2020 08:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch> <20201009123109.GO5177@ziepe.ca>
 <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
 <20201009143209.GS5177@ziepe.ca> <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
 <20201015000939.GD6763@ziepe.ca>
In-Reply-To: <20201015000939.GD6763@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 15 Oct 2020 17:29:05 +0200
Message-ID: <CAKMK7uGeVzbe3=FR=a5MEfzDsrog6D4+Bkiaj8FrVeOLu3-9Mw@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource framework
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
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

On Thu, Oct 15, 2020 at 2:09 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 11:28:54AM -0700, Dan Williams wrote:
> > On Fri, Oct 9, 2020 at 7:32 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Fri, Oct 09, 2020 at 04:24:45PM +0200, Daniel Vetter wrote:
> > > > On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > >
> > > > > On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
> > > > >
> > > > > > +struct address_space *iomem_get_mapping(void)
> > > > > > +{
> > > > > > +     return iomem_inode->i_mapping;
> > > > >
> > > > > This should pair an acquire with the release below
> > > > >
> > > > > > +     /*
> > > > > > +      * Publish /dev/mem initialized.
> > > > > > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > > > > > +      */
> > > > > > +     smp_store_release(&iomem_inode, inode);
> > > > >
> > > > > However, this seems abnormal, initcalls rarely do this kind of stuff
> > > > > with global data..
> > > > >
> > > > > The kernel crashes if this fs_initcall is raced with
> > > > > iomem_get_mapping() due to the unconditional dereference, so I think
> > > > > it can be safely switched to a simple assignment.
> > > >
> > > > Ah yes I checked this all, but forgot to correctly annotate the
> > > > iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
> > > > Add missing memory barriers for devmem_inode").
> > >
> > > Oh yikes, so revoke_iomem can run concurrently during early boot,
> > > tricky.
> >
> > It runs early because request_mem_region() can run before fs_initcall.
> > Rather than add an unnecessary lock just arrange for the revoke to be
> > skipped before the inode is initialized. The expectation is that any
> > early resource reservations will block future userspace mapping
> > attempts.
>
> Actually, on this point a simple WRITE_ONCE/READ_ONCE pairing is OK,
> Paul once explained that the pointer chase on the READ_ONCE side is
> required to be like an acquire - this is why rcu_dereference is just
> READ_ONCE

Hm so WRITE_ONCE doesn't have any barriers, and we'd need that for
updating the pointer. That would leave things rather inconsistent, so
I think I'll just leave it as-is for symmetry reasons. None of this
code matters for performance anyway, so micro-optimizing barriers
seems a bit silly.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
