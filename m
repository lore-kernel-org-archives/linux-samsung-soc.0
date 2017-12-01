From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/6] arm64: dts: exynos: Add GSCL power domain to
 Exynos 5433 SoC
Date: Fri, 1 Dec 2017 17:48:59 +0100
Message-ID: <20171201164859.y3zwm422okkg2jez@kozik-lap>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
 <CGME20171129112649eucas1p1e631c8dd108b28b39924e3b3228dfa73@eucas1p1.samsung.com>
 <20171129112638.15813-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:42392 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750964AbdLAQtC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 11:49:02 -0500
Received: by mail-wm0-f49.google.com with SMTP id l141so4649883wmg.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2017 08:49:02 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129112638.15813-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Wed, Nov 29, 2017 at 12:26:33PM +0100, Marek Szyprowski wrote:
> This patch adds support for GSCL power domain to Exynos 5433 SoCs, which
> contains following devices: a clock controller, three GSCL video scalers and
> their SYSMMUs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
