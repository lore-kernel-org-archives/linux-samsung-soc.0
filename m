From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] clk: samsung: Add a separate driver for Exynos4412
 ISP clocks
Date: Tue, 3 Oct 2017 21:32:34 +0200
Message-ID: <20171003193234.kqex4kwa57sjegcr@kozik-lap>
References: <20171002180007.asan73h53nfot6nr@kozik-lap>
 <CGME20171003061657eucas1p27badb05b29f1130e598aeb2fa2aef92f@eucas1p2.samsung.com>
 <20171003061644.2597-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:38612 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdJCTcj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 15:32:39 -0400
Content-Disposition: inline
In-Reply-To: <20171003061644.2597-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Tue, Oct 03, 2017 at 08:16:44AM +0200, Marek Szyprowski wrote:
> Some registers for the Exynos 4412 ISP (Camera subsystem) clocks are
> partially located in the SOC area, which belongs to ISP power domain.
> Because those registers are also located in a different memory region
> than the main clock controller, support for them can be provided by
> a separate clock controller. This in turn allows to almost seamlessly
> make it aware of the power domain using recently introduced runtime
> PM support for clocks.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos4-clock.txt    |  27 ++++
>  drivers/clk/samsung/Makefile                       |   1 +
>  drivers/clk/samsung/clk-exynos4412-isp.c           | 179 +++++++++++++++++++++
>  include/dt-bindings/clock/exynos4.h                |  35 ++++
>  4 files changed, 242 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos4412-isp.c
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
