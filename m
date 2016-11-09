From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 09/12] exynos-gsc: Simplify system PM even more
Date: Wed, 9 Nov 2016 15:38:12 +0100
Message-ID: <CAPDyKFpfrOGRZCu=3=CCQ-+Eh55U0gNJpQADV_ZdtvR2ZVQ8=A@mail.gmail.com>
References: <CGME20161109142411eucas1p2dc6769c2c713813ce3aaedf74189435d@eucas1p2.samsung.com>
 <1478701441-29107-1-git-send-email-m.szyprowski@samsung.com> <1478701441-29107-10-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1478701441-29107-10-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 9 November 2016 at 15:23, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> System pm callbacks only ensures that device is runtime suspended/resumed,
> so remove them and use generic pm_runtime_force_suspend/resume helper.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/media/platform/exynos-gsc/gsc-core.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 4859727..1e8b216 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> @@ -1166,26 +1166,9 @@ static int gsc_runtime_suspend(struct device *dev)
>  }
>  #endif
>
> -#ifdef CONFIG_PM_SLEEP
> -static int gsc_resume(struct device *dev)
> -{
> -       if (!pm_runtime_suspended(dev))
> -               return gsc_runtime_resume(dev);
> -
> -       return 0;
> -}
> -
> -static int gsc_suspend(struct device *dev)
> -{
> -       if (!pm_runtime_suspended(dev))
> -               return gsc_runtime_suspend(dev);
> -
> -       return 0;
> -}
> -#endif
> -
>  static const struct dev_pm_ops gsc_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(gsc_suspend, gsc_resume)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
>         SET_RUNTIME_PM_OPS(gsc_runtime_suspend, gsc_runtime_resume, NULL)
>  };
>
> --
> 1.9.1
>
