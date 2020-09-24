Return-Path: <SRS0=DxXa=DB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556ACC4346E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 24 Sep 2020 08:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 223EE23787
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 24 Sep 2020 08:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgIXIyO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgIXIyO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 04:54:14 -0400
X-Greylist: delayed 320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Sep 2020 01:54:14 PDT
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF07C0613CE
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Sep 2020 01:54:14 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 5200C295; Thu, 24 Sep 2020 10:48:50 +0200 (CEST)
Date:   Thu, 24 Sep 2020 10:48:48 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Yu Kuai <yukuai3@huawei.com>, kgene@kernel.org, krzk@kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
Subject: Re: [PATCH] iommu/exynos: add missing put_device() call in
 exynos_iommu_of_xlate()
Message-ID: <20200924084848.GD27174@8bytes.org>
References: <CGME20200918011240eucas1p1e16e5b1b11a4ea6c078ffeceaf554966@eucas1p1.samsung.com>
 <20200918011335.909141-1-yukuai3@huawei.com>
 <9f5b25ee-3dad-1798-fe55-9c1af9cde513@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f5b25ee-3dad-1798-fe55-9c1af9cde513@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 18, 2020 at 05:27:59PM +0200, Marek Szyprowski wrote:
> Hi
> 
> On 18.09.2020 03:13, Yu Kuai wrote:
> > if of_find_device_by_node() succeed, exynos_iommu_of_xlate() doesn't have
> > a corresponding put_device(). Thus add put_device() to fix the exception
> > handling for this function implementation.
> >
> > Fixes: aa759fd376fb ("iommu/exynos: Add callback for initializing devices from device tree")
> > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> 
> Thanks for the fix!
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied for v5.9, thanks.
