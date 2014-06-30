From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk/exynos5250: fix bit number for tv sysmmu clock
Date: Mon, 30 Jun 2014 15:49:47 +0200
Message-ID: <53B16AFB.9010107@samsung.com>
References: <1403156836-24421-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63798 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753571AbaF3NuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:50:18 -0400
In-reply-to: <1403156836-24421-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

On 19.06.2014 07:47, Rahul Sharma wrote:
> Change bit from 2 to 9 for tv (mixer) sysmmu clock.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> Based on Kukjin's for-next branch.
> 
>  drivers/clk/samsung/clk-exynos5250.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index 1fad4c5..184f642 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -661,7 +661,7 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>  	GATE(CLK_RTC, "rtc", "div_aclk66", GATE_IP_PERIS, 20, 0, 0),
>  	GATE(CLK_TMU, "tmu", "div_aclk66", GATE_IP_PERIS, 21, 0, 0),
>  	GATE(CLK_SMMU_TV, "smmu_tv", "mout_aclk200_disp1_sub",
> -			GATE_IP_DISP1, 2, 0, 0),
> +			GATE_IP_DISP1, 9, 0, 0),
>  	GATE(CLK_SMMU_FIMD1, "smmu_fimd1", "mout_aclk200_disp1_sub",
>  			GATE_IP_DISP1, 8, 0, 0),
>  	GATE(CLK_SMMU_2D, "smmu_2d", "div_aclk200", GATE_IP_ACP, 7, 0, 0),
> 

Applied as a fix for 3.16.

Best regards,
Tomasz
