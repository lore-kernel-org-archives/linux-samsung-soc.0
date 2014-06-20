From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 1/2] drm/exynos/fbdev: don't set fix.smem/mmio_{start,len}
Date: Fri, 20 Jun 2014 20:15:06 +0800
Message-ID: <CAGS+omCT6u6rBz0QKTju3d=_+G29RD515M5BeX_KEbvWyANg9Q@mail.gmail.com>
References: <1396603322-13585-1-git-send-email-djkurtz@chromium.org> <20140620025938.2e80efa0@i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:50624 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966976AbaFTMP1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 08:15:27 -0400
Received: by mail-vc0-f177.google.com with SMTP id ij19so3314249vcb.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2014 05:15:26 -0700 (PDT)
In-Reply-To: <20140620025938.2e80efa0@i7>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Siarhei Siamashka <siarhei.siamashka@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Jun 20, 2014 at 7:59 AM, Siarhei Siamashka
<siarhei.siamashka@gmail.com> wrote:
>
> On Fri,  4 Apr 2014 17:22:01 +0800
> Daniel Kurtz <djkurtz@chromium.org> wrote:
>
> > Kernel access to the eyxnos fbdev framebuffer is via its gem object's
> > kernel mapping (kvaddr, stored in info->screen_base).
> >
> > User space access is provided by mmap(), read() and write() of /dev/fb/fb0.
> > These functions also only use screen_base/screen_size().
> >
> > Therefore, it is not necessary to set fix->smem_{start,len} or
> > fix->mmio_{start,len} fields.
> >
> > This avoids leaking kernel, physical and dma mapped addresses to user
> > space via the ioctls FBIOGET_VSCREENINFO and FBIOGET_FSCREENINFO.
> >
> > Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> > index 5fa342e..2dcc589 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> > @@ -123,14 +123,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
> >
> >       dev->mode_config.fb_base = (resource_size_t)buffer->dma_addr;
> >       fbi->screen_base = buffer->kvaddr + offset;
> > -     if (is_drm_iommu_supported(dev))
> > -             fbi->fix.smem_start = (unsigned long)
> > -                     (page_to_phys(sg_page(buffer->sgt->sgl)) + offset);
> > -     else
> > -             fbi->fix.smem_start = (unsigned long)buffer->dma_addr;
> > -
> >       fbi->screen_size = size;
> > -     fbi->fix.smem_len = size;
>
> Can we keep proper initialization of 'smem_len'? Some userland
> applications use it for calculating the size for mmap:
>
>     http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/fbdevhw/fbdevhw.c?id=xorg-server-1.15.99.903#n571
>
> >
> >       return 0;
> >  }
>
> Basically, this patch breaks the xf86-video-fbdev ddx and some users
> are already unhappy.


I'm so sorry this patch broke things for some users.
Can you upload a patch to correct it?
I'll happily review it.

-djk

>
>
> --
> Best regards,
> Siarhei Siamashka
