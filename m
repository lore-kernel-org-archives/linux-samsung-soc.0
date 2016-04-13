From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Enable clocks for CMU_CCORE and
 CMU_FSYS0 blocks
Date: Wed, 13 Apr 2016 09:26:15 +0300
Message-ID: <CA+Ln22G0b1O9HHyePg60Q2uZnGT_a3J1LMU0o3+CpPoLCTbksA@mail.gmail.com>
References: <1460459243-27120-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f65.google.com ([209.85.192.65]:35447 "EHLO
	mail-qg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965650AbcDMG0Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Apr 2016 02:26:16 -0400
In-Reply-To: <1460459243-27120-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>

2016-04-12 14:07 GMT+03:00 Alim Akhtar <alim.akhtar@samsung.com>:
> This patch enables clocks for CMU_CCORE and CMU_FSYS0 blocks. This is
> required before accessing registers of these blocks.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index ad68d46..7013aa7 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -8,6 +8,7 @@
>   *
>  */
>
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/of.h>
>
> @@ -205,7 +206,11 @@ static struct samsung_cmu_info topc_cmu_info __initdata = {
>
>  static void __init exynos7_clk_topc_init(struct device_node *np)
>  {
> +       struct clk *clk;
> +
>         samsung_cmu_register_one(np, &topc_cmu_info);
> +       clk = __clk_lookup("aclk_ccore_133");
> +       clk_prepare_enable(clk);

Shouldn't this be rather done before calling
samsung_cmu_register_one()? I don't remember exactly, but wouldn't
clock registration trigger reading back current (mux, div) values from
registers?

Also, do we have any guarantees on order of initialization of
particular CMUs? I believe this will happen in order of DT nodes and
so would be not any kind of guarantee at all.

Best regards,
Tomasz
