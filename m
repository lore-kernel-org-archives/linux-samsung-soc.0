From: InKi Dae <daeinki@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] DRM: exynos: return NULL if
 exynos_pages_to_sg fails
Date: Mon, 25 Jun 2012 22:44:04 +0900
Message-ID: <CAAQKjZMbzyPKV2tYcsRpcvVGMJ9OkboTGvTwtCpR5+31NcAYkA@mail.gmail.com>
References: <1340413958-23125-1-git-send-email-subash.ramaswamy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41503 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754702Ab2FYNoF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jun 2012 09:44:05 -0400
Received: by pbbrp8 with SMTP id rp8so6573694pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jun 2012 06:44:04 -0700 (PDT)
In-Reply-To: <1340413958-23125-1-git-send-email-subash.ramaswamy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Subash Patel <subashrp@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linaro-mm-sig@lists.linaro.org, inki.dae@samsung.com, airlied@redhat.com, olofj@chromium.org, Subash Patel <subash.rp@samsung.com>, Subash Patel <subash.ramaswamy@linaro.org>

Hi Subash,

Could you re-post this patch seperately? your patch includes another on=
e.

Thanks,
Inki Dae

2012/6/23 Subash Patel <subashrp@gmail.com>:
> From: Subash Patel <subash.rp@samsung.com>
>
> exynos_pages_to_sg() internally calls sg_kmalloc() which can return
> no pages when the system is under high memory crunch. One such instan=
ce
> is chromeos-install in the chromeos. This patch adds check for the re=
turn
> value of the function in subject to return NULL on failure.
>
> Signed-off-by: Subash Patel <subash.ramaswamy@linaro.org>
> CC: dri-devel@lists.freedesktop.org
> CC: linux-samsung-soc@vger.kernel.org
> CC: linaro-mm-sig@lists.linaro.org
> CC: inki.dae@samsung.com
> CC: airlied@redhat.com
> CC: olofj@chromium.org
> ---
> =A0drivers/gpu/drm/exynos/exynos_drm_dmabuf.c | =A0 =A06 +++++-
> =A01 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c b/drivers/gpu=
/drm/exynos/exynos_drm_dmabuf.c
> index 97325c1..c908a29 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> @@ -87,6 +87,10 @@ static struct sg_table *
> =A0 =A0 =A0 =A0npages =3D buf->size / buf->page_size;
>
> =A0 =A0 =A0 =A0sgt =3D exynos_pages_to_sg(buf->pages, npages, buf->pa=
ge_size);
> + =A0 =A0 =A0 if (!sgt) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_DEBUG_PRIME("exynos_pages_to_sg ret=
urned NULL!\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unlock;
> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0nents =3D dma_map_sg(attach->dev, sgt->sgl, sgt->nents=
, dir);
>
> =A0 =A0 =A0 =A0DRM_DEBUG_PRIME("npages =3D %d buffer size =3D 0x%lx p=
age_size =3D 0x%lx\n",
> @@ -241,7 +245,7 @@ struct drm_gem_object *exynos_dmabuf_prime_import=
(struct drm_device *drm_dev,
>
>
> =A0 =A0 =A0 =A0sgt =3D dma_buf_map_attachment(attach, DMA_BIDIRECTION=
AL);
> - =A0 =A0 =A0 if (IS_ERR(sgt)) {
> + =A0 =A0 =A0 if (IS_ERR_OR_NULL(sgt)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D PTR_ERR(sgt);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_buf_detach;
> =A0 =A0 =A0 =A0}
> --
> 1.7.9.5
>
>
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-mm-sig
