Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FD528D830;
	Mon, 19 Jan 2026 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838842; cv=none; b=bn5ViY1nTqZxgbAMm0ZSsNHBLVd0VjjDxOR9ajLsylf/QkDKbEPb7yasBKbLzUB6YTzLwDA771it0RI2RsUoNfpmE3s1ZCE+77LrAsTJIwOwt8MDLCawE8dRD3BsQ58yQmbkKT+1JIxsBEw3LwQ0rJwECdSl9sug39bYvTaCfiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838842; c=relaxed/simple;
	bh=FNOVC7smJ25SH7Gdtg7GStcPGWpINi+mo/0Q6qqpZ7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7nB2rO2aHhTR9xEz0h52fOI6tABO+4KSs6RpbX2HJNvyWgpOkY2KfQL8jiQ3yawxB4utKdty4wr5egwMkrqvlL5KiPBJKmDhV8UlvNCZbN8ox9QLIQ5AR4eDkptJfwNhkAagKkCg5ekg+qq5OTwktSuaRGfnkALt5YfhASLbXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=NCLAf0Gy; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="NCLAf0Gy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8pPZdQPY4l/E6Ki51s+kyYAdtveDcn2eRM82KhpKvEs=; b=NCLAf0GyaclQZPdMNf4kV+ydak
	6AOdai735qQfi6T1UQ3K+ccjB1uImgyZUNmG93Tm03D3La8nM6AWcjwQNRgGIpoZCVP9XmqhH2eG8
	cHedeNeY7IC4dYd0GYcW/QrLJxQ6jfW+7/H8ffARoq4O4fi3ye8TpQJheeEObtEde1vOd25ED51B/
	/BlMHAiDjORwBRjW9/ZR+4UDHdN+ZMJ3YQoKyYzy8O92PBa8FrpqzhuVDHd2BBtAQH3LqiA3utzWH
	s5GZF2eLd1PC5rgjvkWZ+xeBBkYm8asn/ll956TTgFVtFl/6vJSrvBBpzwFUCdc0NWg2VJaf5Q6YB
	Endu1X2g==;
Received: from i53875a9c.versanet.de ([83.135.90.156] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vhrmB-0037VG-F4; Mon, 19 Jan 2026 17:06:48 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge helper for
 the Analogix DP driver
Date: Mon, 19 Jan 2026 17:06:46 +0100
Message-ID: <6571983.R56niFO833@diego>
In-Reply-To: <20251217093321.3108939-1-damon.ding@rock-chips.com>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleurop=C3=A4ische Normalzeit =
schrieb Damon Ding:
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

On top of all the recent bridge-related commits, this series still works
on my rk3588-eDP board - when the display is plugged in on boot.

As that is the current state we also had before, this series:
Tested-by: Heiko Stuebner <heiko@sntech.de> on rk3588


=3D=3D=3D=3D=3D=3D
!!! The following should not hold up this series though, because the
analogix-dp not handling hotplug, is also the current state already!!!
=3D=3D=3D=3D=3D=3D

However, actually hotplugging the device does not seem to work.

With the hpd-gpio inside a dp-connector node.


(1) When booting connected and unplugging the display I get:

[   42.725888] rockchip-dp fdec0000.edp: Rx Max Link Rate is abnormal :0 !
[   42.733325] rockchip-dp fdec0000.edp: Rx Max Lane count is abnormal :0 !
[   42.764853] rockchip-dp fdec0000.edp: LT link start failed!
[   42.771105] rockchip-dp fdec0000.edp: eDP link training failed (-110)
[   42.778329] rockchip-dp fdec0000.edp: unable to do link train, ret=3D-110
[   42.785747] [drm:analogix_dp_bridge_atomic_enable] *ERROR* dp commit err=
or, ret =3D -110
( ... repeasts a bunch of times ... )
[   43.284897] rockchip-dp fdec0000.edp: failed to set bridge, retry: 4
[   43.292045] rockchip-dp fdec0000.edp: too many times retry set bridge, g=
ive it up

plugging the eDP back in reenables the display successfully though.

(2) Booting with the display unplugged

Same messages as above, but plugging the display in for the first time
does not create an output.

I'll try to dig more, but if you have an idea, what I should look at, I'd,
be really grateful.


Thanks
Heiko



