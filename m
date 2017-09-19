From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/5] ARM: dts: exynos: Cleanup HDMI DCC definitions
Date: Tue, 19 Sep 2017 19:49:51 +0200
Message-ID: <20170919174951.as3svj2gbnyoona7@kozik-lap>
References: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170915091140eucas1p268cefeea0d564c340ede8ab54788ff6a@eucas1p2.samsung.com>
 <1505466683-32148-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:38906 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751353AbdISRtz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 13:49:55 -0400
Received: by mail-wm0-f68.google.com with SMTP id x17so305421wmd.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Sep 2017 10:49:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1505466683-32148-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Sep 15, 2017 at 11:11:21AM +0200, Marek Szyprowski wrote:
> Commit 2b7681326dc2 ("drm/exynos: hdmi: remove the i2c drivers and use")
> merged to v3.15 kernel added a required 'ddc' property to Exynos HDMI
> device tree bindings, which should point to i2c bus used for handling DDC
> (mainly reading display's EDID information). It has been enough time to
> convert all boards to use new bindings, but sadly due to copy/paste design
> the old approach using separate node with 'samsung,exynos4210-hdmiddc'
> compatible was used also for many new boards. This patch finally converts
> all boards to the new approach and unifies HDMI DDC definition across all
> Exynos boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts           | 9 ++-------
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          | 7 ++-----
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 6 +-----
>  arch/arm/boot/dts/exynos5250-spring.dts            | 6 +-----
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          | 7 ++-----
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 7 ++-----
>  6 files changed, 10 insertions(+), 32 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
