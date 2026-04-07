Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA76318BA8;
	Tue,  7 Apr 2026 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565729; cv=none; b=EJzxdOarpd65kf9a9LaKN/SsgRaLBplCDpGwGajiIHV5DQyk3uEIkI9ORie28EJ/zF9crQ+d3OgKr563quboqFoD/VN+t8+KIyxgaXPWi9w+ZZBDqwsA1/nC3VdTGL/1X2qJtX4FD1HRPsaauojKEZb3Qw8yi0lux9ZGrbepKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565729; c=relaxed/simple;
	bh=vcedrkOtzHl62iyJPmO/Gxl0CAOri1Qj6wGgCI+TYVE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eRw7plqF7ctqkwsWFOvQ4p0ziYuWG7injJyLK0RYklIIZ1R7Q3wr3mYawNi/FSSTsqbrMoee/UHgml34C/Tj2jReR08051iWzBo8UUeTDk4RA52uUeI/O6vdNNMNn/H7U+VaILP1aptWEUj/WSKRw5D0ZckEdJA4E6qy5vz4lZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QWObEjzc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QWObEjzc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33B711A31CB;
	Tue,  7 Apr 2026 12:42:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3E30603C7;
	Tue,  7 Apr 2026 12:42:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC75E10450234;
	Tue,  7 Apr 2026 14:41:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775565723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vcedrkOtzHl62iyJPmO/Gxl0CAOri1Qj6wGgCI+TYVE=;
	b=QWObEjzcAPn4hL/LE8n//pQeBSv34y2P95ZUmzx9n17rGZps5XPsUSZmDkE2GfD9JgW4lv
	os3X9wKZDJg92uLot0YHkmMDmfvgadfOR0Zys79QZf5Ocw/vQqyP0u0SYmW2Pvmj9VF0ob
	b8A4gbpSdyQjg47I7jz/r82S26e7SGmzgLjep0liwUrfHAKkV8da4Ve5fSpAUQAjgEfKHP
	seImPKiR3YDKzYkVzBeoM0y78Gv4b0M0uFZGKKY4je1b5KwEMv60imU5UKyc6lc47otl8g
	w34N94qEXeOxMUfkWyVzW9v0oC4NqSGBaegSEa/tkp7/nILJGwyGaDBwutTYUg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 14:41:52 +0200
Message-Id: <DHMXIJKO62F2.3JVF0Y6L7DI0I@bootlin.com>
Subject: Re: [PATCH v12 02/17] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <alim.akhtar@samsung.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <nicolas.frattaroli@collabora.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <victor.liu@nxp.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <krzk@kernel.org>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260401091454.25730-1-damon.ding@rock-chips.com>
 <20260401091454.25730-3-damon.ding@rock-chips.com>
In-Reply-To: <20260401091454.25730-3-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Wed Apr 1, 2026 at 11:14 AM CEST, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

I tried applying patchs 1-9 to drm-misc-next but patch 2 does not apply due
to conflicts in the Kconfig file. Can you please rebase and send a new
iteration?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
