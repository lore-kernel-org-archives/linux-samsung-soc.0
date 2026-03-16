Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4021ACEDE;
	Mon, 16 Mar 2026 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661182; cv=none; b=Xpn7glUyonzs/lDSuWyTpw8JR/TXzG7XLJVHO5aT14s4x4LeWJiP18ASplt9rjXv2chIsw0oeXf0B3metMy6f7DR8kedhWx14OWMFSrc7D4ZOB1OV72c/ir9XwYrHb0Nqbz1ftT+FV6RBWIYxyl6mQ3/f4V1KgsypMFFQy4mz5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661182; c=relaxed/simple;
	bh=AddVb/baHLx6v1m31dqQ10HQcGs1I2SXvvs0Bkdi6fM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=E3lb47yD8OObbdHWA+u+ua/zLc4MF6hboxbrBUDbBKIh7nIVDER+lheHO3i1WUwTMMAIwZDcEp+wyN5YPthwqnHxCTQ2732dc9nSrphhiAJNTdOfckPZhQpMh6A6pRxTubXsnzGjsT1Fir+KUluC4tL7PAizdsfoTg35zoPpGSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YrywEDwd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YrywEDwd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE851C4158D;
	Mon, 16 Mar 2026 11:40:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EB815FC4A;
	Mon, 16 Mar 2026 11:39:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DF5310369E73;
	Mon, 16 Mar 2026 12:39:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773661176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9LLjJ8Qd6wNXbg06pYIRYcPmRb/RcOo68671SJw5PZI=;
	b=YrywEDwd/DzMcHZz4wMx/qDUUpvovYoTrhVPGEOmyWw/GimO4aRGWgjfaRUp096SdfisEu
	fL7fyiN9g5ShHiC0bJ1HLcSiRmmromhJMWEGykRppDiKWCfJyd8CE9upne8c7MS4veJl9C
	F2567Jh16wPZp2rva8ZWs5sa/ktvOyV7GgKVD1l9lwwqvogkfchCWNn0uiaK9l1+o4CsY/
	8XM9Y78ODDYhIPF3fR5xInhUpzGGiyzeH9/8xsONdMXOwnDHMCWJaUzPBNzQ9Pm/aZwkh+
	4jh1gU77n4mMk8A8bpwAPpZU8p6RPatwWYKsvXQsYdR0qnmwUDqWFz4JFrOonQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 12:39:24 +0100
Message-Id: <DH46EQM1PED9.2BVW9DWVIMEJZ@bootlin.com>
Subject: Re: [PATCH v10 11/18] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
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
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
 <20260310012458.169272-12-damon.ding@rock-chips.com>
 <DH1TKWREZMFK.3BY4NY36BXLXG@bootlin.com>
 <bebadd3b-2fd1-404e-bc64-205c8b44880c@rock-chips.com>
In-Reply-To: <bebadd3b-2fd1-404e-bc64-205c8b44880c@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Mar 16, 2026 at 4:17 AM CET, Damon Ding wrote:
> Hi Luca,
>
> On 3/14/2026 1:10 AM, Luca Ceresoli wrote:
>> Hello Damon,
>>
>> On Tue Mar 10, 2026 at 2:24 AM CET, Damon Ding wrote:
>>> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
>>> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
>>> side, as the private &drm_connector is no longer created.
>>>
>>> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
>>> are replaced by the corresponding &drm_bridge_funcs APIs:
>>>
>>> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
>>> analogix_dp_detect()       -> analogix_dp_bridge_detect()
>>> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>>>                                analogix_dp_bridge_edid_read()
>>>
>>> Additionally, the compatibilities of Analogix DP bridge based on whethe=
r
>>> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
>>> supported; If not (the next bridge is a 'monitor' or a bridge chip),
>>> OP_EDID and OP_DETECT are supported.
>>>
>>> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
>>> analogix_dp_probe(), because the type of next bridge (the panel, monito=
r
>>> or bridge chip) can only be determined after the probe process has full=
y
>>> completed.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
>>
>> ...
>>
>>> @@ -73,15 +72,12 @@ static int exynos_dp_bridge_attach(struct analogix_=
dp_plat_data *plat_data,
>>>   				   struct drm_bridge *bridge)
>>>   {
>>>   	struct exynos_dp_device *dp =3D to_dp(plat_data);
>>> -	enum drm_bridge_attach_flags flags =3D 0;
>>>   	int ret;
>>>
>>>   	/* Pre-empt DP connector creation if there's a bridge */
>>>   	if (plat_data->next_bridge) {
>>> -		if (dp->has_of_bridge)
>>> -			flags =3D DRM_BRIDGE_ATTACH_NO_CONNECTOR;
>>> -
>>> -		ret =3D drm_bridge_attach(&dp->encoder, plat_data->next_bridge, brid=
ge, flags);
>>> +		ret =3D drm_bridge_attach(&dp->encoder, plat_data->next_bridge, brid=
ge,
>>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>
>> Should this be 'flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR' to be future-pro=
of?
>>
>
> Aha, the exynos_dp_bridge_attach() and even
> &analogix_dp_plat_data.attach() have been removed in [PATCH v10 16/18]
> for consistency and simplification. Since the only bridge flag supported
> right now is DRM_BRIDGE_ATTACH_NO_CONNECTOR, let=E2=80=99s leave this as =
is for
> now. ;-)

As you are going to send v11, I'd do that change. It is the right thing do
to, it's cheap, and in case patches up to 11/18 but not (yet) up to 16/18
we avoid ending up with unoptimal code until patch 16/18 is applied.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
