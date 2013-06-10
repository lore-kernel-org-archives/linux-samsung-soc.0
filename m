From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] clk: exynos5250: Add CLK_IGNORE_UNUSED flag for pmu clock
Date: Mon, 10 Jun 2013 09:46:25 +0530
Message-ID: <51B55319.7090603@linaro.org>
References: <1370507298-9230-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:44633 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750996Ab3FJEQa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 00:16:30 -0400
Received: by mail-pd0-f179.google.com with SMTP id q10so1029756pdj.24
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Jun 2013 21:16:29 -0700 (PDT)
In-Reply-To: <1370507298-9230-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, patches@linaro.org

On 06/06/2013 01:58 PM, Tushar Behera wrote:
> Currently 'pmu' clock is not handled by any of the drivers.
> Also before the introduction of CCF, this clock was not defined,
> hence was left enabled always.
> 
> When this clock is disabled, software reset register becomes
> inaccessible and system reboot doesn't work.
> 
> Upon restoring the default behaviour, system reboot starts working.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index 5c97e75..3853da9 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -378,7 +378,7 @@ struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>  	GATE(hsi2c3, "hsi2c3", "aclk66", GATE_IP_PERIC, 31, 0, 0),
>  	GATE(chipid, "chipid", "aclk66", GATE_IP_PERIS, 0, 0, 0),
>  	GATE(sysreg, "sysreg", "aclk66", GATE_IP_PERIS, 1, 0, 0),
> -	GATE(pmu, "pmu", "aclk66", GATE_IP_PERIS, 2, 0, 0),
> +	GATE(pmu, "pmu", "aclk66", GATE_IP_PERIS, 2, CLK_IGNORE_UNUSED, 0),
>  	GATE(tzpc0, "tzpc0", "aclk66", GATE_IP_PERIS, 6, 0, 0),
>  	GATE(tzpc1, "tzpc1", "aclk66", GATE_IP_PERIS, 7, 0, 0),
>  	GATE(tzpc2, "tzpc2", "aclk66", GATE_IP_PERIS, 8, 0, 0),
> 

If there are no objections, can this patch be queued for 3.10? It is
fixing regression w.r.t. system reboot on EXYNOS5250 based systems.

-- 
Tushar Behera
