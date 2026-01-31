Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CBDC145
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jan 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769862832; cv=none; b=mVVsXtUsjw0bXiJY79cj2nHpA9pAYhqojQouQn8WobutldPtb2/7pTPYRN4Loj9kMQD9xc9OxI4fWxOglrjxaOTko7T0Udq6UFSasEWAF9W4fmxecyzf4qmeO0+m+ceA50BHqCqVdowhwvRMCGzWAItsRgtdbwGn5nLIUC0NLV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769862832; c=relaxed/simple;
	bh=MfcqXmGcz9usPetintZk6VO5RzRnZEX+0ToMagGKDqg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=u4roxWxObbD2YJxjwtBpQxPM3A6AOXQX0Ja36QcuRs2yvuRn+vLCnPQbXFKivj3v7cfOxIGxVTGPgA4HVW0VaXC54IL3RjymKjmTrHNUdQo/hJ2pTUTsNhK/QGAIXYBgTzLOtZinJH5rZ746BbXK+EshuNSqB39CgpROlWQinbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oqTZJV0h; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oqTZJV0h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E4BD5C22F7C;
	Sat, 31 Jan 2026 12:33:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBC92606B6;
	Sat, 31 Jan 2026 12:33:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DA53119A8886;
	Sat, 31 Jan 2026 13:33:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769862826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o1FArTjWb5fHnMv+cvCRxPx2Pce2+vtnbqLuhuuwGV4=;
	b=oqTZJV0hSg/2X16nn9r8HEyNeDGFLcFLjeWYysi+mRl3B8Uj0JW9fvJs4Pxa4SClyr2qbA
	ZQamRMUOLc7fAbjdchR/x04C2usO+abkffytpKYafkpjibIF1pJftgtdM9kZKNhgQWW+he
	Qen3cNjQnXdCBvQixpQSw1Ina3DIgbzxdLPAVQB92wUkKnPYOXDdb5pSVOfSG8U1+7sEPT
	TWjulhUlCGohNKQW8tAuhKiE+ww/5LNHvq8zRIVOMPOALjdXHIlWH0t2U92M+uIGCxbG8f
	R5Uj2RBFaitVU2ZkJIq++Kvw1YgbCYmFH60kAjMd7q8SIjUMcalagEoEEfDdYw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 13:33:29 +0100
Message-Id: <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
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
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-6-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon, Dmitry,

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> ---
>
> Changes in v7:
> - Rename legacy-bridge to of-display-mode-bridge.
> - Remove unnecessary API drm_bridge_is_legacy().

...

> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>  	help
>  	  NXP PTN3460 eDP-LVDS bridge chip driver.
>
> +config DRM_OF_DISPLAY_MODE_BRIDGE
> +	tristate
> +	depends on DRM_BRIDGE && OF
> +	help
> +	  This is a DRM bridge implementation that uses of_get_drm_display_mode
> +	  to acquire display mode.
> +
> +	  Newer designs should not use this bridge and should use proper panel
> +	  driver instead.

"Newer designs should not use this bridge", but in patch 8 you are
introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
instead "use proper panel driver instead" in patch 8?

Can you point to the conversation where the converstaion where Dmitry
suggested this change? Maybe it already contains the answer to my
qustion. Also adding a link to that conversation in the commit message
woule be useful.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
