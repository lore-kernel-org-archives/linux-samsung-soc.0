Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AA9C0502E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Aug 2022 07:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiH3HcY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 Aug 2022 03:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiH3HcP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 03:32:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8371EAC1;
        Tue, 30 Aug 2022 00:32:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EFACAB8168C;
        Tue, 30 Aug 2022 07:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1B7C433D6;
        Tue, 30 Aug 2022 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661844731;
        bh=YSQSyCm+NnDwfnhiAk/mJMc9Ar3Fe0i/3+D9gGk12bI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tAGRN8Y3w5NUOiyL3000pg6rDMPwstazBnp7Yb/sD1vXBCc5voBV7rvyPS1OzwHyF
         yqHNywXF49S92ectCKpVKc8ntCHSMF5Pthjk+0B74sSVzOydXXM0ltOpQkbN/j586N
         Yd5IRTTlFBFH84EBFSJyCK7k/2yTVpid3IpyPH0kRXcdwY415fj94kNgYlcDyUcZkh
         6/KwNgUvBR588TD4GytBVqnhIOpzhn4HyQbxzRznypyxkNq/D7tw1UvZ/tsxDqFrnK
         CKIPv1qYKaz4Cq7K5stKxbbaWza/ZHsscUQXYT/OZe7GUS0RPf45er7La3EV0MEIw3
         SK/owzJzeopTA==
Date:   Tue, 30 Aug 2022 13:02:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v2] dt-bindings: phy: samsung,ufs-phy: match clock
 items
Message-ID: <Yw2899yMRxQIiUHS@matsya>
References: <CGME20220725000713epcas2p38d5c9d7ccdd06dd50267b72847cadc18@epcas2p3.samsung.com>
 <20220725000249.30509-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725000249.30509-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25-07-22, 09:02, Chanho Park wrote:
> Below error is detected from dtbs_check. exynos7-ufs-phy is required
> symbol clocks otherwise only PLL ref clock is required.
> 
> clock-names: ['ref_clk'] is too short

Applied, thanks

-- 
~Vinod
