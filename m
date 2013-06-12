From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: exynos5250: Add CLK_IGNORE_UNUSED flag for pmu clock
Date: Tue, 11 Jun 2013 20:06:33 -0700
Message-ID: <20130612030633.8816.19714@quantum>
References: <1370507298-9230-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:60846 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754649Ab3FLDGi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 23:06:38 -0400
Received: by mail-pb0-f47.google.com with SMTP id rr13so6545950pbb.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 20:06:38 -0700 (PDT)
In-Reply-To: <1370507298-9230-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Quoting Tushar Behera (2013-06-06 01:28:18)
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

Taken into clk-fixes.

Thanks,
Mike

> ---
>  drivers/clk/samsung/clk-exynos5250.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index 5c97e75..3853da9 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -378,7 +378,7 @@ struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>         GATE(hsi2c3, "hsi2c3", "aclk66", GATE_IP_PERIC, 31, 0, 0),
>         GATE(chipid, "chipid", "aclk66", GATE_IP_PERIS, 0, 0, 0),
>         GATE(sysreg, "sysreg", "aclk66", GATE_IP_PERIS, 1, 0, 0),
> -       GATE(pmu, "pmu", "aclk66", GATE_IP_PERIS, 2, 0, 0),
> +       GATE(pmu, "pmu", "aclk66", GATE_IP_PERIS, 2, CLK_IGNORE_UNUSED, 0),
>         GATE(tzpc0, "tzpc0", "aclk66", GATE_IP_PERIS, 6, 0, 0),
>         GATE(tzpc1, "tzpc1", "aclk66", GATE_IP_PERIS, 7, 0, 0),
>         GATE(tzpc2, "tzpc2", "aclk66", GATE_IP_PERIS, 8, 0, 0),
> -- 
> 1.7.9.5
