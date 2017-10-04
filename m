From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 5/9] clk: samsung: Drop useless alias in Exynos5420 clk driver
Date: Wed, 4 Oct 2017 23:32:47 +0900
Message-ID: <CAGTfZH3T-p_6vRfGd=Rn=NQZXyUOT8Tsb4qDtQ4saHNZXnQPKw@mail.gmail.com>
References: <CGME20171003100030eucas1p2be91ffc5db49f33cbc289175e72dd586@eucas1p2.samsung.com>
 <20171003100016.32029-1-m.szyprowski@samsung.com> <20171003100016.32029-6-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171003100016.32029-6-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 3, 2017 at 7:00 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Drop clkdev alias for "mout_aclk400_mscl" clock. It was not used at all
> and it was probably committed by accident.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 038701a2af4c..45d34f601e9e 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -600,8 +600,7 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
>                                 TOP_SPARE2, 4, 1),
>
>         MUX(0, "mout_aclk400_isp", mout_group1_p, SRC_TOP0, 0, 2),
> -       MUX_A(0, "mout_aclk400_mscl", mout_group1_p,
> -                               SRC_TOP0, 4, 2, "aclk400_mscl"),
> +       MUX(0, "mout_aclk400_mscl", mout_group1_p, SRC_TOP0, 4, 2),
>         MUX(0, "mout_aclk400_wcore", mout_group1_p, SRC_TOP0, 16, 2),
>         MUX(0, "mout_aclk100_noc", mout_group1_p, SRC_TOP0, 20, 2),
>

Also, 'aclk400_mscl' is used as a duplicate on gate clock's name.
Looks good to me.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
