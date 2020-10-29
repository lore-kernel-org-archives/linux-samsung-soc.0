Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393B8C55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:00:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C710A2072E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qhQ4YkyV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgJ2I6l (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 04:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgJ2I4w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 04:56:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDB0C0613D2;
        Thu, 29 Oct 2020 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=zoaWQCaukT2MSre+YOCy8lPWvGILO48toajhUZfqRO8=; b=qhQ4YkyVtUdCF+9/SxF+KkMnE/
        D3OoH/RsujOjBjImJs3j7wsc+18+EhiCdslrW+7UAfcF/3Lpk99bGShz5x8vvO7NhRDvD/3/jIF/U
        sxjKHuC9kaCmjIQSe39nGdSprah7mG+Z3Qat31XoyHOzlVqjf1/QS7I84ZB/yiztmTbIZ9tig9v0X
        f2yLG+zhB53m3eNdAToBlpu4RWg/tOhEL5fYpqSM8QjSZe/Ra+mMDoJYV20tgz1OUmmI9HvfC/hqJ
        Iucc/rIbeuYDkc44YiTbpdM2F7LW26KSdHCYp3Ov/mUwi9UI3WMsbmPjsLva53P4rrTMzDSlxoDzk
        s6zrIsQQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kY3jh-0006wc-3k; Thu, 29 Oct 2020 08:56:45 +0000
Date:   Thu, 29 Oct 2020 08:56:44 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        J??r??me Glisse <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v4 08/15] mm: Add unsafe_follow_pfn
Message-ID: <20201029085644.GA25658@infradead.org>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026105818.2585306-9-daniel.vetter@ffwll.ch>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> +int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
> +	unsigned long *pfn)

The one tab indent here looks weird, normally tis would be two tabs
or aligned aftetthe opening brace.

> +{
> +#ifdef CONFIG_STRICT_FOLLOW_PFN
> +	pr_info("unsafe follow_pfn usage rejected, see CONFIG_STRICT_FOLLOW_PFN\n");
> +	return -EINVAL;
> +#else
> +	WARN_ONCE(1, "unsafe follow_pfn usage\n");
> +	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +
> +	return follow_pfn(vma, address, pfn);
> +#endif

Woudn't this be a pretty good use case of "if (IS_ENABLED(...)))"?

Also I'd expect the inverse polarity of the config option, that is
a USAFE_FOLLOW_PFN option to enable to unsafe behavior.

> +/**
> + * unsafe_follow_pfn - look up PFN at a user virtual address
> + * @vma: memory mapping
> + * @address: user virtual address
> + * @pfn: location to store found PFN
> + *
> + * Only IO mappings and raw PFN mappings are allowed.
> + *
> + * Returns zero and the pfn at @pfn on success, -ve otherwise.
> + */
> +int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
> +	unsigned long *pfn)
> +{
> +	return follow_pfn(vma, address, pfn);
> +}
> +EXPORT_SYMBOL(unsafe_follow_pfn);

Any reason this doesn't use the warn and disable logic?
