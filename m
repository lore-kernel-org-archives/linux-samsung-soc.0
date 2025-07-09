Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E854226CFC;
	Wed,  9 Jul 2025 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752090966; cv=none; b=p2N5SWjCE7q73gOK0MamtSe1FEIIMiZNw5DxxWWt/KwNNV+22w3K9TggMqDxx+yZXu8IXThAigJnNCjzul/X9dFZIpGa3f/o5YiMn1oHPVb1PprLaWzsx8V/hDkLU/8ThvOziFqcRIMcMS11I5Qdv3YUPK9B21p8mj3l0XQsGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752090966; c=relaxed/simple;
	bh=tdByn8GTZa1jc/53hrqN/9Iy69nq+Q0Owf7bPSq/x1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qcK050wJy5BIBNYlYmk4JY1VAyCqrFSda+AG29u0ssCoLyoU5tLtsawkciLKDSgQt6xST8XGUrXr5+l3JK8K+vylRJe5td8l6WtHWlVWx1X6WuXGSIhcrVZ2ENMv13m3+XDE+UfuJVKQ6DKm/fskqly0foPN/kLNiOopDXCq/xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BFRzFXD5; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BFRzFXD5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JFhcVY1ZSSoc/XTpIZicoEuxmwFVa6EOH7jKZUvbqJs=; b=BFRzFXD5Nbw5HVW60D6pQXWEb8
	3rkb7z3l/vfTl5da3duXtLdc/TgsbxYZiEhh4XeVUvi10UQOSOZpgQMQVwle74iJrcXN7cEqlizaX
	xcuzHez4FLT7kuIr2EwMrRwDh6ywlS0OrgwOon9hRnVkWz2PE+yRX3esQDmCP61Iz446VQx9+Ido0
	Xv6mXFIbpfjbwMIa1PD9kbL6YLx9AGX5m7FLKX8EewJFkxjKzEobi5gYdGSkmpYhzrJZ4N5oM+dFN
	A067ULINjLEdxlBlUroBOwKs6oTOhlhoSEOXwX3H/Je5oLleHGRyTUrd3ndmq/Y5UPVXlP/3uFSVr
	+O1ZAOHw==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZat6-0006ZI-2e; Wed, 09 Jul 2025 21:55:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v2 04/12] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
Date: Wed, 09 Jul 2025 21:55:26 +0200
Message-ID: <4596850.bcXerOTE6V@diego>
In-Reply-To: <20250709070139.3130635-5-damon.ding@rock-chips.com>
References:
 <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-5-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Mittwoch, 9. Juli 2025, 09:01:31 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
> directly.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

> @@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct =
device *master, void *data)
> =20
>  	dp->drm_dev =3D drm_dev;
> =20
> -	if (!dp->plat_data.panel && !dp->ptn_bridge) {
> +	if (!dp->plat_data.panel && !dp->plat_data.panel) {

typo. The second test should be for dp->plat_data.bridge


>  		ret =3D exynos_dp_dt_parse_panel(dp);
>  		if (ret)
>  			return ret;



