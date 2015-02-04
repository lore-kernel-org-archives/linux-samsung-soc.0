From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/exynos: fix DMA_ATTR_NO_KERNEL_MAPPING usage
Date: Wed, 04 Feb 2015 19:57:18 +0900
Message-ID: <54D1FB0E.2070105@samsung.com>
References: <1423041800-27859-1-git-send-email-carlo@caione.org>
 <1423041800-27859-2-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14138 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965209AbbBDK6D convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 05:58:03 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ8008TXUFJF540@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Feb 2015 19:57:19 +0900 (KST)
In-reply-to: <1423041800-27859-2-git-send-email-carlo@caione.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: linux-arm-kernel@lists.infradead.org, jstpierre@mecheye.net, drake@endlessm.com, linux@arm.linux.org.uk, m.szyprowski@samsung.com, robdclark@gmail.com, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, kgene@kernel.org, jy0922.shim@samsung.com, lauraa@codeaurora.org

On 2015=EB=85=84 02=EC=9B=94 04=EC=9D=BC 18:23, Carlo Caione wrote:
> The Exynos DRM driver doesn't follow the correct API when dealing wit=
h
> dma_{alloc, mmap, free}_attrs functions and the
> DMA_ATTR_NO_KERNEL_MAPPING attribute.
>=20
> When a IOMMU is not available and the DMA_ATTR_NO_KERNEL_MAPPING is
> used, the driver should use the pointer returned by dma_alloc_attr() =
as
> a cookie.
>=20
> The Exynos DRM driver directly uses the non-requested virtual kernel
> address returned by the DMA mapping subsystem. This just works now
> because the non-IOMMU codepath doesn't obey DMA_ATTR_NO_KERNEL_MAPPIN=
G
> but we need to fix it before fixing the DMA layer.

Applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Carlo Caione <carlo@caione.org>
> Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_buf.c   |  6 +++---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 29 +++++++++------------=
--------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h   |  2 ++
>  3 files changed, 14 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_buf.c b/drivers/gpu/dr=
m/exynos/exynos_drm_buf.c
> index 9c80884..24994ba 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_buf.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_buf.c
> @@ -63,11 +63,11 @@ static int lowlevel_buffer_allocate(struct drm_de=
vice *dev,
>  			return -ENOMEM;
>  		}
> =20
> -		buf->kvaddr =3D (void __iomem *)dma_alloc_attrs(dev->dev,
> +		buf->cookie =3D dma_alloc_attrs(dev->dev,
>  					buf->size,
>  					&buf->dma_addr, GFP_KERNEL,
>  					&buf->dma_attrs);
> -		if (!buf->kvaddr) {
> +		if (!buf->cookie) {
>  			DRM_ERROR("failed to allocate buffer.\n");
>  			ret =3D -ENOMEM;
>  			goto err_free;
> @@ -132,7 +132,7 @@ static void lowlevel_buffer_deallocate(struct drm=
_device *dev,
>  	buf->sgt =3D NULL;
> =20
>  	if (!is_drm_iommu_supported(dev)) {
> -		dma_free_attrs(dev->dev, buf->size, buf->kvaddr,
> +		dma_free_attrs(dev->dev, buf->size, buf->cookie,
>  				(dma_addr_t)buf->dma_addr, &buf->dma_attrs);
>  		drm_free_large(buf->pages);
>  	} else
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/=
drm/exynos/exynos_drm_fbdev.c
> index e12ea90..84f8dfe 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -79,9 +79,9 @@ static int exynos_drm_fbdev_update(struct drm_fb_he=
lper *helper,
>  				     struct drm_framebuffer *fb)
>  {
>  	struct fb_info *fbi =3D helper->fbdev;
> -	struct drm_device *dev =3D helper->dev;
>  	struct exynos_drm_gem_buf *buffer;
>  	unsigned int size =3D fb->width * fb->height * (fb->bits_per_pixel =
>> 3);
> +	unsigned int nr_pages;
>  	unsigned long offset;
> =20
>  	drm_fb_helper_fill_fix(fbi, fb->pitches[0], fb->depth);
> @@ -94,25 +94,14 @@ static int exynos_drm_fbdev_update(struct drm_fb_=
helper *helper,
>  		return -EFAULT;
>  	}
> =20
> -	/* map pages with kernel virtual space. */
> +	nr_pages =3D buffer->size >> PAGE_SHIFT;
> +
> +	buffer->kvaddr =3D (void __iomem *) vmap(buffer->pages,
> +			nr_pages, VM_MAP,
> +			pgprot_writecombine(PAGE_KERNEL));
>  	if (!buffer->kvaddr) {
> -		if (is_drm_iommu_supported(dev)) {
> -			unsigned int nr_pages =3D buffer->size >> PAGE_SHIFT;
> -
> -			buffer->kvaddr =3D (void __iomem *) vmap(buffer->pages,
> -					nr_pages, VM_MAP,
> -					pgprot_writecombine(PAGE_KERNEL));
> -		} else {
> -			phys_addr_t dma_addr =3D buffer->dma_addr;
> -			if (dma_addr)
> -				buffer->kvaddr =3D (void __iomem *)phys_to_virt(dma_addr);
> -			else
> -				buffer->kvaddr =3D (void __iomem *)NULL;
> -		}
> -		if (!buffer->kvaddr) {
> -			DRM_ERROR("failed to map pages to kernel space.\n");
> -			return -EIO;
> -		}
> +		DRM_ERROR("failed to map pages to kernel space.\n");
> +		return -EIO;
>  	}
> =20
>  	/* buffer count to framebuffer always is 1 at booting time. */
> @@ -313,7 +302,7 @@ static void exynos_drm_fbdev_destroy(struct drm_d=
evice *dev,
>  	struct exynos_drm_gem_obj *exynos_gem_obj =3D exynos_fbd->exynos_ge=
m_obj;
>  	struct drm_framebuffer *fb;
> =20
> -	if (is_drm_iommu_supported(dev) && exynos_gem_obj->buffer->kvaddr)
> +	if (exynos_gem_obj->buffer->kvaddr)
>  		vunmap(exynos_gem_obj->buffer->kvaddr);
> =20
>  	/* release drm framebuffer and real buffer */
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/dr=
m/exynos/exynos_drm_gem.h
> index ec58fe9..308173c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -22,6 +22,7 @@
>  /*
>   * exynos drm gem buffer structure.
>   *
> + * @cookie: cookie returned by dma_alloc_attrs
>   * @kvaddr: kernel virtual address to allocated memory region.
>   * *userptr: user space address.
>   * @dma_addr: bus address(accessed by dma) to allocated memory regio=
n.
> @@ -35,6 +36,7 @@
>   *	VM_PFNMAP or not.
>   */
>  struct exynos_drm_gem_buf {
> +	void 			*cookie;
>  	void __iomem		*kvaddr;
>  	unsigned long		userptr;
>  	dma_addr_t		dma_addr;
>=20
