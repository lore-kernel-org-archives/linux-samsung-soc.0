From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/6] arm64: dts: exynos: Add DISP power domain to
 Exynos 5433 SoC
Date: Fri, 1 Dec 2017 17:49:22 +0100
Message-ID: <20171201164922.xnypkfibsva4sbey@kozik-lap>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
 <CGME20171129112649eucas1p16bc5ac7a6237eba11fc42ec2bd38dc52@eucas1p1.samsung.com>
 <20171129112638.15813-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:32980 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750994AbdLAQtZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 11:49:25 -0500
Received: by mail-wm0-f42.google.com with SMTP id g130so6306930wme.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2017 08:49:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129112638.15813-3-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Wed, Nov 29, 2017 at 12:26:34PM +0100, Marek Szyprowski wrote:
> This patch adds support for DISP power domain to Exynos 5433 SoCs, which
> contains following devices: a clock controller, two display controllers
> (DECON and DECON TV), their SYSMMUs, MIC, DSI and HDMI video devices.
> 
> OCSigned-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
