From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: ipp: validate a GEM handle with multiple
 planes
Date: Thu, 11 Jun 2015 23:53:23 +0900
Message-ID: <5579A0E3.3060503@samsung.com>
References: <1433821515-8952-1-git-send-email-human.hwang@samsung.com>
 <1433821515-8952-2-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54591 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752868AbbFKOxZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 10:53:25 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPS019CTC0ZA380@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Jun 2015 23:53:23 +0900 (KST)
In-reply-to: <1433821515-8952-2-git-send-email-human.hwang@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, jy0922.shim@samsung.com

On 2015=EB=85=84 06=EC=9B=94 09=EC=9D=BC 12:45, Hyungwon Hwang wrote:
> FIMC & GSC driver can calculate the offset of planes. So there are
> use cases which IPP receives just one GEM handle of an image with
> multiple plane. This patch extends ipp_validate_mem_node() to validat=
e
> this case.

Applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 51 +++++++++++++++++++++++=
+---------
>  1 file changed, 38 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/dr=
m/exynos/exynos_drm_ipp.c
> index 54c5cf4..b3dc778 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -482,8 +482,8 @@ static int ipp_validate_mem_node(struct drm_devic=
e *drm_dev,
>  {
>  	struct drm_exynos_ipp_config *ipp_cfg;
>  	unsigned int num_plane;
> -	unsigned long min_size, size;
> -	unsigned int bpp;
> +	unsigned long size, buf_size =3D 0, plane_size, img_size =3D 0;
> +	unsigned int bpp, width, height;
>  	int i;
> =20
>  	ipp_cfg =3D &c_node->property.config[m_node->ops_id];
> @@ -497,20 +497,45 @@ static int ipp_validate_mem_node(struct drm_dev=
ice *drm_dev,
>  	 * but it seems more than enough
>  	 */
>  	for (i =3D 0; i < num_plane; ++i) {
> -		if (!m_node->buf_info.handles[i]) {
> -			DRM_ERROR("invalid handle for plane %d\n", i);
> -			return -EINVAL;
> -		}
> +		width =3D ipp_cfg->sz.hsize;
> +		height =3D ipp_cfg->sz.vsize;
>  		bpp =3D drm_format_plane_cpp(ipp_cfg->fmt, i);
> -		min_size =3D (ipp_cfg->sz.hsize * ipp_cfg->sz.vsize * bpp) >> 3;
> -		size =3D exynos_drm_gem_get_size(drm_dev,
> -					       m_node->buf_info.handles[i],
> -					       c_node->filp);
> -		if (min_size > size) {
> -			DRM_ERROR("invalid size for plane %d\n", i);
> -			return -EINVAL;
> +
> +		/*
> +		 * The result of drm_format_plane_cpp() for chroma planes must
> +		 * be used with drm_format_xxxx_chroma_subsampling() for
> +		 * correct result.
> +		 */
> +		if (i > 0) {
> +			width /=3D drm_format_horz_chroma_subsampling(
> +								ipp_cfg->fmt);
> +			height /=3D drm_format_vert_chroma_subsampling(
> +								ipp_cfg->fmt);
>  		}
> +		plane_size =3D width * height * bpp;
> +		img_size +=3D plane_size;
> +
> +		if (m_node->buf_info.handles[i]) {
> +			size =3D exynos_drm_gem_get_size(drm_dev,
> +					m_node->buf_info.handles[i],
> +					c_node->filp);
> +			if (plane_size > size) {
> +				DRM_ERROR(
> +					"buffer %d is smaller than required\n",
> +					i);
> +				return -EINVAL;
> +			}
> +
> +			buf_size +=3D size;
> +		}
> +	}
> +
> +	if (buf_size < img_size) {
> +		DRM_ERROR("size of buffers(%lu) is smaller than image(%lu)\n",
> +			buf_size, img_size);
> +		return -EINVAL;
>  	}
> +
>  	return 0;
>  }
> =20
>=20
