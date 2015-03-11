From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: samsung: Add CLKOUT driver support for Exynos3250
 SoC.
Date: Wed, 11 Mar 2015 16:34:50 -0700
Message-ID: <5500D11A.6010200@codeaurora.org>
References: <1425262500-27456-1-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:53314 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbbCKXex (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 19:34:53 -0400
In-Reply-To: <1425262500-27456-1-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inha Song <ideal.song@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, mturquette@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, cw00.choi@samsung.com

On 03/01/15 18:15, Inha Song wrote:
> This patch add CLKOUT driver support for Exynos3250 SoC.
>
> Exynos3250 SoC PMU_DEBUG is the same with Exynos4's PMU_DEBUG
> including CLKOUT mux. So, We can use the exynos4's clkout init
> function for Exynos3250 without the need to add new function.
>
> Signed-off-by: Inha Song <ideal.song@samsung.com>

Do you want to take this through some SoC tree? If so:

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 3a7cb25..1c02e73 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -142,6 +142,8 @@ CLK_OF_DECLARE(exynos4212_clkout, "samsung,exynos4212-pmu",
>  		exynos4_clkout_init);
>  CLK_OF_DECLARE(exynos4412_clkout, "samsung,exynos4412-pmu",
>  		exynos4_clkout_init);
> +CLK_OF_DECLARE(exynos3250_clkout, "samsung,exynos3250-pmu",
> +		exynos4_clkout_init);
>  
>  static void __init exynos5_clkout_init(struct device_node *node)
>  {


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
