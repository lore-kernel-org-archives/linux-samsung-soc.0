Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096E3C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Mar 2021 15:53:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3428650FD
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Mar 2021 15:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhCPPxW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237558AbhCPPw5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 11:52:57 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55928C06175F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:52:56 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id d20so38568501oiw.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H9qbH69IBoptMfn8E8EI/JvkYdGz2fb3BHGazwe2dlM=;
        b=N9EuUopTyLYmp/30v4PlCksqyqVrtHnmIWXaZ4XcHcyJlh/IKbvvrNQY1qfiH3e5Ee
         lelk1b8VUwFdD+q76VSpMaPnzL/lvIFOuKBCKDjInKV/GcppAeygsSyrgDsECt+95gH8
         4Hrr19JKU7qUT90Jqgp59LH0ykjG0DfXZI4HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H9qbH69IBoptMfn8E8EI/JvkYdGz2fb3BHGazwe2dlM=;
        b=UdzHzpKjrqtf7jGWi9L+hwo+kQiBIQlEoOX8dRTPNd0NeKVTa5mii1kNS0vXsI+Yx8
         6o1m7SekSllOUX5Z/jHi//VE1f8hYiFrCEpebwhy0P6qzThaRYl21FsBD93w4iGsIKPR
         /CU6Z1KVI2PQPURYNpjJ3Hd85IIeVBIX6MmdFAT3LGJ8PrUZZrcMLALK53Tcch3evLJK
         oHEOetw4KnDn3CYQWc2SQdQxK/TpXYWS1jkcKa3Cnds1Bkw4Lm2V0QIyaws4OP+mx+/f
         iIL6zelYGsl1uS6ozi6jMl6FPAlvfR/uBNe9P1mh/copcvuuIy3Rq0kMK3Vx30TrJce0
         3xfg==
X-Gm-Message-State: AOAM530N9qIJk5JsO5QDjPwWp7oW/JQ90AY7yi/kqmn1N/kqJb6xSQXI
        o25+8JO/MJuegoqplalCZvam7RCGyq6rU2MVCCNonw==
X-Google-Smtp-Source: ABdhPJznz2I6yaUfu5sapSxfaawTvDWTc4egwzJFTFOwI97d2Oq+qgjhGAyeojv1m2fr5BiGgMr/zgmA3/HTfQyhJ8k=
X-Received: by 2002:aca:4188:: with SMTP id o130mr152546oia.101.1615909975767;
 Tue, 16 Mar 2021 08:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-3-daniel.vetter@ffwll.ch> <20210316154549.GA60450@infradead.org>
In-Reply-To: <20210316154549.GA60450@infradead.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 16 Mar 2021 16:52:44 +0100
Message-ID: <CAKMK7uF8Lv0P4TuoctjUiVHtRzAnXf9a50JaYgm0rV+v+7=LFw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media/videobuf1|2: Mark follow_pfn usage as unsafe
To:     Christoph Hellwig <hch@infradead.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        "J??r??me Glisse" <jglisse@redhat.com>, Jan Kara <jack@suse.cz>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Mar 16, 2021 at 4:46 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Mar 16, 2021 at 04:33:02PM +0100, Daniel Vetter wrote:
> > The media model assumes that buffers are all preallocated, so that
> > when a media pipeline is running we never miss a deadline because the
> > buffers aren't allocated or available.
> >
> > This means we cannot fix the v4l follow_pfn usage through
> > mmu_notifier, without breaking how this all works. The only real fix
> > is to deprecate userptr support for VM_IO | VM_PFNMAP mappings and
> > tell everyone to cut over to dma-buf memory sharing for zerocopy.
> >
> > userptr for normal memory will keep working as-is, this only affects
> > the zerocopy userptr usage enabled in 50ac952d2263 ("[media]
> > videobuf2-dma-sg: Support io userptr operations on io memory").
>
> Maybe I'm missing something, but wasn't the conclusion last time that
> this hackish early device to device copy support can just go away?

My understanding is mostly, but with some objections. And I kinda
don't want to let this die in a bikeshed and then not getting rid of
follow_pfn as a result. There's enough people who acked this, and the
full removal got some nack from Mauro iirc.

Maybe if no bug report ever shows up for 1-2 years we can sunset it
for real&completely.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
