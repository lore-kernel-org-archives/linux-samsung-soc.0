From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: Delete an error message for a failed
 memory allocation in exynos_register_cpu_clock()
Date: Wed, 27 Sep 2017 16:59:13 +0200
Message-ID: <cffa4c0c-8b69-bac7-7845-a7a7fee6d898@samsung.com>
References: <CGME20170927135526epcas1p37af4b72a90b97a4b88f9995a26bd0a32@epcas1p3.samsung.com>
        <19c81633-7110-260a-70c6-c55fad5607d6@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22838 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751907AbdI0O7V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Sep 2017 10:59:21 -0400
In-reply-to: <19c81633-7110-260a-70c6-c55fad5607d6@users.sourceforge.net>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 09/27/2017 03:55 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 15:46:53 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied with summary line shortened to 
"clk: samsung: Delete a memory allocation error message in clk-cpu.c",
thanks.

> ---
>  drivers/clk/samsung/clk-cpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
> index 6686e8ba61f9..d2c99d8916b8 100644
> --- a/drivers/clk/samsung/clk-cpu.c
> +++ b/drivers/clk/samsung/clk-cpu.c
> @@ -457,8 +457,6 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>  
>  	cpuclk->cfg = kmemdup(cfg, sizeof(*cfg) * num_cfgs, GFP_KERNEL);
>  	if (!cpuclk->cfg) {
> -		pr_err("%s: could not allocate memory for cpuclk data\n",
> -				__func__);
>  		ret = -ENOMEM;
>  		goto unregister_clk_nb;
>  	}
