Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203AAC55179
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 07:29:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D587A22275
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 07:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Erkn5URR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgKBH3i (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 02:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgKBH3h (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 02:29:37 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79640C0617A6;
        Sun,  1 Nov 2020 23:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=7kqil5vrmEb2Nddp3OQTQBXQGkc9niPiGcaNE67tBY8=; b=Erkn5URR+wSGh9C0rgWsbo+p9y
        ppm6PQDbDGHOGGA2h3Hrj/hAaUJmZb7bckVW0bAUthsA1/1XR/stYVsLsHGSL+0cUvzAzwZBKG4Z+
        1X+JPSn7x/00wDea9bTorvr41bTNvJ1tZplphwfSACELJOmWElB84jaIHXnye8gKSTw7PYtIkp+cK
        WGyQCz7gr/AM/kILQY6/E3kR8Ur/Rw382iwx+IpLcP8isCw9xGb2Ye7bH/QCr3P+yArX+AJnphOaO
        aU9VCRUV9hCMajGMKNzrOpgkRoBtDaIgpUmG5ro2Cv7DaRGobrM3PjNsUJlNDtS1sygQt/v3/GLna
        efXx4F/w==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kZUHU-0004O4-0T; Mon, 02 Nov 2020 07:29:32 +0000
Date:   Mon, 2 Nov 2020 07:29:31 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        J??r??me Glisse <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
Message-ID: <20201102072931.GA16419@infradead.org>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030100815.2269-9-daniel.vetter@ffwll.ch>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> that by drivers/modules is together with an mmu_notifier, and that's
> all _GPL stuff.

I also think it also needs to be renamed to explicitly break any existing
users out of tree or int the submission queue.
