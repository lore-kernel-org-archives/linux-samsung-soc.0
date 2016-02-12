From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix incorrect cpu address for dma_mmap_attrs()
Date: Fri, 12 Feb 2016 15:41:58 +0900
Message-ID: <56BD7EB6.7070909@samsung.com>
References: <1455190327-25648-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51363 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750761AbcBLGmC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 01:42:02 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2F01FRV9A0O8B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Feb 2016 15:42:00 +0900 (KST)
In-reply-to: <1455190327-25648-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Picked it up.

Thanks,
Inki Dae

2016=EB=85=84 02=EC=9B=94 11=EC=9D=BC 20:32=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> dma_mmap_attrs() should be called with cpu address returned by
> dma_alloc_attrs(). Existing code however passed pages array base as c=
pu
> address. This worked only by a pure luck on ARM architecture. This pa=
tch
> fixes this issue.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/=
drm/exynos/exynos_drm_fbdev.c
> index f6118ba..8baabd8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -50,7 +50,7 @@ static int exynos_drm_fb_mmap(struct fb_info *info,
>  	if (vm_size > exynos_gem->size)
>  		return -EINVAL;
> =20
> -	ret =3D dma_mmap_attrs(helper->dev->dev, vma, exynos_gem->pages,
> +	ret =3D dma_mmap_attrs(helper->dev->dev, vma, exynos_gem->cookie,
>  			     exynos_gem->dma_addr, exynos_gem->size,
>  			     &exynos_gem->dma_attrs);
>  	if (ret < 0) {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/dr=
m/exynos/exynos_drm_gem.c
> index 47d126a..26b5e4b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -335,7 +335,7 @@ static int exynos_drm_gem_mmap_buffer(struct exyn=
os_drm_gem *exynos_gem,
>  	if (vm_size > exynos_gem->size)
>  		return -EINVAL;
> =20
> -	ret =3D dma_mmap_attrs(drm_dev->dev, vma, exynos_gem->pages,
> +	ret =3D dma_mmap_attrs(drm_dev->dev, vma, exynos_gem->cookie,
>  			     exynos_gem->dma_addr, exynos_gem->size,
>  			     &exynos_gem->dma_attrs);
>  	if (ret < 0) {
>=20
