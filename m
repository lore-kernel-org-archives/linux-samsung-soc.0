From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/6] arm64: dts: exynos: Add MFC power domain to
 Exynos 5433 SoC
Date: Fri, 1 Dec 2017 17:49:48 +0100
Message-ID: <20171201164948.qoaygmc6pcgqbdn4@kozik-lap>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
 <CGME20171129112650eucas1p14c99978fbf664f9246d57360ca91353e@eucas1p1.samsung.com>
 <20171129112638.15813-5-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36980 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751163AbdLAQtv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 11:49:51 -0500
Received: by mail-wm0-f65.google.com with SMTP id f140so4442001wmd.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2017 08:49:51 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129112638.15813-5-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Wed, Nov 29, 2017 at 12:26:36PM +0100, Marek Szyprowski wrote:
> This patch adds support for MFC power domain to Exynos 5433 SoCs, which
> contains following devices: a clock controller, MFC codec device and its
> SYSMMUs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
