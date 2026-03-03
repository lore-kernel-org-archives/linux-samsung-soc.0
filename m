Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784CC38F22D
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Mar 2026 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530953; cv=none; b=DBGABXW6PzgLC2r/rVQIy2iSw1vdaoDXCuGpzSR7fdqPshpoeOhJayhxM+BaT+AL391rn0IKZ1um8dfh6yzmTl+Bo19LYxT3hPSIz1PBaXGr+/G5cjYUZVkn8IIIkkeifat63rTpCbGHbZjZguSC6NIWSWJtKKCsecWXxsYYFI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530953; c=relaxed/simple;
	bh=2S2u2MYDv39cuTkdT7rvNWL6/ujGlEoYexvzBfQ5Dqc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=h/Coa8QHTflOP1lgyeKzI1ycB7J+RQXRJUSLRmjDy4d7VWZDoJ4tEjma74Tw1wVAqtt3aKeGajlcdxLJJ6EdZZjJzzFr7ahdRQUyEMY2oT9wStUE2ep3+qtS2o/lKeLrcYKNHiRRYoLV30LbgupGCmT4ApBp52CdJN+6Szl2jmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=umJXEb9s; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="umJXEb9s"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3EE701A2358;
	Tue,  3 Mar 2026 09:42:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A62E5FF87;
	Tue,  3 Mar 2026 09:42:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52DA110369680;
	Tue,  3 Mar 2026 10:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772530947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2S2u2MYDv39cuTkdT7rvNWL6/ujGlEoYexvzBfQ5Dqc=;
	b=umJXEb9sPKF1Gx/SzlO0et4KWgKLbhO2WC3t2XLnWDDWaWTNIigJIMAyEpxJVMmhunEA1q
	BpXL1iyJBZwpG8tlHCwjw5xxwaJ+z9EF1SOuCHH4rKo5l3+uGtxw745utO9lXFapGb1GG+
	2A14hN0670lvqkfIxHSZZUqLvmZeblUtKHopt6+NxgvlsUbrQE3Xii0NoHa41XcPVvZi6d
	8h2EPuYP0OnIjwR8Dko3TnRH65K3mIQ8ygyIyTTAC2PwDfm8Q9sEOsaffaUxAwGJFFvAtZ
	yKQauJURV0gzEI/Qnns6VbkFJIMr9xO/aBadLSPjcy3dKmKvk49Ws433Cni2Gg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:42:22 +0100
Message-Id: <DGT1S1RANKZB.2EQQ0Z8HXBFAC@bootlin.com>
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
Subject: Re: [PATCH v9 08/15] drm/bridge: analogix_dp: Remove unused
 &analogix_dp_plat_data.get_modes()
X-Mailer: aerc 0.20.1
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-9-damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-9-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
> The callback &analogix_dp_plat_data.get_modes() is not implemented
> by either Rockchip side or Exynos side.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
