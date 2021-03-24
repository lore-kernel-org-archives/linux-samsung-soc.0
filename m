Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D971BC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Mar 2021 19:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88E2661A17
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Mar 2021 19:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237604AbhCXTSZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 24 Mar 2021 15:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238114AbhCXTRP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 15:17:15 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B51C0613E6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Mar 2021 12:17:14 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id e18so25588374wrt.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Mar 2021 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=ks7ShY2KdqBCOa2qudGrTxafbstGO1KxoD94z5nmwd4=;
        b=bjZoBOViVyL1mHLmUFR7BSZIMAluKI/kXY5E2/ztjZRSCxzbzqraymTeP/LQuXxMd6
         5YPx58H1VAuhSW12/DzOC9BHGHgBV1J/hhCob2AhjQhBoGcMDaLPjYwGaOGrtjITgpiU
         twnR7Di8AA6EdQ4WpfeSjtyjUfsAP9baelo+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=ks7ShY2KdqBCOa2qudGrTxafbstGO1KxoD94z5nmwd4=;
        b=GwkNWvnt2wIc7M6zydiXz/XqNPWWHPlq2KsW8WOkE1QApO7JBZ60DYz5O+L145zbyc
         C3AOvCORXJUtJh5twFeCoCN336qN+3W2nM71nxM7ymyJ3lBt1WRmTpluLOR5tfoXrA/O
         SkUSTarmqNjPphY0fpukHHNu9UNSaNy5UmcuOxm23wiGnn60nhLeU8ILxmdRRQ6PupZs
         glvFH4mEuh7zdfTi0PjnSNrTER0UkyGXveonIa6+zuiZzfjR31K9GAw3GgejCHqZ9C6P
         J3QD1D6TERSqlIkgjUt4SSJaTOiJvQh+zWjDo26tqP7v9a2BTsHLWQ/PpzkvZoppfl13
         JYWg==
X-Gm-Message-State: AOAM530FIOJ7kxwWCMrX5L6GadVlA8f2dey7NaGhKaNlQNci5A6U2324
        dLB+FQlTA9C7fRRUaEnd4zfVHQ==
X-Google-Smtp-Source: ABdhPJz0jKYo0H/XBwWmbtO5rMA4MuyiBVo+Vi9lmrQcQ8si+ZT3Tkgf1DTxMp2/fnyfyvXSPQ76vg==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr5156957wru.149.1616613433126;
        Wed, 24 Mar 2021 12:17:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f2sm3344574wmp.20.2021.03.24.12.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:17:12 -0700 (PDT)
Date:   Wed, 24 Mar 2021 20:17:10 +0100
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
Message-ID: <YFuQNj10P+uUHD4G@phenom.ffwll.local>
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
 <20210324125211.GA2356281@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324125211.GA2356281@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Mar 24, 2021 at 09:52:11AM -0300, Jason Gunthorpe wrote:
> On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
> > Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
> > follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
> > follow_pte()")) have lost their callsites of follow_pfn(). All the
> > other ones have been switched over to unsafe_follow_pfn because they
> > cannot be fixed without breaking userspace api.
> > 
> > Argueably the vfio code is still racy, but that's kinda a bigger
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
> I think this is the right thing to do.

Was just about to smash this into the topic branch for testing in
linux-next. Feel like an ack on the series, or at least the two mm
patches?
-Daniel

> 
> Alex is working on fixing VFIO and while kvm is still racy using
> follow pte, I think they are working on it too?
> 
> Jason

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
