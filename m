Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87219C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 Mar 2021 08:05:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 557B664F97
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 Mar 2021 08:05:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhCQIFT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 17 Mar 2021 04:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbhCQIFC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Mar 2021 04:05:02 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2482AC061760
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Mar 2021 01:05:02 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id u62so25137428oib.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Mar 2021 01:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EI5qglqxsKAU/W0ZKYTsFSvZf8l0B/oXcoORkaxMSD8=;
        b=fb1VA654QtgBN7yjx24Vbsgr8qILHcsfU8IERmXJmGaXai7ib/t/sz/A2+trz33o9V
         +jZ2x+KTzIoXu9ur15pcoOP0mcety3wwVzOYYhW2IDGTduuc/R5KdINLJaadqXnV3Anw
         TPbRuol5s8uvpHLE2zkBMQ0iFY8Iob2xpapBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EI5qglqxsKAU/W0ZKYTsFSvZf8l0B/oXcoORkaxMSD8=;
        b=HtyPF6CGHI7OHYCCBKUkMR1WTbIhMkPkWoR4yfaEinJKFPdsnb0FjJF4ddbaoAtlIt
         KeQAAznc8I+w1M1wk1yl+FcswyY6+1LDGqYaGQ95Yh0rZqLkDXs3+bFzu7greeFNUlR4
         gJLg3vRtm5PFX6AE+f3azvjDsXbTE98Wr8+49MFZEL1EPrvrl2dh/wbd9I2Nb9VTAXtI
         sFcli4QzK1t7kHTctV8E6dlwpDMjSq3qv3lUT5ero3niZTpG/fLLxKSozFDOckg4YteN
         2+wDzY0/OvrDTeUptiRb6gb2QpHlffeh1spxGSw5dnhsGk+cUXfZX+LZFlhkhiSkmNxA
         1shg==
X-Gm-Message-State: AOAM5322WxXWPdmBXi9EW27QoppiQEEi9wayP+HGYWd2f0Qwhhv8eKeH
        sXCyoMxt5nCw0fXmn+ViaNCjpfNTCJiLVkPxTWaWYA==
X-Google-Smtp-Source: ABdhPJwZYNnRwoTd/kuED1Yfh8EqOUzOIuqMpTc+matmHqjzLk6Tn4x3yBWT0QFOmmnBuxIzgcZ9JwEdKsAutEEaYeo=
X-Received: by 2002:aca:4188:: with SMTP id o130mr1878713oia.101.1615968301447;
 Wed, 17 Mar 2021 01:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-3-daniel.vetter@ffwll.ch> <20210316154549.GA60450@infradead.org>
 <CAKMK7uF8Lv0P4TuoctjUiVHtRzAnXf9a50JaYgm0rV+v+7=LFw@mail.gmail.com> <20210317072248.GA284559@infradead.org>
In-Reply-To: <20210317072248.GA284559@infradead.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 17 Mar 2021 09:04:50 +0100
Message-ID: <CAKMK7uGe4-7EzgYo-rLyhxp5Dft-6V_a610TmL0hRucYTpdmRQ@mail.gmail.com>
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

On Wed, Mar 17, 2021 at 8:22 AM Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Mar 16, 2021 at 04:52:44PM +0100, Daniel Vetter wrote:
> > My understanding is mostly, but with some objections. And I kinda
> > don't want to let this die in a bikeshed and then not getting rid of
> > follow_pfn as a result. There's enough people who acked this, and the
> > full removal got some nack from Mauro iirc.
>
> Hmm, ok I must have missed that.  I defintively prefer your series over
> doing nothing, but killing the dead horse ASAP would be even better.

I have a bunch of slow-burner things I need to fix in this area of
driver mmaps vs get_user_/follow_ conflicts anyway, I'll add a note to
put the horse out of it's misery in due time. We have a few problems
still where things might get pinned or used where it really shouldn't
be.

Can I count that as an ack on the series? You've touched this quite a
bit recently.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
