Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB566C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:38:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 689422087E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WN/T3qoj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgJ2Ji3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 05:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgJ2Ji3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 05:38:29 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F02C0613D3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2020 02:38:27 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id f97so1704288otb.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2020 02:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Egb29gKTqFSxWvJdyyI+gXsFyuWERrGbUzIe36GvMh0=;
        b=WN/T3qojfZLOiwWrcArWiy5sVDza4QAlNXW9uwA8epIyHde70y+LwP9IzcHYl+6ykJ
         TAk8UrMTzmau/HOuQondzD4ErZSwoLwV9gqj9wxMlA+Nc7EpAQq6Kw0NuRKGuGv3z2Q3
         wXk6V662Zo5+uF5oqJou8URYRaL/kPvUOFj5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Egb29gKTqFSxWvJdyyI+gXsFyuWERrGbUzIe36GvMh0=;
        b=KFES7tAGCfHYTuXHmKMkgpb49Bn2G6AUTrVbOS0mvjVzD1e39X/NS8+mzWBBuCDQBF
         ySl5VaUSqq7IH1iOoeG414lHSQVUqjLHkgKmV3pxUPXJhTonh3Qv3mS1pkdbaV6Ce2d/
         IMHSjwFII/3QNsBlKeiYkzxdFPUrXToXw+vyHwVZlUEq7ZXvefTAckXKRzktaLkNx6Gg
         IppZFNs3V+k6FZSXftrvJHbtDZkjAXBOPg23wTFZ9Q+0Cl0Ai3KGyuWYf+gv5iSGJjYP
         DkfWc1OrnJYEtIbSu4Apnta82Eo9+xVKkeIghQLuu3oHllg8njGqrV2LcmdN5oh1HquJ
         Wxog==
X-Gm-Message-State: AOAM533V1DJMlImJCqGV93aIxwA7s6q8Z+sSsFkLM0GAT96lPNusN2IG
        Wj6qQqRrO02wOhEWYLO8mg9kfUnh9lHGWHeJQVNWgA==
X-Google-Smtp-Source: ABdhPJx7W4rK7T8Tetk1+e1/J1/olWsPDBEjgbzX/L+3bK6RKH7lBWpMwtzMdyCSKSKNvm+bdKwtPXqJrc1sPDUR5+Q=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id f28mr2715883ote.188.1603964307018;
 Thu, 29 Oct 2020 02:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201029085749.GB25658@infradead.org> <CAKMK7uEV7sQ48w1Dd=WCY1r6LrY+aEq3ASnouOebQoo=Zr=CTQ@mail.gmail.com>
 <20201029092800.GA494@infradead.org>
In-Reply-To: <20201029092800.GA494@infradead.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 29 Oct 2020 10:38:16 +0100
Message-ID: <CAKMK7uG=R2372bVTK1Zh+P7uRd2QJSw5EgcJ6JJwVtNyJ7SJtQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] follow_pfn and other iomap races
To:     Christoph Hellwig <hch@infradead.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 29, 2020 at 10:28 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Oct 29, 2020 at 10:25:16AM +0100, Daniel Vetter wrote:
> > On Thu, Oct 29, 2020 at 9:57 AM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > Maybe I'm missing something, but shouldn't follow_pfn be unexported
> > > at the end of the series?
> >
> > kvm is a legit user and modular afaict. But since you can't use this
> > without an mmu_notifier anyway (or digging around in pagetable
> > locking), maybe it should be EXPORT_SYMBOL_GPL now at least?
>
> I think it should then take the notifier as an argument even if it isn't
> diretly used as a safety check, and get a new name describing it.

Hm so Jason and me discussed this, but e.g. the s390 is safe with with
just the pagetable locks. So we'd need two versions.

The more practical problem is that I haven't found a reasonable way to
check that a passed in mmu_notifier is registered against the mm we're
working on, and without that check it feels a bit silly. But if you
see how to do that I think we can do an EXPORT_SYMBOL_GPL follow_pfn
which takes the notifier, and an __follow_pfn for s390 and similar
internal code which isn't exported.

> EXPORT_SYMBOL_GPL is probably ok for now, but I'm drafting a new
> EXPORT_SYMBOL_FOR_MODULE() which will export symbols that can only be
> used by one specific module, with kvm being a prime user due to all
> the odd exports it requires that aren't really the kernel interface by
> any normal means.

Hm yeah that's another one. There's also some virt stuff that's
currently on unsafe_follow_pfn and needs to be switched over, and I
think that would also need an mmu notifier of some sorts to close the
gaps.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
