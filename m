Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28441C43460
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 10:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2F8361175
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 10:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhDHKFa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Apr 2021 06:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhDHKFa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 06:05:30 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934E2C061761
        for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Apr 2021 03:05:17 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s7so1348112wru.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Apr 2021 03:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=36bvTqcToGLAmD+a9gwi7UztJJlmmlryLAr2BU8KQ8s=;
        b=lIdZTKCpObM4Wmr4t/JuIwVigP9bm6yi8C5UN+QUf40InjOtA1Jdt5+tp80w3zNnQo
         VlSZtKdBmzi+ZwGrhGIMLGEyI3q+id+HoCUH4Q4tHYGMh2RoGkmAJXhHhZHaecvlKMmC
         QlFz7G/ND8mE2P823Sob9sGXYc3DtI/97X/D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=36bvTqcToGLAmD+a9gwi7UztJJlmmlryLAr2BU8KQ8s=;
        b=Pc3QRWJ657Kfo+BuodrE3DnBI6PGiE0ZwSnnY0ZN+xcAs2becFeftY1TdTKgK/7829
         8N9ELCXaRiNoDyFzvnTdTWLoEO13x2aRiHC5Hd0neAkENzITmm0njD7ufLJ53IZ62GJE
         CfV3wYm8+1B/pjdJ6hx8n0TR3xPyrAK6ZtmJSj41sU4Ll3JY2dHWlnt3+/Bp+uSIXKVQ
         TjAE25DDNcvnB0M0j7M/TV1Sj/JVvDvw8M3SQXcgdysUKHr5wjn5OphPLQP3xEfvVK4a
         SsI4/8S7loqcwqOAU0/1aASn/pAYTFkOClDwpogfLOdWMfY2r20y6ERTU6HoyJqwPQxk
         MeTw==
X-Gm-Message-State: AOAM531VbPKE+P3NUo4Ww8t9myB5yNE/irSSuaZZJw6i1GB4vijd0DRv
        uBuXjfTpOipc4jn+cRHI5cwW9A==
X-Google-Smtp-Source: ABdhPJzpwqYXCVUB+8r0nQC2/W7H7J7o+XDWVlyU4mTtGNJrkB+UEdkDLgvXZNrPAgIv0wJQsQSfww==
X-Received: by 2002:adf:f692:: with SMTP id v18mr713305wrp.206.1617876316263;
        Thu, 08 Apr 2021 03:05:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l4sm12802446wmh.8.2021.04.08.03.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 03:05:15 -0700 (PDT)
Date:   Thu, 8 Apr 2021 12:05:13 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        3pvd@google.com, Jann Horn <jannh@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
Message-ID: <YG7VWWkvnv2IPEXt@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        3pvd@google.com, Jann Horn <jannh@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
 <20210329133101.GA1168973@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329133101.GA1168973@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Mar 29, 2021 at 10:31:01AM -0300, Jason Gunthorpe wrote:
> On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
> > Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
> > follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
> > follow_pte()")) have lost their callsites of follow_pfn(). All the
> > other ones have been switched over to unsafe_follow_pfn because they
> > cannot be fixed without breaking userspace api.
> > 
> > Argueably the vfio code is still racy, but that's kinda a bigger
> 
> vfio and kvm

Hm I thought kvm is non-racy due to the mmu notifier catch races?

> 
> > picture. But since it does leak the pte beyond where it drops the pt
> > lock, without anything else like an mmu notifier guaranteeing
> > coherence, the problem is at least clearly visible in the vfio code.
> > So good enough with me.
> > 
> > I've decided to keep the explanation that after dropping the pt lock
> > you must have an mmu notifier if you keep using the pte somehow by
> > adjusting it and moving it into the kerneldoc for the new follow_pte()
> > function.
> > 
> > Cc: 3pvd@google.com
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: Cornelia Huck <cohuck@redhat.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: kvm@vger.kernel.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > --- 
> >  include/linux/mm.h |  2 --
> >  mm/memory.c        | 26 +++++---------------------
> >  mm/nommu.c         | 13 +------------
> >  3 files changed, 6 insertions(+), 35 deletions(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks for your r-b tags, I'll add them.
-Daniel

> 
> Jason

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
