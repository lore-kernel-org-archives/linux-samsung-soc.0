From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] clk: samsung: exynos5433: add CPU clocks
 configuration data and instantiate CPU clocks
Date: Sat, 18 Jun 2016 23:57:30 +0900
Message-ID: <CA+Ln22GZu9GEyCzkywkeQz8v-dq5cpVkeGRxk15spUo=JqvgTA@mail.gmail.com>
References: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com> <1464095957-25851-4-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:32773 "EHLO
	mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbcFRO5c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 18 Jun 2016 10:57:32 -0400
In-Reply-To: <1464095957-25851-4-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Bart,

2016-05-24 22:19 GMT+09:00 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>:
> Add the CPU clocks configuration data and instantiate the CPU clocks
> type for Exynos5433.
>
> Cc: Kukjin Kim <kgene@kernel.org>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 72 ++++++++++++++++++++++++++++++++----
>  1 file changed, 64 insertions(+), 8 deletions(-)

Please see my comments inline.

> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 6dd81ed..9ff6160 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
[snip]
>  static void __init exynos5433_cmu_apollo_init(struct device_node *np)
> @@ -3620,6 +3640,12 @@ static void __init exynos5433_cmu_apollo_init(struct device_node *np)
>                                  ARRAY_SIZE(apollo_div_clks));
>         samsung_clk_register_gate(ctx, apollo_gate_clks,
>                                   ARRAY_SIZE(apollo_gate_clks));
> +
> +       exynos_register_cpu_clock(ctx, CLK_SCLK_APOLLO, "apolloclk",
> +               mout_apollo_p[0], mout_apollo_p[1], 0x200,
> +               exynos5433_apolloclk_d, ARRAY_SIZE(exynos5433_apolloclk_d),
> +               CLK_CPU_HAS_E5433_REGS_LAYOUT);

Hmm, I guess the reason for patch 1/3 was that
exynos_register_cpu_clock() has to be called with the ctx pointer.
However samsung_cmu_register_one() returns the ctx pointer, so I guess
you could use that to avoid open-coding?

Best regards,
Tomasz
