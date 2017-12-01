From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 5/6] arm64: dts: exynos: Add AUD power domain to
 Exynos5433 SoC
Date: Fri, 1 Dec 2017 17:50:14 +0100
Message-ID: <20171201165014.hawli7o3ajtc42rq@kozik-lap>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
 <CGME20171129112651eucas1p18703aa0c427252abed987e1553ff4efe@eucas1p1.samsung.com>
 <20171129112638.15813-6-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:43237 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbdLAQuS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 11:50:18 -0500
Received: by mail-wm0-f66.google.com with SMTP id n138so4635075wmg.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2017 08:50:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129112638.15813-6-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Wed, Nov 29, 2017 at 12:26:37PM +0100, Marek Szyprowski wrote:
> This patch adds support for AUD power domain to Exynos5433 SoCs, which
> contains following devices: a clock controller, a pin controller, LPASS
> module, I2S controller, ADMA PL330 engine and UART #3 device.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
