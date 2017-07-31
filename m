From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: samsung: exynos5420: The EPLL rate table corrections
Date: Mon, 31 Jul 2017 13:17:09 -0700
Message-ID: <20170731201709.GJ2146@codeaurora.org>
References: <CGME20170721112008epcas5p1eb75e4eb00d1dbad130460d2cbc0ce0c@epcas5p1.samsung.com>
 <1500635990-19474-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500635990-19474-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/21, Sylwester Nawrocki wrote:
> This patch fixes values of the EPLL K coefficient and changes
> the EPLL output frequency values to match exactly what is
> possible to achieve with given M, P, S, K coefficients.
> This allows to avoid rounding errors and unexpected frequency
> being set with clk_set_rate(), due to recalc_rate returning
> different values than the PLL rate specified in the
> exynos5420_epll_24mhz_tbl table. E.g. this prevents a case
> where two consecutive clk_set_rate() calls with same argument
> result in different PLL output frequency.
> 
> The PLL output frequencies have been calculated with formula:
> 
> f = fxtal * (M * 2^16 + K) / (P * 2^S) / 2^16
> 
> where fxtal = 24000000.
> 
> Fixes: 9842452acd ("clk: samsung: exynos542x: Add EPLL rate table")
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
