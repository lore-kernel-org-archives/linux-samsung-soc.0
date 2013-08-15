From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH] thermal: exynos_tmu: fix wrong error check for mapped
 memory
Date: Thu, 15 Aug 2013 15:02:08 +0800
Message-ID: <1376550128.2335.110.camel@rzhang-lenovo>
References: <1375864269-9197-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1375864269-9197-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-pm@vger.kernel.org, eduardo.valentin@ti.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, amit.daniel@samsung.com, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On =E4=B8=89, 2013-08-07 at 14:01 +0530, Naveen Krishna Chatradhi wrote=
:
> The error check is checking for a "base" mapped memory base
> instead of "base_common". Fixing the same.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>

applied. Thanks!
BTW, can you rebase the other three exynos patches you submitted?

thanks,
rui
> ---
>  drivers/thermal/samsung/exynos_tmu.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/s=
amsung/exynos_tmu.c
> index ec01dfe..a033dbb 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -592,7 +592,7 @@ static int exynos_map_dt_data(struct platform_dev=
ice *pdev)
> =20
>  	data->base_common =3D devm_ioremap(&pdev->dev, res.start,
>  					resource_size(&res));
> -	if (!data->base) {
> +	if (!data->base_common) {
>  		dev_err(&pdev->dev, "Failed to ioremap memory\n");
>  		return -ENOMEM;
>  	}


