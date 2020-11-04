Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE372C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 14:00:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5514521734
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 14:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Wan5zLNC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbgKDOA1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgKDOA0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 09:00:26 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABB1C061A4C
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2020 06:00:26 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id i21so18565276qka.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2020 06:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J6Nw3097qL1FGBO59AefdNEIbSIDtL/HHl1l69CFDp8=;
        b=Wan5zLNCc03uOg3crmJFeRaNbOEA+qwrbKwCY9LDkg1fZnFvzGEBwk4V+VLFOn5oKx
         tmcyGIKCw4+CD/juWp2ijPQPLgAyQG0AhFaLumt8mFw7D817cQkKUY2w7oYalFQSRaiQ
         Vb/ptf8IpP3WfnK3UuZPUxBAXkXY6PqsAqGNVYoZolg0yUEgsR1Di4PcNN7C/aUr2Q/R
         O0ZcNPr6tO0Ab4yQ9aVnuDw44g3gsPath6hDrZSj4xe9Loas/o/6/OXlQjyqG2MFoi+n
         R3zy4MV988W7+StxSAydki/+D4rJ/lZx0EB7vwQbsli0N+fpB6onleBpY6HTFL+CpY9E
         jiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J6Nw3097qL1FGBO59AefdNEIbSIDtL/HHl1l69CFDp8=;
        b=tX7QRefiZcy1rPttRq5d55zkx171X3BUPEI/VTTJpZAlrtAxeXydaG5rlubrzUn/JV
         sDPf42q3sn/seY6WiLWlGt0iFZZDROpAq7nx6NOTcDnh+cF00c0/g6S51ix2j2zT7WNa
         rqwCpDR5S+oaqoSvDAJAJI/LDGLguZf54rdFR6O2S2a98dquycJWUt3jgt/KLgmUJNiI
         qlqH9At/xGdV8kQUHFYVqFgxUoo4rXBOBkE2zGYZPKbTLvLwjSk064eO2rMH+3Sdtizh
         8pFq4veMZFQMyRvpuXyNi976/PppjTqfbpo8B0IiiP8p4gC+SV6bi6xjWtD4hFLILcbU
         B8XA==
X-Gm-Message-State: AOAM530akF3P7V1GV5E6Nz0YcOIntHNVmvlswOhLLDMubrJ9wKmB2aBa
        bAjkUf3JWEWVAsDzXFPTPsDV7w==
X-Google-Smtp-Source: ABdhPJz06+PUPTCOD5MO6YcYJfu8e1guRGyarj130cNdAlQFDKce0Oko/G5bRBr5wbl0qK0lrF7Apg==
X-Received: by 2002:a37:4ccf:: with SMTP id z198mr26929935qka.348.1604498425743;
        Wed, 04 Nov 2020 06:00:25 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id y3sm131855qto.2.2020.11.04.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:00:24 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kaJKp-00GVgS-9E; Wed, 04 Nov 2020 10:00:23 -0400
Date:   Wed, 4 Nov 2020 10:00:23 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201104140023.GQ36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
 <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
 <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
 <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
 <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Nov 01, 2020 at 11:50:39PM +0100, Daniel Vetter wrote:

> It's not device drivers, but everyone else. At least my understanding
> is that VM_IO | VM_PFNMAP means "even if it happens to be backed by a
> struct page, do not treat it like normal memory". And gup/pup_fast
> happily break that. I tried to chase the history of that test, didn't
> turn up anything I understood much:

VM_IO isn't suppose do thave struct pages, so how can gup_fast return
them?

I thought some magic in the PTE flags excluded this?

Jason
