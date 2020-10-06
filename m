Return-Path: <SRS0=VHj3=DN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773D3C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Oct 2020 03:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33FB82075A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Oct 2020 03:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601955388;
	bh=/wMMUBsTdGYTq3Py+lp4gunl1aTCu2yDsLtiHugHZvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=il4EzF8MjJzJqC9eHb2N1R4YpRsQ7RL32wm1EFTSJjDncRSU3TlQWJik3O1w1mEpI
	 4UoPwAvEMBK7WBTogKRoh+UWwk9qglUcQfOqM8i3ufsot4r9xNsVoFz41f8ZtmtD5W
	 oPQJrMRCDkjRLRj6gp1jdj7CrAgBWFRUuMFHL/hk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgJFDgC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 23:36:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbgJFDgC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 23:36:02 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA99720756;
        Tue,  6 Oct 2020 03:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601955361;
        bh=/wMMUBsTdGYTq3Py+lp4gunl1aTCu2yDsLtiHugHZvc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tZf4TgNEZPQkkesQQgwhKPoxNS0tsXhssvj7kcu4kc5gq1wzU2Kxq0rlR32W9mG23
         jTRjbsr92gZrIKNZCdF5BOjQ/a3M0D37taxvHhGq/MRF9+ohC+5vQ0syHCLuSHPOdv
         2y6d5WUtYsTYKIj4DLRS5Cn2xziy8YwcxFfJB/po=
Date:   Mon, 5 Oct 2020 20:36:00 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>, <linux-mm@kvack.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, Jan Kara <jack@suse.cz>,
        "Mauro Carvalho Chehab" <mchehab@osg.samsung.com>,
        Mel Gorman <mgorman@suse.de>, <stable@vger.kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-Id: <20201005203600.9b0ccb43b9b3a2fc44814d2f@linux-foundation.org>
In-Reply-To: <20201005174747.GA15803@nvidia.com>
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
        <20201005174747.GA15803@nvidia.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 5 Oct 2020 14:47:47 -0300 Jason Gunthorpe <jgg@nvidia.com> wrote:

> Andrew please let me know if you need a resend

Andrew is rather confused.

Can we please identify the minimal patch(es) which are needed for 5.9
and -stable? 
