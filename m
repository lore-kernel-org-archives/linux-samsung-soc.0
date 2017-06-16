From: Shuah Khan <shuahkhan@gmail.com>
Subject: Re: [PATCH] drm/exynos: dsi: do not try to find bridge
Date: Fri, 16 Jun 2017 08:16:14 -0600
Message-ID: <CAKocOOM9RZkYvHOtrBXQeT7S=zCx4PY5QRJ-NXkp-GSvioMuZg@mail.gmail.com>
References: <CGME20170616075016epcas5p34938dd82d07390a03e7690f1634e9229@epcas5p3.samsung.com>
 <1497599415-4327-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:34738 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752647AbdFPOQQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 10:16:16 -0400
Received: by mail-ot0-f193.google.com with SMTP id p48so4611354otc.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jun 2017 07:16:16 -0700 (PDT)
In-Reply-To: <1497599415-4327-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, shuahkh@osg.samsung.com

Hi Inki,

On Fri, Jun 16, 2017 at 1:50 AM, Inki Dae <inki.dae@samsung.com> wrote:
> It doesn't need to try to find a bridge if bridge node doesn't exist.
>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index d404de8..e337cd2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1687,9 +1687,11 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>                 return ret;
>         }
>
> -       bridge = of_drm_find_bridge(dsi->bridge_node);

This is more of question than comment. I am seeing in some places,
such as mtk_dpi_probe(), of_node_put() is called right after
of_drm_find_bridge() whether or not bridge_node is found.

In this case, of_node_put() is done from exynos_dsi_remove() which looks
correct to me.

However, there is the discrepancy. One of these is incorrect perhaps?
When is the right time to call of_node_put()?

> -       if (bridge)
> -               drm_bridge_attach(encoder, bridge, NULL);
> +       if (dsi->bridge_node) {
> +               bridge = of_drm_find_bridge(dsi->bridge_node);
> +               if (bridge)
> +                       drm_bridge_attach(encoder, bridge, NULL);
> +       }
>
>         return mipi_dsi_host_register(&dsi->dsi_host);
>  }
> --
> 1.9.1

Looks good to me.

Reviewed-by: Shuah Khan <shuahkh@osg.samsung.com>

thanks,
-- Shuah
