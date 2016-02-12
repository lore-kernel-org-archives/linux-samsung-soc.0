From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 08/10] drm/exynos: initialize DMA ops for virtual Exynos
 DRM device
Date: Fri, 12 Feb 2016 14:55:51 +0900
Message-ID: <56BD73E7.8060304@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
 <1454503374-16382-9-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37771 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750823AbcBLFz5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 00:55:57 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2F0261W7589N80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Feb 2016 14:55:56 +0900 (KST)
In-reply-to: <1454503374-16382-9-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Marek,

2016=EB=85=84 02=EC=9B=94 03=EC=9D=BC 21:42=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Virtual DRM device is used for memory allocation for GEM objects. On
> some architectures null dma operations are assigned for virtual devic=
es
> if no explicit initialization has been made.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.c
> index 68f0f36..a33ea44 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -144,6 +144,7 @@ static int exynos_drm_load(struct drm_device *dev=
, unsigned long flags)
>  	init_waitqueue_head(&private->wait);
>  	spin_lock_init(&private->lock);
> =20
> +	arch_setup_dma_ops(dev->dev, 0, DMA_BIT_MASK(32), false, false);

As you got the report, above function incurrs build error below,
ERROR: "arch_setup_dma_ops" [drivers/gpu/drm/exynos/exynosdrm.ko] undef=
ined!

Exynos drm can be built as a module. In this case, arch_setup_dma_ops c=
annot be accessed by the module.

I could fix it easily like below but I'm not sure that it's reasonable.

+extern void arch_setup_dma_ops(struct device *dev, u64 dma_base,
+                                     u64 size, struct iommu_ops *iommu=
,
+                                     bool coherent) { };

Thanks,
Inki Dae

>  	dev_set_drvdata(dev->dev, dev);
>  	dev->dev_private =3D (void *)private;
> =20
>=20
