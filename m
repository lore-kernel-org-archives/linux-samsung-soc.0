Return-Path: <SRS0=/wZl=AV=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A298EC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Jul 2020 19:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76E422078D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Jul 2020 19:18:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tcd-ie.20150623.gappssmtp.com header.i=@tcd-ie.20150623.gappssmtp.com header.b="G8ptAYtq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgGJTS2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Jul 2020 15:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgGJTS1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 15:18:27 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53FFC08C5DC
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2020 12:18:26 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id e64so7150977iof.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2020 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/XxOf2MPny3gUO9mnh1IW4HAphuhFeUQbRFZXAvCpM=;
        b=G8ptAYtqk+SEo+CGoUOHZRF+vl7lJLdIBT0S/pHrduzEbWxvqh1IfPE2/4VhppHPde
         YRXFOyzoKkrWceSDyBehaHWrFlUcgXHG6dZJw/Ckmn9tJWTq/vXETO0JL2rxorvAqYgr
         sfYAe5TLkNk/6oh5kEcCbqnW3iSm0YxUhQvE7I1A5yKSuwuC4rUGD6Q7HEO+tu1wAlSl
         tD0rGE8wl+/tQgRZmMsrGa6EwlUhvHi7G/Qlh1O3Vt+4ehxXhBo8td3OJyHLYU9R9Rnm
         rBv1SJmQ77C6sJHC+gp5sx/9NhXLg9ziLq8flwiewQDJ8rwiHelTeKULpgwtJnZC8Zqx
         8ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/XxOf2MPny3gUO9mnh1IW4HAphuhFeUQbRFZXAvCpM=;
        b=YQd3Bz5dQhfxzXcfr3ecOnNKWuM+8YM16R3bfhYIePNBU7Dg9vWiXGglpJqTiA2BKt
         F0SMSqVuF7PxI6eiS82BCyS/Pmc8l/UDpipT77F+ecO9FMcje7/QDcWESF72aWAGzbDA
         TMRqc3cnaM+n/oJxMAGacOJSok89NKxfJgp8/lx3DFrcKWY+Vu9tD3/2tLmlD/TJKZC7
         SK+5kHAUKao2bkh9kjUpD9deYaVPp1oY6AdEohWCn8l7Sha6q1u56jzXme30JhEBj3Dk
         ug+4GLgpSoJ6a+maC9hkyS+0qH422Ol/SkjWphwyTX2geMn/OaPJ73Ecjd7+wNOJMqKI
         zDtg==
X-Gm-Message-State: AOAM531oVMUMNl/v9+foeZddOO1yFtg6qZIY3B/RaRg2mEfCizhin3pg
        2FQdPGXQsW+70qUlHvSC39GgTJAGLrXabNOH6yFxng==
X-Google-Smtp-Source: ABdhPJxMIWGB7DkTs3ZmaVNfNrJhTVDywQypoX4jJyE5KKI9jPnWPX+st4yY6PAU87KCAHCqBg6cegX8IfVhneQ5zK4=
X-Received: by 2002:a05:6638:2172:: with SMTP id p18mr81169397jak.63.1594408706326;
 Fri, 10 Jul 2020 12:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190908165642.22253-1-murphyt7@tcd.ie> <20190908165642.22253-5-murphyt7@tcd.ie>
 <20200710155933.GA20886@lst.de>
In-Reply-To: <20200710155933.GA20886@lst.de>
From:   Tom Murphy <murphyt7@tcd.ie>
Date:   Fri, 10 Jul 2020 12:18:15 -0700
Message-ID: <CALQxJuumgH9xR-J1Nj3LQsLW6k+4ie_0Ho3N9UJiN4R0JBGYoQ@mail.gmail.com>
Subject: Re: [PATCH V6 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

>Btw, what is the current state of converting intel-iommu to the dma-iommu

These changes expose a bug in the i915 intel driver which hasn't been
fixed yet. I don't think anyone is actively working on it but I plan
on merging as many patches as I can so it's easier to do the
intel-iommu -> dma-iommu conversion once the bug is fixed.

You can read more about it here:
https://patchwork.kernel.org/cover/11306999/

On Fri, 10 Jul 2020 at 08:59, Christoph Hellwig <hch@lst.de> wrote:
>
> Btw, what is the current state of converting intel-iommu to the dma-iommu
> code?
