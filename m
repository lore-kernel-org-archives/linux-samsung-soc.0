Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D526C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 18:29:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6B6422284
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 18:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="iLTsuWlJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390413AbgJIS3H (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 14:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388092AbgJIS3H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 14:29:07 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C03CC0613D2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 11:29:07 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id t20so4043645edr.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oVIvf//qjy+hkVJdi59awFrM6IZJ9JvpO2cbPx+MdNs=;
        b=iLTsuWlJpjQ9lEPve4/i/wPKY7/WDc/EpLX4/nS4Vs7XATh36CjNusW0cAwcZzYVKB
         zc2lO4Dz7JRsbYqzp49bDWt7Nj2zjd+nQ3ChgcqgyusxmNzv8xBi0X9an51ub82xSMED
         ypIlohpfnHirbuqkE/mXCCbfP8pd5KhfDsovroGKCzUs8q45yo4Fd6/w1fPvA40p9Zsk
         Fhj1k3kJxsDCiab+2o7o95nm9iELSt9Olz0BwNfHJpYbcdvZw4q4VKPfH3rzH+ZSLvin
         8ENlmZNYLWdWLsvLquEHYWK2U/S9AfZj3u8X6XmfQJoqlt/05+soeGykQWGSaZLnN0RZ
         i9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oVIvf//qjy+hkVJdi59awFrM6IZJ9JvpO2cbPx+MdNs=;
        b=JA+XKDNFr37s1/D0mwE95kvSUc5YCTFZP31Sry5wJ+iV20XkScXfxvLgP9TJdggq8W
         SpC9mWhbbWucIrVoK5YP6yH8471VwLf0liPbXjIGsTyyFP6LGwTLnorzZlMVN9rKQKvv
         Uo9OKWzjUQhf36+tUuVFRDqYBf6lKZFpnusXLeh9x8D2Ocr2xvQ1u1VJLraMDX81eToy
         GAY3NTkvCYdqZX9AOulsaUW8xeyCDWddke1FDcXNP7xKAh802tgZ4909uWMN29fIA6eb
         QB8xduDjCDkQlnWE6MbYboVD9blyXAbUZ2545yAM/P+oidFiM3/5v6ZhZhG4InWM0lFU
         UcEw==
X-Gm-Message-State: AOAM530dzc909J2tZ8z49C/8lI5gG1YYZlxQAZwp0PL4B3nrLaRx+BZL
        cz/bczyTrooUMHuMWFXwPyj6hnfiRKE/Kag2wJ1fqw==
X-Google-Smtp-Source: ABdhPJzWk7BhJg0T57QGadQcytTP33YarvnD8YMhqI7SBWAAOvIcMevxnSHZgp/bJXzdV8lpWps/qAzI6LdBImluO+E=
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr559132edf.18.1602268145655;
 Fri, 09 Oct 2020 11:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch> <20201009123109.GO5177@ziepe.ca>
 <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com> <20201009143209.GS5177@ziepe.ca>
In-Reply-To: <20201009143209.GS5177@ziepe.ca>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 9 Oct 2020 11:28:54 -0700
Message-ID: <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource framework
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
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

On Fri, Oct 9, 2020 at 7:32 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 04:24:45PM +0200, Daniel Vetter wrote:
> > On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
> > >
> > > > +struct address_space *iomem_get_mapping(void)
> > > > +{
> > > > +     return iomem_inode->i_mapping;
> > >
> > > This should pair an acquire with the release below
> > >
> > > > +     /*
> > > > +      * Publish /dev/mem initialized.
> > > > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > > > +      */
> > > > +     smp_store_release(&iomem_inode, inode);
> > >
> > > However, this seems abnormal, initcalls rarely do this kind of stuff
> > > with global data..
> > >
> > > The kernel crashes if this fs_initcall is raced with
> > > iomem_get_mapping() due to the unconditional dereference, so I think
> > > it can be safely switched to a simple assignment.
> >
> > Ah yes I checked this all, but forgot to correctly annotate the
> > iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
> > Add missing memory barriers for devmem_inode").
>
> Oh yikes, so revoke_iomem can run concurrently during early boot,
> tricky.

It runs early because request_mem_region() can run before fs_initcall.
Rather than add an unnecessary lock just arrange for the revoke to be
skipped before the inode is initialized. The expectation is that any
early resource reservations will block future userspace mapping
attempts.
