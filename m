From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: mark PM functions as
 __maybe_unused
Date: Wed, 11 Oct 2017 11:07:33 +0200
Message-ID: <08513173-6712-4156-4475-3600cde6b7ea@samsung.com>
References: <20171010091522.2286344-1-arnd@arndb.de>
        <CGME20171011090739epcas1p298f23646912d3ead6c30609fca199cf2@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171010091522.2286344-1-arnd@arndb.de>
Content-language: en-GB
Sender: linux-clk-owner@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/10/2017 11:15 AM, Arnd Bergmann wrote:
> The suspend/resume functions are referenced conditionally, causing
> a harmless warning when CONFIG_PM is disabled:
> 
> drivers/clk/samsung/clk-exynos5433.c:5476:12: error: 'exynos5433_cmu_resume' defined but not used [-Werror=unused-function]
> drivers/clk/samsung/clk-exynos5433.c:5453:12: error: 'exynos5433_cmu_suspend' defined but not used [-Werror=unused-function]
> 
> This marks both as __maybe_unused to shut up the warning.
> 
> Fixes: 523d3de41f02 ("clk: samsung: exynos5433: Add support for runtime PM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks.
