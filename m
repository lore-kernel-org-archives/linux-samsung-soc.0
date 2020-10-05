Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8F3C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 17:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CE5D207EA
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 17:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ogo60Itj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgJERfe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 13:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgJERfd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 13:35:33 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5570C0613A7
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 10:35:33 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id w16so12902307qkj.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2020 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dKlbhuywYV4trrm533av5g+rTKLjmfZBMKtZHffEpfg=;
        b=Ogo60Itj+Op78dH8jXVJTtV1hFSvseMGAPGjIPJsWqBdL7wrA/UqdSqhsRz6b6AZDM
         I9lloFYxDZt04k/RrwXKkkLdJMtxhJtNbj12+kE6LDkefxEQsCuRyrXoqt5kaQaq6WYb
         TAJSecm4UNC7SEcfUU6PY9R+QlVJxVh8DUZlIM8VVCjCl2LyiL/ccw9cwG5QMQ2xTI44
         Tsx7MrXatCC9vxW+HHqRf4BEp5WLpvB6gW+CUVpFiZvvvlnoDb5wXthNwJdpMlarLbeU
         y3GuwL2OQtzoT2TdhVV09xynxfFdakx3hgKX1AnIaRavPLMbXV35KK2VeBNdbDGcrEVO
         zBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dKlbhuywYV4trrm533av5g+rTKLjmfZBMKtZHffEpfg=;
        b=DFj+OcNPp+FMwCbNQCT6EeSRPFUMBYO11i3ZsBPPTU3VBFRUBE3a/1SDiC8UnuaJrc
         9Aj+eIlBhbSWBNRbroDaiYnubspv+0c0LxEgoUNrOSS3lhC2Gg3CsbHbQy1XKotFewVn
         w6l7aLkOSUbF6i8BPbhkOegNF1udomBvCrL90OxuDoc88hSUttciiT41AaoFLnDK5T4J
         758QPdGb9ShLjP35jC3cVsxBOikynma/tXw22fYfqlEJux7Hg4t02v5qxNBo2vgd39M9
         0Q2rpuB0735eVeGah5lMjYpRzarAr79m1VO9MY1uLybvAevm2xj7Fe1q3Yt8e9mbzRNU
         JWkw==
X-Gm-Message-State: AOAM531KgBR0U7K0zp6ddEpeRuMxkKEvTwoB8fYHKqtihhmUBoINnVUZ
        pK+VqnbTgZXWiUk0g/MSfYUeCA==
X-Google-Smtp-Source: ABdhPJxqFhDsb/GS5ATRJ1dE6t/BFvds0ofvMeomDoUgmoopjs8lj4GVNFEIhuceI6nxBgwZWdG7Tg==
X-Received: by 2002:a37:9e87:: with SMTP id h129mr1161317qke.276.1601919332852;
        Mon, 05 Oct 2020 10:35:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id c13sm320627qtq.5.2020.10.05.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 10:35:32 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kPUOZ-00020z-L7; Mon, 05 Oct 2020 14:35:31 -0300
Date:   Mon, 5 Oct 2020 14:35:31 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005173531.GB5177@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
 <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
 <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
 <20201003232441.GO9916@ziepe.ca>
 <CAKMK7uFjGDiWMD+KeEFziY-nqWy_FtCpn0rekb70yVLaxzJHjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFjGDiWMD+KeEFziY-nqWy_FtCpn0rekb70yVLaxzJHjA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Oct 04, 2020 at 01:20:31PM +0200, Daniel Vetter wrote:

> Yeah I think that works. I tried understanding gup.c code a bit more,
> and it looks like FOLL_LONGTERM only works for the pup_fast variant
> right now? All others seem to have this comment that it's somehow
> incompatible with FAULT_FLAG_ALLOW_RETRY and daxfs. But grepping
> around for that didn't show up anything, at least not nearby dax code.
> For my understanding of all this, what's the hiccup there?

IIRC it needs the VMA and various other flows can't return the vma
list becuse they unlock the mmap_sem will running

> For plans, I only started this for a bit of my own learning, but I
> think I'll respin with the following changes:
> - convert exynos and habanalabs to pin_user_pages_fast directly,
> instead of going through this frame-vector detour

+1

Jason
