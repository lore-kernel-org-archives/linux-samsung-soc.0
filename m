From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add audio power domain support to
 Exynos542x SoCs
Date: Sun, 3 Dec 2017 13:08:34 +0100
Message-ID: <20171203120834.5yiqloldmpwcsnct@kozik-lap>
References: <CGME20171129113526eucas1p11045cbb1dcdd42a68c2f5ba81a635213@eucas1p1.samsung.com>
 <20171129113514.15988-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:44983 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751033AbdLCMIh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Dec 2017 07:08:37 -0500
Received: by mail-wm0-f66.google.com with SMTP id t8so1312005wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Dec 2017 04:08:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129113514.15988-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Nov 29, 2017 at 12:35:14PM +0100, Marek Szyprowski wrote:
> Audio power domain includes following hardware modules: Pin controller
> for GPZ bank, AudioSS clock controller, PL330 ADMA device and Exynos I2S
> controller.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Currently this domain will not be turned off, because pinctrl driver
> don't support runtime PM and PL330 ADMA requires irq-safe runtime PM.
> This will be fixed in the future.
> 
> Issues pointed in the discussion of v1 has been resolved by commit
> 07731019c59c ("pinctrl: samsung: Move retention control from mach-exynos
> to the pinctrl driver").
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> Changelog:
> v2:
> - added domain label
> 
> v1: https://patchwork.kernel.org/patch/9485083/
> - initial version
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
