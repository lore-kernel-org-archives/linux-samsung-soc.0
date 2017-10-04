From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 7/9] clk: samsung: Rework clkdev alias handling in S3C2443 driver
Date: Thu, 5 Oct 2017 00:04:16 +0900
Message-ID: <CAGTfZH1iDS_t3B_LpKija4qq6wO8eB5HpJodiUfR8C_DshPNPQ@mail.gmail.com>
References: <CGME20171003100031eucas1p29f34d4e1878d839a7af9ea05ba15ece9@eucas1p2.samsung.com>
 <20171003100016.32029-1-m.szyprowski@samsung.com> <20171003100016.32029-8-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:36935 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752310AbdJDPE6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 11:04:58 -0400
In-Reply-To: <20171003100016.32029-8-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Tue, Oct 3, 2017 at 7:00 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> S3C2443 SoCs still uses old, non-dt CPUfreq driver, which requires clkdev
> aliases to get access to proper clocks. Create those aliases using
> samsung_clk_register_alias() function instead of using *_A clock macros,
> which will be removed soon.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-s3c2443.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
> index abb935c42916..45166033f638 100644
> --- a/drivers/clk/samsung/clk-s3c2443.c
> +++ b/drivers/clk/samsung/clk-s3c2443.c
> @@ -117,8 +117,8 @@ struct samsung_mux_clock s3c2443_common_muxes[] __initdata = {
>         MUX(0, "epllref", epllref_p, CLKSRC, 7, 2),
>         MUX(ESYSCLK, "esysclk", esysclk_p, CLKSRC, 6, 1),
>         MUX(0, "mpllref", mpllref_p, CLKSRC, 3, 1),
> -       MUX_A(MSYSCLK, "msysclk", msysclk_p, CLKSRC, 4, 1, "msysclk"),
> -       MUX_A(ARMCLK, "armclk", armclk_p, CLKDIV0, 13, 1, "armclk"),
> +       MUX(MSYSCLK, "msysclk", msysclk_p, CLKSRC, 4, 1),
> +       MUX(ARMCLK, "armclk", armclk_p, CLKDIV0, 13, 1),
>         MUX(0, "mux_i2s0", i2s0_p, CLKSRC, 14, 2),
>  };
>
> @@ -189,6 +189,8 @@ struct samsung_gate_clock s3c2443_common_gates[] __initdata = {
>  };
>
>  struct samsung_clock_alias s3c2443_common_aliases[] __initdata = {
> +       ALIAS(MSYSCLK, NULL, "msysclk"),
> +       ALIAS(ARMCLK, NULL, "armclk"),
>         ALIAS(HCLK, NULL, "hclk"),
>         ALIAS(HCLK_SSMC, NULL, "nand"),
>         ALIAS(PCLK_UART0, "s3c2440-uart.0", "uart"),

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
