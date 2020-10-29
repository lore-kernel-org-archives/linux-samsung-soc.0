Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FD0C55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:25:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2768820790
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="RAZGAbKd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgJ2JZ2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 05:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgJ2JZ2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 05:25:28 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F84C0613D2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2020 02:25:28 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id h62so1669041oth.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2020 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RXd5L3340dzHPl4D7TSnIVGFAYIoQ/W+pLHz6LYz95I=;
        b=RAZGAbKdB4XcnSD0wp1Kz5dBTHMEAkPA/y5Q5zBFcm5ek6TOqOD+2MjSuNA7CsSuFv
         QdasXZzvzm82On3eSCMCjzvEPeFEdeSGCKm4fjXr/Z2Mh9xwUtFmVb6ioAaMFNhmVvnm
         LvNYGo6oa8r1Gs3CbA9euLgw6UBFM7BcU9IdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RXd5L3340dzHPl4D7TSnIVGFAYIoQ/W+pLHz6LYz95I=;
        b=CjnvF7p6XBZQXWiWzyjuRvBeOwCAmlTmsmadX2f9YYTuK/CCy9fT40+CV7klXoCffE
         n08vWYezFKX2jhXrq6fZnvM/9GvQRJeYdkaqFSiARd+yULdd+8xua4TV9gxHyLUiC0NV
         hSX+49uPX99nJMjj2NZnqtP0ogfapNBXRFAaJ4IEwywKsGRgDWS68WDe0FnAuavQ6kDp
         lDGvQB587xkEAH2ZuJNtHHdEGhtzDxrZCDfcNcQRPKwqY/vPoHvflAfqohPQmroELkiO
         Y9iPAzScYQLMZW/rzE91fEdm2+dAJGAmu5Y3rUe4kDL+HYYQYkpW6YPKSNfszI6aERTR
         kH0A==
X-Gm-Message-State: AOAM532tOLX47Txv/vQT2ghtxNlUoDUw1b8VrQlk06m4Ks6wcbJx0k0N
        GqnmJ1chI1ofJnlrJ5Wcy0H0/Xxed6DfOBh1hcYO5w==
X-Google-Smtp-Source: ABdhPJz3d3GbocYLOWK17PC84OSTKCpC1P9Cp1Gqiuhg8zJB6kTRUJIIoeLruWIEtxgmiFM3IrJbR1M7sDMXTefUSTI=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id f28mr2685703ote.188.1603963527533;
 Thu, 29 Oct 2020 02:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch> <20201029085749.GB25658@infradead.org>
In-Reply-To: <20201029085749.GB25658@infradead.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 29 Oct 2020 10:25:16 +0100
Message-ID: <CAKMK7uEV7sQ48w1Dd=WCY1r6LrY+aEq3ASnouOebQoo=Zr=CTQ@mail.gmail.com>
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

On Thu, Oct 29, 2020 at 9:57 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> Maybe I'm missing something, but shouldn't follow_pfn be unexported
> at the end of the series?

kvm is a legit user and modular afaict. But since you can't use this
without an mmu_notifier anyway (or digging around in pagetable
locking), maybe it should be EXPORT_SYMBOL_GPL now at least?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
