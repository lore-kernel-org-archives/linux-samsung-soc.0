From: Inki Dae <inki.dae@samsung.com>
Subject: Re: drm/exynos: consider deferred probe case
Date: Wed, 11 Jun 2014 15:12:37 +0900
Message-ID: <5397F355.4060105@samsung.com>
References: <20140610123837.GA7854@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20926 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752544AbaFKGMj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 02:12:39 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6Z008BYQL14DA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jun 2014 15:12:37 +0900 (KST)
In-reply-to: <20140610123837.GA7854@mwanda>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-samsung-soc@vger.kernel.org


Hello Dan,

On 2014=EB=85=84 06=EC=9B=94 10=EC=9D=BC 21:38, Dan Carpenter wrote:
> Hello Inki Dae,
>=20
> The patch df5225bc9a87: "drm/exynos: consider deferred probe case"
> from May 29, 2014, leads to the following static checker warning:
>=20
> 	drivers/gpu/drm/exynos/exynos_drm_fimd.c:996 fimd_probe()
> 	warn: 'ctx->display' isn't an ERR_PTR
>=20
> drivers/gpu/drm/exynos/exynos_drm_fimd.c
>    994 =20
>    995          ctx->display =3D exynos_dpi_probe(dev);
>    996          if (IS_ERR(ctx->display))
>    997                  return PTR_ERR(ctx->display);
>    998 =20
>=20
> Smatch is complaining because my config has CONFIG_DRM_EXYNOS_DPI
> disabled.
>=20
> 1) If CONFIG_DRM_EXYNOS_DPI isn't enabled, we still return "0".  That
> will cause a Sparse warning.
>

It would be no problem. This code will return PTR_ERR(ctx->dislay) only
in case that dpi module is enabled.

> 2) Also there are still a number of checks for "if (ctx->display)".
> Those things are weird to me, are those checks to see
> CONFIG_DRM_EXYNOS_DPI is enabled or are they checking that
> exynos_dpi_probe() succeeded?
>=20

Right. crtc driver, fimd, needs encoder/connector objects. In Exynos dr=
m
case, encoder/connector can be created by dpi module for parallel panel=
,
by dsi module for mipi dsi based panel, or by dp module for eDP based p=
anel.

So if some board has a parallel panel, encoder/connector objects will b=
e
created by dpi module, and then fimd module will refer to ctx->display
object to control the parallel panel device. Otherwise, dsi or dp
modules will create encoder/connector objects in its driver, and one of
them will use its own display object to control corresponding panel dev=
ice.

Thanks,
Inki Dae

> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
