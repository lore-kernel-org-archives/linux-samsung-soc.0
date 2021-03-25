Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BD2C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 25 Mar 2021 21:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF33861A41
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 25 Mar 2021 21:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhCYVeA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 25 Mar 2021 17:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhCYVd6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Mar 2021 17:33:58 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F310C06175F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Mar 2021 14:33:57 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b9so3707685wrt.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Mar 2021 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=TXHI1OxX+D4iSzKCuoMMss3yjiQz/+KLKVrP99q3G2I=;
        b=frvH/QuNUnODqvtDdusaUFppblhOygLUWsC1ixB43GNG2Cc+yxM2WFbRWpgjN4Ju8Y
         95PeIsuDNMn98oqagJ3ef1Nu2yOkiL1vvMi/6inWwQyeTtLH5DD3GrBLCXNufjRYGMCK
         r/gFSHALeS9GIhicmr/nrrhcB3MijIi/RQZtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=TXHI1OxX+D4iSzKCuoMMss3yjiQz/+KLKVrP99q3G2I=;
        b=U+K9KSQRNUAlRpK5/nfvzpAT7+rSgSBr3iALhwtHCs74KjxgqgACYrTCrQqtFUfbC5
         6SzdYRspKY5hlzTaZvIQX/9uETXsW25U2U8Zta1jTgxBNTxXvZNN7OWdesmIrxTgc7fi
         YjzVPnMSUKetTh6SGWe8dLcwbFkpwhVPO/lDm1oNrzOvx+BOHoQc+QGjFHQ7/NtB9ZJj
         10PB2yOo2MrrUtnWDEn6AUNw3leWICb1PzfaN2LFSezRZ9lS3E2rOoPcXQpJppgm7DeD
         cxrvPTOPmPLjTk9byipcOPSPoChPpYl87fqPPNVxtkoxfvHg4gop1h9AdTxvvds9EPzI
         zAuQ==
X-Gm-Message-State: AOAM533RneHAkoAXHgx7z/VqD9oOENsttqAskBrzc4NeCnPXNBlkHdEH
        gTs+KvmxRH4N+TlIyqPnaiWnGg==
X-Google-Smtp-Source: ABdhPJwn8UAApYENGs0EsRiOl6kaa4IOv1NsIwYwvHs5ZhbA+T+EIOa3Ak0sCs/YbuNvp+I4gerYDg==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr10992298wrn.315.1616708036367;
        Thu, 25 Mar 2021 14:33:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x13sm1115693wmp.39.2021.03.25.14.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 14:33:55 -0700 (PDT)
Date:   Thu, 25 Mar 2021 22:33:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Gunthorpe <jgg@nvidia.com>,
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
Message-ID: <YF0BwfzqpPLuFTw+@phenom.ffwll.local>
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
 <YFuQNj10P+uUHD4G@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFuQNj10P+uUHD4G@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Mar 24, 2021 at 08:17:10PM +0100, Daniel Vetter wrote:
> On Wed, Mar 24, 2021 at 09:52:11AM -0300, Jason Gunthorpe wrote:
> > On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
> > > Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
> > > follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
> > > follow_pte()")) have lost their callsites of follow_pfn(). All the
> > > other ones have been switched over to unsafe_follow_pfn because they
> > > cannot be fixed without breaking userspace api.
> > > 
> > > Argueably the vfio code is still racy, but that's kinda a bigger
> > > picture. But since it does leak the pte beyond where it drops the pt
> > > lock, without anything else like an mmu notifier guaranteeing
> > > coherence, the problem is at least clearly visible in the vfio code.
> > > So good enough with me.
> > > 
> > > I've decided to keep the explanation that after dropping the pt lock
> > > you must have an mmu notifier if you keep using the pte somehow by
> > > adjusting it and moving it into the kerneldoc for the new follow_pte()
> > > function.
> > > 
> > > Cc: 3pvd@google.com
> > > Cc: Jann Horn <jannh@google.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-samsung-soc@vger.kernel.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: kvm@vger.kernel.org
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  include/linux/mm.h |  2 --
> > >  mm/memory.c        | 26 +++++---------------------
> > >  mm/nommu.c         | 13 +------------
> > >  3 files changed, 6 insertions(+), 35 deletions(-)
> > 
> > I think this is the right thing to do.
> 
> Was just about to smash this into the topic branch for testing in
> linux-next. Feel like an ack on the series, or at least the two mm
> patches?

Pushed them to my topic branch for a bit of testing in linux-next,
hopefully goes all fine for a pull for 5.13.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
