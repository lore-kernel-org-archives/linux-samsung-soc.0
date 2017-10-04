From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 RESEND] clk: samsung: exynos4: Enable VPLL and EPLL
 clocks for suspend/resume cycle
Date: Wed, 4 Oct 2017 09:19:25 -0700
Message-ID: <20171004161925.GW457@codeaurora.org>
References: <CGME20170919100345eucas1p1391a495dab09faecdc2acf9635e4c42d@eucas1p1.samsung.com>
 <1505815279-19097-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505815279-19097-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/19, Marek Szyprowski wrote:
> Commit 6edfa11cb396 ("clk: samsung: Add enable/disable operation for
> PLL36XX clocks") added enable/disable operations to PLL clocks. Prior that
> VPLL and EPPL clocks were always enabled because the enable bit was never
> touched. Those clocks have to be enabled during suspend/resume cycle,
> because otherwise board fails to enter sleep mode. This patch enables them
> unconditionally before entering system suspend state. System restore
> function will set them to the previous state saved in the register cache
> done before that unconditional enable.
> 
> Fixes: 6edfa11cb396 ("clk: samsung: Add enable/disable operation for PLL36XX clocks")
> CC: stable@vger.kernel.org # v4.13
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
