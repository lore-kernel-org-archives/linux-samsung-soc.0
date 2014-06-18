From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [patch] drm/exynos: change zero to NULL for sparse
Date: Wed, 18 Jun 2014 14:06:59 +0900
Message-ID: <53A11E73.3070208@samsung.com>
References: <20140611063623.GA16247@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-reply-to: <20140611063623.GA16247@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2014=EB=85=84 06=EC=9B=94 11=EC=9D=BC 15:36, Dan Carpenter wrote:
> We recently changed this function to return a pointer instead of an i=
nt
> so we need to change this zero to a NULL or Sparse complains:
>=20
> 	drivers/gpu/drm/exynos/exynos_drm_drv.h:346:47:
> 	warning: Using plain integer as NULL pointer

Applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index 36535f3..06cde45 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -343,7 +343,7 @@ struct exynos_drm_display * exynos_dpi_probe(stru=
ct device *dev);
>  int exynos_dpi_remove(struct device *dev);
>  #else
>  static inline struct exynos_drm_display *
> -exynos_dpi_probe(struct device *dev) { return 0; }
> +exynos_dpi_probe(struct device *dev) { return NULL; }
>  static inline int exynos_dpi_remove(struct device *dev) { return 0; =
}
>  #endif
> =20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janito=
rs" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
