Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0C238D42;
	Wed,  9 Jul 2025 19:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752091132; cv=none; b=UNNk48AIrPAQBdPnK+PAzluuNfFUMBfYRqL0rb9Jh5EHNx0I4ppAl83y4mw2XCe/u9oyu5JkR+jjIXJsvZZch1HKBL+KDEPorzqpEZvBc+vqiMoRnCJHeJcuO4vHuiX9AobT3QdSzQfk6yOHpCj42eEEiC1Yyo3JQevWPmkavrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752091132; c=relaxed/simple;
	bh=3U4wRwzxIlfVfoMkRN9AfQ6Ch2SkWWWXSiINd4wFQfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DkVgYKDhydqMSmXdytQW4IWOJQybWi8FwXFTeuD5Y78smd8ezhvbsG8J1/NwxyFD2gdwmL1sP4tc5ZhW61NKpOt8WPZP1nJTpApvoConQu3yam3CNU3Nbq9UmE0WuktIDYSBdxKdLcsf5ius/mS4Z+U6IYOTkJ8Vl+vxIUl79Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CplRT5r6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CplRT5r6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Oi+8ljfF+JQ62/JezDSEUuiZkb455tkEy3zZWjAXllY=; b=CplRT5r6vcPr6kjF6esg0ft930
	B90fQvkTqExfjC/bI9ln9oLal5rexREbxOjnqMv5pb0a18gQDO/sUzrXkC7Tuqyq/UnM4SJD5Q4js
	vJsLIbGSTvV1bEHWxzhmjgOm/rA/4h5hAB4ob+Mw7zL6XdA6rE9zvyCo/QOg4P8+894UnFF8CYXi/
	1IF31V+e1mgGDD3pGhy4KUTzB3UcJbZLDkIVFeRNotAoqE6RKf9arcc2Bz3qB6CpXwWSGq1BfspbA
	GA+h8dm92fFcTEf85HDWVt5VBHBqQYhMdxrjDcu7jBP3mQMgUlZw6Cjx6lJ1IzVJRpmrOxbT++sHQ
	lK7lIn7A==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZavq-0006bE-Gp; Wed, 09 Jul 2025 21:58:18 +0200
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
 Re: [PATCH v2 05/12] drm/exynos: exynos_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
Date: Wed, 09 Jul 2025 21:58:17 +0200
Message-ID: <6306541.2iPT33SAM4@diego>
In-Reply-To: <20250709070139.3130635-6-damon.ding@rock-chips.com>
References:
 <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-6-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Mittwoch, 9. Juli 2025, 09:01:32 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> The &analogix_dp_plat_data.skip_connector related check can be replaced
> by &analogix_dp_plat_data.bridge.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 9d7d3f009e58..9e1313fdecad 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -237,7 +237,6 @@ static int exynos_dp_probe(struct platform_device *pd=
ev)
>  	dp->plat_data.power_off =3D exynos_dp_poweroff;
>  	dp->plat_data.attach =3D exynos_dp_bridge_attach;
>  	dp->plat_data.get_modes =3D exynos_dp_get_modes;
> -	dp->plat_data.skip_connector =3D !!bridge;
> =20
>  out:
>  	dp->adp =3D analogix_dp_probe(dev, &dp->plat_data);
>=20

I think you might want to merge=20
=2D drm/exynos: exynos_dp: Remove redundant &analogix_dp_plat_data.skip_con=
nector
=2D drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_c=
onnector

Because when separate this creates a bisection issue.
Like when a bisect happens to land directly on this commit, you already have
removed the exynos assignment, but the updated check from the following pat=
ch
is not yet in place.


