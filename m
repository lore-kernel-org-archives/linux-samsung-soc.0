From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] memory: Exynos5422: minor fixes in DMC
Date: Fri, 6 Sep 2019 12:51:01 +0200
Message-ID: <CAJKOXPdLhrvqR==k4a9w9cmdnwGRYaTXC1ya+vOeVaGpML0zcQ@mail.gmail.com>
References: <CGME20190906101405eucas1p2e3da7b461810a3a520e76c636a06e486@eucas1p2.samsung.com>
 <20190906101344.3535-1-l.luba@partner.samsung.com> <20190906101344.3535-2-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906101344.3535-2-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 6 Sep 2019 at 12:14, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Small fixes captured by static analyzes.

Explain please what are the errors being fixed. Additionally error
message from tool might be useful.

Also:
Reported-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/memory/samsung/exynos5422-dmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
> index 8c2ec29a7d57..a809fa997c03 100644
> --- a/drivers/memory/samsung/exynos5422-dmc.c
> +++ b/drivers/memory/samsung/exynos5422-dmc.c
> @@ -269,7 +269,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
>         return 0;
>
>  err_free_tables:
> -       kfree(dmc->opp);
> +       devm_kfree(dmc->dev, dmc->opp);
>  err_opp:
>         dev_pm_opp_of_remove_table(dmc->dev);
>
> @@ -732,7 +732,7 @@ static struct devfreq_dev_profile exynos5_dmc_df_profile = {
>   * statistics engine which supports only registered values. Thus, some alignment
>   * must be made.
>   */
> -unsigned long
> +static unsigned long
>  exynos5_dmc_align_init_freq(struct exynos5_dmc *dmc,
>                             unsigned long bootloader_init_freq)
>  {
> --
> 2.17.1
>
