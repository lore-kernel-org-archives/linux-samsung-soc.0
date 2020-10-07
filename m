Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8328FC41604
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 16:53:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 308D72173E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 16:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ThVHp0Bf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgJGQxU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 12:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgJGQxU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 12:53:20 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846FBC0613D4
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 09:53:19 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id v123so3552645qkd.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aA5/IKqeJTcjHMODAliv+D9oxsXiJBjU0Q/RoQOchc4=;
        b=ThVHp0Bf6+g4+R33mQIvIX8CheiSQQTMUuTCia9X1IqJrBuFaGelh/l39LBTeYKkvK
         NaMOGfKlUrf0z4iE8OxQVYLuzZ/JlM7sUpAQwKcFn4cRIEuVLL6aIerNL35v1pmwUkj+
         wDrYDlD+5FNGiiz175SjQIUqXASz3MvdF3eYJh+ukkwcF83qjZnM9uioklIntUHKaRya
         Zg9rg6+eKKInIDWli/ZJm1h6yck77cdzU9Fs3bEWsRArMtEGioYwK8tfNazOHk/B4xtt
         Mf7AVxNkG0ee/JcnZSnMywZa9C4+2enXUIhuG1wGpzdJZvOcjJkPsfCeezTM2uT5xq7S
         MUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aA5/IKqeJTcjHMODAliv+D9oxsXiJBjU0Q/RoQOchc4=;
        b=JpePrp3CZFUOFx1rdjXjbk4Qu9EXc85RgCsSSsuvagbZo6qcEZVmYGRKk8CCRaPDTo
         shDHMhi2rPhaXgGOY7kU19duAZjHk+AtszpPB+C5zucOiIXz8zhw0eBYm/FOxGIVoqH9
         nTHtcnM0iUwN2w26QHkjUs+5E3IT4jNm71xO22CqDCD7tmt9zLL2tFBXs4lIf6ZhU7oV
         bkjbMMlJu61oLEgXLSbJEgk4GalkMXo3Koloqs+nAhejTeHA9w/laHslSFIuKu06UowG
         Rttf5ns2mOWmxsXAh26gcxFYFihJtNW0g7nepdW6oZI30gbVSZqnxIuCfOGXvr1e41x+
         MyeA==
X-Gm-Message-State: AOAM531apfITakbtPO9w86HNcNxg0lg1+8iG4ve81XEJsDyoLqNiFAt9
        6KWurntSJ+lC0Xq3GylMurF0aw==
X-Google-Smtp-Source: ABdhPJxixhkZJXYtJ75yqJVriDbZSDlnfap0MWWWiSIn4wzaboeX7oTS66SiExjVo2w4rTtFpjs6Eg==
X-Received: by 2002:a37:aec2:: with SMTP id x185mr3746059qke.73.1602089598574;
        Wed, 07 Oct 2020 09:53:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id x75sm232893qka.59.2020.10.07.09.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:53:17 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQCgm-0010EB-Tr; Wed, 07 Oct 2020 13:53:16 -0300
Date:   Wed, 7 Oct 2020 13:53:16 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201007165316.GT5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 07, 2020 at 06:44:18PM +0200, Daniel Vetter wrote:
>  
> -	/*
> -	 * While get_vaddr_frames() could be used for transient (kernel
> -	 * controlled lifetime) pinning of memory pages all current
> -	 * users establish long term (userspace controlled lifetime)
> -	 * page pinning. Treat get_vaddr_frames() like
> -	 * get_user_pages_longterm() and disallow it for filesystem-dax
> -	 * mappings.
> -	 */
> -	if (vma_is_fsdax(vma)) {
> -		ret = -EOPNOTSUPP;
> -		goto out;
> -	}
> -
> -	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> -		vec->got_ref = true;
> -		vec->is_pfns = false;
> -		ret = pin_user_pages_locked(start, nr_frames,
> -			gup_flags, (struct page **)(vec->ptrs), &locked);
> -		goto out;
> -	}

The vm_flags still need to be checked before going into the while
loop. If the break is taken then nothing would check vm_flags

Jason
