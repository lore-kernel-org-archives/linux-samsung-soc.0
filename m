Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DA043E9C8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Mar 2026 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133993; cv=none; b=c1hJBkZMWRqXi4+J58E2Xg1DGiq4HGR+8FOj/yP2NaDRggW7Bke45P03MDTHK4GfdAWLYv95XeVxQJ1SYCNcu8JaFHozB2Vs19ItAlo2J/37Fpjs3l7AZkAPhqmxBS2OysSPjsckEisjJ/6yeUuQ7s0nh3LMTapzdat2jNQrTRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133993; c=relaxed/simple;
	bh=166qCuS3GrAlXI6brs6QxvJQpFd4voxu1ZjUSc4jdNI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZv8unhw/R3O39Pt2O6mR5zehqTTfo+C+7YNGysiUeOFLbNR43hPVtX4ev7OonWO2Aqr97Hf9WoYXTYL+0Vvg7SQAe4HH2AIZH1MrL4f1gVr1xKJ5P19Z8iCv+kqVbBLhiWLIios/g832POgLSWsUZgE/1qb8ajIJXsM2aZMnHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8a-0005gc-A9; Tue, 10 Mar 2026 10:12:24 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8U-004fp8-2w;
	Tue, 10 Mar 2026 10:12:20 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8W-00000000385-0VM0;
	Tue, 10 Mar 2026 10:12:20 +0100
Message-ID: <7414fb775dd4c9a0a1c00f1452ef128de300ee06.camel@pengutronix.de>
Subject: Re: [PATCH v10 02/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 	tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, 	s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, 	inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, 	krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, hjc@rock-chips.com, 
	heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, 	dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, 
	jani.nikula@intel.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Date: Tue, 10 Mar 2026 10:12:20 +0100
In-Reply-To: <20260310012458.169272-3-damon.ding@rock-chips.com>
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
	 <20260310012458.169272-3-damon.ding@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org

On Di, 2026-03-10 at 09:24 +0800, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
