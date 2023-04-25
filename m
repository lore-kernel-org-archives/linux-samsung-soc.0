Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2ABC77B61
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Apr 2023 16:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234801AbjDYQ43 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Apr 2023 12:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbjDYQ42 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 12:56:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FC0D307;
        Tue, 25 Apr 2023 09:56:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BFE4962699;
        Tue, 25 Apr 2023 16:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B901EC433D2;
        Tue, 25 Apr 2023 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682441782;
        bh=22mPNmkUVHl+VVe7JN/fIv8NuIT+SW8vRSUhM5SEw18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YHazUVu7uEXa/CUAumf1vdTfPwZ3kOoIumXwpjEuAww5ie1isrYoXmTIeMKDTnX+1
         3/g2NnbxeyflDVxa48sovr5yskrHJTDf7W6+kwyF1aA826C6+1OFN0MpxHbCFpBnE/
         rAPNmhNyb0GMwrsRLb1A4Eur7t7MlXei+uD8VFBKfEt7AsS4jhwjoDZhnDhC30nNhy
         wVsn+zHStUxjYoaAh6nT+ImJSbKkaCtFqiCMEsTqMuX6yklP/o4LKHESBFF82JiLoC
         QX9qX1oKiyKPuRx/6Q4qw3adV/pjr/Vwxcsa+fhcPjWcBqZrC51UXV8fGnsL6NiXIr
         lzv7Nat3L2f5Q==
Date:   Tue, 25 Apr 2023 18:56:18 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix g2d_open/close helper function
 definitions
Message-ID: <20230425165618.2ztg4mecuvpkdg3a@intel.intel>
References: <20230417210423.2517593-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417210423.2517593-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Arnd,

On Mon, Apr 17, 2023 at 11:04:11PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The empty stub functions are defined as global functions, which
> causes a warning because of missing prototypes:
> 
> drivers/gpu/drm/exynos/exynos_drm_g2d.h:37:5: error: no previous prototype for 'g2d_open'
> drivers/gpu/drm/exynos/exynos_drm_g2d.h:42:5: error: no previous prototype for 'g2d_close'
> 
> Mark them as 'static inline' to avoid the warning and to make
> them behave as intended.
> 
> Fixes: eb4d9796fa34 ("drm/exynos: g2d: Convert to driver component API")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Cc: <stable@vger.kernel.org> # v4.19+

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
