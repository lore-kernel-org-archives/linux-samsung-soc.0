From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/7] ARM: EXYNOS: Remove Exynos4212 related dead code
Date: Sun, 8 Oct 2017 14:20:53 +0200
Message-ID: <20171008122053.qpb4f2yxcd4k46es@kozik-lap>
References: <20171004063828.22068-1-m.szyprowski@samsung.com>
 <CGME20171004063835eucas1p2d9c25263cbae0b9d57f1af2dfcfcdcd6@eucas1p2.samsung.com>
 <20171004063828.22068-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:57038 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751747AbdJHMU5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Oct 2017 08:20:57 -0400
Received: by mail-wm0-f53.google.com with SMTP id l68so16918123wmd.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Oct 2017 05:20:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20171004063828.22068-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Oct 04, 2017 at 08:38:22AM +0200, Marek Szyprowski wrote:
> Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
> to keep remaining dead code related to this SoC version.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig    |  5 -----
>  arch/arm/mach-exynos/common.h   | 11 +----------
>  arch/arm/mach-exynos/exynos.c   |  2 --
>  arch/arm/mach-exynos/firmware.c |  5 -----
>  arch/arm/mach-exynos/pm.c       |  3 +--
>  arch/arm/mach-exynos/suspend.c  |  4 ----
>  6 files changed, 2 insertions(+), 28 deletions(-)
> 

Thanks for the cleanup, much appreciated!

Applied.

Best regards,
Krzysztof
