Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5580386449
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Mar 2026 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530950; cv=none; b=XbYRCOdjSkou4JEIl8qs9+PuZMqWlgxvKWWloJrlz81xD3SL/gLbNOdRNiy+S2jLjPgikXJh7abPlfYP2ed4TBiD2Zy71jP0iqeADGiAoZP4s7U0wgDmUwaXtfHPp0EJ3oeGcq2/HKTFfVEoPCSHKuq8+uQl/nm6d0njH8DFvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530950; c=relaxed/simple;
	bh=uKkT16WQ2PwFq6EXZ11CSb4MueygRWh/vL8xQ2NJLPE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ezPyGSLfnGEzeVzFxsrJL8uhzt0OaIL1Y/DDWdZeu4qDDN3tMfz4iH1i4lmfhQtf2qBFLQlwUhS40drqWRwm7ktURfenTicLxuGyva8d3m1oueY5eP59FLqVdcr6gtBRwyunHJqWLQ8Xto7syV8sXRCT2e2nXUQxCrSjEdQ2DYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zpd0maNm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zpd0maNm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D02C1A234F;
	Tue,  3 Mar 2026 09:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBD845FF29;
	Tue,  3 Mar 2026 09:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A39710369689;
	Tue,  3 Mar 2026 10:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772530942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uKkT16WQ2PwFq6EXZ11CSb4MueygRWh/vL8xQ2NJLPE=;
	b=zpd0maNm0gGPyBMoMvFv6uv8h6eEB/xLCqRbfpgmPhSK6O1NE4t6N+MJNeGgDcpwie+yWR
	p1LVP+zGwHf9yszOXzAjQOVAFGOTc5+dHzei2NNxyHz82ZUJ+84YQhHBPw6qZpOnyo/2Ta
	oLBfHg1j549L3NZ/a9Rfiv2/KFmv2GSSGhKk9yBfgU0hQmiSS1sB+uQpVPN7+J94cQEsBg
	9+J2mtuHdvuK4+8RJ1jMLFrRQ8IG8t/h/zAlg5iVFL2kZILVrJRs7F2FYFoBR1RTdUXuc+
	Vu3CosuVvx31LJUdxvHkpQekXJeoId9GmH+FN75HmMlEzjYay47l2LQH2gMz+A==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:42:14 +0100
Message-Id: <DGT1RY079AQY.39WPHSR0J6H9F@bootlin.com>
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
Subject: Re: [PATCH v9 05/15] drm/exynos: exynos_dp: Apply
 of-display-mode-bridge to parse the display-timings node
X-Mailer: aerc 0.20.1
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-6-damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-6-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
> If there is neither a panel nor a bridge, the display timing can be
> parsed from the display-timings node under the dp node.
>
> In order to get rid of &analogix_dp_plat_data.get_modes() and make
> the codes more consistent, apply DRM of-display-mode-bridge to parse
> display timings.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
