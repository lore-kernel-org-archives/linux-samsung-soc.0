From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/5] ARM: dts: exynos: Add Exynos4412 ISP clock
 controller
Date: Wed, 29 Nov 2017 19:08:05 +0100
Message-ID: <20171129180805.yn35ib7ierqcd4bl@kozik-lap>
References: <20171011092515.1698-1-m.szyprowski@samsung.com>
 <CGME20171011092522eucas1p13c442dd9daa51e610618b39ee436e100@eucas1p1.samsung.com>
 <20171011092515.1698-5-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35763 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753348AbdK2SPl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 13:15:41 -0500
Content-Disposition: inline
In-Reply-To: <20171011092515.1698-5-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Oct 11, 2017 at 11:25:14AM +0200, Marek Szyprowski wrote:
> Exynos4412 ISP clock controller is located in the SOC area, which belongs
> to ISP power domain. This patch instantiates a separate clock driver
> for those clocks, updates all clients of ISP clocks and ensures that the
> driver is properly integrated in ISP power domin.
> 
> This finally solves all the mysterious freezes in accessing ISP clocks
> when ISP power domain is disabled.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 71 ++++++++++++++++++++++++---------------
>  1 file changed, 44 insertions(+), 27 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
