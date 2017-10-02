From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/4] clk: samsung: Remove obsolete code for Exynos4412
 ISP clocks
Date: Mon, 2 Oct 2017 20:00:37 +0200
Message-ID: <20171002180037.negsvbgcues4k7wk@kozik-lap>
References: <20171002104759.25944-1-m.szyprowski@samsung.com>
 <CGME20171002104826eucas1p17b7ea22d3984f1dea0e3efb45733d728@eucas1p1.samsung.com>
 <20171002104759.25944-5-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171002104759.25944-5-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 02, 2017 at 12:47:59PM +0200, Marek Szyprowski wrote:
> Exynos4412 ISP clock are provided by separate Exynos4412 ISP clock
> driver, so support for them in Exynos4-clk driver can be removed.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c   | 81 -------------------------------------
>  include/dt-bindings/clock/exynos4.h | 30 --------------
>  2 files changed, 111 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

