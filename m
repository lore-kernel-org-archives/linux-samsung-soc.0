Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44CAC64E7C
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 07:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EB19221FB
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 07:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgLBHGL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Dec 2020 02:06:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:38756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgLBHGL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 02:06:11 -0500
Date:   Wed, 2 Dec 2020 12:35:25 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606892730;
        bh=9qn0NrdWjruLyUWQ7XKn10OO1oc80uMd+sP+D93H81M=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=DJFWp43l5knvrzrbXohnGTBjFN3K0dhOwNm9OA0KVjY6VFFkklgG084t9jnxbsenx
         YhF35Siizh0PChYwdRZj3mX6nKjUov0N0QW9BCv+ohpNqLZKOpquVpnLLDEj+wyot7
         UPcCBUiCXm7Q1unL8flLC5wOF4bpSZUrYGrd/rSw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH v2] phy: samsung: Merge Kconfig for Exynos5420 and
 Exynos5250
Message-ID: <20201202070525.GF8403@vkoul-mobl>
References: <CGME20201202064807eucas1p124fbd6237538e9ba01c7981891e7a082@eucas1p1.samsung.com>
 <20201202064759.24300-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202064759.24300-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02-12-20, 07:47, Marek Szyprowski wrote:
> Exynos5420 variant of USB2 PHY is handled by the same code as the
> Exynos5250 one. Introducing a separate Kconfig symbol for it was an
> over-engineering, which turned out to cause build break for certain
> configurations:
> 
> ERROR: modpost: "exynos5420_usb2_phy_config" [drivers/phy/samsung/phy-exynos-usb2.ko] undefined!
> 
> Fix this by removing PHY_EXYNOS5420_USB2 symbol and using
> PHY_EXYNOS5250_USB2 also for Exynos5420 SoCs.

Applied, thanks

-- 
~Vinod
