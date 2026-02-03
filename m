Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAEB23184A;
	Tue,  3 Feb 2026 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117132; cv=none; b=oYi4YYSkCTT0UrfsCisa1aVF2THsK5TDdg/DZ/AtnZfv4W7Qspvnjl6M/nKXS1dshqRKyZrRmFgdQRruAokIgV9ixTRbuFKf/tjENOMOQ+w/TG5EUfjrDzIPlsHFYb6+7+LNau+uS7kT6tbYGmwbOfvXnMoCICKm+yNX0mhR21s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117132; c=relaxed/simple;
	bh=ntEqjZ4vPtV9eWcEMUAr5LrB5oLRPrI5bgg2M4/Hgg4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=rHhGd3uerwm2NsPpsmU7hE1mdfPrfj/9mipK1H+ZF3KbDCN4ED9YYHx9ygjqyRHpLlMYNYoZzSZzlAaIAAPMo5ucy5tyOW3PivBaqcq7YpbfebGgqktHFaV6JvNgTmOnB5t2wT+Ah7zkrnJ2Ht2qVs7p6s/gxeWxxUluYTtwDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DPoX7rqx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DPoX7rqx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 88BF4C211DD;
	Tue,  3 Feb 2026 11:12:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4351F60728;
	Tue,  3 Feb 2026 11:12:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49DDD119A8888;
	Tue,  3 Feb 2026 12:11:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770117125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=szFGRLlVCEwZRRovS/jad1iKZfVKQX8FqT/CwFCFTuw=;
	b=DPoX7rqxJKZUDYyaRDR7/S+6t9BTtJqy8WOm0KmHCdu7fbDoA48IJeL5CmMiKa5CyLOhPX
	1m04Tm1xnpB+4RqSBdn7YL51+pYU3mHNquNAHCkDuVG/s86TDceDYJ9NzVKwqMLOP+ckgr
	l5IyZPCe6xDcieA1XnO/XkU+hCgZUUoC71wA9QWyEwKGBoUn6jkxFv+oPWNTwgiVXpO+3X
	zROF2ReXs0saPeDrmiua4EgvrIFBe8Jc+tbqSIiRARGUc+JofQISJrkPs/wocHLOBMIBdh
	sPveengo3QMRO55rX/CBQjMu9HRt0XLeznsH2BnuNRYnSdvxUSFDSepExnD74A==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 12:11:53 +0100
Message-Id: <DG5A5BNULPQX.HRWTJLN9UQ2W@bootlin.com>
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 "Damon Ding" <damon.ding@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <andy.yan@rock-chips.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <jani.nikula@intel.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <6571983.R56niFO833@diego>
In-Reply-To: <6571983.R56niFO833@diego>
X-Last-TLS-Session-Version: TLSv1.3

Hello Heiko, Damon,

On Mon Jan 19, 2026 at 5:06 PM CET, Heiko St=C3=BCbner wrote:
> Hi Damon,
>
> Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleurop=C3=A4ische Normalzei=
t schrieb Damon Ding:
>> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or bot=
h.
>> PATCH 2 is a small format optimization for struct analogid_dp_device.
>> PATCH 3 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 4 is to add a new parameter to store the point of next bridge.
>> PATCH 5 is to make legacy bridge driver more universal.
>> PATCH 6-11 are preparations for apply drm_bridge_connector helper.
>> PATCH 12 is to apply the drm_bridge_connector helper.
>> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 16 is to attach the next bridge on Analogix side uniformly.
>> PATCH 17-18 are to apply the panel_bridge helper.
>
> On top of all the recent bridge-related commits, this series still works
> on my rk3588-eDP board - when the display is plugged in on boot.
>
> As that is the current state we also had before, this series:
> Tested-by: Heiko Stuebner <heiko@sntech.de> on rk3588

I'm appplying patches 1-3 and got a checkpatch warning for each patch:

  WARNING: Unexpected content after email: 'Heiko Stuebner <heiko@sntech.de=
> on rk3588', should be: 'Heiko Stuebner <heiko@sntech.de> (on rk3588)'

I'm fixing it while applying those 3 patches.

Damon, can you fix that for the remaining patches before sending a new
iteration?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
