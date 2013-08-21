From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 14/16] clk: samsung: exynos4: Register PLL rate tables for Exynos4210
Date: Wed, 21 Aug 2013 18:04:07 +0530
Message-ID: <CAKew6eXbc8ai9vSX2EMv+=7LYmxZ+75z1X72ytULOxtwX7bebg@mail.gmail.com>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
	<1377019903-14614-15-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:40078 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463Ab3HUMeI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 08:34:08 -0400
In-Reply-To: <1377019903-14614-15-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, Aug 20, 2013 at 11:01 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch adds rate tables for PLLs that can be reconfigured at runtime
> for Exynos4210 SoCs. Provided tables contain PLL coefficients for
> input clock of 24 MHz and so are registered only in this case. MPLL does
> not need runtime reconfiguration and so table for it is not provided.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c | 45 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 34474ce..e18cfae 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -992,6 +992,40 @@ static struct of_device_id ext_clk_match[] __initdata = {
>         {},
>  };
>
> +/* PLLs PMS values */
> +static struct samsung_pll_rate_table exynos4210_apll_rates[] = {
> +       PLL_45XX_RATE(1200000000, 150,  3, 1, 28),

All these tables in this patch as well as next patch can be __initdata


Regards,
Yadwinder
