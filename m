From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] clk: exynos5433: Extend list of available AUD_PLL
 output frequencies
Date: Tue, 13 Feb 2018 06:46:01 +0900
Message-ID: <5A820B19.8080902@samsung.com>
References: <CGME20180212155239epcas2p34dad3d106036f65e5ee566a593a983e3@epcas2p3.samsung.com>
        <20180212155227.20605-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20180212155227.20605-1-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2018년 02월 13일 00:52, Sylwester Nawrocki wrote:
> Add one more entry to the exynos5433_aud_pll_rates table, this allows
> to support audio sample rates: 48000, 96000, 192000 Hz with minimum
> error. The M, P, S, K values re confirmed by the HW team.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index ebd18586e325..b08a9028653f 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -765,6 +765,7 @@ static const struct samsung_pll_rate_table exynos5433_aud_pll_rates[] __initcons
>  	PLL_36XX_RATE(294912000U,  98, 1, 3,  19923),
>  	PLL_36XX_RATE(288000000U,  96, 1, 3,      0),
>  	PLL_36XX_RATE(252000000U,  84, 1, 3,      0),
> +	PLL_36XX_RATE(196608001U, 197, 3, 3, -25690),
>  	{ /* sentinel */ }
>  };

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
