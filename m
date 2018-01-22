From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: syscon: Remove unused Exynos PMU headers
Date: Mon, 22 Jan 2018 13:44:52 +0000
Message-ID: <20180122134452.kx4fst5dxi4wllmr@dell>
References: <20180109185921.28260-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180109185921.28260-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 09 Jan 2018, Krzysztof Kozlowski wrote:

> Since commit 5812f0106c44 ("phy: exynos4: Remove duplicated defines of
> PHY register defines") and commit 7a66647b25b6 ("phy: exynos: Use one
> define for enable bit") all users of syscon Exynos PMU headers (for PHY
> drivers) are converted to use different headers so these can be removed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Actually I removed these headers in mentioned commits:
>  - https://www.spinics.net/lists/arm-kernel/msg568612.html
>  - https://www.spinics.net/lists/arm-kernel/msg568608.html
> however this part of patch disappeared when applying...
> ---
>  include/linux/mfd/syscon/exynos4-pmu.h | 21 ---------------------
>  include/linux/mfd/syscon/exynos5-pmu.h | 19 -------------------
>  2 files changed, 40 deletions(-)
>  delete mode 100644 include/linux/mfd/syscon/exynos4-pmu.h
>  delete mode 100644 include/linux/mfd/syscon/exynos5-pmu.h

Applied, thanks.

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
