Return-Path: <SRS0=b7Q7=D5=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF669C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Oct 2020 08:49:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 657CD22248
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Oct 2020 08:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="SJNJAJHW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509624AbgJVIt2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 22 Oct 2020 04:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2509623AbgJVIt1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 04:49:27 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93167C0613CF
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2020 01:49:24 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c16so1058533wmd.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2020 01:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VWt6XRHT1mtrTh0CCtZLa0wzMoEJLJvCOa4qxU5Byfg=;
        b=SJNJAJHWWSatt37yFJRHVEbZn0P63mliHJEuywcMzW7beqB8NExePBJsBSEKTV2IyK
         GDiZ5ZjuTBNjAQrSx9GFFKDh9re66/Dcbmane4QOewhmKa5XnxMXe84rjVZUUPTyyOKy
         1ovUJK5+84JV3uKcgbGhlDkAVpKoTx9G/IdjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VWt6XRHT1mtrTh0CCtZLa0wzMoEJLJvCOa4qxU5Byfg=;
        b=Uz2fKphMsn6geh2tvVw/XCeH/9JCFutsMbnMji0EecOMgu7ja9n7QciTozGKRG1U5E
         mP+Rwinq3mIe0k2BOp0cKeaK3KlkEkvdQx7B1XFP7jh5i+k7YRZhTO1MVDxYJk/BE7sY
         fHeXtTlVf62c6z4kOufvlSFwK6wi1F+DQWevM0Lrb82Bw61mOTAwTBROEyxBn3NRRN/D
         8XnrTJIk38RzPbocK6BOvaECzS+kdfTMUgHbsvUrmWLPBAmh2YxhoBn3d6KICFM7+fPx
         4OA8qKOMt05kg5vIHhrNoP2zdY8IQcHu/R3Q/dlChVPgirEbuv+hU2bvMaCgk9sEjMe/
         Wt7Q==
X-Gm-Message-State: AOAM532czaaM99oSUH0NQMA1I3g2QbF4DyS0NRKslSYgWXZl0TE/cR4q
        k7utwzXyeWfRdZPBCNdfvQNvEQ==
X-Google-Smtp-Source: ABdhPJxkyq8GVJelx7O70iPhsj8A18D7siq72V+fzAy3BQnehMq9ndDymNKOsvN6dFPrcy8yVu5tEA==
X-Received: by 2002:a05:600c:2905:: with SMTP id i5mr1458519wmd.9.1603356563173;
        Thu, 22 Oct 2020 01:49:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n9sm2717558wrq.72.2020.10.22.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 01:49:22 -0700 (PDT)
Date:   Thu, 22 Oct 2020 10:49:19 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        kraxel@redhat.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com,
        bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 08/10] drm/gem: Store client buffer mappings as struct
 dma_buf_map
Message-ID: <20201022084919.GU401619@phenom.ffwll.local>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020122046.31167-9-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 20, 2020 at 02:20:44PM +0200, Thomas Zimmermann wrote:
> Kernel DRM clients now store their framebuffer address in an instance
> of struct dma_buf_map. Depending on the buffer's location, the address
> refers to system or I/O memory.
> 
> Callers of drm_client_buffer_vmap() receive a copy of the value in
> the call's supplied arguments. It can be accessed and modified with
> dma_buf_map interfaces.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Tested-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_client.c    | 34 +++++++++++++++++++--------------
>  drivers/gpu/drm/drm_fb_helper.c | 23 +++++++++++++---------
>  include/drm/drm_client.h        |  7 ++++---
>  3 files changed, 38 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index ac0082bed966..fe573acf1067 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -235,7 +235,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>  {
>  	struct drm_device *dev = buffer->client->dev;
>  
> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> +	drm_gem_vunmap(buffer->gem, &buffer->map);
>  
>  	if (buffer->gem)
>  		drm_gem_object_put(buffer->gem);
> @@ -291,25 +291,31 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>  /**
>   * drm_client_buffer_vmap - Map DRM client buffer into address space
>   * @buffer: DRM client buffer
> + * @map_copy: Returns the mapped memory's address
>   *
>   * This function maps a client buffer into kernel address space. If the
> - * buffer is already mapped, it returns the mapping's address.
> + * buffer is already mapped, it returns the existing mapping's address.
>   *
>   * Client buffer mappings are not ref'counted. Each call to
>   * drm_client_buffer_vmap() should be followed by a call to
>   * drm_client_buffer_vunmap(); or the client buffer should be mapped
>   * throughout its lifetime.
>   *
> + * The returned address is a copy of the internal value. In contrast to
> + * other vmap interfaces, you don't need it for the client's vunmap
> + * function. So you can modify it at will during blit and draw operations.
> + *
>   * Returns:
> - *	The mapped memory's address
> + *	0 on success, or a negative errno code otherwise.
>   */
> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
> +int
> +drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map_copy)
>  {
> -	struct dma_buf_map map;
> +	struct dma_buf_map *map = &buffer->map;
>  	int ret;
>  
> -	if (buffer->vaddr)
> -		return buffer->vaddr;
> +	if (dma_buf_map_is_set(map))
> +		goto out;
>  
>  	/*
>  	 * FIXME: The dependency on GEM here isn't required, we could
> @@ -319,13 +325,14 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>  	 * fd_install step out of the driver backend hooks, to make that
>  	 * final step optional for internal users.
>  	 */
> -	ret = drm_gem_vmap(buffer->gem, &map);
> +	ret = drm_gem_vmap(buffer->gem, map);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
>  
> -	buffer->vaddr = map.vaddr;
> +out:
> +	*map_copy = *map;
>  
> -	return map.vaddr;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>  
> @@ -339,10 +346,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>   */
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>  {
> -	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buffer->vaddr);
> +	struct dma_buf_map *map = &buffer->map;
>  
> -	drm_gem_vunmap(buffer->gem, &map);
> -	buffer->vaddr = NULL;
> +	drm_gem_vunmap(buffer->gem, map);
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
>  
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index c2f72bb6afb1..6212cd7cde1d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -378,7 +378,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
>  	unsigned int cpp = fb->format->cpp[0];
>  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>  	void *src = fb_helper->fbdev->screen_buffer + offset;
> -	void *dst = fb_helper->buffer->vaddr + offset;
> +	void *dst = fb_helper->buffer->map.vaddr + offset;
>  	size_t len = (clip->x2 - clip->x1) * cpp;
>  	unsigned int y;
>  
> @@ -400,7 +400,8 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>  	struct drm_clip_rect *clip = &helper->dirty_clip;
>  	struct drm_clip_rect clip_copy;
>  	unsigned long flags;
> -	void *vaddr;
> +	struct dma_buf_map map;
> +	int ret;
>  
>  	spin_lock_irqsave(&helper->dirty_lock, flags);
>  	clip_copy = *clip;
> @@ -413,8 +414,8 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>  
>  		/* Generic fbdev uses a shadow buffer */
>  		if (helper->buffer) {
> -			vaddr = drm_client_buffer_vmap(helper->buffer);
> -			if (IS_ERR(vaddr))
> +			ret = drm_client_buffer_vmap(helper->buffer, &map);
> +			if (ret)
>  				return;
>  			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
>  		}
> @@ -2060,7 +2061,8 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  	struct drm_framebuffer *fb;
>  	struct fb_info *fbi;
>  	u32 format;
> -	void *vaddr;
> +	struct dma_buf_map map;
> +	int ret;
>  
>  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
>  		    sizes->surface_width, sizes->surface_height,
> @@ -2096,11 +2098,14 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  		fb_deferred_io_init(fbi);
>  	} else {
>  		/* buffer is mapped for HW framebuffer */
> -		vaddr = drm_client_buffer_vmap(fb_helper->buffer);
> -		if (IS_ERR(vaddr))
> -			return PTR_ERR(vaddr);
> +		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
> +		if (ret)
> +			return ret;
> +		if (map.is_iomem)
> +			fbi->screen_base = map.vaddr_iomem;
> +		else
> +			fbi->screen_buffer = map.vaddr;
>  
> -		fbi->screen_buffer = vaddr;
>  		/* Shamelessly leak the physical address to user-space */
>  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
>  		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0)

Just noticed a tiny thing here: I think this needs to be patched to only
set smem_start when the map is _not_ iomem. Since virt_to_page isn't
defined on iomem at all.

I guess it'd be neat if we can set this for iomem too, but I have no idea
how to convert an iomem pointer back to a bus_addr_t ...

Cheers, Daniel

> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 7aaea665bfc2..f07f2fb02e75 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -3,6 +3,7 @@
>  #ifndef _DRM_CLIENT_H_
>  #define _DRM_CLIENT_H_
>  
> +#include <linux/dma-buf-map.h>
>  #include <linux/lockdep.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> @@ -141,9 +142,9 @@ struct drm_client_buffer {
>  	struct drm_gem_object *gem;
>  
>  	/**
> -	 * @vaddr: Virtual address for the buffer
> +	 * @map: Virtual address for the buffer
>  	 */
> -	void *vaddr;
> +	struct dma_buf_map map;
>  
>  	/**
>  	 * @fb: DRM framebuffer
> @@ -155,7 +156,7 @@ struct drm_client_buffer *
>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
>  int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
> +int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map);
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>  
>  int drm_client_modeset_create(struct drm_client_dev *client);
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
