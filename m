From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 0/7] clk/samsung: exynos5410: Add sound subsystem
 related clocks
Date: Thu, 08 Sep 2016 16:49:45 +0200
Message-ID: <9e3c332d-b7eb-d7c1-d055-d09efcfe4bf3@samsung.com>
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/06/2016 02:04 PM, Sylwester Nawrocki wrote:
> This patch adds support for the EPLL and the peripheral DMA clocks required
> for sound support on Odroid-XU board.
> 
> The clk-exynos-audss driver has been reworked to support
> "samsung,exynos5412-audss-clock" compatible.
> 
> This series also includes a cleanup patch consolidating the PLL clocks
> code, i.e. switching exynos5440 to use common code.
> 
> Sylwester Nawrocki (7):
>   clk: samsung: exynos5410: Add clock IDs for PDMA and EPLL clocks
>   clk: samsung: exynos5410: Expose the peripheral DMA gate clocks
>   clk: samsung: Use common registration function for pll2550x
>   clk: samsung: Add support for EPLL on exynos5410
>   clk: samsung: clk-exynos-audss: controller variant handling rework
>   clk: samsung: clk-exynos-audss: Add exynos5410 compatible
>   clk: samsung: clk-exynos-audss: Whitespace and debug trace cleanup


I have applied all patches from this series, except
"clk: samsung: Add support for EPLL on exynos5410", to my tree.

-- 
Thanks,
Sylwester
