From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] clk: samsung: Instantiate Exynos4412 ISP clocks only
 when available
Date: Mon, 2 Oct 2017 19:40:47 +0200
Message-ID: <20171002174047.erucrnbh4dtvkjib@kozik-lap>
References: <20171002104759.25944-1-m.szyprowski@samsung.com>
 <CGME20171002104824eucas1p1de6466888524f3f3f097086b1e2388ff@eucas1p1.samsung.com>
 <20171002104759.25944-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38910 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751131AbdJBRkv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 13:40:51 -0400
Content-Disposition: inline
In-Reply-To: <20171002104759.25944-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Oct 02, 2017 at 12:47:56PM +0200, Marek Szyprowski wrote:
> Some additional registers for the ISP (Camera subsystem) clocks are
> partially located in the SOC area, which belongs to ISP power domain.
> Istatiate those clocks only when provided clock registers resource
> covers those registers. This is a preparation for adding a separate
> clock driver for ISP clocks, which will be intergated with power
> domain using runtime PM feature.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
