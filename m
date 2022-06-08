Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B98CCA481
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Jun 2022 16:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245424AbiFHQV7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Jun 2022 12:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245390AbiFHQV7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 12:21:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3712CC84;
        Wed,  8 Jun 2022 09:21:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA0A56186B;
        Wed,  8 Jun 2022 16:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C00C34116;
        Wed,  8 Jun 2022 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654705317;
        bh=t6way+TkxDknfIT1NDrSx3IOUfKk8a+tJbG6qq0uLv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PFK8LFa5TAHTqZBspVmsXHdJohSuanlwGDSxrR6zW2yiMqaREB6q/pv3NeEltm7Bm
         XZWortlRlc3Pf6pOGU+9g60RXWux86Br7dZ/URhjXwvNCy+/Nw9iyXGNxuKXypIzKi
         54R0de/y2aarRD7Bs5sr26E3Hzzm4kBm/8cBEQ7NdJCQXHFwIE7Y4xZBJvq0xnEmfy
         NkQS6jX6xQkgqHhoaeeINabxidqbpXUAXx1B3gkMmK6ACCdR7qDuGZSvNV4XLsULUb
         oCSIY1ge5ecqVcx123W7Uu5fudsxvq+WmOjSuOF9FA58i3R7n4c037Wvj447bRwav9
         8J39QuQWW721w==
Date:   Wed, 8 Jun 2022 21:51:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/5] support secondary ufs for Exynos Auto v9 SoC
Message-ID: <YqDMn7GCJpOV9EH2@matsya>
References: <CGME20220607072937epcas2p4e3e1bf3258e021c20692b0d348abdd8b@epcas2p4.samsung.com>
 <20220607072907.127000-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607072907.127000-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07-06-22, 16:29, Chanho Park wrote:
> To support ufs #1 for Exynos Auto v9 SoC, we need to control its own pmu
> register. So, we need to specify the offset of the register via an
> argument of syscon node.

Applied, thanks

-- 
~Vinod
