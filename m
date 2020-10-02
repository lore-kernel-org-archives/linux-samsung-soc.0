Return-Path: <SRS0=6p2y=DJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F08DC47095
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 18:17:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7ABC20758
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 18:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="UroveKdE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388270AbgJBSRE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 2 Oct 2020 14:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388265AbgJBSRB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 14:17:01 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63C5C0613D0
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2020 11:16:59 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id a13so2227028otl.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2020 11:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3HxwxxjOyUFsHnvZd90so4n7HtMcvrp+2NDYk+teChw=;
        b=UroveKdEgKPvYhDgIRFBP6hGaOMHl0KhWjPmr7h+me9Xj+hsNqVEe+KzxfQ5R752mW
         Q39uBXtohsZOj34gGmK/hanyDQGQMTFvEwg1txwSCZatYOYvpHfVCUEfTc1tX+5qw+e4
         lhr2S+yleRha4sKjZin5W1q02Y1XO7J4/uNO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3HxwxxjOyUFsHnvZd90so4n7HtMcvrp+2NDYk+teChw=;
        b=gLfkynl16GMOWeUKpxv3EiLzaYe1+QfbtvzWeylXr9n2N0o1sAKdFn5rhpJQxeZXEG
         GNhaIUXsSURlUrXI0DLviKU3O6etpZN8wnqElNI4tv7RGLwZQifG8HiGPrwpiJfhWzmG
         BqEfoyubyeDA7nCIKLVTPhqY1NiiEuH1TkFx5wc5c/jEviEhTcgC/SaWI+ZzWrDFhfug
         iSR17rBj/2535tnJEkIwv4RxoiJ6wfywp/PzRTUjGRtlmbLws8WEp70jwcR02+84K02q
         vR6Ym3GYoPxxSiNv/MTlJse2TBR2kbvEFarBHMQV5aT/IldN9AguLk4kS30Ej4Yqj/vB
         fbSA==
X-Gm-Message-State: AOAM532+UHJrOGIZbiATA/r3eNH58jyWtxIkzQBu+4HktSo0dW5BjIKN
        w2DfVC4BknYpynv+MJ3xpYbmvb98uHF3j5Po7AKaOw==
X-Google-Smtp-Source: ABdhPJz/iLpxd0MKJvGez6uG++167T4Nd3ZEU24lIiueGBImWGdkODsxyKl+FpR0pn01MP2E0GHPOCfnbU7WfP4NbAY=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr2747483otf.281.1601662619231;
 Fri, 02 Oct 2020 11:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
In-Reply-To: <20201002180603.GL9916@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 2 Oct 2020 20:16:48 +0200
Message-ID: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 2, 2020 at 8:06 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Fri, Oct 02, 2020 at 07:53:03PM +0200, Daniel Vetter wrote:
> > For $reasons I've stumbled over this code and I'm not sure the change
> > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > convert get_user_pages() --> pin_user_pages()") was entirely correct.
> >
> > This here is used for long term buffers (not just quick I/O) like
> > RDMA, and John notes this in his patch. But I thought the rule for
> > these is that they need to add FOLL_LONGTERM, which John's patch
> > didn't do.
> >
> > There is already a dax specific check (added in b7f0554a56f2 ("mm:
> > fail get_vaddr_frames() for filesystem-dax mappings")), so this seems
> > like the prudent thing to do.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Hi all,
> >
> > I stumbled over this and figured typing this patch can't hurt. Really
> > just to maybe learn a few things about how gup/pup is supposed to be
> > used (we have a bit of that in drivers/gpu), this here isn't really
> > ralated to anything I'm doing.
>
> FOLL_FORCE is a pretty big clue it should be FOLL_LONGTERM, IMHO

Since you're here ... I've noticed that ib sets FOLL_FORCE when the ib
verb access mode indicates possible writes. I'm not really clear on
why FOLL_WRITE isn't enough any why you need to be able to write
through a vma that's write protected currently.

> > I'm also wondering whether the explicit dax check should be removed,
> > since FOLL_LONGTERM should take care of that already.
>
> Yep! Confirms the above!
>
> This get_vaddr_frames() thing looks impossible to use properly. How on
> earth does a driver guarentee
>
>  "If @start belongs to VM_IO | VM_PFNMAP vma, we don't touch page
>  structures and the caller must make sure pfns aren't reused for
>  anything else while he is using them."
>
> The only possible way to do that is if the driver restricts the VMAs
> to ones it owns and interacts with the vm_private data to refcount
> something.
>
> Since every driver does this wrong anything that uses this is creating
> terrifying security issues.
>
> IMHO this whole API should be deleted :(

Yeah that part I just tried to conveniently ignore. I guess this dates
back to a time when ioremaps where at best fixed, and there wasn't
anything like a gpu driver dynamically managing vram around, resulting
in random entirely unrelated things possibly being mapped to that set
of pfns.

The underlying follow_pfn is also used in other places within
drivers/media, so this doesn't seem to be an accident, but actually
intentional.

I guess minimally we'd need a VM_PFNMAP flag for dynamically manged
drivers like modern drm gpu drivers, to make sure follow_pfn doesn't
follow these?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
