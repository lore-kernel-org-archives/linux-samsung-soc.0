Return-Path: <SRS0=VHj3=DN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6939C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Oct 2020 11:57:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 354462083B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Oct 2020 11:57:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="lLhpfE52"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgJFL5F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 6 Oct 2020 07:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgJFL5F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Oct 2020 07:57:05 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2053DC061755
        for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Oct 2020 04:57:05 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id s66so12020073otb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Oct 2020 04:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/v0p3FvFQy6vefIiWkN5sABT9yaRl0KmB4aTLtFJ80=;
        b=lLhpfE52DsBTlXOZaNcfYtajrRM/cDqIwevRSBDcVW4qoPVbzEi7+sihe6YcHp2QOU
         hnAD2eoXIOk84DvIqJ2RTZpXb49sc13g/2RKsA0kTklQEV+Sykz8QqnvTSECPTErHsRx
         qsTQaNy+j6UOMtosFQSSws5ErF7y9aC00H4zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/v0p3FvFQy6vefIiWkN5sABT9yaRl0KmB4aTLtFJ80=;
        b=inWt8SuuFAYlpaAO0ath3jPldoCqxnveJkf3BBL0W3KlcJK2fh13YztCixWUFzeSCh
         W8sSwb/TYjJIi5Q1zxd26xF4MXd+VPkCrCx8ckmpVVPAhUljNvGvEP3Q5BN6b6f10eUz
         qcoeUBMQU2nkWFxTDXiMBJFqocc5vECsRg4tKSwhaP0NKs7McKYuJm1HFPhT6LhfFOa5
         tA8yAuWJguBQCJWIneZYOOF9wWXteGEjdOA8nLwYteIo/PWZI9FsRT3Z/SDXSyRUgxok
         Umrgr2TGJXWsKclHqSoIc4gZPdQFKgNRsgv+IZ0fg/lDtCmsgkZJ7mIaEihuztVBoseK
         oOaQ==
X-Gm-Message-State: AOAM533pqiSr2j/DnkdUUs/oM3hfiZEmMZz+p5kcqKkLXpiy9lwXRWlL
        yP2dJO+AleeFnNyjauvrm4FDxy0adXakDzhfB5E98Q==
X-Google-Smtp-Source: ABdhPJyMG6+nB6zVd1RDfgIGK4/zu55vJ18yPOXo0KPUU4RdObE/Y3T3eJQEZZwVcpMDmw5VSMtR9OkGz5YHDq9+Jw8=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id f28mr2857746ote.188.1601985424516;
 Tue, 06 Oct 2020 04:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
 <20201005175308.GI4225@quack2.suse.cz> <20201005175746.GA4734@nvidia.com>
In-Reply-To: <20201005175746.GA4734@nvidia.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 6 Oct 2020 13:56:53 +0200
Message-ID: <CAKMK7uGrQq6tb2hMUSC-=JkTNMC2DvdQkcZncmVBKZ-0x6S61Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Jan Kara <jack@suse.cz>, andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Mel Gorman <mgorman@suse.de>, stable <stable@vger.kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 5, 2020 at 7:58 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Oct 05, 2020 at 07:53:08PM +0200, Jan Kara wrote:
> > On Mon 05-10-20 14:38:54, Jason Gunthorpe wrote:
> > > When get_vaddr_frames() does its hacky follow_pfn() loop it should never
> > > be allowed to extract a struct page from a normal VMA. This could allow a
> > > serious use-after-free problem on any kernel memory.
> > >
> > > Restrict this to only work on VMA's with one of VM_IO | VM_PFNMAP
> > > set. This limits the use-after-free problem to only IO memory, which while
> > > still serious, is an improvement.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > >  mm/frame_vector.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > > index 10f82d5643b6de..26cb20544b6c37 100644
> > > +++ b/mm/frame_vector.c
> > > @@ -99,6 +99,10 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> > >             if (ret >= nr_frames || start < vma->vm_end)
> > >                     break;
> > >             vma = find_vma_intersection(mm, start, start + 1);
> > > +           if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > > +                   ret = -EINVAL;
> > > +                   goto out;
> > > +           }
> > >     } while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> >
> > Hum, I fail to see how this helps. If vma has no VM_IO or VM_PFNMAP flag,
> > we'd exit the loop (to out: label) anyway due to the loop termination
> > condition and why not return the frames we already have? Furthermore
> > find_vma_intersection() can return NULL which would oops in your check
> > then. What am I missing?
>
> Oh, nothing, you are right. It just didn't read naturally because
> hitting the wrong kind of VMA should be an error condition :\

Also follow_pfn checks for this same conditionat already too, so this
isn't really stopping anything bad from happening.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
