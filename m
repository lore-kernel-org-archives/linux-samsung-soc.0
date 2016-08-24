From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: EXYNOS: Remove unused DMC offset and its mapping
Date: Wed, 24 Aug 2016 06:43:29 +0200
Message-ID: <20160824044329.GA8407@kozik-book>
References: <1471931416-15991-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33890 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750947AbcHXEnd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 00:43:33 -0400
Received: by mail-wm0-f68.google.com with SMTP id q128so914677wma.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2016 21:43:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1471931416-15991-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, k.kozlowski@samsung.com, krzk@kernel.org, kgene@kernel.org

On Tue, Aug 23, 2016 at 11:20:16AM +0530, Pankaj Dubey wrote:
> Currently there is no user of DMC SFR offsets, so we can safely remove
> mapping of its SFR address space and cleanup related offset macros from
> mach-exynos.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c                | 10 ----------
>  arch/arm/mach-exynos/include/mach/map.h      |  3 ---
>  arch/arm/plat-samsung/include/plat/map-s5p.h |  3 ---
>  3 files changed, 16 deletions(-)
>

Thanks, applied.

Best regards,
Krzysztof
