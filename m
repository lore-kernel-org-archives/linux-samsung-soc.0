Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E1FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 20 Nov 2021 12:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237305AbhKTMwj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 20 Nov 2021 07:52:39 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58857 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236254AbhKTMwj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 20 Nov 2021 07:52:39 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211120124934euoutp02d5aa258732c962ae2c72cbc8e20b6f70~5Qg_X4c3r0724907249euoutp02G
        for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Nov 2021 12:49:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211120124934euoutp02d5aa258732c962ae2c72cbc8e20b6f70~5Qg_X4c3r0724907249euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637412574;
        bh=CdzGw4To/E3VT3Lrh4NcSSRB2biRHC8f/46KoobbYwk=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=p86xR5SPtBggCVlj6v1a0r0QuDGjQPbEC2XXmFuJ3HyJrqzjut/bUxHkEeaC1y5Tq
         X0ykCArFg3BS+eADjImA0QPShLRph6LjI5Cpo3S6MfHBjYYr4rA7QPeL4aXSWwY+ZA
         lJhsW7l7yXqCc8cPdD9obeGIjXR5e8rDQhBb30Cc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211120124933eucas1p221744a3e9ebcb0cca6024c7e715fa50f~5Qg90Cimg2331823318eucas1p2Y;
        Sat, 20 Nov 2021 12:49:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 80.D0.10260.DDEE8916; Sat, 20
        Nov 2021 12:49:33 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211120124933eucas1p2e4a09f2ce79544393083e32a2ec831b1~5Qg9RBT5u2334023340eucas1p2s;
        Sat, 20 Nov 2021 12:49:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211120124933eusmtrp1eeb356a99e65be8b869aebcb3832f3af~5Qg9QMs8x2134921349eusmtrp1h;
        Sat, 20 Nov 2021 12:49:33 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-4b-6198eedde740
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id EA.F4.09404.CDEE8916; Sat, 20
        Nov 2021 12:49:32 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211120124932eusmtip286623d7ae596cfe454a120fac0b9bd9a~5Qg8eUzq82793927939eusmtip23;
        Sat, 20 Nov 2021 12:49:32 +0000 (GMT)
Message-ID: <fcc939e6-50b4-1847-c738-db940d0c5bd4@samsung.com>
Date:   Sat, 20 Nov 2021 13:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v2 1/1] clk: samsung: exynos850: Register clocks early
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211025161254.5575-1-semen.protsenko@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHKsWRmVeSWpSXmKPExsWy7djP87p3381INJi6UcHi+pfnrBbzj5xj
        tdj49geTxabH11gtPvbcY7W4vGsOm8WM8/uYLC6ecrX4cbyP2aJ17xF2i3/XNrJYPO8Dip+6
        +5ndYtWuP4wOfB7vb7Sye8xq6GXz2DnrLrvHplWdbB53ru1h89i8pN6jb8sqRo/Pm+QCOKK4
        bFJSczLLUov07RK4Mr59P8hYsEO8YvOB8ywNjOeEuxg5OSQETCQe3W1i72Lk4hASWMEo8fz0
        V0aQhJDAF0aJz78UIBKfGSW+3ZnLDtOxZ1cXK0RiOaPEiRs9zBAdHxklpnUEgti8AnYSs27v
        BpvEIqAq8ffubBaIuKDEyZlPwGxRgSSJ062TwHqFBbwkum/eB4szC4hL3HoynwnEFhHQk1g3
        8xXYecwCHSwSU198YQVJsAkYSvQe7QNbwClgL3GlcTdUs7zE9rdzmEEaJARWc0rcvXKeFeJs
        F4ktJ2YwQtjCEq+Ob4F6R0bi9OQeFoiGZkaJnt232SGcCYwS948vgOqwlrhz7hdbFyMH0ApN
        ifW79CHCjhKbDl5gAglLCPBJ3HgrCHEEn8SkbdOZIcK8Eh1tQhDVKhK/V01ngrClJLqf/GeZ
        wKg0CylcZiH5fxaSd2Yh7F3AyLKKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMMmd/nf8
        6w7GFa8+6h1iZOJgPMQowcGsJMLLsWF6ohBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFekT8NiUIC
        6YklqdmpqQWpRTBZJg5OqQYma9PXAQX+AUaW2s/rZ07OYz2yvHni0c+ZTMGV4Tf8L5uyM/Vw
        vL53pfnmcUuLnC6nq0UvTsxeIl5k4MG/xpM/q+PyTuki64+/0u6yxAf2q5V0ma+3ZTa+ZiY+
        R+/J+acHjzBrbXzlNEfllE276pkJG6OcBe42XTytLDyrTWap1kuO5Fczc8yV2LN2vOSbubJw
        d9XiE1rnllcLVXyy4tKJj7l7XEybkffkq+vL99R0iMRpuZtwZ3wqSP7yqNQ24h4X91GLg0zu
        2VlrIk55e8ay7NJS79n868HR7P3PwvsW/RRQ4s+Y4fQx+tH5qJuWSROKA6o2F04/pmqmqM+0
        od/P4tH7KVd+HXtaumK2ob0SS3FGoqEWc1FxIgDssgdX4QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7p33s1INDj/xNri+pfnrBbzj5xj
        tdj49geTxabH11gtPvbcY7W4vGsOm8WM8/uYLC6ecrX4cbyP2aJ17xF2i3/XNrJYPO8Dip+6
        +5ndYtWuP4wOfB7vb7Sye8xq6GXz2DnrLrvHplWdbB53ru1h89i8pN6jb8sqRo/Pm+QCOKL0
        bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr59P8hY
        sEO8YvOB8ywNjOeEuxg5OSQETCT27Opi7WLk4hASWMooMfldP2MXIwdQQkpifosSRI2wxJ9r
        XWwQNe8ZJd69nMAGkuAVsJOYdXs3I4jNIqAq8ffubBaIuKDEyZlPwGxRgSSJ/u+7mEFsYQEv
        ie6b98HizALiEreezGcCsUUE9CTWzXzFDrKAWaCLReLf8VZmiG2TGCVmvJwEtoFNwFCi92gf
        mM0pYC9xpXE3C8ilzALqEuvnCUEMlZfY/nYO8wRGoVlI7piFZN8shI5ZSDoWMLKsYhRJLS3O
        Tc8tNtIrTswtLs1L10vOz93ECIzpbcd+btnBuPLVR71DjEwcjIcYJTiYlUR4OTZMTxTiTUms
        rEotyo8vKs1JLT7EaAoMi4nMUqLJ+cCkklcSb2hmYGpoYmZpYGppZqwkzutZ0JEoJJCeWJKa
        nZpakFoE08fEwSnVwKR+o+bHqymyRSf5ZiVc4zlh8Xp12uab2UxL2F1/sH/iu+kV+TzJ9vuK
        NnW+c+G3DY2zDkkJa34ImZhp+e7BVJGLahfeCarlNXpu2FMaVv46TPHLq6tCD1m+xGRdrV90
        6ef6rR/u39Jp8mXumcW9rEutd5tVd8a3eSpdi8Ubc3X1eJIVvn4J3NN0cuL3Izn3TzXvOSO0
        lDmO9d70jRcO2+ifX7CENV/jq4eocNNVX2PvRUmyOk90JzMt+DPrP9eVcytLHwWY3jmyyW3W
        ukPngzKnHE3QmxlzZVrb27ezTrM+2S/DOfOJ5HXn6OPN+tbO6xLZqk7INd5l27r4/WttUcX0
        xqLz+3S2sE67xsFUz+yixFKckWioxVxUnAgAklSGOnIDAAA=
X-CMS-MailID: 20211120124933eucas1p2e4a09f2ce79544393083e32a2ec831b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211025161302eucas1p2f50ef29a0bba69c13deaf1ad31a8439c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211025161302eucas1p2f50ef29a0bba69c13deaf1ad31a8439c
References: <CGME20211025161302eucas1p2f50ef29a0bba69c13deaf1ad31a8439c@eucas1p2.samsung.com>
        <20211025161254.5575-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25.10.2021 18:12, Sam Protsenko wrote:
> Some clocks must be registered before init calls. For example MCT clock
> (from CMU_PERI) is needed for MCT timer driver, which is registered
> with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
> clk-exynos850 platform driver init, it's already too late. Inability to
> get "mct" clock in MCT driver leads to kernel panic, as functions
> registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
> can't be fixed either, as it's acting as a clock source and it's
> essential to register it in start_kernel() -> time_init().
> 
> Let's register CMU_PERI clocks early, using CLK_OF_DECLARE_DRIVER(), and
> do all stuff relying on "struct dev" object (like runtime PM and
> enabling bus clock) later in platform driver probe. Basically
> CLK_OF_DECLARE_DRIVER() matches CMU compatible, but clears OF_POPULATED
> flag, which allows the same device to be matched again later.

> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-exynos850.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> index 95e373d17b42..ecffa5c7a081 100644
> --- a/drivers/clk/samsung/clk-exynos850.c
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -753,6 +753,15 @@ static const struct samsung_cmu_info peri_cmu_info __initconst = {
>  	.clk_name		= "dout_peri_bus",
>  };
>  
> +static void __init exynos850_cmu_peri_init(struct device_node *np)
> +{
> +	exynos850_init_clocks(np, peri_clk_regs, ARRAY_SIZE(peri_clk_regs));
> +	samsung_cmu_register_one(np, &peri_cmu_info);
> +}
> +
> +CLK_OF_DECLARE_DRIVER(exynos850_cmu_peri, "samsung,exynos850-cmu-peri",
> +		      exynos850_cmu_peri_init);
> +
>  /* ---- CMU_CORE ------------------------------------------------------------ */
>  
>  /* Register Offset definitions for CMU_CORE (0x12000000) */
> @@ -920,8 +929,12 @@ static int __init exynos850_cmu_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  
>  	info = of_device_get_match_data(dev);
> -	exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
> -	samsung_cmu_register_one(np, info);
> +
> +	/* Early clocks are already registered using CLK_OF_DECLARE_DRIVER() */
> +	if (info != &peri_cmu_info) {
> +		exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
> +		samsung_cmu_register_one(np, info);
> +	}

Don't you also need to register early CMU_TOP, which provides clocks
for CMU_PERI? I'm afraid it might not work properly when you register 
CMU_PERI clocks early and only later in probe() you enable parent clock
required for the already registered clocks to be usable.
How about registering also CMU_TOP early and enabling parent clock
also in OF_CLK_DECLARE init callback, i.e. using either OF_CLK_DECLARE
or platform driver for a CMU? 

-- 
Regards,
Sylwester
