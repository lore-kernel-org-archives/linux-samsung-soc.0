From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5420: The EPLL rate table
 corrections
Date: Mon, 31 Jul 2017 14:26:24 +0200
Message-ID: <33f53903-9043-29c0-2cb8-e5d6950cc92f@samsung.com>
References: <CGME20170721112008epcas5p1eb75e4eb00d1dbad130460d2cbc0ce0c@epcas5p1.samsung.com>
        <1500635990-19474-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1500635990-19474-1-git-send-email-s.nawrocki@samsung.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: cw00.choi@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/21/2017 01:19 PM, Sylwester Nawrocki wrote:
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
> f = fxtal * (M * 2^16  + K) / (P * 2^S) / 2^16
> 
> where fxtal = 24000000.
> 
> Fixes: 9842452acd ("clk: samsung: exynos542x: Add EPLL rate table")
> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>

Stephen, Mike,

Could you apply this patch directly for v4.12-rcX?
It fixes code added in v4.12.

-- 
Thanks,
Sylwester
