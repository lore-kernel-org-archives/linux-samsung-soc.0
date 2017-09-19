From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/5] ARM: dts: exynos: Add status property to Exynos 54xx
 Mixer nodes
Date: Tue, 19 Sep 2017 19:52:27 +0200
Message-ID: <20170919175227.n2ellrfep4xi7ceu@kozik-lap>
References: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170915091141eucas1p2622dd1def1799e6bfde948ff17d497b9@eucas1p2.samsung.com>
 <1505466683-32148-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36451 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750872AbdISRwa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 13:52:30 -0400
Received: by mail-wm0-f67.google.com with SMTP id r136so319918wmf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Sep 2017 10:52:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1505466683-32148-6-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Sep 15, 2017 at 11:11:23AM +0200, Marek Szyprowski wrote:
> HDMI support requires some additional off-SoC logic, so Mixer device (part
> of HDMI display path) should be disabled by default in SoC dtsi and enabled
> then in each board dts. This patch unifies Mixer handling with other
> Exynos SoCs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 4 ++++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts         | 4 ++++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          | 4 ++++
>  arch/arm/boot/dts/exynos5420.dtsi                  | 1 +
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++++
>  5 files changed, 17 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
