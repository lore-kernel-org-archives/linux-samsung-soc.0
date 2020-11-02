Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C47C4742C
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 12:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97BC322273
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 12:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="T3p+MSLR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgKBM4X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 07:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgKBM4W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 07:56:22 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F49EC0617A6
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2020 04:56:22 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id i18so7750004ots.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2020 04:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5ses3L4S0EGFIO147NO/jaN4EloOqduj8AeaQfFuV8=;
        b=T3p+MSLRVTQeTCxHlv2KtbWAgQXYXjF/NQ5vZEZ56cGWMPWmhzeFc9ZhAf24TyMNJy
         X8ZVYO+h7DmQjzrCGnwO7PCiNeRaaOGSFYoXqqakqdoymjMzjnu9kMLe6DLLbyq0pqc5
         IQ0xty7dRJBPKhniovuUncjzErvz8QtDqXg1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5ses3L4S0EGFIO147NO/jaN4EloOqduj8AeaQfFuV8=;
        b=WGMXJuWEH76IiMd/zXD95+Z+5FJ6mgM1Zq8WCP/JLs2qCGGHdwNc30wnuMGVR89pll
         0Fr91yuw4qoM40ngixJr5Y4AX3fH+1Fw7Nb5hwWBiXAzovDlwobHxLps5Zp6yMx2gVS5
         q9oRca5zMtqRpgtVNQRWT8cXHaszMnUWB1nsRIVqDNYad7cJE0qct9xSzQNeXnIAEpFo
         cx/+GL/EXiQB+imPSayENTk1FdBhcVsRkZEcxj1YA2/g9hBiLH2H3eDg1B1oHF5HI714
         /W6NAMJl+byzgJzEUawtkLNw0bbiDFlwng0EKI7LKQxoCAk0VdJeqGDl2OArodimJFPK
         0aIQ==
X-Gm-Message-State: AOAM531OjKUgrKBP0quWY0+TqkRx2BS+E3enQjTB05NTzlZZg9B5n0bG
        qDEUV3VV13Qc1yJ72T2YJdPzvEZ1nBTFLjT8in/r/g==
X-Google-Smtp-Source: ABdhPJxuikM8EweOBXPqOBWXx8bGKhMyIqIExlZHbYHppkEx5/UodSudDdaWfAmFL8eR0NFLmbTm21/CfypVpUHeCk4=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr12585840otr.281.1604321781980;
 Mon, 02 Nov 2020 04:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch> <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
In-Reply-To: <20201102072931.GA16419@infradead.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 2 Nov 2020 13:56:10 +0100
Message-ID: <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
To:     Christoph Hellwig <hch@infradead.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        "J??r??me Glisse" <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > that by drivers/modules is together with an mmu_notifier, and that's
> > all _GPL stuff.
>
> I also think it also needs to be renamed to explicitly break any existing
> users out of tree or int the submission queue.

Ok I looked at the mmu notifier locking again and noticed that
mm->subscriptions has its own spinlock. Since there usually shouldn't
be a huge pile of these I think it's feasible to check for the mmu
notifier in follow_pfn. And that would stuff this gap for good. I'll
throw that on top as a final patch and see what people think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
