From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 8/9] clk: samsung: Add explicit MPLL and EPLL clkdev
 aliases in S3C2443 driver
Date: Thu, 5 Oct 2017 00:38:03 +0900
Message-ID: <CAGTfZH2V-t4a7Dds0nZiuDCcinbM7JrARkZo=AkoYVFXdTf0Gw@mail.gmail.com>
References: <CGME20171003100031eucas1p142552d25c13db986a50951c988073223@eucas1p1.samsung.com>
 <20171003100016.32029-1-m.szyprowski@samsung.com> <20171003100016.32029-9-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:35648 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752409AbdJDPip (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 11:38:45 -0400
In-Reply-To: <20171003100016.32029-9-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi,

On Tue, Oct 3, 2017 at 7:00 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> S3C2443 platform still use non-dt based lookup in some of its drivers to
> get MPLL and EPLL clocks. Till now it worked only because PLL() macro
> implicitely created aliases for all instatiated clocks. This feature will
> be removed, so explicitely create aliases for MPLL and EPLL clocks.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-s3c2443.c   | 10 ++++++----
>  include/dt-bindings/clock/s3c2443.h |  2 ++
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
> index 45166033f638..d94b85a42356 100644
> --- a/drivers/clk/samsung/clk-s3c2443.c
> +++ b/drivers/clk/samsung/clk-s3c2443.c
> @@ -191,6 +191,8 @@ struct samsung_gate_clock s3c2443_common_gates[] __initdata = {
>  struct samsung_clock_alias s3c2443_common_aliases[] __initdata = {
>         ALIAS(MSYSCLK, NULL, "msysclk"),
>         ALIAS(ARMCLK, NULL, "armclk"),
> +       ALIAS(MPLL, NULL, "mpll"),
> +       ALIAS(EPLL, NULL, "epll"),
>         ALIAS(HCLK, NULL, "hclk"),
>         ALIAS(HCLK_SSMC, NULL, "nand"),
>         ALIAS(PCLK_UART0, "s3c2440-uart.0", "uart"),
> @@ -223,9 +225,9 @@ struct samsung_clock_alias s3c2443_common_aliases[] __initdata = {
>  /* S3C2416 specific clocks */
>
>  static struct samsung_pll_clock s3c2416_pll_clks[] __initdata = {
> -       [mpll] = PLL(pll_6552_s3c2416, 0, "mpll", "mpllref",
> +       [mpll] = PLL(pll_6552_s3c2416, MPLL, "mpll", "mpllref",
>                                                 LOCKCON0, MPLLCON, NULL),
> -       [epll] = PLL(pll_6553, 0, "epll", "epllref",
> +       [epll] = PLL(pll_6553, EPLL, "epll", "epllref",
>                                                 LOCKCON1, EPLLCON, NULL),
>  };
>
> @@ -277,9 +279,9 @@ struct samsung_clock_alias s3c2416_aliases[] __initdata = {
>  /* S3C2443 specific clocks */
>
>  static struct samsung_pll_clock s3c2443_pll_clks[] __initdata = {
> -       [mpll] = PLL(pll_3000, 0, "mpll", "mpllref",
> +       [mpll] = PLL(pll_3000, MPLL, "mpll", "mpllref",
>                                                 LOCKCON0, MPLLCON, NULL),
> -       [epll] = PLL(pll_2126, 0, "epll", "epllref",
> +       [epll] = PLL(pll_2126, EPLL, "epll", "epllref",
>                                                 LOCKCON1, EPLLCON, NULL),
>  };
>
> diff --git a/include/dt-bindings/clock/s3c2443.h b/include/dt-bindings/clock/s3c2443.h
> index 37e66b054d64..f3ba68a25ecb 100644
> --- a/include/dt-bindings/clock/s3c2443.h
> +++ b/include/dt-bindings/clock/s3c2443.h
> @@ -26,6 +26,8 @@
>  #define ARMCLK                 4
>  #define HCLK                   5
>  #define PCLK                   6
> +#define MPLL                   7
> +#define EPLL                   8
>
>  /* Special clocks */
>  #define SCLK_HSSPI0            16


When using PLL() macro, pll uses the 'name' as for both 'name' and 'alias'.
The patch9 removes the registration of PLL's alias in the
_samsung_clk_register_pll().
So, this patch looks good to me for patch9.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
