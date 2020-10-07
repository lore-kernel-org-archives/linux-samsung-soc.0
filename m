Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD646C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 13:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ED71208C7
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 13:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oRN0ouP+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgJGNmh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 09:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbgJGNmg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 09:42:36 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC6EC0613D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 06:42:36 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id t20so1126259qvv.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bm7Nux/xb6SXj9ZR29eQsCeZolUUGIlGA/3pCXOWnqY=;
        b=oRN0ouP+3GVYiwbPUcOxPk+cVTMSfi6e6xB/kp+ZpPLA+3QEn3FltuYnLYp3IbMyT4
         XLTyLwYzH3ifqaZnXaU/ZWFyM48epTsFUjsHkhU0idcCtjI43xlPcUDIQI5i97qJQ1Z/
         hmWU0XhKPvhi2J7X6OI+NOkn5m1fjar7B+5a/IGgH6kfN1aHK788jThYwphFUhnE71h5
         QymuBRmevVtIbPPsb8/x5Mk95uTwIXwCIbZATz13huzt0//nPIRFE0pqbC5dvTfYdelP
         5WCCE51W2P5JcKqcJp27ijUk9DzYAmgp+0NhYYdt4Crdv5HPqfR+eWr9bpKdWw5SdwKY
         eKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bm7Nux/xb6SXj9ZR29eQsCeZolUUGIlGA/3pCXOWnqY=;
        b=J/X7vSMXQOaDozC49UsDJpIPekb59/RJM7KiyO58+mAdWDPZLh2FW7LesifNZJEN0I
         QbchxQmPCA7kDHZv0LJrpNJljwD7uSh+n1ajkBTvEMEfIsdALbskfXrqw0NbHzMP4i5u
         /s/Im4kqmGLa30vxQjsYtkMH3l8/sYXlbtIakTbLMZLNGDtr4mzrU9tFwucW+n9lS48R
         PNw4p3kzwTc7be45nrStS2a/1mRYrlTrM5z8CxMqYGpAmJpaik0Sh/4EUQ3N1C3dDP2Q
         QLDv1+axPYs8avB5lxUMgxmlbaFTgBkRHu+JKzviT/7TlTG701EjWN8xCvjwS9U0Hbpj
         5N8A==
X-Gm-Message-State: AOAM533hONSy4AXnNxKOmV6iQahX3CoWwhFeKE9XNBPQEPPUYcDNOz4T
        jMDitBHd3x+O4qQBzmz1QQLFaw==
X-Google-Smtp-Source: ABdhPJwsa8h0AE9bNg84UqMhO3s2DHUlgwedfs5Hzzp4d+UxHAd3U8iQNwNgaZByIN+Ca7e6aXxfNA==
X-Received: by 2002:a0c:e2c1:: with SMTP id t1mr3148068qvl.35.1602078155592;
        Wed, 07 Oct 2020 06:42:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id b9sm1325969qka.86.2020.10.07.06.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 06:42:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQ9iE-000uYh-A3; Wed, 07 Oct 2020 10:42:34 -0300
Date:   Wed, 7 Oct 2020 10:42:34 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201007134234.GR5177@ziepe.ca>
References: <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
 <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
 <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
 <20201007130610.GP5177@ziepe.ca>
 <CAAFQd5CH8ytmwfd_AD0e9C92xkW3fRPmqvi9_4UN6pw-y3f-sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5CH8ytmwfd_AD0e9C92xkW3fRPmqvi9_4UN6pw-y3f-sg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 07, 2020 at 03:34:01PM +0200, Tomasz Figa wrote:

> I think the userptr zero-copy hack should be able to go away indeed,
> given that we now have CMA that allows having carveouts backed by
> struct pages and having the memory represented as DMA-buf normally.

This also needs to figure out how to get references to CMA pages out
of a VMA. IIRC Daniel said these are not pinnable?

> How about the regular userptr use case, though?

Just call pin_user_pages(), that is the easy case.

> Is your intention to drop get_vaddr_frames() or we could still keep
> using it and if vec->is_pfns is true:

get_vaddr_frames() is dangerous, I would like it to go away.

> a) if CONFIG_VIDEO_LEGACY_PFN_USERPTR is set, taint the kernel
> b) otherwise just undo and fail?

For the CONFIG_VIDEO_LEGACY_PFN_USERPTR case all the follow_pfn
related code in get_vaddr_frames() shold move back into media and be
hidden under this config.

Jason
