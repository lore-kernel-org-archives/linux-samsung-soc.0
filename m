From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos3250: fix width field of mout_mmc0/1
Date: Tue, 09 Sep 2014 14:14:03 +0200
Message-ID: <540EEF0B.3040202@samsung.com>
References: <1409918081-2464-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12423 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352AbaIIMOR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Sep 2014 08:14:17 -0400
In-reply-to: <1409918081-2464-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com

On 05.09.2014 13:54, Pankaj Dubey wrote:
> As per Exynos3250 user manual mmc0/1 mux selection has 4 bit wide.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos3250.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

>
> diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
> index 7a17bd4..e1cb464 100644
> --- a/drivers/clk/samsung/clk-exynos3250.c
> +++ b/drivers/clk/samsung/clk-exynos3250.c
> @@ -335,8 +335,8 @@ static struct samsung_mux_clock mux_clks[] __initdata = {
>
>   	/* SRC_FSYS */
>   	MUX(CLK_MOUT_TSADC, "mout_tsadc", group_sclk_p, SRC_FSYS, 28, 4),
> -	MUX(CLK_MOUT_MMC1, "mout_mmc1", group_sclk_p, SRC_FSYS, 4, 3),
> -	MUX(CLK_MOUT_MMC0, "mout_mmc0", group_sclk_p, SRC_FSYS, 0, 3),
> +	MUX(CLK_MOUT_MMC1, "mout_mmc1", group_sclk_p, SRC_FSYS, 4, 4),
> +	MUX(CLK_MOUT_MMC0, "mout_mmc0", group_sclk_p, SRC_FSYS, 0, 4),
>
>   	/* SRC_PERIL0 */
>   	MUX(CLK_MOUT_UART1, "mout_uart1", group_sclk_p, SRC_PERIL0, 4, 4),
>
