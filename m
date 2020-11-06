Return-Path: <SRS0=C3hI=EM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C79C55178
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 12:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FB22206D5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 12:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SpM7chHf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbgKFM6p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Nov 2020 07:58:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbgKFM6m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 07:58:42 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC71C0613D4
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2020 04:58:42 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id p12so633209qtp.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Nov 2020 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LDmpY5Q3jeo13aLjq8mpu4vGc1arJjADg5EChwDGndg=;
        b=SpM7chHfdZV7h7CKnja31DtYMLYzvOBfAlRtmJ/n/nmTfwC0/x656sMJMRCmtcchj/
         ZyUoXciqxn2yvqmwaFJGHZpzSVxZGn6Ze+JMY7srqI9JIuOIozv+IXpP8Z+LAF7g6ch/
         geDIF/iCN2g4ZH9VZGIJGVBqjOuzBGBXOfBZNRG4f137xGwffeFnYlpuanA0eFi1/Rzl
         pE4g37GMMac8kgjZ4ctH1Noi6iDIudZDIDNiFDVJFDqddViW7d1FfR7i1JICWyRJ9Ug1
         S57hfmUNM5E/OZ/BlY/n0jaRZ1v6nFt9MTt+r5sEgovuILshM1zaV3phLFg35dveDz2Q
         NHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LDmpY5Q3jeo13aLjq8mpu4vGc1arJjADg5EChwDGndg=;
        b=YPIzS+irmX3IgAbJzM1VNg7X02RRF0z8tcjg3+vmNcD5JzAfiSF36mmYd3PnFsloz0
         EAGQ+gZRRHMlkqgGKJet/6Dpr+w2ayIPlqU/NC/foYrw8gfNlt2jOl+rXz9DZ4pVjG48
         Nb+tAPe/ugQM/UXb1z5FaIjg7mUiYkkb4fag1pDZGSn1r/hlws6iQAgfGWO3BgL5WcRM
         cOEEXt+alLaEP905QGw04jBPnfVG+dJ3pXvHSzr15/+M6CxG4Kj/vDKHoAMyIqr+rcCV
         3MgH86U21DyM9/PMvjZO7oL9mdjNdagJ5TxxwNj+RYEEvVdWaqOoDI+nvpgMHjBaIy7F
         agtA==
X-Gm-Message-State: AOAM531uEXwpvyg8tr/KTHgg3ocIXPGcTCDA9PEtysuTtcylV1DLL5q3
        mJ/avQR22hkrrCloEZiwUEZZ/g==
X-Google-Smtp-Source: ABdhPJw+rwYTMNOCDOtELAS3ZURAM14wn0+raNRbu4MJsphc7No8hlqtgP1VZD/3115+BJAOILEwww==
X-Received: by 2002:ac8:74c:: with SMTP id k12mr1292900qth.32.1604667521864;
        Fri, 06 Nov 2020 04:58:41 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id o63sm432040qkd.96.2020.11.06.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 04:58:41 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kb1KC-000leP-L9; Fri, 06 Nov 2020 08:58:40 -0400
Date:   Fri, 6 Nov 2020 08:58:40 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     John Hubbard <jhubbard@nvidia.com>,
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
Message-ID: <20201106125840.GP36674@ziepe.ca>
References: <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org>
 <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local>
 <20201105124950.GZ36674@ziepe.ca>
 <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com>
 <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 06, 2020 at 11:01:57AM +0100, Daniel Vetter wrote:

> gpu drivers also tend to use vmf_insert_pfn* directly, so we can do
> on-demand paging and move buffers around. From what I glanced for
> lowest level we to the pte_mkspecial correctly (I think I convinced
> myself that vm_insert_pfn does that), but for pud/pmd levels it seems
> just yolo.
> 
> remap_pfn_range seems to indeed split down to pte level always.

Thats what it looked like to me too.
 
> >  From my reading, yes. See ioremap_try_huge_pmd().
> 
> The ioremap here shouldn't matter, since this is for kernel-internal
> mappings. So that's all fine I think.

Right, sorry to be unclear, we are talking about io_remap_pfn_range()
which is for userspace mappings in VMAs

Jason
