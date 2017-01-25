From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/7] soc: samsung: pmu: Add dummy support for Exynos5433
 SoC
Date: Wed, 25 Jan 2017 19:30:00 +0200
Message-ID: <20170125173000.nj7bp3f4wjeoie3q@kozik-lap>
References: <1485345031-2948-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115102eucas1p187f817f967c18a640098cf29268238d2@eucas1p1.samsung.com>
 <1485345031-2948-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485345031-2948-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 25, 2017 at 12:50:25PM +0100, Marek Szyprowski wrote:
> Add compatible for Exynos5433 SoC, so the driver will bind and let other
> drivers to use PMU regmap.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Makes sense but please also add a check in exynos_sys_powerdown_conf() for
!pmu_data or a comment for that. For current architecture, this will not
happen but you are adding different usage thus forcing reader to find the
dependencies on his own (dependecies are already spread all over for ARMv7).

Best regards,
Krzysztof

> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 813df6e7292d..effb8a8a78c6 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -90,6 +90,8 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
>  	}, {
>  		.compatible = "samsung,exynos5420-pmu",
>  		.data = &exynos5420_pmu_data,
> +	}, {
> +		.compatible = "samsung,exynos5433-pmu",
>  	},
>  	{ /*sentinel*/ },
>  };
> @@ -122,7 +124,7 @@ static int exynos_pmu_probe(struct platform_device *pdev)
>  	pmu_context->dev = dev;
>  	pmu_context->pmu_data = of_device_get_match_data(dev);
>  
> -	if (pmu_context->pmu_data->pmu_init)
> +	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
>  		pmu_context->pmu_data->pmu_init();
>  
>  	platform_set_drvdata(pdev, pmu_context);
> -- 
> 1.9.1
> 
