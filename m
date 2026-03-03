Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE75F38C428
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Mar 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530959; cv=none; b=g0Sk5nnLjZhrVo1C6yGwwPzdiHZGTL5ccSOslpMpIdfrIirExdNeyO3WzGLhxd4IHPZRC9cxoaf0jLHKGELzjZqxgK+koleeHKtCZZZKkoWhspIOWv4NwspWpzNC9QKrY2TYx+I1QzUUOoe2NOwnzDrdILS2NDM6n3LQbS/E8bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530959; c=relaxed/simple;
	bh=DrfYySGTzORXKamz8HoPTohDqNudCaIuoX44kwzhW/w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tJvsJ8zioPAWBtKI8jgdcPQ9I5/OmQD2opCE0B5p9BqOuIgInsnbMmt/JjMydue5hl5EXmEsdvMKHZhmK3gDEh3WPRJCqT+A1cd+VGndJI7oA11LynAs7qdou2GHaY6YB7Dc4taVqtuZuPRheMT2EDLZUKsV34zMNFM0ijLEP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iH5gkeS8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iH5gkeS8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA8B04E42500;
	Tue,  3 Mar 2026 09:42:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D5085FF29;
	Tue,  3 Mar 2026 09:42:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6472F103682E0;
	Tue,  3 Mar 2026 10:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772530950; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b4FnwUyggxbhER6+JVaL2FhJxctsR5DXdCcHIQG0bqY=;
	b=iH5gkeS8EZnmbrNwNRBfYKZfDj2+6dd92LdeVnRYQEQmt43nZ0slJ3kwfCRyYzBwnuQ0zi
	pYo/JLluMaAiNz8ZATi9AOBiCaz7D4rKgBt5dgvjyVdIfdXGXrf2U0TiMXhVoV0I9ITfic
	e6yms5btiQDbmY+cEXAiC05DC2JxL4OVgt4w6oxlr11HpEguqvvs7r+lriNP2HjrviKk8/
	g3WtTxiJespsFV8mqBkic79SaORNJjLrGUMJGXgGY4s7wwCBCj5MLEGY2tSl0vV564NlBF
	aT6wn+7sdS1AU6gCtYoqjK+adzSy3+x1vWXVknLbN0AXkcXg6RPuafs+U9Hv3A==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:42:25 +0100
Message-Id: <DGT1S368J0BK.3UA75JNEA1AB8@bootlin.com>
Subject: Re: [PATCH v9 09/15] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-10-damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-10-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
> Apply drm_bridge_connector helper for Analogix DP driver.
>
> The following changes have been made:
> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>   and &drm_connector_helper_funcs.
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach.
> - Remove &analogix_dp_device.connector.
> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>   &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>   &drm_bridge_funcs.edid_read().
> - Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
>   binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
                             ^

Do you mean "!DRM_BRIDGE_ATTACH_NO_CONNECTOR" here (i.e. missing '!')?

Also, unsuppported -> unsupported (typo)

>   in analogix_dp_bridge_attach().
> - Set &drm_bridge.ops according to different cases.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

I had a quick look, looks good overall, for the moment I have only a
question, see below.

I aim at reviewing this patch in depth, but it's not an easy one to
digest. Would it be feasible to split it in smaller logical steps? If it
is, please do, it would be very helpful for reviewing.

> @@ -1532,6 +1481,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *d=
rm_dev)
>  {
> +	struct drm_bridge *bridge =3D &dp->bridge;
>  	int ret;
>
>  	dp->drm_dev =3D drm_dev;
> @@ -1545,7 +1495,18 @@ int analogix_dp_bind(struct analogix_dp_device *dp=
, struct drm_device *drm_dev)
>  		return ret;
>  	}
>
> -	ret =3D drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> +	if (dp->plat_data->panel)
> +		bridge->ops =3D DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
> +	else
> +		bridge->ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> +
> +	bridge->of_node =3D dp->dev->of_node;
> +	bridge->type =3D DRM_MODE_CONNECTOR_eDP;
> +	ret =3D devm_drm_bridge_add(dp->dev, &dp->bridge);

Can devm_drm_bridge_add() be added to analogix_dp_probe() instead?

> +	if (ret)
> +		goto err_unregister_aux;
> +
> +	ret =3D drm_bridge_attach(dp->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_=
NO_CONNECTOR);
>  	if (ret) {
>  		DRM_ERROR("failed to create bridge (%d)\n", ret);
>  		goto err_unregister_aux;

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
