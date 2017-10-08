From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/7] soc: samsung: Remove Exynos4212 related dead code
Date: Sun, 8 Oct 2017 14:21:05 +0200
Message-ID: <20171008122105.fklm7knzoah7vu3n@kozik-lap>
References: <20171004063828.22068-1-m.szyprowski@samsung.com>
 <CGME20171004063835eucas1p28e23131c839ad432d0e5af60fe8ad504@eucas1p2.samsung.com>
 <20171004063828.22068-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:49898 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751747AbdJHMVJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Oct 2017 08:21:09 -0400
Received: by mail-wm0-f54.google.com with SMTP id b189so16118635wmd.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Oct 2017 05:21:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20171004063828.22068-3-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Oct 04, 2017 at 08:38:23AM +0200, Marek Szyprowski wrote:
> Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
> to keep remaining dead code related to this SoC version.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/arm/samsung/pmu.txt |  1 -
>  drivers/soc/samsung/exynos-pmu.c                      |  9 ---------
>  drivers/soc/samsung/exynos-pmu.h                      |  2 --
>  drivers/soc/samsung/exynos4-pmu.c                     | 13 ++-----------
>  4 files changed, 2 insertions(+), 23 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
