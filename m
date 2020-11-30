Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF43BC64E7B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Nov 2020 11:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C8EC2084C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Nov 2020 11:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zGn6PdvI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgK3LAW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Nov 2020 06:00:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:37624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727656AbgK3LAV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 06:00:21 -0500
Received: from localhost (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46C70207F7;
        Mon, 30 Nov 2020 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606733981;
        bh=10Od5snn4pdSConzB62wtzmV9/mRp7/jgGm4pu6xGr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zGn6PdvI7L3ZdBcBmV9AOlh3DOITLc+2vOS+nKKV+tBG69xUVchABB30Eu9oe7qSC
         Nhd7nT2E447PKyMfs43JMByH/aA5/0e+0LcttQblaqKYEx2DBSCOCLOOwHrT5g52nv
         dzTm5m0UItYTOOJLYtlZP/bc9EQoecnBpy6I1kHA=
Date:   Mon, 30 Nov 2020 16:29:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: [PATCH 1/2] phy: samsung: Add support for the Exynos5420 variant
 of the USB2 PHY
Message-ID: <20201130105931.GP8403@vkoul-mobl>
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
 <CGME20201120085651eucas1p1d30223968745e93e6177892b400a7773@eucas1p1.samsung.com>
 <20201120085637.7299-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120085637.7299-2-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20-11-20, 09:56, Marek Szyprowski wrote:
> Exynos5420 differs a bit from Exynos5250 in USB2 PHY related registers in
> the PMU region. Add a variant for the Exynos5420 case. Till now, USB2 PHY
> worked only because the bootloader enabled the PHY, but then driver messed
> USB 3.0 DRD related registers during the suspend/resume cycle.

Applied, thanks

-- 
~Vinod
