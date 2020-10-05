Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E746C4727F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 15:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EEE52078A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 15:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgJEPER (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:04:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:44006 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbgJEPDd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 73158AB95;
        Mon,  5 Oct 2020 15:03:31 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 1B7271E12EF; Mon,  5 Oct 2020 17:03:31 +0200 (CEST)
Date:   Mon, 5 Oct 2020 17:03:31 +0200
From:   Jan Kara <jack@suse.cz>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005150331.GE4225@quack2.suse.cz>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002180603.GL9916@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi!

On Fri 02-10-20 15:06:03, Jason Gunthorpe wrote:
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

So I'm the one guilty for introducing this API. The API was created to
factor out code in several (mostly V4L AFAIR) drivers thus reducing amount
of drivers poking into MM internals and getting things wrong in various
cases. It may well be that the API is still broken from "can driver ensure
this" POV - I tried to keep things things as they were before in this
regard as I have very little knowledge in how these drivers are supposed to
work.

Anyway, if you can make this go away, sure go ahead :)

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
