Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14671C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Nov 2022 09:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiKSJP7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Nov 2022 04:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKSJP6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Nov 2022 04:15:58 -0500
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 552FF66CAA
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Nov 2022 01:15:57 -0800 (PST)
Received: from 8bytes.org (p200300c27724780086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7724:7800:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id CF9B62A02E2;
        Sat, 19 Nov 2022 10:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1668849356;
        bh=bAWWr9POnrJ3vGSz6N2a/qyoeet6mFZL89l+jLDNx4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MXNtOzhcEWoeblnEK/Cv/yBvH/uu8SXZyyLyzwTEiZtT8wf+nceecXfKL9xSLzmbm
         iRqQ2WTySzxTSt7aDXXiICV6+YnoaWEitQ8kYLcHOqU0YaiSwgzR3HKFJCwSCHyEke
         jRqvIFvWsWQP2wH7zKi9Bx+drMMFnuru/PrLiR/DCzNddNdA73V3L2hmGpRUkyrbz6
         xmgDw3KlbLYjay1grKJoJB6uCt7uTgKRqIKXDTD0N2BbhWERZF+wHqO+ANkZP0zybo
         T/HcUvxyBwoJC674b+iC0/ESaSO1r3kUHGrDWKCseHFupcqBYcnoXrUUtI+zoC5Pob
         bfKKAqBcpzw3g==
Date:   Sat, 19 Nov 2022 10:15:54 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH] iommu/exynos: Fix driver initialization sequence
Message-ID: <Y3ieyubpoq5U62/B@8bytes.org>
References: <CGME20221104115521eucas1p2ef149555574e8f6cbd1bb3df0bdbbb20@eucas1p2.samsung.com>
 <20221104115511.28256-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104115511.28256-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 04, 2022 at 12:55:11PM +0100, Marek Szyprowski wrote:
> Registering SYSMMU platform driver might directly trigger initializing
> IOMMU domains and performing initial mappings. That time all common
> resources for the SYSMMU driver must be already allocated, so move
> platform driver registration to the end of exynos_iommu_init() function.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/iommu/exynos-iommu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.
