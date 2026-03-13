Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430823976B0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Mar 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421871; cv=none; b=TQVpIHWl1j0pTu9+urvFId4kXMiFuCx91N/TMPdxWfs0PUqfZSyh7fRFIdYzo0hmGj4Cg2CCg/8l56DZpFs/E0TKetWvdZ2OR7rP3WBlGXAsOTo6QFuL6td5inW0N0B10J50dsO2J+aDZkJFpQKwn7kNFXpS8EjKPQb4T/skHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421871; c=relaxed/simple;
	bh=H73NZZBRz9fgCVcRCfrDslzmTFYwh0i+dzH8h8YzbYE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Z3PL/K7LTCr89idfxrbUAQj8y5BWRZYfWqBRd6jNhCXkZenjCTCz6LLrVlfC9AxXuW1bqbIlftDD8JXErYWReuYHf2X0nrRRXj6M2DbLoXHs/7sJ5zWxtZFCkqIbjPWHGYdxqhbatX8ryPfz87wrANW7/lciZdUPp3e0Bgc2ddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SE3yhlFs; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SE3yhlFs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE810C4270E;
	Fri, 13 Mar 2026 17:11:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 950A860027;
	Fri, 13 Mar 2026 17:11:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AD9410369EB3;
	Fri, 13 Mar 2026 18:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773421865; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sWN7mR8hhlLflSgSx7L+rGxa42YNgcjhiWs/sTnP90E=;
	b=SE3yhlFsKqX9la54BlcGeTn3MbBSNhgAE46gJLM27etqIvuJoPv9/huZfYVMW9pJmUUM2Q
	FK9x+xCgx11jgA0B8RK5PNYAeKOy4tN4YMJ26mysbNs219sWH8ILr2es0HoYp4AGtPOFIi
	7neL84Yhwo+TROshQ9GT2AiKVhcXsiX3ACnixqrzBvIqlMVggFLBEgI7yLaJh0QcT88wXI
	8AOpDresz7XivMX1Vq3EFLAM12STKTbvq3103ljKKe0iyb4Ekmp0Zhv+IqdsHCAdD9qzPF
	S9/buoMATnkXLmNmm+smfAzx4PLH5AUIGlwlmguOS/TZJj0OUyN8h3Z0ZRfaCA==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 18:10:54 +0100
Message-Id: <DH1TKWREZMFK.3BY4NY36BXLXG@bootlin.com>
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
Subject: Re: [PATCH v10 11/18] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
X-Mailer: aerc 0.20.1
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
 <20260310012458.169272-12-damon.ding@rock-chips.com>
In-Reply-To: <20260310012458.169272-12-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Tue Mar 10, 2026 at 2:24 AM CET, Damon Ding wrote:
> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
> side, as the private &drm_connector is no longer created.
>
> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
> are replaced by the corresponding &drm_bridge_funcs APIs:
>
> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
> analogix_dp_detect()       -> analogix_dp_bridge_detect()
> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>                               analogix_dp_bridge_edid_read()
>
> Additionally, the compatibilities of Analogix DP bridge based on whether
> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
> supported; If not (the next bridge is a 'monitor' or a bridge chip),
> OP_EDID and OP_DETECT are supported.
>
> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
> analogix_dp_probe(), because the type of next bridge (the panel, monitor
> or bridge chip) can only be determined after the probe process has fully
> completed.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

...

> @@ -73,15 +72,12 @@ static int exynos_dp_bridge_attach(struct analogix_dp=
_plat_data *plat_data,
>  				   struct drm_bridge *bridge)
>  {
>  	struct exynos_dp_device *dp =3D to_dp(plat_data);
> -	enum drm_bridge_attach_flags flags =3D 0;
>  	int ret;
>
>  	/* Pre-empt DP connector creation if there's a bridge */
>  	if (plat_data->next_bridge) {
> -		if (dp->has_of_bridge)
> -			flags =3D DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> -
> -		ret =3D drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge=
, flags);
> +		ret =3D drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge=
,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);

Should this be 'flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR' to be future-proof?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
