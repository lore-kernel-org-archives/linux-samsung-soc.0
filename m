Return-Path: <SRS0=Cil/=AF=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360B4C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Jun 2020 11:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 167E520857
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Jun 2020 11:58:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mh1QeBar"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403822AbgFXL6z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 24 Jun 2020 07:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403819AbgFXL6x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 07:58:53 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A29C061795
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jun 2020 04:58:51 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id y10so2197023eje.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jun 2020 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bfoFbTp1jr2I0obymTUaIsffNufAQrxCZnD5n4W9cLQ=;
        b=mh1QeBarXUNA+BpPNkuVYPczl6ELMrnlr7iG8xE/noQvhbCpusVzCoBhSnKDAuHh6W
         LlTBWpRYN88ysR3tnIIqi6NS9JG11ypRdeDuCdEPLvKedQBvEpwiCQbf2QGSlTDO9R7K
         PpVq0v8UXTXcsDkLtvJ2TdJn0e335AK1FJNeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bfoFbTp1jr2I0obymTUaIsffNufAQrxCZnD5n4W9cLQ=;
        b=YvWRDW9cKUmzZ689v1CR5Kc7gpEx/rBLzsqBRfeBgFNFo7Jew29j4liVnZfhYv/sc9
         KydyUT2UlDaI0n0n3zCvkqtWI04vpD7WJrZL2SWX+EA8BL4TadCVncbVDq8xR8oI+Rn3
         QNnegDtQ7yEcWbao/aD0I9VEdQNjzIb7FmS/IN2u6ciKfNt6IbiiuLd6Yu8K+oaarXfg
         /xpZx6yz8RCdGEjWZvIF5+n9MMFTd80wZURmFsVJ5x0C8C6hRsoQ8J6rHTQqyrYlG8Km
         suJihqSxN7Y/ekWBDgFwH/lnbyWzzoHhG0OJFFZ9kU3KN6XVvujsF6eDTBVjAlI+h2c4
         sfDQ==
X-Gm-Message-State: AOAM530SPoOyNlo3bz/jTmyc7LzewVzUUlkB1AmCH/Tw/GUY/AgBvTfi
        mwbyL8Tu0gzhUyNPgghbev/D9lv1XS/1AQ==
X-Google-Smtp-Source: ABdhPJyV8R1C1R2YhSfneU23AKqMJmJOP+GXfiNbgShEexqRe+WUA7BwYThVYywWehl4ICmfJm2+Yw==
X-Received: by 2002:a17:906:488b:: with SMTP id v11mr15897973ejq.173.1592999930130;
        Wed, 24 Jun 2020 04:58:50 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id u15sm5352186ejc.37.2020.06.24.04.58.48
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 04:58:49 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id l2so759594wmf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jun 2020 04:58:48 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr30008672wmk.11.1592999928401;
 Wed, 24 Jun 2020 04:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <BN6PR04MB06602E7221CC7455F3142540A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <07fb9000-ae00-efcd-e91a-48765ff3d4bf@xs4all.nl> <20200624115419.GA20764@pi3>
In-Reply-To: <20200624115419.GA20764@pi3>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 24 Jun 2020 13:58:37 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CW0CL-s6=UOPsm37Mg+kswM_DTXEEnQMHC3kc2LxAY5w@mail.gmail.com>
Message-ID: <CAAFQd5CW0CL-s6=UOPsm37Mg+kswM_DTXEEnQMHC3kc2LxAY5w@mail.gmail.com>
Subject: Re: [PATCH 00/11] media: exynos4-is: Improve support for s5pv210 and
 parallel ports
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, kgene@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jun 24, 2020 at 1:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Jun 24, 2020 at 01:39:50PM +0200, Hans Verkuil wrote:
> > Can someone from Samsung or someone who knows this SoC take a look at this series?
> >
> > This series looks sane to me, so I'll probably merge this if nobody replies
> > in the next two weeks or so.
>
> Unfortunately I don't know the media part on S5Pv210 at all so I cannot
> provide any feedback. There are not many active users of these SoCs
> nowadays. One of hem is Jonathan, so if he wants to change something he will
> mostly break/affect his own setup. :) Therefore I think it is safe to merge.

I think this driver is also used on Exynos4210 and on some setups with
4412 where the ISP is not used.

I can't promise anything, but I'll try to do a high level review.
Hopefully I still have some memory from the time I used to play with
this hardware.

Best regards,
Tomasz
