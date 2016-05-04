From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm/exynos: fix cancel page flip code
Date: Wed, 4 May 2016 10:56:58 +0100
Message-ID: <CAPj87rNzGspWQ1msznzU-c1Qxh5iMtVBmkFRdnXWf1=J_dHu+g@mail.gmail.com>
References: <1458816758-5172-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:32819 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383AbcEDJ47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 May 2016 05:56:59 -0400
Received: by mail-wm0-f45.google.com with SMTP id g17so33692040wme.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2016 02:56:59 -0700 (PDT)
In-Reply-To: <1458816758-5172-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Andrzej,

On 24 March 2016 at 10:52, Andrzej Hajda <a.hajda@samsung.com> wrote:
> @@ -229,24 +229,12 @@ void exynos_drm_crtc_cancel_page_flip(struct drm_crtc *crtc,
>                                         struct drm_file *file)
>  {
>         struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> -       struct drm_pending_vblank_event *e;
> -       unsigned long flags;
> +       struct drm_pending_vblank_event *e = exynos_crtc->event;
>
> -       spin_lock_irqsave(&crtc->dev->event_lock, flags);
> -       e = exynos_crtc->event;
> -       if (e && e->base.file_priv == file) {
> -               exynos_crtc->event = NULL;
> -               /*
> -                * event will be destroyed by core part
> -                * so below line should be removed later with core changes
> -                */
> -               e->base.destroy(&e->base);
> -               /*
> -                * event_space will be increased by core part
> -                * so below line should be removed later with core changes.
> -                */
> -               file->event_space += sizeof(e->event);
> -               atomic_dec(&exynos_crtc->pending_update);
> -       }
> -       spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> +       if (!e || e->base.file_priv != file)
> +               return;
> +
> +       exynos_crtc->event = NULL;
> +       atomic_dec(&exynos_crtc->pending_update);
> +       drm_event_cancel_free(crtc->dev, &e->base);

Accessing and manipulating exynos_crtc->event should still be done
under event_lock, to avoid racing with the IRQ handler.

Cheers,
Daniel
