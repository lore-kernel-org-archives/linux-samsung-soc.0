Return-Path: <SRS0=V4Vk=4X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC328C10F25
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Mar 2020 21:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B1F420705
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Mar 2020 21:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgCFV0m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Mar 2020 16:26:42 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:36480 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgCFV0m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 16:26:42 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8B00A2001E;
        Fri,  6 Mar 2020 22:26:30 +0100 (CET)
Date:   Fri, 6 Mar 2020 22:26:29 +0100
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
Subject: Re: [PATCH 02/22] drm/atmel-hlcdc: Use simple encoder
Message-ID: <20200306212629.GB17369@ravnborg.org>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305155950.2705-3-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=ISFmP3M1dWiz_JBsLmoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 05, 2020 at 04:59:30PM +0100, Thomas Zimmermann wrote:
> The atmel-hlcdc driver uses an empty implementation for its encoder.
> Replace the code with the generic simple encoder.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> index e2019fe97fff..43bc709e3523 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> @@ -11,9 +11,10 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/of_graph.h>
>  
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_bridge.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "atmel_hlcdc_dc.h"
>  
> @@ -22,10 +23,6 @@ struct atmel_hlcdc_rgb_output {
>  	int bus_fmt;
>  };
>  
> -static const struct drm_encoder_funcs atmel_hlcdc_panel_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  static struct atmel_hlcdc_rgb_output *
>  atmel_hlcdc_encoder_to_rgb_output(struct drm_encoder *encoder)
>  {
> @@ -98,9 +95,8 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
>  		return -EINVAL;
>  	}
>  
> -	ret = drm_encoder_init(dev, &output->encoder,
> -			       &atmel_hlcdc_panel_encoder_funcs,
> -			       DRM_MODE_ENCODER_NONE, NULL);
> +	ret = drm_simple_encoder_init(dev, &output->encoder,
> +				      DRM_MODE_ENCODER_NONE);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.25.1
