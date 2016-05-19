From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/5] drm: mediatek: fixup drm_gem_object_lookup API change
Date: Thu, 19 May 2016 16:56:30 +0200
Message-ID: <573DD41E.3050506@gmail.com>
References: <1463587653-3035181-1-git-send-email-arnd@arndb.de>
 <1463587653-3035181-4-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34000 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754217AbcESO4e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2016 10:56:34 -0400
In-Reply-To: <1463587653-3035181-4-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org



On 18/05/16 18:07, Arnd Bergmann wrote:
> The drm_gem_object_lookup() function prototype changed while this
> driver was added, so it fails to build now:
>
> drivers/gpu/drm/mediatek/mtk_drm_gem.c: In function 'mtk_drm_gem_dumb_map_offset':
> drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
>    obj = drm_gem_object_lookup(dev, file_priv, handle);
>
> This fixes the new caller as well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: a8ad0bd84f98 ("drm: Remove unused drm_device from drm_gem_object_lookup()")
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_fb.c  | 2 +-
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.c b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> index 33d30c19f35f..147df85399ab 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> @@ -138,7 +138,7 @@ struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
>   	if (drm_format_num_planes(cmd->pixel_format) != 1)
>   		return ERR_PTR(-EINVAL);
>
> -	gem = drm_gem_object_lookup(dev, file, cmd->handles[0]);
> +	gem = drm_gem_object_lookup(file, cmd->handles[0]);
>   	if (!gem)
>   		return ERR_PTR(-ENOENT);
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index a773bfaea913..fa2ec0cd00e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -139,7 +139,7 @@ int mtk_drm_gem_dumb_map_offset(struct drm_file *file_priv,
>   	struct drm_gem_object *obj;
>   	int ret;
>
> -	obj = drm_gem_object_lookup(dev, file_priv, handle);
> +	obj = drm_gem_object_lookup(file_priv, handle);
>   	if (!obj) {
>   		DRM_ERROR("failed to lookup gem object.\n");
>   		return -EINVAL;
>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
