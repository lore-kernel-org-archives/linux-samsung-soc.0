From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 6/6] arm64: dts: exynos: Add remaining power domains
 to Exynos5433 SoC
Date: Fri, 1 Dec 2017 17:50:29 +0100
Message-ID: <20171201165029.sacd3if72k57iqle@kozik-lap>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
 <CGME20171129112651eucas1p1a0058dd31edffbe9dbd62ea4c2fb0f6f@eucas1p1.samsung.com>
 <20171129112638.15813-7-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:45271 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750768AbdLAQuc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 11:50:32 -0500
Received: by mail-wm0-f66.google.com with SMTP id 9so4622209wme.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2017 08:50:32 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129112638.15813-7-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Wed, Nov 29, 2017 at 12:26:38PM +0100, Marek Szyprowski wrote:
> This patch adds support for G2D, G3D, CAM0, CAM1, ISP, HVEC power domains
> to Exynos5433 SoCs. Currently only clock controllers for those domains are
> defined. CAM1 is a parent of CAM0 power domain and CAM0 is a parent of ISP
> power domain.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 50 ++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
