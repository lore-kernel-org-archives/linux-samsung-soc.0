From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/exynos: dp: add of_graph dt binding support
 for panel
Date: Thu, 3 Dec 2015 16:51:51 -0600
Message-ID: <CAL_JsqJ0sw2QJdqVNCCvGL4gahx9FJXgRYcgS3UNA3b6G6-YTg@mail.gmail.com>
References: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59347 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751618AbbLCWwN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Dec 2015 17:52:13 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id CB7E0204E7
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Dec 2015 22:52:12 +0000 (UTC)
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 63A3B20551
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Dec 2015 22:52:11 +0000 (UTC)
Received: by ykfs79 with SMTP id s79so105080773ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Dec 2015 14:52:10 -0800 (PST)
In-Reply-To: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, Dec 2, 2015 at 5:57 AM, Inki Dae <inki.dae@samsung.com> wrote:
> This patch adds of_graph dt binding support for panel device
> and also keeps the backward compatibility.
>
> i.e.,
> The dts file for Exynos5800 based peach pi board
> has a panel property so we need to keep the backward compatibility.
>
> Changelog v2:
> - return -EINVAL if getting a port node failed.
>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 94f02a0..0b53045 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1392,7 +1392,7 @@ static const struct component_ops exynos_dp_ops = {
>  static int exynos_dp_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> -       struct device_node *panel_node, *bridge_node, *endpoint;
> +       struct device_node *panel_node = NULL, *bridge_node, *endpoint = NULL;
>         struct exynos_dp_device *dp;
>         int ret;
>
> @@ -1403,15 +1403,32 @@ static int exynos_dp_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, dp);
>
> +       /* This is for the backward compatibility. */
>         panel_node = of_parse_phandle(dev->of_node, "panel", 0);
>         if (panel_node) {
>                 dp->panel = of_drm_find_panel(panel_node);
>                 of_node_put(panel_node);
>                 if (!dp->panel)
>                         return -EPROBE_DEFER;
> +       } else {
> +               endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +               if (endpoint) {
> +                       panel_node = of_graph_get_remote_port_parent(endpoint);
> +                       if (panel_node) {
> +                               dp->panel = of_drm_find_panel(panel_node);
> +                               of_node_put(panel_node);
> +                               if (!dp->panel)
> +                                       return -EPROBE_DEFER;
> +                       } else {
> +                               DRM_ERROR("no port node for panel device.\n");
> +                               return -EINVAL;
> +                       }
> +               }

This should be a fairly common sequence, so please make it one. Only
which port is the panel should vary.

Rob
