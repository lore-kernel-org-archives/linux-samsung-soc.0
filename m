Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C41C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 10:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbiGFK6R (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiGFK6Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 06:58:16 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F7127CD7
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 03:58:16 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 6596A4CC; Wed,  6 Jul 2022 12:58:13 +0200 (CEST)
Date:   Wed, 6 Jul 2022 12:58:12 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/exynos: Make driver independent of the system page
 size
Message-ID: <YsVqxCpljVAbalgO@8bytes.org>
References: <CGME20220623093641eucas1p11732bf2c875960f7a2bb1d6fe053bc81@eucas1p1.samsung.com>
 <20220623093629.32178-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623093629.32178-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jun 23, 2022 at 11:36:29AM +0200, Marek Szyprowski wrote:
>  drivers/iommu/exynos-iommu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.
