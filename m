Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70F334685
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Feb 2026 11:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119630; cv=none; b=d1wPfAfQmOZjdVBa7DPZ+FM+11qv3jbRoL1f1M473wyIY6TpohrnDOTukofoOOdRQV6f69YZvOzn3sEvmwGnCj95kn062rpAFuAniJsva6NlZqV7Jz3j30bfDd90d+ivYHsrVWYidex/jd3UQsw/ZndP8dFc45JR+YgscoQ8Azo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119630; c=relaxed/simple;
	bh=I12JpYU8SFoYG9LY5HYJxv0gaZoRlGInnne5CRnqgZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jftEu0yVuIoyS+0/4arnFl/jIol2GNGHMx4w/QnZqdhTJVX3wCtvJfNvMJ87yoej1Y54/nyw4u36tCy2yxCb6scburbf0tPEOySSaItUBy1iCrBMUZqAYloTHQ/TwN9jQ/gkkKy0996C7G4lB9irteK6vYx8+p/Qh1gpSNcxglI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pGLrDq0F; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pGLrDq0F"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 35D15C211EB;
	Tue,  3 Feb 2026 11:53:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EED3760728;
	Tue,  3 Feb 2026 11:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42835119A8888;
	Tue,  3 Feb 2026 12:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770119615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=czGxAqtWlC7CiVBQnNcTBd7QV+mqCq2IlCe+hizwtH0=;
	b=pGLrDq0FDlC6TZPzDwz+Q/LbCPms3wDALSsrNFAGRXrrJUMWn/+VlSWQN2QR1wDRN5t7R/
	4dzoNl826W3u5sMZpiUnAdxPkKb84cPrxTMxNDLahXGpiwPNmn9eS5238/Jp+bC+ex8+vX
	vbDhkjVeUStK9q7btu0T2fx76OX81Ua0754MhEjiyODMlnM/R7O8S56hvlNuX01P0qZM+G
	nlwC3jJMJKjoHhH2sq8CMgGpUNdNEwPZhhN6u26MXXTEcHuZ+OoKdCgPnRYERLalsXIgXs
	ne+a7qepIg13lOceMckrlU+BJr2gXQ4vfi5Pi4HuB/tssJGozFElfoz4tOiY2A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com, 
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com, 
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com, 
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com, 
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
In-Reply-To: <20251217093321.3108939-1-damon.ding@rock-chips.com>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
Subject: Re: (subset) [PATCH v8 00/18] Apply drm_bridge_connector and
 panel_bridge helper for the Analogix DP driver
Message-Id: <177011960346.1855144.4866699055858398856.b4-ty@bootlin.com>
Date: Tue, 03 Feb 2026 12:53:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 17 Dec 2025 17:33:03 +0800, Damon Ding wrote:
> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or both.
> PATCH 2 is a small format optimization for struct analogid_dp_device.
> PATCH 3 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 4 is to add a new parameter to store the point of next bridge.
> PATCH 5 is to make legacy bridge driver more universal.
> PATCH 6-11 are preparations for apply drm_bridge_connector helper.
> PATCH 12 is to apply the drm_bridge_connector helper.
> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
> PATCH 16 is to attach the next bridge on Analogix side uniformly.
> PATCH 17-18 are to apply the panel_bridge helper.
> 
> [...]

Applied, thanks!

[01/18] drm/display: bridge_connector: Ensure last bridge determines EDID/modes detection capabilities
        commit: 3c05e956b85e70cbd5042e03f615b23ca4635385
[02/18] drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
        commit: 10a2694fde68ba214eca7d24229094fc2427fddd
[03/18] drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
        commit: cff3f89ffbdd4b6c43a117c01aaf5b290ff80803

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

