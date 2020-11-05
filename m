Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A5FC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 12:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86CAC22261
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 12:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ey9/JXPq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgKEMtz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 07:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730501AbgKEMty (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 07:49:54 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2FFC0613D4
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 04:49:52 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id t5so945554qtp.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2020 04:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c/75nGkQrQ26C3oLWTOAYAjfB1zI6lLeh7OxDvBkYU4=;
        b=ey9/JXPqLzTLqSC0JUXYcVxUXf6bgAVzYD4I4rO+pMYwL+MZhAaGFEUE/+P8Locz8v
         LJ+RhibI0qf9gLCV/mRJ83hORIvqSMnJCg5JZJzCh+xHF7VIlIbjuRPAp0C63CSZuqsG
         vYgc5f9BkYulbWJWSx8NN3DJBDW1+TKWxoIWvVybUSqXDpV2fkacRRICo8Tgpy2bpeGk
         Ltiq/5WP3OM3AF7WaYqeeBRq6dKQGJ/PL2Qyomfzz0Quj8y3hj/F49F0vpFao5oEjJKE
         yviSyey2jqX+EBs1TWKrdjoCX5L1qgaPHh/4yTZi2biI/4T2G6/5ZjvS2T05bvZ3lDtu
         PdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c/75nGkQrQ26C3oLWTOAYAjfB1zI6lLeh7OxDvBkYU4=;
        b=AxPi5bJShEoSm/QmsE6RyjPCimPh23h5p1arUBGBCGdR/1TQhRKyzTAoTslNiLKPQp
         ArjSkjakcrMPtwR06IKKvoRWbhH7AqbTbgajg29Azb2BOo58k/W9FG9deIU2KjWHOoYT
         IBBzOpqLKMn2ihSfhRAVmii005s/Uvl5TBLXNPfAmwC5N/EtImrTTXvr3/2ZqJWgArl3
         3hCRhtrPzjLYjl0HC9gaAnGPmVIv4tQPVvdctrEdwvfweG4gKBv6dsmqYexolws66YT3
         G3abEsAGrF9VIj+kcKX+I/v+unRt96wlcpzJ1YSPxPpjoFZaAUhL47wDweNaTW2oFiPO
         glrg==
X-Gm-Message-State: AOAM532I5XsjS3TI1g86/JGeEYm4YBqeUtYLERFrzRtMiBte2L3TnqYq
        cE/oF9w9L19XAd2uJzJLqhSCTg==
X-Google-Smtp-Source: ABdhPJyp3xdvhiGf3T//L8CChJ12FUSiNzGQbei5PswIE841BlFiQ3KzgYdb3JVW6KR7+PP7QIWQow==
X-Received: by 2002:ac8:46c1:: with SMTP id h1mr1733189qto.361.1604580591377;
        Thu, 05 Nov 2020 04:49:51 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id u31sm763588qtu.87.2020.11.05.04.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 04:49:50 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kaei6-00H0yJ-2m; Thu, 05 Nov 2020 08:49:50 -0400
Date:   Thu, 5 Nov 2020 08:49:50 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     John Hubbard <jhubbard@nvidia.com>,
        Christoph Hellwig <hch@infradead.org>,
        J??r??me Glisse <jglisse@redhat.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        KVM list <kvm@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux MM <linux-mm@kvack.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201105124950.GZ36674@ziepe.ca>
References: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
 <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org>
 <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105092524.GQ401619@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 05, 2020 at 10:25:24AM +0100, Daniel Vetter wrote:
> > /*
> >  * If we can't determine whether or not a pte is special, then fail immediately
> >  * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
> >  * to be special.
> >  *
> >  * For a futex to be placed on a THP tail page, get_futex_key requires a
> >  * get_user_pages_fast_only implementation that can pin pages. Thus it's still
> >  * useful to have gup_huge_pmd even if we can't operate on ptes.
> >  */
> 
> We support hugepage faults in gpu drivers since recently, and I'm not
> seeing a pud_mkhugespecial anywhere. So not sure this works, but probably
> just me missing something again.

It means ioremap can't create an IO page PUD, it has to be broken up.

Does ioremap even create anything larger than PTEs?

Jason
