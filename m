Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392452BDC13;
	Mon, 13 Apr 2026 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096481; cv=none; b=IU3qeuO1vJ221ndZlJkZ/K+DDS7VJQ7OQPx7G5OiEu4qXsAsqu8cEolKjVgHwZE389HMyjNi7LQcuwa9gf3wnuq/tF+jSxOJlcR8lA0CDpc1U7JPHdGGl/kgW7NORsHB4yhn0K0r6pHYEN4TC9vKtmvux9NRfionjmubKx5le+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096481; c=relaxed/simple;
	bh=ESkNk8fLeIqvp+1QKyRie6K+BosJg7j0W2ArchCaWdM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=oifFrOH0U3UgGkuYrv7yEunH0NvZcEW7sllc1i/5ZNPlMEFxzmXxf25WUjYnvuXo5ZuDqqzco74SZVPioTGIX7NgFk0b78gyArgepPNFLhuAyfW0WyUAbIJ4s8csaL6WqKcQAfdA4cAewnnoVS84tqs7AXqrwn2DBuShCYU85Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xEz+sPue; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xEz+sPue"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9BA5C5B1AA;
	Mon, 13 Apr 2026 16:08:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 353CB5FFB9;
	Mon, 13 Apr 2026 16:07:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 962D010450093;
	Mon, 13 Apr 2026 18:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776096474; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=asF0HsGt6RiO9yJ1UjElEHlRXE65Jp9uDD1NhjSotBQ=;
	b=xEz+sPue9JfPASrlINjN6Vr2FuCOoJ4drkDjQUVkWM4UGLZJ4t04mMr1FqI4DQJpLQ7V2K
	w2H3nJx11sTROYwbl0RIHa3yS/nSXAtdbqCDyJ+Qc/wXHY8LC5HvUPgHlFXcq1mggXBfYh
	NWbNQ2Q8vCyNf3lsUs/FMDj+DazLtD83hLkoQgvXaAlRSZ3CpvjfoBQSqIgVCk7GQFsJnx
	d4PJzRN1joJyAyOkBvNJB9vrX49Uh3v9cFGnvsEwAhI8lxYdbaPvpN0PvVCHt90ZeGBEpn
	tTGhli/qd0TFjPFx5kO23T5kFP1jJ8yiWTk+z/P5757N8IyE+jGudyoZ1p+rWg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 18:07:46 +0200
Message-Id: <DHS5NGSKY3ZE.2NWYPEL21N27Z@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <alim.akhtar@samsung.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <nicolas.frattaroli@collabora.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <krzk@kernel.org>, <jingoohan1@gmail.com>,
 <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v14 3/8] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
X-Mailer: aerc 0.20.1
References: <20260413132551.1049307-1-damon.ding@rock-chips.com>
 <20260413132551.1049307-4-damon.ding@rock-chips.com>
In-Reply-To: <20260413132551.1049307-4-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Mon Apr 13, 2026 at 3:25 PM CEST, Damon Ding wrote:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side. Therefore, we add
> a new API analogix_dp_finish_probe(), which combines the panel/bridge
> parsing with component addition, to do it.
>
> In order to process component binding right after the probe completes,
> the &analogix_dp_plat_data.ops is newly added to pass &component_ops,
> for which the &dp_aux_ep_device_with_data.done_probing() of DP AUX bus
> only supports passing &drm_dp_aux.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588
>
> ---
>
> Changes in v4:
> - Rename the &analogix_dp_plat_data.bridge to
>   &analogix_dp_plat_data.next_bridge.
> - Remame API analogix_dp_find_panel_or_bridge() to
>   analogix_dp_finish_probe().
>
> Changes in v5:
> - Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP.
>
> Changes in v9:
> - Add Tested-by tag.
>
> Changes in v10:
> - Fix to use dev_err_probe() in analogix_dp_finish_probe().
> - Expand the commit message.
>
> Changes in v13:
> - Modify '(on rk3588)' to '# rk3588' for Tested-by tag.
> ---
>  drivers/gpu/drm/bridge/analogix/Kconfig       |  1 +
>  .../drm/bridge/analogix/analogix_dp_core.c    | 46 +++++++++++++++++++
>  include/drm/bridge/analogix_dp.h              |  2 +
>  3 files changed, 49 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/br=
idge/analogix/Kconfig
> index 03dc7ffe824a..8a6136cd675f 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -29,6 +29,7 @@ config DRM_ANALOGIX_ANX78XX
>  config DRM_ANALOGIX_DP
>  	tristate
>  	depends on DRM
> +	select DRM_DISPLAY_DP_AUX_BUS

While applying, sparse noticed an issue here: DRM_DISPLAY_DP_AUX_BUS
depends on OF, so you need to propagate the 'depends on OF' to
DRM_ANALOGIX_DP and its reverse dependencies.

I fixed it while applying the patch.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
