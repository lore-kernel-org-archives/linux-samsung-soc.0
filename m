Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F041F8691;
	Sat, 31 Jan 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866923; cv=none; b=X6QOKXLS+8TjCPjf8TVzoJ+P8/cs2Doy15EzB9x1kZdl1g5L1MdwlkQ6nL8PJb9ET6LnXXT3GjrENPO7F4/Rx1hqA/LNY03n+3vifkf02UzQjrihMmnuoLh2F2cYqc3Ta3hoPEXY+H9gA6Ykn8L5POoXnj0B55KudscplJ/bOQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866923; c=relaxed/simple;
	bh=RBYOYCO2M46JIUgq8W9sG/5NWADYqzV49iOKEvvP47A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HZ+kOOrUuZ1yPtxbTR+cM26KRy1NBSo7nm8GFg2YAwyhSydeC+NMjLfYKpTrGECpqNqT0LD77LdBdcEKnX0tZmif11vtv1aO7tDbaLF8Cr7XqIPgMlccdP0qPFl/S6+FxjWNhlIdLVIlazIKgOoYJRHtt0xC6gYAKQY8lQ9HvSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ObetL+87; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ObetL+87"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B2634E42386;
	Sat, 31 Jan 2026 13:42:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F1F1606B6;
	Sat, 31 Jan 2026 13:42:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AE0E119A888D;
	Sat, 31 Jan 2026 14:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769866918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RBYOYCO2M46JIUgq8W9sG/5NWADYqzV49iOKEvvP47A=;
	b=ObetL+87ucAVdXN/zM/vumcAjf5XZKAjrwu/JLgNuJRCVgS1hIsba4xuH053AbpJHcsSf4
	egeqr4qVj/elz9W/+QiXsmRa0s26LDBiRXIB1R9j4NhDcSFSGoGL6PNPMXiv4Ma8MpeoXn
	TWyAMDRuSFIlD3FIv1Y6ZToKI2cZybbhFJwtIpi7IrYNMKEUK5V5gf/gS1FqfDAdN844DO
	aoeLtEnTwkUF5B08JMFsqS6n/QyrLA33U08Tut6hXhqebgvy8izito6edW5J1kjmwnVZoz
	Z0nfteB0cdtqrX+UypJw6qMSQ47xn3VB0ofXMFDunPu+BsijY2vSYpZtYeED+g==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:41:48 +0100
Message-Id: <DG2TGHAO69YZ.BCOGDONNNQ1M@bootlin.com>
Subject: Re: [PATCH v8 06/18] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
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
 <20251217093321.3108939-7-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-7-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
> directly.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
