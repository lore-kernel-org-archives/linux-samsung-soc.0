Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813B3C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbjAXVEm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjAXVEl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 16:04:41 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9495D2685
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:04:40 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9B878855B5;
        Tue, 24 Jan 2023 22:04:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674594278;
        bh=i2Tf2xUr41a1Xt/qiigFI3GfvYyaAwEqq7DZFLV5OG0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=uMQwwuly9x8Spq6TaC4a6R+bQ3/w1Ickun6Fdv4I6v23C3v56RccT0S2JBZvgK96I
         vT9O9IF4HjCwZqGNIsR5XzkCh1b29Q2ULS4Y4s0fjsyg2AkLywaIeh6Wq5z0BxJPDT
         Z3Lqa0iKRMxyCWih0wFtSkdPIwDdbU9zRDLJhmrw906/hCt54ww13JJgPcZDemgcc8
         xsKRGxc/XhHB3dBiQOk0b9113EeMpdCA/uNCq+cw+pht3TrsvBAU4NiJUUGV6osXFl
         Zm0xef5rTHy8zh8dGQ5tmEkedbwl/Ji1BOCDNrqHCh3u1Fdy8eevGc9HGeeCnhVICP
         upwXyE1+nhMUw==
Message-ID: <f90b1d1d-d3a8-bb99-b282-d48fcc487833@denx.de>
Date:   Tue, 24 Jan 2023 22:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 12/18] drm: exynos: dsi: Consolidate component
 and bridge
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-13-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-13-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:12, Jagan Teki wrote:
> DSI host registration, attach and detach operations are quite
> different for the component and bridge-based DRM drivers.
> 
> Supporting generic bridge driver to use both component and bridge
> based DRM drivers can be tricky and would require additional host
> related operation hooks.
> 
> Add host operation hooks for registering and unregistering Exynos
> and generic drivers, where Exynos hooks are used in existing Exynos
> component based DRM drivers and generic hooks are used in i.MX8M
> bridge based DRM drivers.
> 
> Add host attach and detach operation hooks for Exynos component
> DRM drivers and those get invoked while DSI core host attach and
> detach gets called.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v11:
> - none
> Changes for v10:
> - split from previous series patch
> "drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"
> 
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 179 ++++++++++++++++++------
>   1 file changed, 140 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 7afbbe30d1d3..fc7f00ab01b4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -250,6 +250,8 @@ struct exynos_dsi_transfer {
>   	u16 rx_done;
>   };
>   
> +struct exynos_dsi;

Is this forward declaration really necessary ? Can't the structures 
below be reordered to get rid of this ?

>   #define DSIM_STATE_ENABLED		BIT(0)
>   #define DSIM_STATE_INITIALIZED		BIT(1)
>   #define DSIM_STATE_CMD_LPM		BIT(2)
> @@ -281,12 +283,19 @@ struct exynos_dsi_driver_data {
>   	const unsigned int *reg_values;
>   };
>   
> +struct exynos_dsim_host_ops {
> +	int (*register_host)(struct exynos_dsi *dsim);
> +	void (*unregister_host)(struct exynos_dsi *dsim);
> +	int (*attach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
> +	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
> +};
> +
>   struct exynos_dsi_plat_data {
>   	enum exynos_dsi_type hw_type;
> +	const struct exynos_dsim_host_ops *host_ops;
>   };
>   
>   struct exynos_dsi {
> -	struct drm_encoder encoder;
>   	struct mipi_dsi_host dsi_host;
>   	struct drm_bridge bridge;
>   	struct drm_bridge *out_bridge;
> @@ -316,6 +325,12 @@ struct exynos_dsi {
>   
>   	const struct exynos_dsi_driver_data *driver_data;
>   	const struct exynos_dsi_plat_data *plat_data;
> +
> +	void *priv;
> +};
> +
> +struct exynos_dsi_enc {
> +	struct drm_encoder encoder;
>   };
>   
>   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
> @@ -1319,10 +1334,11 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
>   
>   static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
>   {
> -	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
> +	struct exynos_dsi *dsim = (struct exynos_dsi *)dev_id;

Is the rename really needed  ?

> +	struct exynos_dsi_enc *dsi = dsim->priv;

Call this variable something else , like dsi_enc , and you shouldn't 
need the rename above ...

>   	struct drm_encoder *encoder = &dsi->encoder;
>   
> -	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
> +	if (dsim->state & DSIM_STATE_VIDOUT_AVAILABLE)

... and the rename here .

>   		exynos_drm_crtc_te_handler(encoder->crtc);
>   
>   	return IRQ_HANDLED;


[...]

>   static void exynos_dsi_unbind(struct device *dev, struct device *master,
>   				void *data)
>   {
> -	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> +	struct exynos_dsi *dsim = dev_get_drvdata(dev);

Please avoid the variable renames globally, that should simplify this 
patch and remove unrelated changes.

> -	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
> +	dsim->bridge.funcs->atomic_disable(&dsim->bridge, NULL);
>   
> -	mipi_dsi_host_unregister(&dsi->dsi_host);
> +	mipi_dsi_host_unregister(&dsim->dsi_host);
>   }

[...]

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>
