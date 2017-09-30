From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3 RESEND] ARM: dts: exynos: Move audio clocks
 configuration to odroidxu3-audio.dtsi
Date: Sat, 30 Sep 2017 19:14:45 +0200
Message-ID: <20170930171445.q3h2xponmd7vhy6m@kozik-lap>
References: <1506684783-9722-2-git-send-email-m.szyprowski@samsung.com>
 <CGME20170929123353eucas1p164a4d125cf71345f98dc27d5eb8d1e3d@eucas1p1.samsung.com>
 <1506688405-12624-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33796 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbdI3ROt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Sep 2017 13:14:49 -0400
Received: by mail-wm0-f67.google.com with SMTP id i131so1292582wma.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Sep 2017 10:14:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1506688405-12624-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Sep 29, 2017 at 02:33:25PM +0200, Marek Szyprowski wrote:
> Audio subsystem clocks configuration is a part of audio block,
> so there it should be moved to exynos5422-odroidxu3-audio.dtsi
> to avoid it on Odroid XU4, which has no audio codec.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Resend reason: added missing patch description
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  | 13 +++++++++++++
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 12 ------------
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
