From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 2/3] clk: samsung: exynos5433: Add data for 250MHz and
 278MHz PLL rates
Date: Thu, 26 Jan 2017 23:33:02 +0900
Message-ID: <CAGTfZH2PZUAj91f=HBYYJzLxLEfcbU+TwTVvgQmDmHDAdJWBFw@mail.gmail.com>
References: <CGME20170126123805eucas1p2b95ab23660b7a6631ab7f639ebaff0fc@eucas1p2.samsung.com>
 <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com> <1485434274-6579-3-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:35244 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752853AbdAZOdo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 09:33:44 -0500
Received: by mail-qt0-f193.google.com with SMTP id f4so38903193qte.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2017 06:33:43 -0800 (PST)
In-Reply-To: <1485434274-6579-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

2017-01-26 21:37 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Default clock configuration applied by the bootloader for TM2 and TM2e
> boards includes 250MHz and 278MHz rate for DISP PLL clock. To ensure such
> configuration for those boards with 'assigned-clocks*' properties,
> parameters for those two additional rates are needed.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 6ee91ae875c3..11343a597093 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -739,7 +739,9 @@
>         PLL_35XX_RATE(350000000U,  350, 6,  2),
>         PLL_35XX_RATE(333000000U,  222, 4,  2),
>         PLL_35XX_RATE(300000000U,  500, 5,  3),
> +       PLL_35XX_RATE(278000000U,  556, 6,  3),
>         PLL_35XX_RATE(266000000U,  532, 6,  3),
> +       PLL_35XX_RATE(250000000U,  500, 6,  3),
>         PLL_35XX_RATE(200000000U,  400, 6,  3),
>         PLL_35XX_RATE(166000000U,  332, 6,  3),
>         PLL_35XX_RATE(160000000U,  320, 6,  3),

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
