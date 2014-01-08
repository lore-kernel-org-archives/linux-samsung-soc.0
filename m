From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] exynos4-is: Compile runtime PM callbacks in conditionally
Date: Wed, 08 Jan 2014 13:22:10 +0900
Message-ID: <000001cf0c29$32cb7220$98625660$%han@samsung.com>
References: <1389132528-21281-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1389132528-21281-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-media-owner@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, January 08, 2014 7:09 AM, Sylwester Nawrocki wrote:
>=20
> Enclose the runtime PM helpers in #ifdef CONFIG_PM_RUNTIME/#endif
> to avoid following compile warning when CONFIG_PM_RUNTIME is disabled=
:
>=20
>  CC      drivers/media/platform/exynos4-is/fimc-core.o
> drivers/media/platform/exynos4-is/fimc-core.c:1040:12: warning: =E2=80=
=98fimc_runtime_resume=E2=80=99 defined but not
> used
> drivers/media/platform/exynos4-is/fimc-core.c:1057:12: warning: =E2=80=
=98fimc_runtime_suspend=E2=80=99 defined but not
> used
>=20
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Right, '#ifdef CONFIG_PM_RUNTIME' should be used in order to
fix the compile warning.

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/media/platform/exynos4-is/fimc-core.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/media/platform/exynos4-is/fimc-core.c b/drivers/=
media/platform/exynos4-is/fimc-
> core.c
> index dcbea59..da2fc86 100644
> --- a/drivers/media/platform/exynos4-is/fimc-core.c
> +++ b/drivers/media/platform/exynos4-is/fimc-core.c
> @@ -1037,6 +1037,7 @@ err_sclk:
>  	return ret;
>  }
>=20
> +#ifdef CONFIG_PM_RUNTIME
>  static int fimc_runtime_resume(struct device *dev)
>  {
>  	struct fimc_dev *fimc =3D	dev_get_drvdata(dev);
> @@ -1069,6 +1070,7 @@ static int fimc_runtime_suspend(struct device *=
dev)
>  	dbg("fimc%d: state: 0x%lx", fimc->id, fimc->state);
>  	return ret;
>  }
> +#endif
>=20
>  #ifdef CONFIG_PM_SLEEP
>  static int fimc_resume(struct device *dev)
> --
> 1.7.4.1
