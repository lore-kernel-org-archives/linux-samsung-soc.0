From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/5] ARM: dts: exynos: Move HDMI PHY node to
 exynos5250.dtsi
Date: Tue, 19 Sep 2017 19:47:42 +0200
Message-ID: <20170919174742.kmbktkjll4lsavwa@kozik-lap>
References: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170915091139eucas1p2eb6d2d81ee77ee5a47f1c32f9ccce268@eucas1p2.samsung.com>
 <1505466683-32148-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35094 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751690AbdISRrq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 13:47:46 -0400
Received: by mail-wm0-f68.google.com with SMTP id e64so318043wmi.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Sep 2017 10:47:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1505466683-32148-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Sep 15, 2017 at 11:11:20AM +0200, Marek Szyprowski wrote:
> All Exynos 5250 SoCs have HDMI PHY connected via dedicated I2C bus (bus
> number 8), so HDMI PHY should be defined in exynos5250.dtsi instead of
> duplicating it in every board, which enable HDMI support.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts      | 8 +-------
>  arch/arm/boot/dts/exynos5250-smdk5250.dts     | 6 +-----
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi | 7 +------
>  arch/arm/boot/dts/exynos5250-spring.dts       | 7 +------
>  arch/arm/boot/dts/exynos5250.dtsi             | 6 ++++++
>  5 files changed, 10 insertions(+), 24 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
