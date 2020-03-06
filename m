Return-Path: <SRS0=V4Vk=4X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41D0C10F00
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Mar 2020 21:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2EB420714
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Mar 2020 21:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCFVSV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Mar 2020 16:18:21 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:36050 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgCFVSV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 16:18:21 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 92F132001E;
        Fri,  6 Mar 2020 22:18:04 +0100 (CET)
Date:   Fri, 6 Mar 2020 22:18:03 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, abrodkin@synopsys.com,
        bbrezillon@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        jingoohan1@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
        xinliang.liu@linaro.org, zourongrong@gmail.com,
        john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
        puck.chen@hisilicon.com, linux@armlinux.org.uk,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
        matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
        tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 01/22] drm/arc: Use simple encoder
Message-ID: <20200306211802.GA17369@ravnborg.org>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305155950.2705-2-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=rqCPFu_3IIfdMowE660A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 05, 2020 at 04:59:29PM +0100, Thomas Zimmermann wrote:
> The arc driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.

We should , as a follow-up patch, embed the encoder in
arcgpu_drm_private.
Then we drop the kzalloc() and avoid that life-time challenge.

This patch looks good for what it does.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/arc/arcpgu_hdmi.c | 10 +++-------
>  drivers/gpu/drm/arc/arcpgu_sim.c  |  8 ++------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> index 52839934f2fb..780911765e2e 100644
> --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
> +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> @@ -7,15 +7,12 @@
>  
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_encoder.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "arcpgu.h"
>  
> -static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
>  {
>  	struct drm_encoder *encoder;
> @@ -34,8 +31,7 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
>  
>  	encoder->possible_crtcs = 1;
>  	encoder->possible_clones = 0;
> -	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
> index 37d961668dfe..66ca2c26e339 100644
> --- a/drivers/gpu/drm/arc/arcpgu_sim.c
> +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "arcpgu.h"
>  
> @@ -50,10 +51,6 @@ static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  {
>  	struct arcpgu_drm_connector *arcpgu_connector;
> @@ -68,8 +65,7 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  	encoder->possible_crtcs = 1;
>  	encoder->possible_clones = 0;
>  
> -	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_VIRTUAL);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.25.1
