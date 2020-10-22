Return-Path: <SRS0=b7Q7=D5=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312DAC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Oct 2020 13:04:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C75552417D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Oct 2020 13:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hFupg462"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899257AbgJVNEd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 22 Oct 2020 09:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899238AbgJVNE0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 09:04:26 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D101C0613D5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2020 06:04:26 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id f37so1377418otf.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2020 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZyNrxU7+apn6xOGNK6avkKI1+/ers9vOGia4XvYK0qo=;
        b=hFupg462AQWF/3SYEGt7TdCBz7vmVV24cGf5H3PsZJ3NHOF7ARTtk1Xj9pQ6xHZuZX
         osgTY+1RlCMoExun5CEMIKW0/Q22JFrGKszrr35SoM6z+n1XQ4DOZb0ztKWF8FqsQ0rj
         YYO9Ror43OTX+8WLAdJnTsM4HmBRXtLFYIBBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZyNrxU7+apn6xOGNK6avkKI1+/ers9vOGia4XvYK0qo=;
        b=h1shuD26hhZYylQ+FSWexum8MIwwD2re6u/oB5b8KQxDQb1I0P5MtXV97MzzHPN7Nk
         Zaqx35aynEdhXoSEkSKpHm0H/beRWS51MobN61dSTgykyITQeC2Uo5i/q4SQmi81t59Z
         kdnjv+O5SOF+M4SkOoh4F4y/WWVccwEVugrD/CLaseFfyvxbnQL7yMRNeA9n53gB8bbd
         +R6Bukl1IltM3c6Babi8UOVxezjHAPJlj/0GMvrkrHSidCcdDewmlwZKofFzhYLPzWe6
         OAKi0gV/cDY49/8UI+9N1GXe+v6msIMIbxdw951eXrpZ9AJxb/RogvDXlTCzJ7C7sHmj
         q6XQ==
X-Gm-Message-State: AOAM530S4QZ/gwNFjRoNY2w57e7CYzi6UEyQMzXkA3ewitBlkFWJE1wV
        SdfN9m/CHwxLx5LjxTm29Eb5Z1Yi2k2qnGVrR99VUg==
X-Google-Smtp-Source: ABdhPJx8bjchuHtk5X5j8AOy5uSsJ+M716njPCO+bint+3P1gD9xIsXgxoepgb7cnqWbI4FroPmfqz6vrX/g4fdQHsY=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr1916643otr.281.1603371865933;
 Thu, 22 Oct 2020 06:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch> <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
 <20201021151352.GL36674@ziepe.ca> <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
 <20201021163702.GM36674@ziepe.ca> <CAKMK7uEjE5sHUq0hV_bnYjPKRxYyBnty0sLre+owANGZjLJg9Q@mail.gmail.com>
 <20201021232022.GN36674@ziepe.ca> <CAKMK7uEkAK42+19KRo06XzJFuMCVriEEg0jxqXq8oAdt2ExLsQ@mail.gmail.com>
 <20201022114345.GO36674@ziepe.ca>
In-Reply-To: <20201022114345.GO36674@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 22 Oct 2020 15:04:14 +0200
Message-ID: <CAKMK7uHUufuyCXF5jUZG1zZ8SeaAFOi-9dA1sejc2R5fnLTJVA@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
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
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 22, 2020 at 1:43 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Oct 22, 2020 at 09:00:44AM +0200, Daniel Vetter wrote:
> > On Thu, Oct 22, 2020 at 1:20 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Wed, Oct 21, 2020 at 09:24:08PM +0200, Daniel Vetter wrote:
> > > > On Wed, Oct 21, 2020 at 6:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > >
> > > > > On Wed, Oct 21, 2020 at 05:54:54PM +0200, Daniel Vetter wrote:
> > > > >
> > > > > > The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
> > > > > > split that. So ideally ->mmap would never set up any ptes.
> > > > >
> > > > > /dev/mem makes pgoff == pfn so it doesn't get changed by remap.
> > > > >
> > > > > pgoff doesn't get touched for MAP_SHARED either, so there are other
> > > > > users that could work like this - eg anyone mmaping IO memory is
> > > > > probably OK.
> > > >
> > > > I was more generally thinking for io_remap_pfn_users because of the
> > > > mkwrite use-case we might have in fbdev emulation in drm.
> > >
> > > You have a use case for MAP_PRIVATE and io_remap_pfn_range()??
> >
> > Uh no :-)
>
> So it is fine, the pgoff mangling only happens for MAP_PRIVATE

Ah right I got confused, thanks for clarifying.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
