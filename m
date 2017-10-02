From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/4] Fix problems with Exynos4412 ISP clocks
Date: Mon, 2 Oct 2017 19:36:31 +0200
Message-ID: <20171002173631.lgkqfrtbacyzqeml@kozik-lap>
References: <CGME20171002104824eucas1p1f9795b5403b6cd599b1e33e9dc7b604f@eucas1p1.samsung.com>
 <20171002104759.25944-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32857 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751773AbdJBRgf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 13:36:35 -0400
Content-Disposition: inline
In-Reply-To: <20171002104759.25944-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Oct 02, 2017 at 12:47:55PM +0200, Marek Szyprowski wrote:
> Hi!
> 
> Exynos4412 ISP clock controller is located in the SOC area, which belongs
> to ISP power domain. This was not properly handled by the current
> Exynos4-clk driver. This patchset instantiates a separate clock driver
> for those clocks, updates all clients of ISP clocks and ensures that
> the driver is properly integrated in ISP power domin using runtime PM
> feature of the clock framework.
> 
> This finally solves all the mysterious freezes in accessing ISP clocks
> when ISP power domain is disabled.
> 
> The last patch breaks support for old dtbs. It can be applied when all
> boards are updated. Exynos4412 ISP subsystem is only used by Trats2
> boards, for which kernel is updated always together with the dtb file,
> so the last patch can be applied to the next kernel release after merging
> the DTS patch.

I am fine with this approach. However I see that third patch (dts)
depends on previous so it will also wait one cycle. arm-soc folks for
some time do not accept code mixed with dts.

Unless you can split dts into two patches: adding new clock controller
and removing old. In such case the new clock could be applied in
parallel to clk code changes.

Best regards,
Krzysztof


> 
> This patchset requires clocks runtime PM support ("Add runtime PM support
> for clocks (on Exynos SoC example)" v9 patchset), which I hope to be
> merged soon to clk-next.
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> 
> Patch summary:
> 
> Marek Szyprowski (4):
>   clk: samsung: Instantiate Exynos4412 ISP clocks only when available
>   clk: samsung: Add a separate driver for Exynos4412 ISP clocks
>   ARM: dts: exynos: Add Exynos4412 ISP clock controller
>   clk: samsung: Remove obsolete code for Exynos4412 ISP clocks
> 
>  .../devicetree/bindings/clock/exynos4-clock.txt    |  27 ++++
>  arch/arm/boot/dts/exynos4412.dtsi                  |  71 ++++----
>  drivers/clk/samsung/Makefile                       |   1 +
>  drivers/clk/samsung/clk-exynos4.c                  |  66 +-------
>  drivers/clk/samsung/clk-exynos4412-isp.c           | 179 +++++++++++++++++++++
>  include/dt-bindings/clock/exynos4.h                |  65 ++++----
>  6 files changed, 287 insertions(+), 122 deletions(-)
>  create mode 100644 drivers/clk/samsung/clk-exynos4412-isp.c
> 
> -- 
> 2.14.2
> 
