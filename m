From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v3 12/16] clk: exynos5420: fix register offset for sclk_bpll
Date: Wed, 30 Apr 2014 21:07:58 +0530
Message-ID: <CAK9yfHz-=rOuVakyttVaNnFpnF+WFckU+zyWjVwYPQ8BggHX0A@mail.gmail.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
	<1398344632-18623-13-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:45406 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933654AbaD3Ph7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 11:37:59 -0400
Received: by mail-oa0-f54.google.com with SMTP id i7so2150840oag.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2014 08:37:59 -0700 (PDT)
In-Reply-To: <1398344632-18623-13-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, shaik.samsung@gmail.com, Rahul Sharma <r.sh.open@gmail.com>

Hi Shaik,

On 24 April 2014 18:33, Shaik Ameer Basha <shaik.ameer@samsung.com> wrote:
> This patch fixes the wrong register offset for sclk_bpll clock.

Since this patch is a fix, it is better to send it separately so that
it gets into one of
the upcoming RCs (and if needed to stable).

>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 6daf739..3afc112 100755
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -111,7 +111,6 @@
>  #define TOP_SPARE2             0x10b08
>  #define BPLL_LOCK              0x20010
>  #define BPLL_CON0              0x20110
> -#define SRC_CDREX              0x20200
>  #define KPLL_LOCK              0x28000
>  #define KPLL_CON0              0x28100
>  #define SRC_KFC                        0x28200
> @@ -204,7 +203,6 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
>         GATE_TOP_SCLK_FSYS,
>         GATE_TOP_SCLK_PERIC,
>         TOP_SPARE2,
> -       SRC_CDREX,
>         SRC_KFC,
>         DIV_KFC0,
>  };
> @@ -380,7 +378,7 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>         MUX(0, "mout_kpll", mout_kpll_p, SRC_KFC, 0, 1),
>         MUX(0, "mout_kfc", mout_kfc_p, SRC_KFC, 16, 1),
>
> -       MUX(0, "sclk_bpll", mout_bpll_p, SRC_CDREX, 0, 1),
> +       MUX(0, "sclk_bpll", mout_bpll_p, TOP_SPARE2, 0, 1),
>
>         MUX_A(0, "mout_aclk400_mscl", mout_group1_p,
>                         SRC_TOP0, 4, 2, "aclk400_mscl"),
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
