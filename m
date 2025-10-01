Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A2248F72
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Oct 2025 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759334999; cv=none; b=WKikFgflDc/nY9UGZ3vLWGIRRkcqnq0IsxY4A9ZeN0x52xQySVNy+j1ycljJoCqcPXt40N65umY/3kI0XupXVeKzsy4CG2Hi1DdW5NwfNPjs2ZCZ6Hwug5+rvOYvqoUQNMyj2rB54i3ImbacIIoy9RjOIzz4LmdOOD5Qv+3Js7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759334999; c=relaxed/simple;
	bh=2k01JO4kLyXEdsY63gzIBYkAfPijzflAQjkb2arWM9o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzGItj6RzZdLtmP+dZ6vg0eB5CYyTmodSkT7Z/RTe+/CH1F/Tt8CaqGKJbiTkSq1Dr1hs0vqh4GnjhHv9RRVjmby+FrAgYFRdLJpiIVM4Jml+niyBhc2zOAuyiWBoEos5veH8MlpnwDrmWv8Eq33SvE7IGMuRWoxPRSJ3cl3o1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rv7pdWQx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rv7pdWQx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3A8AC1A1075;
	Wed,  1 Oct 2025 16:09:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 093A5606BF;
	Wed,  1 Oct 2025 16:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7266102F1A3E;
	Wed,  1 Oct 2025 18:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759334993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9CvJDGBSoVXbt+J412aK4yig9hsCig6aqy7YzBwhW2U=;
	b=rv7pdWQxzoqrjN3bhcDG6IeHqv9N+XFI6QwkO+p2auYuGPT6LdtWBCRBaL+JXAoVwiZp3M
	GCz4Tg3Kp9FHaQ9ya4b1XoJUTf6IrVRO2rb9kWsrBaj8QlhrQSzkcUKcKaIjBJevIfdKML
	Wq9Hw3uoV22IEeAse398wh3dpFWcPNP4997mm0bXmVga+Na0ZqDBIom3Xkc/v8U54fbN0P
	dUv7sLcbxNiQ6FHk4AuZ6ks4JvbyqGVlVceYlp2gOFBy2i4u7ZoQOFNKAjjRBjtVSLzzx1
	IWzQUOqHYmLJoe+mlbvD6F85QWGNZgLSYs8vBFGYgIlNgCS9dU1HYJqlbZYC9A==
Date: Wed, 1 Oct 2025 18:09:22 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <20251001180922.6bbe42ac@booty>
In-Reply-To: <20250930090920.131094-12-damon.ding@rock-chips.com>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
	<20250930090920.131094-12-damon.ding@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Tue, 30 Sep 2025 17:09:13 +0800
Damon Ding <damon.ding@rock-chips.com> wrote:

> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
> 
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
> 
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
> 
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.

I think the whole explanation can be more concisely rewritten as:

If the later bridge declares OP_EDID, OP_MODES or both, then both
.bridge_modes and .bridge_edid should be set to NULL (if any was set
from a previous bridge), and then .bridge_modes and/or .bridge_edid be
set to the later bridge as is done already.

Does this look correct (i.e. does it convey the same meaning)?

> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_connector *connector;
>  	struct i2c_adapter *ddc = NULL;
>  	struct drm_bridge *bridge, *panel_bridge = NULL;
> +	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
>  	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
>  	unsigned int max_bpc = 8;
>  	bool support_hdcp = false;
> @@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	 */
>  	connector_type = DRM_MODE_CONNECTOR_Unknown;
>  	drm_for_each_bridge_in_chain(encoder, bridge) {
> +		pre_bridge_edid = bridge_connector->bridge_edid;
> +		pre_bridge_modes = bridge_connector->bridge_modes;
> +
>  		if (!bridge->interlace_allowed)
>  			connector->interlace_allowed = false;
>  		if (!bridge->ycbcr_420_allowed)
> @@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			bridge_connector->bridge_detect = bridge;
>  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>  			bridge_connector->bridge_modes = bridge;
> +
> +		/*
> +		 * When multiple bridges are present, EDID detection capability
> +		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> +		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
> +		 * are determined by the last bridge in the chain, we handle
> +		 * three cases:
> +		 *
> +		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> +		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> +		 *    &drm_bridge_connector.bridge_edid to NULL and set
> +		 *    &drm_bridge_connector.bridge_modes to the later bridge.
> +		 *  - Ensure modes detection capability of the later bridge
> +		 *    will not be ignored.
> +		 *
> +		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> +		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> +		 *    &drm_bridge_connector.bridge_modes to NULL and set
> +		 *    &drm_bridge_connector.bridge_edid to the later bridge.
> +		 *  - Although EDID detection capability has higher priority,
> +		 *    this operation is for balance and makes sense.
> +		 *
> +		 * Case 3: the later bridge declares both of them
> +		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
> +		 *    and &drm_bridge_connector.bridge_modes to this bridge.
> +		 *  - Just leave transfer of these two capabilities as before.
> +		 */
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
> +		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
> +			if (pre_bridge_modes)
> +				bridge_connector->bridge_modes = NULL;
> +		}
> +		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
> +		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
> +			if (pre_bridge_edid)
> +				bridge_connector->bridge_edid = NULL;
> +		}
> +

If the above rewrite is correct, then I think this patch can be
rewritten in a simple way (build tested only):

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a5bdd6c10643..bd5dbafe88bc 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -672,14 +672,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
                if (!bridge->ycbcr_420_allowed)
                        connector->ycbcr_420_allowed = false;
 
-               if (bridge->ops & DRM_BRIDGE_OP_EDID)
-                       bridge_connector->bridge_edid = bridge;
+               if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
+                       bridge_connector->bridge_edid = NULL;
+                       bridge_connector->bridge_modes = NULL;
+                       if (bridge->ops & DRM_BRIDGE_OP_EDID)
+                               bridge_connector->bridge_edid = bridge;
+                       if (bridge->ops & DRM_BRIDGE_OP_MODES)
+                               bridge_connector->bridge_modes = bridge;
+               }
                if (bridge->ops & DRM_BRIDGE_OP_HPD)
                        bridge_connector->bridge_hpd = bridge;
                if (bridge->ops & DRM_BRIDGE_OP_DETECT)
                        bridge_connector->bridge_detect = bridge;
-               if (bridge->ops & DRM_BRIDGE_OP_MODES)
-                       bridge_connector->bridge_modes = bridge;
                if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
                        if (bridge_connector->bridge_hdmi)
                                return ERR_PTR(-EBUSY);

Another thing to note is that this patch conflicts with [0], which I
plan to apply in the next few days. The two patches are orthogonal but
they insist on the same lines (those assigning
bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
comes later will be easily adapted. Just wanted to ensure you are aware.

[0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
