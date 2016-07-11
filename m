From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v3 2/2] clk: samsung: exynos7: Add clocks for atlas block
Date: Mon, 11 Jul 2016 16:43:50 +0200
Message-ID: <CAM4voa=6-4Gq+0TvQLJGiB24UzKJudTW8kXacUbTAOr1t=JMyg@mail.gmail.com>
References: <1467750561-13957-1-git-send-email-a.kesavan@samsung.com>
 <1467750561-13957-3-git-send-email-a.kesavan@samsung.com> <577E2E6E.3040809@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <577E2E6E.3040809@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

Thanks for the review.

On Thu, Jul 7, 2016 at 12:26 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 07/05/2016 10:29 PM, Abhilash Kesavan wrote:
>
>> +static const struct samsung_pll_rate_table pll1450x_24mhz_tbl[] = {
>> +     /* rate, m, p, s */
>> +     PLL_35XX_RATE(2496000000, 208, 2, 0),
>
> Please add U postfix to these constants to address compiler warning
> as reported by kbuild-all@01.org:

I'll fix the warning.
>
>>> drivers/clk/samsung/clk-exynos7.c:43:2: warning: this decimal constant is
> unsigned only in ISO C90
>      PLL_35XX_RATE(2496000000, 208, 2, 0),
>      ^~~~~~~~~~~~~
>
>
>> +static void __init exynos7_clk_atlas_init(struct device_node *np)
>> +{
>> +     void __iomem *reg_base;
>> +     struct samsung_clk_provider *ctx;
>> +
>> +     reg_base = of_iomap(np, 0);
>> +     if (!reg_base) {
>> +             panic("%s: failed to map registers\n", __func__);
>> +             return;
>> +     }
>> +
>> +     ctx = samsung_clk_init(np, reg_base, ATLAS_NR_CLK);
>> +     if (!ctx) {
>> +             panic("%s: unable to allocate ctx\n", __func__);
>
> You can remove this panic() call, there is already one inside
> samsung_clk_init().

Will remove it.

Thanks,
Abhilash
