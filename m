Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BBCC4363D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 14:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E575621548
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 14:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EkrWq1Mr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbgJGO6S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 10:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbgJGO6R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 10:58:17 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44C8C061755
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 07:58:17 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id de3so1291213qvb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P2gM9yMWULW8Gy0X53Dd8f+mRA7vL7mt4JQg7J+CsJg=;
        b=EkrWq1MrrRrhX94tY4shxt2sLz9reBBnaXPgSxaBe8tilDqy+2IS1g570qnI6q2Bwb
         VTZx0T7ukCpH2KhVpGwAlcgwN+08jcdBryOAUJsnrCoQ3sDIRGhbR49CMNFI4tETADRf
         CS4ynbPfqQ+EfaUNE0vtblxsA5wAfc6seY0Is0oCap6lr3N+S8vvfmpnh7Yelpm1c7B0
         mLinWmmY747mC1qpUt2odZnzr8hLQog7wTcAPIaeK9bsSbxe6JHWZE+fIEJVz+CJIgTt
         1IeH4KA8rzkLIgg5NfFox6GHYfwfLa/83FQ+yNgrLHAOFw09XKpj880UZUJDvOWgo7iE
         wzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P2gM9yMWULW8Gy0X53Dd8f+mRA7vL7mt4JQg7J+CsJg=;
        b=V27YSXF0sdV5fjS6RgPHZZ00pLjDCmxr06u0nG+iZFjNJFGn3+m2ms/cSQ0/RVoq7L
         8x/VfiEnqCDeMctPkAET9vgg7ywcE2JUpyfCtJ2ZYIkHZNuKlO+Fn9x4bsFgU2lzk7WO
         cCSlb2fqW3q+xUCvKQ6TjFLyA2n/nozXtj+zHfMmLyaytdFYCyo+21F5B5akXcw7mq2C
         EsgCBxy/EN+ENVZkJj4k0ZpYCsj9++JH7LJw8fC8LSnphsxqJ8fAJ0A2SbQCCM/mR7Zu
         7zGZt9Z8jbWyzjqQcJ6HXGT1oqpo5n0h/+56pVreyJQkuBnz+v8ZBfaaLm41oTzPTPXZ
         bnXA==
X-Gm-Message-State: AOAM531DHu2fTgng+LN3V3r3ulDBg+GVv66l4gur0BEe9JW4TS9Drbvo
        KCO7pJ9eb6BH3n6RgqF/xdcRJg==
X-Google-Smtp-Source: ABdhPJyjY3nHEt0ctmWulUEEoQC0sv3v89EPil6229gZRAfJaFF/qKe7nim9Rza8tp1X2JRL4Y6Eww==
X-Received: by 2002:a05:6214:945:: with SMTP id dn5mr3776857qvb.56.1602082696901;
        Wed, 07 Oct 2020 07:58:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id n7sm1705722qtp.93.2020.10.07.07.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 07:58:16 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQAtT-000wnC-KC; Wed, 07 Oct 2020 11:58:15 -0300
Date:   Wed, 7 Oct 2020 11:58:15 -0300
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
Message-ID: <20201007145815.GS5177@ziepe.ca>
References: <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
 <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
 <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
 <20201007130610.GP5177@ziepe.ca>
 <CAAFQd5CH8ytmwfd_AD0e9C92xkW3fRPmqvi9_4UN6pw-y3f-sg@mail.gmail.com>
 <CAKMK7uFSTrULTE-o+vHU-81dJpKJ5cHAAb8qkpQtcz6KrhvPzg@mail.gmail.com>
 <CAAFQd5ArKWR8f4XO73UB7tyeq3ZCYJb4OD_K=2hxOgputRY=Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5ArKWR8f4XO73UB7tyeq3ZCYJb4OD_K=2hxOgputRY=Rw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 07, 2020 at 04:11:59PM +0200, Tomasz Figa wrote:

> We also need to bring back the vma_open() that somehow disappeared
> around 4.2, as Marek found.

No

Jason
