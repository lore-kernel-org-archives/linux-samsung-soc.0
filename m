Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B69138F646;
	Tue,  3 Mar 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531660; cv=none; b=jJVElsImdPPaig/ddCsakcctjmh2M8+5chbXxHw24PVewAeD3FTmuNY56DsbqTIUCj9rVw6Pz92WBOGl4u996ORAPOraC2phi3lu3PUbxq9G51dl7dk3JhSL4Jgp4XsKhF71ovFTw4Hc1hOAuJ5ynp/dumC2s22hf1gKoQ2ZLuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531660; c=relaxed/simple;
	bh=d3yrrUMprMXThY8dV86NIYBbK0Wr0DMzlFlkODlPjwM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qmR7AXJSNuQ+x4mOQsDmkk33HL3/3I8kXP/XN5wixMFI4MUkeKWO1+W1vEAVp8d5Q+z/t4ax+bdL453VU2ljEnGWFOxdVNfCchkgrwL+SuSsiqIabdkPP/R96LnJHbnc6UGc6TQ3CG+dC5nSG1HQlY+JmTdZS99upd8h+WgQyfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yHIp9qbL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yHIp9qbL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B233C1A22B4;
	Tue,  3 Mar 2026 09:54:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E5205FF29;
	Tue,  3 Mar 2026 09:54:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0481103695F3;
	Tue,  3 Mar 2026 10:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772531654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D4B+fqv1Q4afrFn9HAZJqj6Nm/zmdWDCD9AzHRpLCIw=;
	b=yHIp9qbLWNRM7L5uL0cVbKgUvYxtLjY07FFZee+XHhU87qlGyOf/Wl0Jl0SmOlQo9Xj4O8
	JrpFG1OpxJpXIyrPSPKvXXMdy8oJi2/NfP9MfAuFTTCqRINrXOE+WvebbLJSDNkCIAfTQm
	CIV5U72GuO05+L8eUIjWkdTHnSuMyMBPogbwauxcOoslNwkxh2yY9kYxEl9M+2zXM3Z4tL
	KcypOlo6T5fTDAfdPd3PR2IaImE8gF1mH6TDjRJdZvd/o0rQPy9GTQU/h/9bTeXrdGzGby
	sP1FFCi3BGPc9xts2phfbOFkqwsKMg/DDdbgwn4vyExKtFojI9gRWU6xa8ca0Q==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:54:03 +0100
Message-Id: <DGT20ZJ3Q4WP.3OTQJYWGSYGUD@bootlin.com>
Subject: Re: [PATCH v9 10/15] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
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
 <20260210071225.2566099-11-damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-11-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side. Therefore, we add
> a new API analogix_dp_finish_probe(), which combines the panel/bridge
> parsing with component addition, to do it.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

...

> @@ -1581,6 +1583,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct anal=
ogix_dp_device *dp)
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
>
> +static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
> +{
> +	struct analogix_dp_device *dp =3D to_dp(aux);
> +	struct analogix_dp_plat_data *plat_data =3D dp->plat_data;
> +	int port =3D plat_data->dev_type =3D=3D EXYNOS_DP ? 0 : 1;
> +	int ret;
> +
> +	/*
> +	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no va=
lid panel
> +	 * or bridge nodes. The driver should go on for the driver-free bridge =
or the DP
> +	 * mode applications.
> +	 */
> +	ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
> +					  &plat_data->panel, &plat_data->next_bridge);
> +	if (ret && ret !=3D -ENODEV)
> +		return ret;
> +
> +	return component_add(dp->dev, plat_data->ops);
> +}
> +
> +int analogix_dp_finish_probe(struct analogix_dp_device *dp)
> +{
> +	int ret;
> +
> +	ret =3D devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_prob=
ing);
> +	if (ret) {
> +		/*
> +		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing(=
) will
> +		 * not be called because there are no EP devices. Then the callback fu=
nction
> +		 * analogix_dp_aux_done_probing() will be called directly in order to =
support
> +		 * the other valid DT configurations.
> +		 *
> +		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROB=
E_DEFER.

Uhm, if it is allowed to return -EPROBE_DEFER...

> +		 */
> +		if (ret !=3D -ENODEV) {
> +			dev_err(dp->dev, "failed to populate aux bus\n");
> +			return ret;
> +		}

...then you shouldn't dev_err() when -EPROBE_DEFER is returned.

Either use dev_err_probe() (which would also simplify your code) or check
for if (ret !=3D -ENODEV && ret !=3D -EPROBE_DEFER).

> +
> +		return analogix_dp_aux_done_probing(&dp->aux);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
> +
>  MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>  MODULE_DESCRIPTION("Analogix DP Core Driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index 3428ffff24c5..bae969dec63a 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
>  	struct drm_bridge *next_bridge;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
> +	const struct component_ops *ops;

Is adding a new stored field a good idea? Can it be instead passed as an
argument to analogix_dp_finish_probe()?

Note I don't have a strong opinion here, just the added struct field seems
overkill for being used just once.

> @@ -49,5 +50,6 @@ int analogix_dp_stop_crc(struct drm_connector *connecto=
r);
>
>  struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp=
_aux *aux);
>  struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
> +int analogix_dp_finish_probe(struct analogix_dp_device *dp);
>
>  #endif /* _ANALOGIX_DP_H_ */

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
