From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/3] drm/exynos: free DP if probe fails to find a panel or bridge
Date: Sat, 22 Nov 2014 23:56:34 +0900
Message-ID: <CAAQKjZPgYbwchnHNEEmjL7eWVGU3_NAHZBvB1Los1d-reyNg6g@mail.gmail.com>
References: <1416527664-10553-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:61429 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757AbaKVO4g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Nov 2014 09:56:36 -0500
Received: by mail-la0-f54.google.com with SMTP id gf13so5710811lab.27
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2014 06:56:34 -0800 (PST)
In-Reply-To: <1416527664-10553-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

2014-11-21 8:54 GMT+09:00 Gustavo Padovan <gustavo@padovan.org>:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>
> DP was leaked everytime function returns EPROBE_DEFER, free it before
> returning.

It seems that you misunderstood devm_* api.

Thanks,
Inki Dae

>
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 85762cf..6fd4a46 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1336,8 +1336,10 @@ static int exynos_dp_probe(struct platform_device *pdev)
>         if (panel_node) {
>                 dp->panel = of_drm_find_panel(panel_node);
>                 of_node_put(panel_node);
> -               if (!dp->panel)
> -                       return -EPROBE_DEFER;
> +               if (!dp->panel) {
> +                       ret = -EPROBE_DEFER;
> +                       goto free_dp;
> +               }
>         }
>
>         endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> @@ -1346,10 +1348,14 @@ static int exynos_dp_probe(struct platform_device *pdev)
>                 if (bridge_node) {
>                         dp->bridge = of_drm_find_bridge(bridge_node);
>                         of_node_put(bridge_node);
> -                       if (!dp->bridge)
> -                               return -EPROBE_DEFER;
> -               } else
> -                       return -EPROBE_DEFER;
> +                       if (!dp->bridge) {
> +                               ret = -EPROBE_DEFER;
> +                               goto free_dp;
> +                       }
> +               } else {
> +                       ret = -EPROBE_DEFER;
> +                       goto free_dp;
> +               }
>         }
>
>         exynos_dp_display.ctx = dp;
> @@ -1359,6 +1365,9 @@ static int exynos_dp_probe(struct platform_device *pdev)
>                 exynos_drm_component_del(&pdev->dev,
>                                                 EXYNOS_DEVICE_TYPE_CONNECTOR);
>
> +free_dp:
> +       devm_kfree(dev, dp);
> +
>         return ret;
>  }
>
> --
> 1.9.3
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
