From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] clk: s5pv210: add missing call to
 samsung_clk_of_add_provider()
Date: Fri, 07 Aug 2015 16:10:43 +0200
Message-ID: <55C4BC63.6090203@samsung.com>
References: <1411117216-11456-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44081 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753341AbbHGOKr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Aug 2015 10:10:47 -0400
In-reply-to: <1411117216-11456-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>

Hello,

On 2014-09-19 11:00, Marek Szyprowski wrote:
> Commit d5e136a21b2028fb1f45143ea7112d5869bfc6c7 ("clk: samsung: Register
> clk provider only after registering its all clocks", merged to v3.17-rc1)
> modified a way that driver registers registers to core framework. This
> change has not been applied to s5pv210 clocks driver, which has been
> merged in parallel to that commit. This patch adds a missing call to
> samsung_clk_of_add_provider(), so the driver is operational again.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Hello!
>
> This is an important fix to v3.17-rcX. Without it support for Samsung
> S5PV210 SoCs is not functional.
>
> Mike, could you take it to the fixes branch?

Mike: could you handle this patch? It looks it got missed for a few 
releases...

> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> ---
>   drivers/clk/samsung/clk-s5pv210.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
> index d270a20..f41b017 100644
> --- a/drivers/clk/samsung/clk-s5pv210.c
> +++ b/drivers/clk/samsung/clk-s5pv210.c
> @@ -828,6 +828,8 @@ static void __init __s5pv210_clk_init(struct device_node *np,
>   
>   	s5pv210_clk_sleep_init();
>   
> +	samsung_clk_of_add_provider(np, ctx);
> +
>   	pr_info("%s clocks: mout_apll = %ld, mout_mpll = %ld\n"
>   		"\tmout_epll = %ld, mout_vpll = %ld\n",
>   		is_s5p6442 ? "S5P6442" : "S5PV210",

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
